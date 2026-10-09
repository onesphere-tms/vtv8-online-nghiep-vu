# G0-05 – Thiết kế kiến trúc nền tảng, dữ liệu và bảo mật

> **Trạng thái module GĐ0:** Đã thống nhất nội bộ tên, mục tiêu và ranh giới module (09/10/2026).  
> **Danh sách công việc Fxxx:** DRAFT – đề xuất đầy đủ để rà soát toàn bộ GĐ0; chưa chốt nội bộ từng danh sách, chưa được VTV8 xác nhận.  
> **Chưa tính:** FE/BE Middle Developer, BA/Design/QA, MD, giá, timeline chi tiết.

## 1. Mục tiêu

Xây dựng phương án solution architecture đáp ứng GĐ1 và phát triển tăng dần qua GĐ2–GĐ4, có khung yêu cầu phi chức năng và trách nhiệm vận hành rõ ràng.

**Nguồn đối chiếu:** Phần Kiến trúc kỹ thuật, video architecture, bài toán 120k CCU, lưu trữ video, lựa chọn cơ sở dữ liệu; GĐ0 yêu cầu kiến trúc, SLA/CDN.

## 2. Đối tượng phối hợp, đầu vào và đầu ra

- **Đối tượng phối hợp dự kiến:** Kiến trúc sư/technical lead, quản trị hạ tầng, DevOps, bảo mật, đại diện VTVcab ở điểm tích hợp, BA/Product owner.
- **Đầu vào cần có:** Yêu cầu và user flows G0-01, hiện trạng G0-02, rights policy G0-03, taxonomy G0-04, các kịch bản media G0-06.
- **Sản phẩm bàn giao cấp module:** Tài liệu/tập bảng khảo sát và ma trận đánh giá tổng hợp từ danh mục bên dưới; các phần được tích hợp chung trong bộ hồ sơ GĐ0, không nhất thiết mỗi Fxxx là một báo cáo riêng.
- **Phương pháp:** rà soát tài liệu và hệ thống được phép tiếp cận, phỏng vấn stakeholder, thu thập bằng chứng, lập bảng đối chiếu, trình xác nhận các điểm mở. Sự kiện khảo sát thực tế **chưa diễn ra** trong bản phân tích này.

## 3. Danh mục công việc đề xuất (10 mục)

| ID | Công việc | Nội dung | Đầu ra |
|---|---|---|---|
| G0-05-F001 | Xác định NFR và giả định quy mô | Làm rõ SLA dự kiến, đối tượng sử dụng, số bài/video, peak traffic, phân loại CCU đọc trang vs CCU xem video, lưu trữ và retention. | NFR Register có mục tiêu/cách đo/nguồn số liệu/chưa xác nhận. |
| G0-05-F002 | Phân rã ứng dụng và service boundaries | Xác định các phân hệ Web/CMS/Content/DAM/User/Search/Live/Analytics/Commerce theo giai đoạn. | Component diagram và responsibility boundaries/API ownership cấp tổng thể. |
| G0-05-F003 | Kiến trúc dữ liệu và entity tổng thể | Định nghĩa nhóm entity chính: content, media asset, program/series, location, heritage, author, role, rights, audience (sau này). | Conceptual ERD/data flow và ownership dữ liệu. |
| G0-05-F004 | Chiến lược lưu trữ, tìm kiếm và cache | So sánh hướng sử dụng PostgreSQL, Redis, object storage, search, analytics theo nhu cầu và lộ trình triển khai. | Technology options cùng điều kiện bật thêm thành phần. |
| G0-05-F005 | Danh mục tích hợp và hợp đồng dữ liệu cấp cao | Đặt ranh giới API giữa website/CMS/media/partner và bên thứ ba, mô hình xác thực, lỗi/truyền lại. | System Context + Integration Register cấp cao. |
| G0-05-F006 | Kiến trúc identity, phân quyền và bảo vệ dữ liệu | Định hướng IAM CMS, RBAC, secret management, bảo vệ dữ liệu người dùng, audit và quyền truy cập asset. | Security baseline và quyền kỹ thuật cấp kiến trúc. |
| G0-05-F007 | Hạ tầng triển khai và khả năng mở rộng | Lớp web/app, DB, cache, storage, CDN edge, load balancing, WAF, môi trường stage/production và đường mở rộng. | Deployment topology sơ bộ, sizing assumptions và điểm bottleneck. |
| G0-05-F008 | Sao lưu, khôi phục và observability | Xác định backup/restore, retention log, metrics/alerting, phân loại sự cố, đề xuất RPO/RTO/SLA cần xác nhận. | Operation/NFR checklist, mục tiêu phục hồi chưa chốt. |
| G0-05-F009 | Đánh giá phương án công nghệ và chi phí | So sánh kế thừa/xây mới, monolith/modular vs chia dịch vụ, managed services vs self-hosted và các rủi ro. | Decision matrix về trade-off: effort, vận hành, mở rộng, vendor lock-in. |
| G0-05-F010 | Lộ trình kiến trúc và rà soát giải pháp | Xác định kiến trúc V1 tối thiểu và các điểm mở rộng cho GĐ2–GĐ4; ghi các quyết định cần phê duyệt. | Architecture Decision List, roadmap kỹ thuật và checklist review. |

