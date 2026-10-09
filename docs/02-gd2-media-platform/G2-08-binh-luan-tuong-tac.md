# G2-08 – Bình luận và tương tác cộng đồng

> **GĐ2 Media Platform – phạm vi nội bộ đã chuẩn hóa 09/10/2026.** Chưa được VTV8 phê duyệt, chưa tính giờ FE/BE.

## Mục tiêu
Mở tương tác người xem trên nội dung VTV8Online nếu có đủ căn cứ pháp lý/giấy phép và quy trình kiểm duyệt.

## Ranh giới
**Toàn bộ module là CONDITIONAL** vì nguồn nêu bình luận/tương tác chỉ khi mô hình pháp lý cho phép và cần giấy phép con. Không mặc định xây chat trực tiếp, livestream chat hoặc mạng xã hội riêng.

## Phụ thuộc
Bằng chứng giấy phép/phê duyệt pháp lý; G2-01 user/account; G1-03 content moderation role; chính sách riêng tư, retention và khiếu nại.

## Danh mục tính năng (6)

| ID | Tính năng | Actor | Nghiệp vụ | FE mới | BE mới | Nghiệm thu | Nguồn | Phạm vi | Ranh giới sau rà soát |
|---|---|---|---|---|---|---|---|---|---|
| G2-08-F001 | **Bật/tắt tương tác theo loại nội dung** | Quản trị; biên tập | Thiết lập cho phép bình luận theo nội dung chỉ sau khi VTV8 xác minh điều kiện pháp lý, trách nhiệm kiểm duyệt và quy định vận hành. | Công tắc và trạng thái cho phép bình luận | Content interaction policy; authorization | Không có API/tương tác công khai trước khi gate G2-H02-W001 được chốt. | C | CONDITIONAL | Giữ nghiệp vụ theo nguồn/đề xuất, chỉ phát triển phần mới. Chỉ phát hành sau khi đạt gate pháp lý G2-H02-W001. |
| G2-08-F002 | **Gửi và hiển thị bình luận** | Người xem đăng nhập | Chỉ mở bình luận theo chính sách VTV8 và cơ chế tiền kiểm/hậu kiểm được xác nhận; không mặc định cho phép hiển thị ngay. | Composer, list/pagination, trạng thái gửi | Comment CRUD theo owner, status moderation, nội dung sanitize | Chế độ tiền kiểm phải giữ bình luận chờ duyệt kín, chống HTML độc hại. | T | CONDITIONAL | Giữ nghiệp vụ theo nguồn/đề xuất, chỉ phát triển phần mới. Chỉ phát hành sau khi đạt gate pháp lý G2-H02-W001. |
| G2-08-F003 | **Phản hồi bình luận có kiểm soát** | Người xem | Bổ sung phản hồi bình luận theo luồng tối đa một cấp nếu được duyệt bên trong gói tương tác có điều kiện; không mặc định cần thiết để phát hành comment V1 GĐ2. | Reply UI gọn, thread navigation | Parent relation, nesting/depth validation | Không sinh luồng bình luận vô hạn, không vượt quyền | B | CONDITIONAL | Giữ nghiệp vụ theo nguồn/đề xuất, chỉ phát triển phần mới. Chỉ phát hành sau khi đạt gate pháp lý G2-H02-W001. |
| G2-08-F004 | **Kiểm duyệt, ẩn và xóa bình luận** | Biên tập; kiểm duyệt | Điều phối kiểm duyệt, ẩn/xóa có log và nhân sự được phân công; không đồng nhất workflow bình luận với workflow bài viết G1-03. | Moderation queue, action buttons | State machine comments, moderator role, audit | Bình luận chưa được duyệt không xuất hiện ở chế độ tiền kiểm | B | CONDITIONAL | Giữ nghiệp vụ theo nguồn/đề xuất, chỉ phát triển phần mới. Chỉ phát hành sau khi đạt gate pháp lý G2-H02-W001. |
| G2-08-F005 | **Báo cáo bình luận vi phạm** | Người xem | Tiếp nhận báo cáo vi phạm với lý do, số lần báo cáo, trạng thái xử lý và trách nhiệm kiểm duyệt theo chính sách VTV8. | Report dialog, trạng thái xử lý nếu cần | Flag/report API, queue, rate limit | Nội dung bị report có thể truy vết quyết định xử lý | B | CONDITIONAL | Giữ nghiệp vụ theo nguồn/đề xuất, chỉ phát triển phần mới. Chỉ phát hành sau khi đạt gate pháp lý G2-H02-W001. |
| G2-08-F006 | **Chống spam và kiểm soát lạm dụng** | Hệ thống; kiểm duyệt | Giới hạn tốc độ/chống spam, khóa tương tác, dấu vết kiểm duyệt là điều kiện vận hành tối thiểu khi bật bình luận. | Thông báo hạn chế, trạng thái khóa tương tác | Rate limiting, dedupe, restrictions, audit | Tài khoản bị hạn chế không bypass bằng API | B | CONDITIONAL | Giữ nghiệp vụ theo nguồn/đề xuất, chỉ phát triển phần mới. Chỉ phát hành sau khi đạt gate pháp lý G2-H02-W001. |

**Quy ước:** T = nhóm yêu cầu trong nguồn VTV8, B = bổ sung suy luận, C = phụ thuộc pháp lý/vendor. CORE = đề xuất triển khai GĐ2 cơ sở, OPTION = chỉ thực hiện khi chọn, CONDITIONAL = cần gate xác nhận. Xem [66 tính năng](G2-DANH-MUC-TINH-NANG.md), [mapping 72→66](G2-MAPPING-72-66.md) và [kịch bản nghiệm thu](G2-TIEU-CHI-NGHIEM-THU.md). Chưa có giờ FE/BE.

[Trở về tổng quan GĐ2](README.md).
