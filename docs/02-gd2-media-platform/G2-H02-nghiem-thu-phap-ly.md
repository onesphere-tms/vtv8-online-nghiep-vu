# G2-H02 – Pháp lý, kiểm thử và chuyển giao Media Platform (DRAFT)

> **Nhóm công việc ngoài phát triển chức năng thông thường.** Không tự chốt điều kiện pháp lý, mô hình đăng ký trả phí hay QA chuyên sâu khi chưa có đầu vào VTV8 và nhà cung cấp.

| Mã | Công việc | Đầu ra/tiêu chí | Ranh giới |
|---|---|---|---|
| G2-H02-W001 | Rà soát điều kiện pháp lý bình luận/tương tác | Hồ sơ xác nhận có/không được triển khai module G2-08, chính sách kiểm duyệt | Gate bắt buộc trước khi chọn G2-08; không thay luật sư/quyết định cơ quan quản lý |
| G2-H02-W002 | Xác nhận điều khoản thuê bao, thanh toán và hoàn tiền | Giá/gói/chu kỳ/chủ thể giao dịch, chính sách payment/refund và đối tác | Gate nghiệp vụ cho G2-09/G2-10, không giả định tự thu tiền |
| G2-H02-W003 | UAT Account/SSO và dữ liệu cá nhân | Kịch bản đăng ký, reset, consent, yêu cầu dữ liệu, phân quyền | Chỉ tính UAT/hỗ trợ ngoài QA chuẩn, không viết IAM lại |
| G2-H02-W004 | Kiểm thử quyền xem và DRM trên trình duyệt/thiết bị | Ma trận entitlement, gói/hết hạn, player, DRM license và luồng lỗi | Hợp tác vendor; tự xây DRM không mặc định |
| G2-H02-W005 | Kiểm tra số liệu hành vi, search và gợi ý | Đối soát event count, privacy, search visibility, recommendations | Chỉ QA chuyên sâu ngoài test feature chuẩn mới tách riêng |
| G2-H02-W006 | Kiểm chứng hiệu năng Media Platform | Tải API account/search/events, media QoE/SLA theo nguồn và quy tắc đo | Phân biệt media tests GĐ1 và tăng tải mới của GĐ2; yêu cầu provider nếu có |
| G2-H02-W007 | Cutover/nâng cấp từ GĐ1 | Kế hoạch migration user/media metadata nếu có, rollback và go-live dịch vụ mới | Không đổi cơ sở dữ liệu GĐ1 chỉ vì GĐ2 xuất hiện |
| G2-H02-W008 | Đào tạo/bàn giao vận hành GĐ2 | Hướng dẫn quản trị thuê bao, analytics, moderation nếu bật và notification | Bàn giao ngoài QA, không lặp GĐ1 |