## 4. Phân tích công việc và đầu ra

### G0-05-F001 – Xác định NFR và giả định quy mô

- **Nội dung:** Làm rõ SLA dự kiến, đối tượng sử dụng, số bài/video, peak traffic, phân loại CCU đọc trang vs CCU xem video, lưu trữ và retention.
- **Sản phẩm/bằng chứng:** NFR Register có mục tiêu/cách đo/nguồn số liệu/chưa xác nhận.
- **Điều kiện hoàn thành ở bước khảo sát:** Không xem 120k CCU là capacity đã được kiểm chứng.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-05-F002 – Phân rã ứng dụng và service boundaries

- **Nội dung:** Xác định các phân hệ Web/CMS/Content/DAM/User/Search/Live/Analytics/Commerce theo giai đoạn.
- **Sản phẩm/bằng chứng:** Component diagram và responsibility boundaries/API ownership cấp tổng thể.
- **Điều kiện hoàn thành ở bước khảo sát:** Không mặc định microservices bắt buộc ngay ở V1.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-05-F003 – Kiến trúc dữ liệu và entity tổng thể

- **Nội dung:** Định nghĩa nhóm entity chính: content, media asset, program/series, location, heritage, author, role, rights, audience (sau này).
- **Sản phẩm/bằng chứng:** Conceptual ERD/data flow và ownership dữ liệu.
- **Điều kiện hoàn thành ở bước khảo sát:** Không làm data mapping chi tiết migration tại đây.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-05-F004 – Chiến lược lưu trữ, tìm kiếm và cache

- **Nội dung:** So sánh hướng sử dụng PostgreSQL, Redis, object storage, search, analytics theo nhu cầu và lộ trình triển khai.
- **Sản phẩm/bằng chứng:** Technology options cùng điều kiện bật thêm thành phần.
- **Điều kiện hoàn thành ở bước khảo sát:** Không tự mặc định OpenSearch, ClickHouse, MongoDB hay Cassandra phải triển khai GĐ1.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-05-F005 – Danh mục tích hợp và hợp đồng dữ liệu cấp cao

- **Nội dung:** Đặt ranh giới API giữa website/CMS/media/partner và bên thứ ba, mô hình xác thực, lỗi/truyền lại.
- **Sản phẩm/bằng chứng:** System Context + Integration Register cấp cao.
- **Điều kiện hoàn thành ở bước khảo sát:** Chi tiết protocol/băng thông/video thuộc G0-06; data mapping thuộc G0-07.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-05-F006 – Kiến trúc identity, phân quyền và bảo vệ dữ liệu

