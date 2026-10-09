# G1-08 – Tích hợp và vận hành nền tảng Streaming

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Danh mục module đã được người dùng chọn; chi tiết tính năng **DRAFT chờ rà soát với VTV8**. Chưa ước tính giờ FE/BE.

## Mục tiêu
Đảm bảo website có thể nhận/phát video/live qua một giải pháp media có năng lực kiểm chứng, ưu tiên tích hợp nhà cung cấp phù hợp.

## Ranh giới và phụ thuộc
Phân ranh rõ: phần tích hợp do dự án làm; media processing/origin/CDN có thể do VTVcab/VTVprime hoặc bên thứ ba cung cấp; không tự nhận trách nhiệm tự xây Media Server, transcoder, CDN trong baseline nếu chưa có ADR và hợp đồng.

## Danh sách tính năng (7)

| ID | Tính năng | Người sử dụng | Nghiệp vụ và đầu ra | FE cần làm | BE cần làm | Nghiệm thu riêng | Nguồn | Phạm vi | Ranh giới sau QA |
|---|---|---|---|---|---|---|---|---|---|
| G1-08-F002 | **Cấu hình kết nối đối tác và kênh phát** | Kỹ thuật CMS | Cấu hình adapter/provider và nguồn phát theo thông số đã xác nhận; secrets nằm trong secret manager/config an toàn, không mặc định UI nhập khóa bí mật. | Danh sách/chọn kênh nếu vận hành cần | Provider API adapter, secrets/config bảo mật | Không lộ stream key, signed token, API credentials qua UI hoặc logs. | B | CORE | Giữ adapter cấu hình/kênh; ưu tiên cấu hình bí mật qua môi trường/secret manager, không mặc định xây UI quản lý credentials. |
| G1-08-F003 | **Tích hợp nguồn RTMP/SRT ingest** | Kỹ thuật phát sóng | Thiết lập hoặc tiếp nhận thông tin điểm ingest, stream key/quyền phát từ đối tác; tùy API có thể tự tạo kênh hay cấu hình thủ công. | Hiển thị hướng dẫn và trạng thái ingest, không lộ stream key rộng rãi | Adapter lấy/cấp thông tin ingest, kiểm soát quyền | Kết nối từ nguồn studio theo test case đã thống nhất | C | CONDITIONAL | Ingest RTMP/SRT chỉ tính nếu thuộc trách nhiệm VTV8Online; yêu cầu live có nguồn phát nhưng không mặc định viết ingest server. |
| G1-08-F004 | **Playback manifest và tương thích trình phát** | Người xem; kỹ thuật | Playback adapter dùng chung cho VOD và live, HLS/DASH tùy provider; cấu hình player/token khi cần, không tạo player FE thứ hai. | Source/config adapter cho shared player G1-06-F003 | Provider playback config API/URL signing khi cần | VOD/live nhận URL phù hợp, bản private không lộ khi chưa cấp quyền. | B | CORE | Giữ phạm vi và nghiệm thu đã mô tả. |
| G1-08-F005 | **Cấu hình transcoding và bitrate thích ứng** | Kỹ thuật streaming | Chỉ cấu hình transcoding/ABR profile nếu provider cho API và trách nhiệm thuộc VTV8Online; không tự viết transcoder/media server. | Chỉ có UI nếu vận hành profile bằng CMS được xác nhận | Provider config API/validation nếu có | Theo năng lực provider, kiểm tra 360/720/1080p nếu đã chốt; không tự nhận cung cấp transcoding. | C | CONDITIONAL | ABR/transcoding phải có năng lực tương thích, nhưng API cấu hình riêng không bắt buộc nếu nhà cung cấp xử lý; không tự viết transcoder trong baseline. |
| G1-08-F006 | **Kết nối Origin, lưu trữ phân phối và CDN** | Kỹ thuật streaming; DevOps | Tích hợp/cấu hình origin/CDN phân phối video theo phương án chọn; media traffic/chi phí vendor và cấu hình DevOps tách ngoài FE/BE. | Không có UI riêng mặc định | Route/manifest domain config; provider integration khi có API | Luồng video dùng CDN đã chốt, không phục vụ trực tiếp từ app web server. | B | CORE | Giữ công việc CDN/origin, chủ yếu tích hợp/cấu hình; làm rõ ai có quyền truy cập vận hành, chi phí CDN là vendor, không ép vào giờ BE. |
| G1-08-F007 | **Tiếp nhận bản ghi sau livestream** | Kỹ thuật media | Nhận recording metadata/webhook từ provider, kiểm tra idempotency, liên kết asset DAM; G1-07 chỉ gắn phiên và G1-06 xuất bản phát lại. | Trạng thái nhận bản ghi phục vụ quản trị nếu cần | Recording adapter/webhook, idempotent mapping đến DAM | Webhook gửi lại không tạo bản ghi mới; chưa duyệt thì không public. | T | CORE | Giữ nhận recording, điều kiện webhook/API cần xác nhận; nếu không hỗ trợ recording thì cần phương án riêng và dự toán thay đổi. |
| G1-08-F008 | **Theo dõi trạng thái nguồn và cảnh báo cơ bản** | Kỹ thuật vận hành | Theo dõi ingest/playback/recording theo chỉ số nhà cung cấp cho phép, cảnh báo vận hành cơ bản; QoE analytics người xem nâng cao không mặc định. | View tình trạng/alerts ở mức tối thiểu | Vendor status polling/webhooks, alert hook, log | Có trạng thái và dấu vết khi stream bị lỗi; chỉ tiêu chưa có API phải ghi chưa hỗ trợ. | B | CORE | Giữ health/alerts cơ bản trên chỉ số vendor cung cấp; QoE sâu/client-side telemetry chỉ tính theo yêu cầu có căn cứ. |

**Quy ước:** T = chủ đề trong tài liệu VTV8 (chi tiết suy luận phải xác nhận); B = bổ sung; C = phụ thuộc vendor/quyết định. CORE = đề xuất V1; CONDITIONAL/OPTION = chưa tính giờ cơ sở. Xem [nghiệm thu chung](G1-TIEU-CHI-NGHIEM-THU.md) và [thành phần dùng chung](G1-THANH-PHAN-DUNG-CHUNG.md). Chưa có giờ FE/BE.

## Điểm xác nhận trước dự toán
- Cần bản phân công trách nhiệm VTV8/IIEL/VTVcab, tài khoản kỹ thuật, mẫu dữ liệu và trường hợp lỗi thực tế.
- Nếu nhà cung cấp không cung cấp API/kênh recording/cơ sở dữ liệu cần thiết, cập nhật phương án và ước tính lại.
- Mục tiêu 120.000 CCU/SLA trong tài liệu là **yêu cầu kiểm chứng** chứ không phải năng lực đã được đo đạt.

[Xem danh mục GĐ1](README.md).
## Mã gốc chuyển sang WBS phi-feature

| Mã cũ | Công việc | Nơi quản lý |
|---|---|---|
| G1-08-F001 | Ma trận năng lực và hợp đồng tích hợp media | G1-H02-W011 (tiếp nhận/đối chiếu thông số tích hợp từ G0-06) |
| G1-08-F009 | Kiểm chứng khả năng tải, QoE và SLA | G1-H02-W007 (kiểm thử hiệu năng và SLA Streaming) |

**Không ước tính như một tính năng FE/BE; đầu việc vẫn còn trong GĐ1 hoặc là đầu vào GĐ0 cần bàn giao.**
