# G1-08 – Tích hợp và vận hành nền tảng Streaming

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Danh mục module đã được người dùng chọn; chi tiết tính năng **DRAFT chờ rà soát với VTV8**. Chưa ước tính giờ FE/BE.

## Mục tiêu
Đảm bảo website có thể nhận/phát video/live qua một giải pháp media có năng lực kiểm chứng, ưu tiên tích hợp nhà cung cấp phù hợp.

## Ranh giới và phụ thuộc
Phân ranh rõ: phần tích hợp do dự án làm; media processing/origin/CDN có thể do VTVcab/VTVprime hoặc bên thứ ba cung cấp; không tự nhận trách nhiệm tự xây Media Server, transcoder, CDN trong baseline nếu chưa có ADR và hợp đồng.

## Danh sách tính năng (9)

| ID | Tính năng | Actor | Luồng xử lý/đầu ra | FE cần làm | BE cần làm | Nghiệm thu sơ bộ | Nguồn | Phạm vi |
|---|---|---|---|---|---|---|---|---|
| G1-08-F001 | **Ma trận năng lực và hợp đồng tích hợp media** | Kiến trúc sư; kỹ thuật | Xác nhận API, cấp stream/channel, quyền truy cập, HLS/DASH, recording, transcoding, CDN, monitoring, giới hạn và đầu mối SLA theo kết quả GĐ0. | Không bắt buộc FE; tài liệu cấu hình | Định nghĩa adapter/interface và hợp đồng tích hợp | Có danh sách API, secret, giới hạn, ai vận hành từng lớp | B | CORE |
| G1-08-F002 | **Cấu hình kết nối đối tác và kênh phát** | Kỹ thuật CMS | Thiết lập môi trường kết nối, kênh streaming, credential và liên kết với sự kiện; secret không hiển thị public. | Màn quản lý kênh nếu phải thao tác thường xuyên | Provider client/API config, secret handling, validation | Có thể gán kênh hợp lệ cho live, secret không lộ | B | CORE |
| G1-08-F003 | **Tích hợp nguồn RTMP/SRT ingest** | Kỹ thuật phát sóng | Thiết lập hoặc tiếp nhận thông tin điểm ingest, stream key/quyền phát từ đối tác; tùy API có thể tự tạo kênh hay cấu hình thủ công. | Hiển thị hướng dẫn và trạng thái ingest, không lộ stream key rộng rãi | Adapter lấy/cấp thông tin ingest, kiểm soát quyền | Kết nối từ nguồn studio theo test case đã thống nhất | C | CONDITIONAL |
| G1-08-F004 | **Playback manifest và tương thích trình phát** | Người xem; kỹ thuật | Kết nối HLS/DASH/URL media hợp lệ, kiểm soát trạng thái nguồn, player config và các trường hợp hết hạn token nếu nhà cung cấp có. | Player adapter chung cho VOD/live | Endpoint manifest/config, URL signing khi vendor yêu cầu | Các luồng VOD/live phát được trên trình duyệt mục tiêu | B | CORE |
| G1-08-F005 | **Cấu hình transcoding và bitrate thích ứng** | Kỹ thuật streaming | Thống nhất các profile 360p/720p/1080p theo năng lực hạ tầng; nếu đối tác cung cấp API cấu hình, hệ thống dùng tích hợp, không tự viết transcoder. | Chỉ có UI profile khi cần người vận hành cấu hình | Provider profiles/config, validation, sync | Player chuyển được chất lượng khi vendor có ABR | C | CONDITIONAL |
| G1-08-F006 | **Kết nối Origin, lưu trữ phân phối và CDN** | Kỹ thuật streaming; DevOps | Cấu hình origin/CDN, cache, domain và đường truyền theo kiến trúc/nhà cung cấp; CDN fees và thiết bị là chi phí riêng. | Không bắt buộc màn riêng; hiển thị tình trạng kết nối khi có | Integrations/domain config, playback routing, audit config | Đường dẫn phát đi qua kênh phân phối đã chốt, không qua web-app server | B | CORE |
| G1-08-F007 | **Tiếp nhận bản ghi sau livestream** | Kỹ thuật media | Nhận webhook/status bản ghi, metadata, URL/file ID; chuyển liên kết về DAM và G1-06 mà không công khai tự động. | Trạng thái bản ghi quản trị | Recording adapter, mapping asset, idempotent ingestion | Một bản ghi không được tạo trùng qua nhiều webhook | T | CORE |
| G1-08-F008 | **Theo dõi trạng thái nguồn và cảnh báo cơ bản** | Kỹ thuật vận hành | Nhận status ingest/playback/recording và các chỉ số đối tác cung cấp, cảnh báo qua kênh nội bộ đã chốt; không mặc định QoE analytics sâu. | Bảng sức khỏe luồng ở mức cho phép | Status polling/webhooks, error metrics, alert integration | Có dấu vết tình trạng lỗi và thông báo đúng sự cố | B | CORE |
| G1-08-F009 | **Kiểm chứng khả năng tải, QoE và SLA** | Kiến trúc sư; QA chuyên sâu; đối tác | Lập kế hoạch kiểm chứng CCU website khác viewer video; test thực tế theo tầng và bằng chứng từ vendor; phân định SLA ứng dụng/CDN/streaming. | Không cần màn người dùng; công cụ test tùy dự án | Test scripts/metrics support, trace kết quả, phối hợp vendor | Báo cáo đạt/chưa đạt và giới hạn đo, không tuyên bố đạt 120k khi chưa test | T | CORE |

**Nguồn:** `T` = nêu trực tiếp trong tài liệu VTV8 về nghiệp vụ hoặc yêu cầu kỹ thuật (chi tiết triển khai vẫn có phần suy luận); `B` = suy luận cần thiết; `C` = phụ thuộc vendor/quyết định. **Phạm vi:** `CORE` = baseline đề xuất, `CONDITIONAL` = chỉ tính effort sau khi phương án được xác nhận. Không nhầm `CORE` với yêu cầu đã được VTV8 ký duyệt.

## Điểm xác nhận trước dự toán
- Cần bản phân công trách nhiệm VTV8/IIEL/VTVcab, tài khoản kỹ thuật, mẫu dữ liệu và trường hợp lỗi thực tế.
- Nếu nhà cung cấp không cung cấp API/kênh recording/cơ sở dữ liệu cần thiết, cập nhật phương án và ước tính lại.
- Mục tiêu 120.000 CCU/SLA trong tài liệu là **yêu cầu kiểm chứng** chứ không phải năng lực đã được đo đạt.

[Xem danh mục GĐ1](README.md).