- **Nội dung:** Định hướng IAM CMS, RBAC, secret management, bảo vệ dữ liệu người dùng, audit và quyền truy cập asset.
- **Sản phẩm/bằng chứng:** Security baseline và quyền kỹ thuật cấp kiến trúc.
- **Điều kiện hoàn thành ở bước khảo sát:** Không tự đưa ra khẳng định đạt chứng chỉ hoặc compliance pháp lý.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-05-F007 – Hạ tầng triển khai và khả năng mở rộng

- **Nội dung:** Lớp web/app, DB, cache, storage, CDN edge, load balancing, WAF, môi trường stage/production và đường mở rộng.
- **Sản phẩm/bằng chứng:** Deployment topology sơ bộ, sizing assumptions và điểm bottleneck.
- **Điều kiện hoàn thành ở bước khảo sát:** CDN cho media chỉ mô tả interface; thiết kế/giá stream chi tiết G0-06.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-05-F008 – Sao lưu, khôi phục và observability

- **Nội dung:** Xác định backup/restore, retention log, metrics/alerting, phân loại sự cố, đề xuất RPO/RTO/SLA cần xác nhận.
- **Sản phẩm/bằng chứng:** Operation/NFR checklist, mục tiêu phục hồi chưa chốt.
- **Điều kiện hoàn thành ở bước khảo sát:** Không mô tả runbook production đã được kiểm chứng khi chưa vận hành.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-05-F009 – Đánh giá phương án công nghệ và chi phí

- **Nội dung:** So sánh kế thừa/xây mới, monolith/modular vs chia dịch vụ, managed services vs self-hosted và các rủi ro.
- **Sản phẩm/bằng chứng:** Decision matrix về trade-off: effort, vận hành, mở rộng, vendor lock-in.
- **Điều kiện hoàn thành ở bước khảo sát:** Giá cloud/vendor chỉ ở mức kịch bản TBC, không phải báo giá có hiệu lực.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-05-F010 – Lộ trình kiến trúc và rà soát giải pháp

- **Nội dung:** Xác định kiến trúc V1 tối thiểu và các điểm mở rộng cho GĐ2–GĐ4; ghi các quyết định cần phê duyệt.
- **Sản phẩm/bằng chứng:** Architecture Decision List, roadmap kỹ thuật và checklist review.
- **Điều kiện hoàn thành ở bước khảo sát:** Không cố định sớm triển khai công nghệ chưa cần ở V1.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.


## 5. Giới hạn phạm vi và tránh trùng lặp

Solution architecture cấp tổng thể, nguyên tắc data/security/NFR, không đi sâu mọi endpoint hoặc triển khai hạ tầng production; media pipeline chuyên sâu thuộc G0-06.

## 6. Rủi ro và dữ kiện còn thiếu

- Kịch bản tăng tải và SLA có thể yêu cầu hạ tầng khác nhau theo website/live.
- Vai trò vận hành hạ tầng streaming giữa VTV8, VTVcab và IIEL chưa xác minh.
- Các số liệu quota/storage/cost chưa có đo đạc sẽ được giữ là assumption.
- Khối lượng khảo sát (số hệ thống/nguồn dữ liệu/buổi workshop/màn hình/tài liệu) chưa có xác nhận và phải là input khi dự toán.
- Nội dung chưa có bằng chứng được đánh dấu `TBC` kèm người/phương thức xác minh.

## 7. Nghiệm thu ở cấp module và bước tiếp theo

Một hạng mục khảo sát chỉ coi là hoàn thành khi có **sản phẩm/bảng kiểm/biên bản** được chỉ ra trong từng công việc, ghi **nguồn bằng chứng**, giới hạn khảo sát và câu hỏi đang mở; chủ sở hữu nghiệp vụ của VTV8 phải có cơ hội rà soát. **Chưa tự coi là đã nghiệm thu khi mới tạo tài liệu kế hoạch này.**

**Trạng thái hiện tại:** Danh mục Fxxx đã được **soạn đầy đủ để rà soát**, không tự coi là chốt bởi khách hàng hoặc đã thực thi. Sau khi thống nhất toàn bộ GĐ0 mới tiến hành xác định khối lượng và phương pháp effort cho GĐ0, không gán giờ code giả tạo.
