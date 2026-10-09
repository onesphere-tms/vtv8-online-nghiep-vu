# G0-06 – Đánh giá và thiết kế giải pháp Video/Livestream

> **Trạng thái module GĐ0:** Đã thống nhất nội bộ tên, mục tiêu và ranh giới module (09/10/2026).  
> **Danh sách công việc Fxxx:** DRAFT – đề xuất đầy đủ để rà soát toàn bộ GĐ0; chưa chốt nội bộ từng danh sách, chưa được VTV8 xác nhận.  
> **Chưa tính:** FE/BE Middle Developer, BA/Design/QA, MD, giá, timeline chi tiết.

## 1. Mục tiêu

Có phương án xử lý và phân phối VOD/livestream thực tế, phụ thuộc đối tác rõ ràng, đặc biệt với mục tiêu tải cao và vấn đề gián đoạn đã được mô tả.

**Nguồn đối chiếu:** GĐ1: livestream lịch phát, phát lại và hạn chế hệ thống cũ; Video Architecture; bài toán 120.000 CCU; lưu trữ video và SLA trong đề xuất.

## 2. Đối tượng phối hợp, đầu vào và đầu ra

- **Đối tượng phối hợp dự kiến:** Kỹ thuật VTV8, studio/sản xuất, VTVcab/VTVprime, đơn vị vận hành CDN, product/technical lead.
- **Đầu vào cần có:** Workflow live G0-01, baseline hiện trạng G0-02, NFR/kiến trúc G0-05, thông số kỹ thuật/API/SLA từ đối tác nếu tiếp cận được.
- **Sản phẩm bàn giao cấp module:** Tài liệu/tập bảng khảo sát và ma trận đánh giá tổng hợp từ danh mục bên dưới; các phần được tích hợp chung trong bộ hồ sơ GĐ0, không nhất thiết mỗi Fxxx là một báo cáo riêng.
- **Phương pháp:** rà soát tài liệu và hệ thống được phép tiếp cận, phỏng vấn stakeholder, thu thập bằng chứng, lập bảng đối chiếu, trình xác nhận các điểm mở. Sự kiện khảo sát thực tế **chưa diễn ra** trong bản phân tích này.

## 3. Danh mục công việc đề xuất (10 mục)

| ID | Công việc | Nội dung | Đầu ra |
|---|---|---|---|
| G0-06-F001 | Đối chiếu quy trình phát sóng và sự cố hiện hữu | Thu thập lịch live, số nguồn đồng thời, chất lượng nguồn, lịch sử dừng luồng/giật-lag, cách chuyển qua YouTube embed. | Incident baseline và tình huống vận hành cần hỗ trợ. |
| G0-06-F002 | Khảo sát năng lực và trách nhiệm VTVcab/VTVprime | Làm rõ streaming ingest, encode/transcode, recording, HLS/DASH, DRM (nếu có), CDN, API, SLA và người đầu mối. | Vendor Capability Matrix có trạng thái đã xác minh/chưa có dữ liệu. |
| G0-06-F003 | Phương án tiếp nhận luồng và vận hành sự kiện | Xác định đầu vào từ studio/camera, phương thức ingest RTMP/SRT dự kiến, luồng backup và cách chủ động xử lý nguồn. | Sơ đồ ingest/failover dự kiến và yêu cầu đối tác cung cấp. |
| G0-06-F004 | Transcoding, bitrate và chất lượng đầu ra | Đề xuất profiles, ABR, encode/transcode, định dạng/độ phân giải theo thiết bị; phân biệt V1 với 2K/4K/8K dài hạn. | Profile ladder dự kiến và bảng lựa chọn có giả định. |
| G0-06-F005 | Packaging, player và thiết bị xem | Xác định HLS/DASH, nhúng player hay SDK, mobile/browser hỗ trợ, controls, fallback và quyền xem. | Player Integration Requirements và compatibility matrix. |
| G0-06-F006 | Lịch phát, ghi hình, phát lại và thư viện VOD | Phân tích kết nối lịch phát với video asset, trạng thái live, recording, cắt/chuyển phát lại và lưu tài liệu. | Business-to-media handoff và flow live → archive/VOD. |
| G0-06-F007 | Kiến trúc origin, shield và CDN | Xác định nguồn phát, origin/storage, origin shielding, edge cache, phương án chống hot-link và traffic split. | Streaming Distribution Diagram và boundaries giữa vendor và hệ thống. |
| G0-06-F008 | Phân tích 120.000 CCU và kịch bản băng thông | Tách viewer CCU/website CCU; tính bitrate, giờ peak, traffic, vùng phân phối, cache hit, retention; kịch bản 3 Mbps và 6 Mbps là ví dụ trong nguồn. | Traffic Model với giả định và công thức rõ ràng, vùng có thể kiểm thử. |
| G0-06-F009 | SLA, QoE, bảo vệ hệ thống và phương án sự cố | Xác định stall/rebuffering, start-up time, packet loss (nếu đo), monitoring, RTO/incident contacts, DDoS/WAF. | Media QoE/SLA requirement register và workflow escalation. |
| G0-06-F010 | So sánh giải pháp, dự toán và kế hoạch kiểm chứng | So sánh phương án kế thừa VTVcab, thuê dịch vụ media/CDN và tự vận hành; điều kiện PoC/benchmark. | Option Assessment + chi phí theo kịch bản + checklist kiểm chứng thực tế. |

