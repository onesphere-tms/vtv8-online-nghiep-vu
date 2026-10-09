# G2-08 – Bình luận và tương tác cộng đồng

> **GĐ2 Media Platform – thiết kế nghiệp vụ sơ bộ 09/10/2026.** Module và tính năng **DRAFT, chưa được người dùng chốt hoặc VTV8 xác nhận**, chưa ước tính giờ FE/BE.

## Mục tiêu
Mở tương tác người xem trên nội dung VTV8Online nếu có đủ căn cứ pháp lý/giấy phép và quy trình kiểm duyệt.

## Ranh giới
**Toàn bộ module là CONDITIONAL** vì nguồn nêu bình luận/tương tác chỉ khi mô hình pháp lý cho phép và cần giấy phép con. Không mặc định xây chat trực tiếp, livestream chat hoặc mạng xã hội riêng.

## Phụ thuộc
Bằng chứng giấy phép/phê duyệt pháp lý; G2-01 user/account; G1-03 content moderation role; chính sách riêng tư, retention và khiếu nại.

## Danh mục tính năng (6)

| Mã | Tính năng | Người sử dụng | Luồng nghiệp vụ và đầu ra | Phần việc FE mới | Phần việc BE mới | Tiêu chí nghiệm thu sơ bộ | Nguồn | Phạm vi đề xuất |
|---|---|---|---|---|---|---|---|---|
| G2-08-F001 | **Bật/tắt tương tác theo loại nội dung** | Quản trị; biên tập | Cấu hình cho phép bình luận trên bài/video/chương trình đủ điều kiện, chặn nội dung hạn chế. | Công tắc và trạng thái cho phép bình luận | Content interaction policy; authorization | Nội dung bị khóa không cho gửi bình luận dù gọi API trực tiếp | C | CONDITIONAL |
| G2-08-F002 | **Gửi và hiển thị bình luận** | Người xem đăng nhập | Nhập bình luận, xem danh sách bình luận hợp lệ theo thời gian và trạng thái duyệt. | Composer, list/pagination, trạng thái gửi | Comment CRUD theo owner, status moderation, nội dung sanitize | Bình luận không hợp lệ bị từ chối, nội dung chờ duyệt không public | T | CONDITIONAL |
| G2-08-F003 | **Phản hồi bình luận có kiểm soát** | Người xem | Trả lời bình luận theo cấu trúc tối đa một cấp hoặc độ sâu do VTV8 duyệt. | Reply UI gọn, thread navigation | Parent relation, nesting/depth validation | Không sinh luồng bình luận vô hạn, không vượt quyền | B | CONDITIONAL |
| G2-08-F004 | **Kiểm duyệt, ẩn và xóa bình luận** | Biên tập; kiểm duyệt | Xem hàng đợi, phê duyệt, ẩn/xóa và ghi lý do; tách khỏi workflow biên tập bài viết G1-03. | Moderation queue, action buttons | State machine comments, moderator role, audit | Bình luận chưa được duyệt không xuất hiện ở chế độ tiền kiểm | B | CONDITIONAL |
| G2-08-F005 | **Báo cáo bình luận vi phạm** | Người xem | Báo cáo bình luận và lựa chọn lý do; nhân sự được phân công xử lý, tránh báo cáo spam. | Report dialog, trạng thái xử lý nếu cần | Flag/report API, queue, rate limit | Nội dung bị report có thể truy vết quyết định xử lý | B | CONDITIONAL |
| G2-08-F006 | **Chống spam và kiểm soát lạm dụng** | Hệ thống; kiểm duyệt | Giới hạn tốc độ gửi, phát hiện trùng đơn giản, chặn tài khoản vi phạm theo quy trình. | Thông báo hạn chế, trạng thái khóa tương tác | Rate limiting, dedupe, restrictions, audit | Tài khoản bị hạn chế không bypass bằng API | B | CONDITIONAL |

**Quy ước:** `T` là nhóm yêu cầu VTV8 nêu trực tiếp (thao tác chi tiết có thể được suy luận); `B` là phân rã nghiệp vụ bổ sung; `C` là hạng mục có điều kiện pháp lý/vendor. `CORE` là đề xuất phạm vi cơ sở, `OPTION` và `CONDITIONAL` chưa mặc nhiên triển khai. Riêng **G2-08 toàn bộ CONDITIONAL** theo tài liệu GĐ2.

[Trở về tổng quan GĐ2](README.md).
