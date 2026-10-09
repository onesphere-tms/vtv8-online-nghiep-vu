# G2-10 – Paywall, quyền xem và DRM

> **GĐ2 Media Platform – thiết kế nghiệp vụ sơ bộ 09/10/2026.** Module và tính năng **DRAFT, chưa được người dùng chốt hoặc VTV8 xác nhận**, chưa ước tính giờ FE/BE.

## Mục tiêu
Kiểm soát nội dung miễn phí/trả phí và cấp phép xem video theo quyền thuê bao và bản quyền nội dung.

## Ranh giới
G2-09 quản lý gói/giao dịch, G2-10 sở hữu quyền xem nội dung; quyền sở hữu/khai thác asset ở G1-05 vẫn là nguồn pháp lý, không trùng DRM. DRM là tích hợp với nhà cung cấp bản quyền/license server, không tự viết DRM từ đầu.

## Phụ thuộc
G1-05 quyền khai thác, G1-06/07/08 playback, G2-01 user, G2-09 subscription, provider DRM có hợp đồng.

## Danh mục tính năng (7)

| Mã | Tính năng | Người sử dụng | Luồng nghiệp vụ và đầu ra | Phần việc FE mới | Phần việc BE mới | Tiêu chí nghiệm thu sơ bộ | Nguồn | Phạm vi đề xuất |
|---|---|---|---|---|---|---|---|---|
| G2-10-F001 | **Phân loại nội dung miễn phí và trả phí** | Biên tập; quản trị | Gắn trạng thái public/free/subscriber-only hoặc các quyền theo gói với video/chương trình/tập; kiểm tra rights DAM trước khi bán. | CMS tag entitlement, xem trước trạng thái trả phí | Content access policy, mapping plans/content, rights check | Nội dung không đủ bản quyền khai thác không được gắn gói bán trái quy tắc | T | CORE |
| G2-10-F002 | **Kiểm tra quyền xem theo tài khoản** | Người xem; hệ thống | Tại thời điểm truy cập video/live, đánh giá quyền tài khoản, gói đang hiệu lực, địa lý/thiết bị nếu hợp đồng yêu cầu. | Trạng thái cho phép/từ chối, CTA hợp lệ | Centralized entitlement service, cache & revoke | Tài khoản không quyền không nhận stream private chỉ nhờ đoán URL | T | CORE |
| G2-10-F003 | **Giao diện paywall và nâng cấp quyền xem** | Người xem | Thông báo lý do hạn chế, gói phù hợp và đường dẫn đăng ký; không che nội dung premium chỉ bằng CSS. | Paywall modal/page, trạng thái hết gói | Entitlement status/offer API tích hợp G2-09 | Không tiết lộ manifest protected trước khi entitlement được chấp thuận | T | CORE |
| G2-10-F004 | **Bảo vệ URL và phiên phát nội dung có quyền** | Người xem; hệ thống | Cấp URL/token phát giới hạn thời gian và xác thực session, đồng bộ quyền với provider media. | Player state, yêu cầu tải lại quyền khi hết hạn | Signed playback/session token, provider adapter G1-08 | Người không được cấp quyền không tái dùng URL private vô hạn | B | CORE |
| G2-10-F005 | **Tích hợp hệ thống DRM được cấp phép** | Kỹ thuật media; người xem | Kết nối dịch vụ DRM/license để bảo vệ nội dung theo hợp đồng và thiết bị; không phát triển bộ mã hóa/cấp phép DRM từ đầu. | Player DRM config/UX lỗi không hỗ trợ | License provider integration, entitlement-to-DRM mapping | Trình duyệt/thiết bị hỗ trợ xem được, không đủ quyền bị từ chối license | T | CONDITIONAL |
| G2-10-F006 | **Quản lý số thiết bị/phiên xem đồng thời** | Người xem; vận hành | Giới hạn thiết bị hoặc số luồng xem đồng thời theo gói/điều khoản nếu mô hình kinh doanh cần. | Thông báo vượt giới hạn và quản lý thiết bị nếu cần | Concurrent-session policy, lease/expiry | Không vượt giới hạn đã đăng ký; có cơ chế giải phóng phiên bất thường | B | OPTION |
| G2-10-F007 | **Thời hạn khả dụng theo giấy phép nội dung** | Biên tập; bộ phận bản quyền | Đối chiếu quyền phát lại, khung giờ/địa bàn hoặc thời hạn khai thác từ DAM để từ chối quyền xem khi không còn hiệu lực. | Thông báo unavailable và lý do phù hợp | Entitlement kiểm tra asset rights/window từ G1-05 | Gói trả phí không vượt quyền khai thác media vốn có | B | CORE |

**Quy ước:** `T` là nhóm yêu cầu VTV8 nêu trực tiếp (thao tác chi tiết có thể được suy luận); `B` là phân rã nghiệp vụ bổ sung; `C` là hạng mục có điều kiện pháp lý/vendor. `CORE` là đề xuất phạm vi cơ sở, `OPTION` và `CONDITIONAL` chưa mặc nhiên triển khai. Riêng **G2-08 toàn bộ CONDITIONAL** theo tài liệu GĐ2.

[Trở về tổng quan GĐ2](README.md).
