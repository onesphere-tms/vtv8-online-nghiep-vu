# G1-03 – Sản xuất, biên tập và xuất bản nội dung

> **Phân rã GĐ1 V1 ngày 09/10/2026** · Danh sách module được người dùng chọn; **chi tiết tính năng là đề xuất DRAFT**, chưa được VTV8 phê duyệt, chưa tính FE/BE giờ công.

## Mục tiêu
Tin bài đi được trọn vòng đời từ bản nháp đến xuất bản, chỉnh sửa và gỡ.

## Ranh giới
Module này sở hữu nội dung bài viết và workflow; G1-02 chỉ xác thực/phân quyền; G1-04 sở hữu taxonomy/đối tượng có cấu trúc; G1-05 sở hữu file media.

## Danh sách tính năng (10)

| ID | Tính năng | Người sử dụng | Nghiệp vụ và đầu ra | FE cần làm | BE cần làm | Nghiệm thu riêng | Nguồn | Phạm vi | Ranh giới sau QA |
|---|---|---|---|---|---|---|---|---|---|
| G1-03-F001 | **Soạn thảo và cập nhật bài viết** | Phóng viên; biên tập | Soạn bài bằng rich-text editor có sẵn, quản lý tiêu đề/sapo/slug/ảnh/taxonomy; xác định block và cách dán Word được hỗ trợ, sanitize HTML. | Editor tích hợp, validation, picker ảnh dùng DAM | CRUD content, validation, sanitize và tham chiếu | Rich-text hợp lệ giữ định dạng; script/HTML không an toàn không chạy. | T | CORE | Giữ editor; cần quy định block rich-text, media embeds, kiểm tra HTML/XSS và định dạng dán từ Word; không tự làm trình soạn thảo riêng. |
| G1-03-F002 | **Danh sách bài và quản lý bản nháp** | Phóng viên; biên tập | Lọc bài theo trạng thái, tác giả, chuyên mục và thời gian; lưu nháp thủ công với cảnh báo chưa lưu. | Danh sách, lọc, thao tác bản nháp | API filter/search, ownership và version guard | Người dùng truy cập đúng bài thuộc quyền; nháp không public | B | CORE | Giữ phạm vi và nghiệm thu đã mô tả. |
| G1-03-F003 | **Gửi duyệt và hàng đợi biên tập** | Phóng viên; người duyệt | Gửi bài lên hàng đợi, xem nội dung chờ xử lý, phân công/hiển thị người chịu trách nhiệm theo quy trình VTV8. | Nút gửi duyệt, inbox, trạng thái | Workflow transitions và kiểm tra quyền/trạng thái | Không gửi duyệt bài thiếu điều kiện hoặc không hợp lệ | T | CORE | Giữ gửi duyệt; chưa mặc định tự động phân công nhiều cấp, nhiều phòng, hoặc notification hệ thống. |
| G1-03-F004 | **Yêu cầu chỉnh sửa và phê duyệt** | Người duyệt; biên tập | Người duyệt xem, ghi lý do trả bài hoặc phê duyệt; người viết sửa và gửi lại. | Chi tiết bài chờ duyệt, ghi chú, quyết định | History workflow có actor/time/comment, rule chuyển trạng thái | Bài bị trả có lý do; bài chưa duyệt không xuất bản | B | CORE | Giữ phạm vi và nghiệm thu đã mô tả. |
| G1-03-F005 | **Xem trước nội dung trước khi công khai** | Phóng viên; người duyệt | Preview bài nháp theo template website, không tạo liên kết public truy cập tự do. | Preview tái sử dụng renderer G1-01-F004 và API nháp an toàn, không nhân đôi template | Preview API có kiểm tra quyền truy cập bản nháp | Người ngoài không truy cập bản nháp bằng đường dẫn preview. | B | CORE | Giữ preview, nên dùng renderer G1-01 và URL có xác thực; không làm lại màn preview độc lập. |
| G1-03-F006 | **Xuất bản, cập nhật và gỡ bài** | Người có quyền xuất bản | Chỉ công khai bài đã duyệt và các media đủ quyền theo chính sách DAM; sửa bài published theo quy trình VTV8 xác nhận, gỡ có lý do. | Publish/unpublish và thông báo khi media thiếu quyền | State transition, public guard, media-rights gate, audit và cache invalidation | Bài chưa duyệt/asset bị BLOCK không công khai; gỡ bài ẩn khỏi public. | T | CORE | Giữ publish/unpublish; chốt rõ biên tập bài đang công khai, ngăn vòng tránh duyệt và kiểm tra quyền asset từ G1-05. |
| G1-03-F007 | **Lập lịch xuất bản** | Biên tập; người xuất bản | Chọn giờ xuất bản tự động cho bài đã được duyệt, hủy/đổi lịch, trạng thái job. | Date/time picker, lịch đã đặt | Job scheduler, timezone, idempotent retry | Không xuất bản sai giờ hoặc bài chưa duyệt | C | OPTION | Lịch đăng bài nằm OPTION; xác nhận cần thiết cho lịch làm tin của VTV8. |
| G1-03-F008 | **Lịch sử phiên bản và khôi phục** | Biên tập; người duyệt | Xem các bản sửa đã lưu, so sánh và khôi phục phiên bản theo quyền; xác định rõ xử lý bài đang published. | Danh sách revision, diff/restore UI | Revision snapshots, rollback giữ audit trail | Khôi phục không mất bản lưu trước; không bypass duyệt | C | OPTION | Full diff/restore ở OPTION; vẫn cần audit trạng thái và tối thiểu lưu người/giờ thay đổi trong CORE. |
| G1-03-F009 | **Điều phối vị trí hiển thị nội dung** | Biên tập; người xuất bản | Ghim nổi bật, thứ tự ưu tiên/trang chủ hoặc chuyên mục trong các slot đã định nghĩa; không xây page builder. | UI chọn slot và ưu tiên | CRUD editorial placement, chống slot trùng, cache | Nội dung hết hiệu lực/đã gỡ không hiển thị trong slot | B | CORE | Giữ slot nổi bật cơ bản cho trang chủ; giới hạn số slot, không phát triển hệ điều phối quảng cáo/page builder. |
| G1-03-F010 | **Quản lý trang thông tin tĩnh trên CMS** | Biên tập; người xuất bản | Tạo/sửa/lưu nháp/duyệt/xuất bản trang giới thiệu, liên hệ, chính sách. Tái dùng editor và quy trình CMS, không xây page builder. | Danh sách/form trang tĩnh, editor tái dùng, slug/template giới hạn | Static page CRUD, workflow đã có, public read API | Trang tĩnh chỉ public sau phê duyệt; sửa nội dung trên CMS cập nhật website không cần deploy. | B | CORE | Bổ sung theo QA để G1-01-F009 có đầu vào quản trị; tái dùng editor và quy trình duyệt. |

**Quy ước:** T = yêu cầu/chủ đề trong tài liệu (luồng chi tiết có thể suy ra); B = suy luận triển khai; C = phụ thuộc quyết định. CORE = đề xuất trong V1; OPTION/CONDITIONAL = chưa thuộc effort cơ sở. Xem [tiêu chí nghiệm thu dùng chung](G1-TIEU-CHI-NGHIEM-THU.md) và [thành phần dùng chung](G1-THANH-PHAN-DUNG-CHUNG.md). Chưa có số giờ FE/BE.

## Những điều cần xác nhận
- Số lượng hồ sơ và người dùng, quy trình hiện hữu của VTV8 và tiêu chí đầu ra tương ứng.
- Số mẫu màn hình và vòng phản hồi UX/UI theo kết quả GĐ0.
- Giới hạn nghiệp vụ đặc thù phải xác nhận trước khi báo giá cố định.

## Liên kết
[Xem toàn bộ danh mục GĐ1](README.md).