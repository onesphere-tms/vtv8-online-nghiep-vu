# G2-H01 – Hạ tầng và vận hành Media Platform (DRAFT)

> **Công việc kỹ thuật xuyên module, không đồng nhất với feature FE/BE.** Chỉ phát triển hạ tầng mới/phần nâng cấp chưa có ở GĐ1, không tính lại backup/CDN/player đã triển khai.

| Mã | Công việc | Đầu ra cần có | Điều kiện và chi phí cần tách |
|---|---|---|---|
| G2-H01-W001 | Mở rộng mô hình tài khoản người xem | Environment/config/secrets/auth-provider, chính sách tài khoản riêng CMS | DevOps/security, SMS/email identity provider nếu cần |
| G2-H01-W002 | Dịch vụ/chỉ mục tìm kiếm | Thiết lập search index, đồng bộ publish/unpublish, sao lưu/rebuild | Cân nhắc DB search trước, OpenSearch chỉ nếu tải/chức năng cần |
| G2-H01-W003 | Hệ thống xử lý event và retention | Queue/store/aggregation và chính sách giữ dữ liệu xem | Chi phí analytics, data storage, user privacy; không mặc định ClickHouse |
| G2-H01-W004 | Hạ tầng thông báo | Email/Web Push config, secret, dịch vụ gửi và lỗi | Chỉ triển khai kênh được chốt, không mặc định mobile push |
| G2-H01-W005 | Hạ tầng subscription và DRM provider | Cấu hình sandbox/prod gateway, webhook, DRM token/license provider | Vendor fee/license và kiểm tra bảo mật, không tự viết DRM |
| G2-H01-W006 | Media QoE và năng lực phát nâng cấp | Provider metrics, QoE monitoring, phân loại tải/cấu hình CDN video nếu nâng cấp | Phí media/CDN và tải phụ thuộc SLA, không tính lại G1-08 |
| G2-H01-W007 | Bảo mật, sao lưu, monitoring mở rộng | Logs/alerting, retention cá nhân và cải thiện monitoring toàn nền tảng | Chỉ tính phần tăng từ G1-H01, không mua lại hạ tầng cũ |