## 4. Phân tích công việc và đầu ra

### G0-06-F001 – Đối chiếu quy trình phát sóng và sự cố hiện hữu

- **Nội dung:** Thu thập lịch live, số nguồn đồng thời, chất lượng nguồn, lịch sử dừng luồng/giật-lag, cách chuyển qua YouTube embed.
- **Sản phẩm/bằng chứng:** Incident baseline và tình huống vận hành cần hỗ trợ.
- **Điều kiện hoàn thành ở bước khảo sát:** Không lặp lại phỏng vấn quy trình nghiệp vụ F004 ở G0-01.
- **Căn cứ:** SOURCE; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-06-F002 – Khảo sát năng lực và trách nhiệm VTVcab/VTVprime

- **Nội dung:** Làm rõ streaming ingest, encode/transcode, recording, HLS/DASH, DRM (nếu có), CDN, API, SLA và người đầu mối.
- **Sản phẩm/bằng chứng:** Vendor Capability Matrix có trạng thái đã xác minh/chưa có dữ liệu.
- **Điều kiện hoàn thành ở bước khảo sát:** Chưa thể coi hạ tầng đối tác đủ năng lực khi chưa có bằng chứng.
- **Căn cứ:** SOURCE; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-06-F003 – Phương án tiếp nhận luồng và vận hành sự kiện

- **Nội dung:** Xác định đầu vào từ studio/camera, phương thức ingest RTMP/SRT dự kiến, luồng backup và cách chủ động xử lý nguồn.
- **Sản phẩm/bằng chứng:** Sơ đồ ingest/failover dự kiến và yêu cầu đối tác cung cấp.
- **Điều kiện hoàn thành ở bước khảo sát:** Không tự cam kết độ tin cậy nguồn live do bên khác quản lý.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-06-F004 – Transcoding, bitrate và chất lượng đầu ra

- **Nội dung:** Đề xuất profiles, ABR, encode/transcode, định dạng/độ phân giải theo thiết bị; phân biệt V1 với 2K/4K/8K dài hạn.
- **Sản phẩm/bằng chứng:** Profile ladder dự kiến và bảng lựa chọn có giả định.
- **Điều kiện hoàn thành ở bước khảo sát:** Không mặc định cung cấp 4K/8K từ giai đoạn đầu.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-06-F005 – Packaging, player và thiết bị xem

- **Nội dung:** Xác định HLS/DASH, nhúng player hay SDK, mobile/browser hỗ trợ, controls, fallback và quyền xem.
- **Sản phẩm/bằng chứng:** Player Integration Requirements và compatibility matrix.
- **Điều kiện hoàn thành ở bước khảo sát:** DRM trả phí chi tiết ưu tiên phân tích tại GĐ2.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-06-F006 – Lịch phát, ghi hình, phát lại và thư viện VOD

