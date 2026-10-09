# G1-03 – Sản xuất, biên tập và xuất bản nội dung

> **Phân rã GĐ1 V1 ngày 09/10/2026** · Danh sách module được người dùng chọn; **chi tiết tính năng là đề xuất DRAFT**, chưa được VTV8 phê duyệt, chưa tính FE/BE giờ công.

## Mục tiêu
Tin bài đi được trọn vòng đời từ bản nháp đến xuất bản, chỉnh sửa và gỡ.

## Ranh giới
Module này sở hữu nội dung bài viết và workflow; G1-02 chỉ xác thực/phân quyền; G1-04 sở hữu taxonomy/đối tượng có cấu trúc; G1-05 sở hữu file media.

## Danh sách tính năng (9)

| ID | Tính năng | Người sử dụng | Nghiệp vụ / luồng chính | Phần việc FE | Phần việc BE | Tiêu chí nghiệm thu sơ bộ | Nguồn | Phạm vi |
|---|---|---|---|---|---|---|---|---|
| G1-03-F001 | **Soạn thảo và cập nhật bài viết** | Phóng viên; biên tập | Tạo/sửa tiêu đề, sapo, rich-text, slug, ảnh đại diện, tác giả, chuyên mục, tag và nội dung liên quan. | Editor, validation, chọn ảnh từ DAM | CRUD bài và kiểm tra trường bắt buộc, tham chiếu media/taxonomy | Lưu, đọc lại không mất định dạng và tham chiếu | T | CORE |
| G1-03-F002 | **Danh sách bài và quản lý bản nháp** | Phóng viên; biên tập | Lọc bài theo trạng thái, tác giả, chuyên mục và thời gian; lưu nháp thủ công với cảnh báo chưa lưu. | Danh sách, lọc, thao tác bản nháp | API filter/search, ownership và version guard | Người dùng truy cập đúng bài thuộc quyền; nháp không public | B | CORE |
| G1-03-F003 | **Gửi duyệt và hàng đợi biên tập** | Phóng viên; người duyệt | Gửi bài lên hàng đợi, xem nội dung chờ xử lý, phân công/hiển thị người chịu trách nhiệm theo quy trình VTV8. | Nút gửi duyệt, inbox, trạng thái | Workflow transitions và kiểm tra quyền/trạng thái | Không gửi duyệt bài thiếu điều kiện hoặc không hợp lệ | T | CORE |
| G1-03-F004 | **Yêu cầu chỉnh sửa và phê duyệt** | Người duyệt; biên tập | Người duyệt xem, ghi lý do trả bài hoặc phê duyệt; người viết sửa và gửi lại. | Chi tiết bài chờ duyệt, ghi chú, quyết định | History workflow có actor/time/comment, rule chuyển trạng thái | Bài bị trả có lý do; bài chưa duyệt không xuất bản | B | CORE |
| G1-03-F005 | **Xem trước nội dung trước khi công khai** | Phóng viên; người duyệt | Preview bài nháp theo template website, không tạo liên kết public truy cập tự do. | Preview cùng renderer website | API preview an toàn có kiểm tra quyền | Preview được ảnh/video mà không lộ URL công khai của bài nháp | B | CORE |
| G1-03-F006 | **Xuất bản, cập nhật và gỡ bài** | Người có quyền xuất bản | Xuất bản bài đã duyệt, xác lập thời điểm, gỡ bài có lý do; cập nhật sau xuất bản phải tuân thủ quy trình duyệt đã chốt. | Thao tác publish/unpublish, confirm | State machine, public visibility, cache invalidation, audit | Bài đã gỡ không còn nằm trong danh sách public | T | CORE |
| G1-03-F007 | **Lập lịch xuất bản** | Biên tập; người xuất bản | Chọn giờ xuất bản tự động cho bài đã được duyệt, hủy/đổi lịch, trạng thái job. | Date/time picker, lịch đã đặt | Job scheduler, timezone, idempotent retry | Không xuất bản sai giờ hoặc bài chưa duyệt | C | OPTION |
| G1-03-F008 | **Lịch sử phiên bản và khôi phục** | Biên tập; người duyệt | Xem các bản sửa đã lưu, so sánh và khôi phục phiên bản theo quyền; xác định rõ xử lý bài đang published. | Danh sách revision, diff/restore UI | Revision snapshots, rollback giữ audit trail | Khôi phục không mất bản lưu trước; không bypass duyệt | C | OPTION |
| G1-03-F009 | **Điều phối vị trí hiển thị nội dung** | Biên tập; người xuất bản | Ghim nổi bật, thứ tự ưu tiên/trang chủ hoặc chuyên mục trong các slot đã định nghĩa; không xây page builder. | UI chọn slot và ưu tiên | CRUD editorial placement, chống slot trùng, cache | Nội dung hết hiệu lực/đã gỡ không hiển thị trong slot | B | CORE |

**Chú giải:** `T` = có chủ đề/yêu cầu trực tiếp trong đề xuất VTV8 (thao tác chi tiết có thể được suy ra); `B` = bổ sung suy luận để V1 hoạt động trọn luồng; `C` = có điều kiện hoặc lựa chọn cần xác nhận. `CORE` = đề xuất đưa vào phạm vi V1 cơ sở để lập dự toán; `OPTION` = chưa đưa vào giờ cơ sở khi chưa chốt. Các cột FE/BE là **phạm vi việc**, chưa phải ước tính thời gian.

## Những điều cần xác nhận
- Số lượng hồ sơ và người dùng, quy trình hiện hữu của VTV8 và tiêu chí đầu ra tương ứng.
- Số mẫu màn hình và vòng phản hồi UX/UI theo kết quả GĐ0.
- Giới hạn nghiệp vụ đặc thù phải xác nhận trước khi báo giá cố định.

## Liên kết
[Xem toàn bộ danh mục GĐ1](README.md).