# G2-07 – Bản tin cập nhật và thông báo

> **GĐ2 Media Platform – thiết kế nghiệp vụ sơ bộ 09/10/2026.** Module và tính năng **DRAFT, chưa được người dùng chốt hoặc VTV8 xác nhận**, chưa ước tính giờ FE/BE.

## Mục tiêu
Thông báo cho người xem về chương trình và nội dung quan tâm qua các kênh phù hợp Media Platform.

## Ranh giới
Thông báo trong website là phạm vi cơ bản đề xuất; email newsletter/web push cần xác nhận kênh, sự đồng ý và nhà cung cấp. Không triển khai mobile push khi chưa có native app GĐ4.

## Phụ thuộc
G2-01 user/consent; G2-02 follow; G1-03/G1-04 publish content; G1-07 lịch live.

## Danh mục tính năng (7)

| Mã | Tính năng | Người sử dụng | Luồng nghiệp vụ và đầu ra | Phần việc FE mới | Phần việc BE mới | Tiêu chí nghiệm thu sơ bộ | Nguồn | Phạm vi đề xuất |
|---|---|---|---|---|---|---|---|---|
| G2-07-F001 | **Quản lý nội dung bản tin cập nhật** | Biên tập; bộ phận nội dung | Soạn mục cập nhật/chuyên mục và chọn liên kết bài/video/chương trình đã công khai; tái dùng CMS hiện có. | Form chọn nội dung, preview thông báo | Notification-content metadata, liên kết nguồn published | Không gửi thông báo về bài nháp/đã gỡ | T | CORE |
| G2-07-F002 | **Sinh thông báo theo chương trình đang theo dõi** | Người xem đăng nhập | Khi chương trình có tập mới hoặc lịch phát quan trọng, hệ thống tạo thông báo theo đối tượng follow. | Badge/inbox integration, settings follow | Rule/event trigger từ publish/schedule, chọn người nhận theo follow | Một lần phát sinh không tạo nhiều thông báo trùng | B | CORE |
| G2-07-F003 | **Hộp thư thông báo trong tài khoản** | Người xem đăng nhập | Xem thông báo theo mới/cũ, đánh dấu đã đọc, mở nội dung liên quan. | Trang/hộp thông báo, unread badge, mark read | Notification inbox API, read state, user ownership | Chỉ đọc được inbox cá nhân, badge khớp số chưa đọc | B | CORE |
| G2-07-F004 | **Thông báo đẩy trên trình duyệt** | Người xem | Xin quyền nhận web push, đăng ký/bỏ đăng ký thiết bị và nhận thông báo ngay cả khi không ở trang. | Consent browser và trạng thái bật/tắt | Web push subscription, queue/delivery adapter | Chỉ gửi khi người xem đã cấp quyền; hỗ trợ trình duyệt mục tiêu | T | CONDITIONAL |
| G2-07-F005 | **Bản tin cập nhật qua email** | Người xem | Đăng ký/huỷ email nhận bản tin với danh mục nội dung được chọn; dùng nhà cung cấp email được VTV8 cho phép. | Form subscription/unsubscribe, email settings | Email list consent, opt-out và email delivery adapter | Hủy đăng ký được ghi nhận, không gửi cho người đã từ chối | B | OPTION |
| G2-07-F006 | **Thiết lập sở thích và tần suất thông báo** | Người xem | Chọn loại thông báo, theo dõi chương trình, kênh nhận và khả năng tạm dừng. | Trang preferences trong tài khoản | Preference API và filter recipient | Cài đặt tắt một loại/kênh được áp dụng cho thông báo mới | B | CORE |
| G2-07-F007 | **Theo dõi trạng thái gửi và lỗi** | Nhân sự vận hành | Xem thống kê gửi, thành công/thất bại và thử lại có giới hạn; không phát triển email campaign suite. | Bảng trạng thái đơn giản | Delivery log, retry policy, idempotency | Không gửi trùng khi retry; biết được kênh nào lỗi | B | CORE |

**Quy ước:** `T` là nhóm yêu cầu VTV8 nêu trực tiếp (thao tác chi tiết có thể được suy luận); `B` là phân rã nghiệp vụ bổ sung; `C` là hạng mục có điều kiện pháp lý/vendor. `CORE` là đề xuất phạm vi cơ sở, `OPTION` và `CONDITIONAL` chưa mặc nhiên triển khai. Riêng **G2-08 toàn bộ CONDITIONAL** theo tài liệu GĐ2.

[Trở về tổng quan GĐ2](README.md).