- **Nội dung:** Phân tích kết nối lịch phát với video asset, trạng thái live, recording, cắt/chuyển phát lại và lưu tài liệu.
- **Sản phẩm/bằng chứng:** Business-to-media handoff và flow live → archive/VOD.
- **Điều kiện hoàn thành ở bước khảo sát:** Không tự phát triển player/service ở GĐ0.
- **Căn cứ:** SOURCE; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-06-F007 – Kiến trúc origin, shield và CDN

- **Nội dung:** Xác định nguồn phát, origin/storage, origin shielding, edge cache, phương án chống hot-link và traffic split.
- **Sản phẩm/bằng chứng:** Streaming Distribution Diagram và boundaries giữa vendor và hệ thống.
- **Điều kiện hoàn thành ở bước khảo sát:** Chi tiết chi phí dựa theo báo giá nhà cung cấp, chưa được coi là đơn giá chốt.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-06-F008 – Phân tích 120.000 CCU và kịch bản băng thông

- **Nội dung:** Tách viewer CCU/website CCU; tính bitrate, giờ peak, traffic, vùng phân phối, cache hit, retention; kịch bản 3 Mbps và 6 Mbps là ví dụ trong nguồn.
- **Sản phẩm/bằng chứng:** Traffic Model với giả định và công thức rõ ràng, vùng có thể kiểm thử.
- **Điều kiện hoàn thành ở bước khảo sát:** 120.000 × 3 Mbps = 360 Gbps là minh họa lý thuyết, không phải capacity hạ tầng đã đạt.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-06-F009 – SLA, QoE, bảo vệ hệ thống và phương án sự cố

- **Nội dung:** Xác định stall/rebuffering, start-up time, packet loss (nếu đo), monitoring, RTO/incident contacts, DDoS/WAF.
- **Sản phẩm/bằng chứng:** Media QoE/SLA requirement register và workflow escalation.
- **Điều kiện hoàn thành ở bước khảo sát:** Mục tiêu 99,9%/99,95% nêu trong nguồn chưa phải SLA hợp đồng.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-06-F010 – So sánh giải pháp, dự toán và kế hoạch kiểm chứng

- **Nội dung:** So sánh phương án kế thừa VTVcab, thuê dịch vụ media/CDN và tự vận hành; điều kiện PoC/benchmark.
- **Sản phẩm/bằng chứng:** Option Assessment + chi phí theo kịch bản + checklist kiểm chứng thực tế.
- **Điều kiện hoàn thành ở bước khảo sát:** Không coi kết quả giả định là thử tải thành công hoặc hợp đồng hạ tầng.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.


## 5. Giới hạn phạm vi và tránh trùng lặp

Khảo sát/so sánh/thiết kế phương án VOD/live. Không mặc định làm PoC/load-test thực tế, trả phí CDN hoặc cấu hình/triển khai production trong GĐ0.

## 6. Rủi ro và dữ kiện còn thiếu

- VTV8 đã ghi nhận trải nghiệm streaming cũ từng dừng/giật-lag; cần bằng chứng kỹ thuật để xác định nguyên nhân.
- Đơn giá CDN/egress/encoding biến động theo đối tác và khu vực.
- Tải tối đa phải kiểm chứng bằng test plan hoặc SLA/bằng chứng từ vendor trước khi cam kết.
- Khối lượng khảo sát (số hệ thống/nguồn dữ liệu/buổi workshop/màn hình/tài liệu) chưa có xác nhận và phải là input khi dự toán.
- Nội dung chưa có bằng chứng được đánh dấu `TBC` kèm người/phương thức xác minh.

## 7. Nghiệm thu ở cấp module và bước tiếp theo

Một hạng mục khảo sát chỉ coi là hoàn thành khi có **sản phẩm/bảng kiểm/biên bản** được chỉ ra trong từng công việc, ghi **nguồn bằng chứng**, giới hạn khảo sát và câu hỏi đang mở; chủ sở hữu nghiệp vụ của VTV8 phải có cơ hội rà soát. **Chưa tự coi là đã nghiệm thu khi mới tạo tài liệu kế hoạch này.**

**Trạng thái hiện tại:** Danh mục Fxxx đã được **soạn đầy đủ để rà soát**, không tự coi là chốt bởi khách hàng hoặc đã thực thi. Sau khi thống nhất toàn bộ GĐ0 mới tiến hành xác định khối lượng và phương pháp effort cho GĐ0, không gán giờ code giả tạo.
