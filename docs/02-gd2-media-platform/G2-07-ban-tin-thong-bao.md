# G2-07 – Bản tin cập nhật và thông báo

> **GĐ2 Media Platform – phạm vi nội bộ đã chuẩn hóa 09/10/2026.** Chưa được VTV8 phê duyệt, chưa tính giờ FE/BE.

## Mục tiêu
Thông báo cho người xem về chương trình và nội dung quan tâm qua các kênh phù hợp Media Platform.

## Ranh giới
Thông báo trong website là phạm vi cơ bản đề xuất; email newsletter/web push cần xác nhận kênh, sự đồng ý và nhà cung cấp. Không triển khai mobile push khi chưa có native app GĐ4.

## Phụ thuộc
G2-01 user/consent; G2-02 follow; G1-03/G1-04 publish content; G1-07 lịch live.

## Danh mục tính năng (7)

| ID | Tính năng | Actor | Nghiệp vụ | FE mới | BE mới | Nghiệm thu | Nguồn | Phạm vi | Ranh giới sau rà soát |
|---|---|---|---|---|---|---|---|---|---|
| G2-07-F001 | **Quản lý nội dung bản tin cập nhật** | Biên tập; bộ phận nội dung | Bản tin cập nhật có thể là danh sách nội dung/notification/digest, chưa được VTV8 xác nhận loại kênh; sử dụng CMS GĐ1 để chọn nội dung công khai, không làm CMS thứ hai. | Form chọn nội dung, preview template có sẵn | Notification-source metadata/refs và kiểm tra public status | Không gửi thông báo về bài nháp/đã gỡ | T | CORE | Nguồn chỉ ghi 'bản tin cập nhật'; cần xác nhận đó là mục tin theo chương trình, bản tin biên tập trên web hay newsletter email, không mặc định xây một CMS thứ hai. |
| G2-07-F002 | **Sinh thông báo theo chương trình đang theo dõi** | Người xem đăng nhập | Thông báo trong tài khoản khi chương trình theo dõi xuất bản tập mới/lịch phát, lọc preference/consent, idempotent và không gửi lặp. | Badge/inbox integration, settings follow | Event trigger theo follow và CMS, recipient filter, dedupe, inbox create log | Một lần phát sinh không tạo nhiều thông báo trùng | B | CORE | Thông báo follow dùng event xuất bản/lịch G1, lọc theo trạng thái người nhận, idempotency và chống gửi trùng; không phát lại cho mọi user nếu không theo dõi. |
| G2-07-F003 | **Hộp thư thông báo trong tài khoản** | Người xem đăng nhập | Inbox trên website quản lý thông báo mới/đã đọc và link nội dung; trạng thái tạo/đọc và log cơ bản là CORE không phụ thuộc email/web push. | Trang/hộp thông báo, unread badge, mark read | Inbox store/read API và log trạng thái tạo/đọc tối thiểu | Chỉ đọc được inbox cá nhân, badge khớp số chưa đọc | B | CORE | Giữ nghiệp vụ theo nguồn/đề xuất, chỉ phát triển phần mới. |
| G2-07-F004 | **Thông báo đẩy trên trình duyệt** | Người xem | Xin quyền nhận web push, đăng ký/bỏ đăng ký thiết bị và nhận thông báo ngay cả khi không ở trang. | Consent browser và trạng thái bật/tắt | Web push subscription, queue/delivery adapter | Chỉ gửi khi người xem đã cấp quyền; hỗ trợ trình duyệt mục tiêu | T | CONDITIONAL | Giữ nghiệp vụ theo nguồn/đề xuất, chỉ phát triển phần mới. |
| G2-07-F005 | **Bản tin cập nhật qua email** | Người xem | Đăng ký/huỷ email nhận bản tin với danh mục nội dung được chọn; dùng nhà cung cấp email được VTV8 cho phép. | Form subscription/unsubscribe, email settings | Email list consent, opt-out và email delivery adapter | Hủy đăng ký được ghi nhận, không gửi cho người đã từ chối | B | OPTION | Giữ nghiệp vụ theo nguồn/đề xuất, chỉ phát triển phần mới. |
| G2-07-F006 | **Thiết lập sở thích và tần suất thông báo** | Người xem | Một bộ tùy chọn thông báo sử dụng consent G2-01 và danh sách follow G2-02; lựa chọn kênh chỉ hiện nếu kênh được triển khai. | Trang preferences trong tài khoản | Recipient preferences/filtering dùng consent history G2-01 | Cài đặt tắt một loại/kênh được áp dụng cho thông báo mới | B | CORE | Sở thích thông báo dùng chính sách consent G2-01-F005, preferences follow G2-02; UI duy nhất cho cài đặt thông báo, không nhân đôi. |
| G2-07-F007 | **Theo dõi trạng thái gửi và lỗi** | Nhân sự vận hành | CONDITIONAL: chỉ triển khai dashboard delivery/retry chuyên sâu khi kích hoạt push/email từ F004/F005; inbox CORE chỉ cần log tạo/đọc cơ bản. | Bảng lỗi/gửi theo kênh khi kích hoạt | Delivery status retry/log/idempotency theo adapter/provider được chốt | Kênh chưa bật không cần console; khi bật có log gửi lỗi và cơ chế retry không trùng. | B | CONDITIONAL | Dashboard gửi/retry nâng cao chỉ cần khi web push/email được kích hoạt; CORE inbox chỉ cần trạng thái tạo/đọc cơ bản và audit, tránh xây delivery suite trước kênh. |

**Quy ước:** T = nhóm yêu cầu trong nguồn VTV8, B = bổ sung suy luận, C = phụ thuộc pháp lý/vendor. CORE = đề xuất triển khai GĐ2 cơ sở, OPTION = chỉ thực hiện khi chọn, CONDITIONAL = cần gate xác nhận. Xem [66 tính năng](G2-DANH-MUC-TINH-NANG.md), [mapping 72→66](G2-MAPPING-72-66.md) và [kịch bản nghiệm thu](G2-TIEU-CHI-NGHIEM-THU.md). Chưa có giờ FE/BE.

[Trở về tổng quan GĐ2](README.md).
