# G4-01 – Ứng dụng di động iOS/Android

> **GĐ4 – DRAFT phân tích nghiệp vụ ngày 09/10/2026, chưa được VTV8 phê duyệt và chưa có dự toán FE/BE.** GĐ4 là định hướng dài hạn; CORE ở đây là phần cơ sở **nếu chọn kích hoạt nhóm năng lực tương ứng**, không phải yêu cầu triển khai đồng thời toàn GĐ4.

## Mục tiêu
Phân phối nội dung VTV8Online trên mobile, kế thừa API/identity/player GĐ1–GĐ2 và kết nối dịch vụ GĐ3 khi thật sự được triển khai.

## Phân kỳ và kế thừa
- **Nhóm triển khai:** A – Mobile Experience.
- **Không tính trùng:** G1-01/G1-06/G1-07/G1-08 nội dung và player; G2-01/03/04/07/09/10 audience, library, search, notification và entitlement; G3-01/05/07 content-commerce. Không xây mobile backend riêng lặp toàn bộ API.
- **Gate:** tham chiếu [G4-RELEASE-GATES.md](G4-RELEASE-GATES.md) cho các mục CONDITIONAL và các ràng buộc phát hành. Chi tiết UI/API là phân rã đề xuất, chưa được xác nhận trong nguồn.

## Danh mục tính năng (9)

| Mã | Tính năng | Actor | Nghiệp vụ/đầu ra | FE mới | BE/Integration mới | Nghiệm thu sơ bộ | Phạm vi | Căn cứ | Gate/giả định |
|---|---|---|---|---|---|---|---|---|---|
| G4-01-F001 | **Nền tảng ứng dụng và điều hướng** | Người xem | Khởi tạo ứng dụng iOS/Android với điều hướng, trạng thái mạng, cấu hình môi trường, cập nhật và đồng bộ thiết kế thương hiệu. | Mobile app shell, navigation, screens shared UI | BFF/API adapters tối thiểu nếu API web chưa tương thích | Ứng dụng khởi động, điều hướng và xử lý lỗi mạng nhất quán trên phiên bản OS được chốt. | CORE | T4 | APP_OS |
| G4-01-F002 | **Tài khoản và phiên người xem** | Người xem | Đăng nhập/đăng xuất, hồ sơ cá nhân qua audience identity G2-01, không dùng tài khoản CMS. | Mobile login/profile/session UX | Tích hợp token refresh/logout G2-01, không lập user store mới | Phiên bị thu hồi hết quyền trên app, không truy cập profile tài khoản khác. | CORE | P | IDENTITY |
| G4-01-F003 | **Trang chủ, chuyên mục, tìm kiếm** | Người xem | Khám phá bài viết, chương trình, địa danh, video và tìm kiếm nội dung đã published, tái dùng search G2-04. | Native content feed, browse/search và detail layouts | Public content/search API adapters, pagination/cache đúng quyền | Nội dung gỡ/không public không xuất hiện; đi được đến bài và video đúng. | CORE | T4 | CONTENT_API |
| G4-01-F004 | **Phát VOD và livestream trên mobile** | Người xem | Phát video/livestream bằng player SDK phù hợp HLS/DASH/provider, có lỗi mạng, resume nếu G2-03 có dữ liệu. | Mobile player, fullscreen, state/quality thích hợp | Media playback token/session adapter từ G1-08/G2-10 khi cần | Video phát được trên thiết bị thử, không bypass protected stream. | CORE | P | MEDIA_PROVIDER |
| G4-01-F005 | **Thư viện cá nhân và tiếp tục xem** | Người xem | Theo dõi, yêu thích, lịch sử và playlist qua dữ liệu G2-02/03, chỉ hiển thị năng lực đã triển khai. | Mobile My Library, favorites, continue-watching | Đọc/ghi bằng API G2-02/03, không tạo dữ liệu thứ hai | Trạng thái người dùng đồng bộ web/mobile với chính sách quyền xem. | CORE | P | G2_FEATURES |
| G4-01-F006 | **Thông báo đẩy trên điện thoại** | Người xem | Thông báo từ chương trình theo dõi/nội dung cập nhật theo consent, bao gồm đăng ký token thiết bị, opt-in và link sâu. | OS notification permission, notification inbox/deeplink | Push token registration, provider adapter, reuse G2-07 events/preferences | Người từ chối nhận không nhận push; gửi trùng được kiểm soát. | CONDITIONAL | P | PUSH_PROVIDER |
| G4-01-F007 | **Quyền xem premium và membership trên app** | Người xem | Hiển thị gói/quyền xem, thực thi entitlement G2-10; phương án mua trong app phụ thuộc kênh phân phối và quy định thanh toán. | Premium state/paywall, member badge và entitlement-safe player | G2-09/10 entitlement API; commerce/billing adapter chỉ khi mô hình được duyệt | Không cấp premium chỉ bằng thay đổi giao diện; mua gói chỉ hoạt động khi luồng thanh toán hợp lệ. | CONDITIONAL | T4 | MEMBERSHIP_BILLING |
| G4-01-F008 | **Trải nghiệm nội dung tới dịch vụ thương mại** | Người xem | Từ video/bài viết mở offering, gửi lead, referral hoặc booking theo đúng các bước GĐ3 đã mở; không tự giả định có checkout. | Content-to-offer cards, forms hoặc link-out mobile | Dùng API lead/affiliate/booking G3 nếu đã triển khai, không làm order backend riêng | Redirect không bị báo booked/paid; chỉ dịch vụ hợp lệ được hiện. | CONDITIONAL | P | G3_COMMERCIAL |
| G4-01-F009 | **Tải nội dung xem offline** | Người xem | Lưu VOD để xem ngoại tuyến nếu nhà cung cấp, giấy phép khai thác và DRM cho phép; có hạn dùng/xóa tệp. | Downloads view, storage/error/progress offline | Encrypted download/license expiry via provider nếu hỗ trợ, metadata local | Nội dung hết quyền/đã thu hồi không tiếp tục được mở ngoại tuyến trái chính sách. | OPTION | P | OFFLINE_LICENSE |

**Nguồn:** `T4` = hướng App/AI/Membership/Partner/Data được nêu tại lộ trình GĐ4; `TAI` = khả năng nêu ở mục VII AI (trang 11–12); `AKT` = Smart TV/Web/Mobile trong kiến trúc (trang 8); `P` = chi tiết phân tích bổ sung, không có yêu cầu chức năng trực tiếp trong nguồn. **Nhãn T4/TAI/AKT chỉ xác nhận chủ đề, không xác nhận từng thao tác.**

[Danh mục GĐ4](G4-DANH-MUC-TINH-NANG.md) · [Phân kỳ và release gates](G4-RELEASE-GATES.md).
