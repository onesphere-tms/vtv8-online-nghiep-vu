# G2-10 – Paywall, quyền xem và DRM

> **GĐ2 Media Platform – phạm vi nội bộ đã chuẩn hóa 09/10/2026.** Chưa được VTV8 phê duyệt, chưa tính giờ FE/BE.

## Mục tiêu
Kiểm soát nội dung miễn phí/trả phí và cấp phép xem video theo quyền thuê bao và bản quyền nội dung.

## Ranh giới
G2-09 quản lý gói/giao dịch, G2-10 sở hữu quyền xem nội dung; quyền sở hữu/khai thác asset ở G1-05 vẫn là nguồn pháp lý, không trùng DRM. DRM là tích hợp với nhà cung cấp bản quyền/license server, không tự viết DRM từ đầu.

## Phụ thuộc
G1-05 quyền khai thác, G1-06/07/08 playback, G2-01 user, G2-09 subscription, provider DRM có hợp đồng.

## Danh mục tính năng (6)

| ID | Tính năng | Actor | Nghiệp vụ | FE mới | BE mới | Nghiệm thu | Nguồn | Phạm vi | Ranh giới sau rà soát |
|---|---|---|---|---|---|---|---|---|---|
| G2-10-F001 | **Phân loại nội dung miễn phí và trả phí** | Biên tập; quản trị | Gắn nội dung free/subscriber-only dựa gói thật được VTV8 phê duyệt và quyền DAM. Chỉ bật premium khi COMMERCIAL_RELEASE_GATE đã đạt. | CMS tag entitlement, xem trước trạng thái trả phí | Content access policy, mapping plans/content, rights check | Không bán nội dung thiếu bản quyền, không đánh dấu subscriber-only khi không thể cấp quyền thật. | T | CONDITIONAL | Cấu hình free/subscriber-only phải cùng luồng gói + payment + entitlement. Không mặc định cho CMS gắn 'trả phí' khi chưa có cách cấp quyền hợp lệ; DAM rights vẫn phải chặn xuất bản sai. Luồng thương mại trả phí phải đáp ứng COMMERCIAL_RELEASE_GATE; xem G2-COMMERCIAL-RELEASE-GATE.md. |
| G2-10-F002 | **Kiểm tra quyền xem theo tài khoản** | Người xem; hệ thống | Một entitlement service đánh giá subscription, gói, thời hạn và rights DAM G1-05; tích hợp nghiệp vụ thời hạn gốc G2-10-F007, không có policy thứ hai. | Trạng thái cho phép/từ chối, CTA hợp lệ | Central entitlement service theo subscription, content access policy và expiry từ DAM, guard truy cập API/stream | Tài khoản không gói, gói hết hạn hoặc media hết quyền không nhận được quyền phát; không bypass API. | T | CONDITIONAL | Central entitlement là trái tim premium playback và phụ thuộc vòng đời subscription G2-09, quyền DAM G1-05; cần phân biệt quyền nội dung với tài khoản đã đăng nhập. Luồng thương mại trả phí phải đáp ứng COMMERCIAL_RELEASE_GATE; xem G2-COMMERCIAL-RELEASE-GATE.md. |
| G2-10-F003 | **Giao diện paywall và nâng cấp quyền xem** | Người xem | Paywall/CTA gói có thật và phương án mua được; bảo vệ thực tế ở BE/provider, không coi CSS/modal là chặn nội dung. | Paywall modal/page, trạng thái hết gói | Entitlement status/offer API tích hợp G2-09 | Tài khoản chưa mua nhận offer hợp lệ, không có manifest media private trái quyền. | T | CONDITIONAL | Paywall CTA phụ thuộc gói thật có thể đăng ký, không nghiệm thu chỉ bằng trang thông báo giả lập; chặn nội dung tại BE/media provider. Luồng thương mại trả phí phải đáp ứng COMMERCIAL_RELEASE_GATE; xem G2-COMMERCIAL-RELEASE-GATE.md. |
| G2-10-F004 | **Bảo vệ URL và phiên phát nội dung có quyền** | Người xem; hệ thống | Cấp signed playback URL/session giới hạn thời gian sau entitlement check theo năng lực media provider G1-08; nhận kiểm tra rights/expiry từ G2-10-F007. | Player state, yêu cầu tải lại quyền khi hết hạn | Token playback/expiry/security adapter được provider hỗ trợ, gắn entitlement và media rights | Không dùng URL protected sau thu hồi/hết hạn theo chính sách; không tự hứa CDN signing nếu provider không hỗ trợ. | B | CONDITIONAL | Token URL/signed playback cần được cung cấp đúng theo provider đã xác nhận; không mặc định tự triển khai CDN/video signing hoặc xem CSS là DRM. Luồng thương mại trả phí phải đáp ứng COMMERCIAL_RELEASE_GATE; xem G2-COMMERCIAL-RELEASE-GATE.md. |
| G2-10-F005 | **Tích hợp hệ thống DRM được cấp phép** | Kỹ thuật media; người xem | DRM vendor/license integration **nếu** nội dung/thiết bị/hợp đồng yêu cầu; là lớp bảo vệ khác token URL, không tự phát triển DRM hoặc license server. | Player DRM config/UX lỗi không hỗ trợ | License provider integration, entitlement-to-DRM mapping | Nội dung DRM chỉ phát trên thiết bị tương thích và tài khoản được cấp license, vendor cụ thể phải được chốt. | T | CONDITIONAL | Giữ tính năng trong phạm vi đã phân tích; kiểm tra phụ thuộc pháp lý/vendor trước nghiệm thu. Luồng thương mại trả phí phải đáp ứng COMMERCIAL_RELEASE_GATE; xem G2-COMMERCIAL-RELEASE-GATE.md. |
| G2-10-F006 | **Quản lý số thiết bị/phiên xem đồng thời** | Người xem; vận hành | OPTION giới hạn số thiết bị/phiên theo gói thương mại đã kích hoạt; nếu DRM/media provider không hỗ trợ cần có phương án kỹ thuật riêng. | Thông báo vượt giới hạn và quản lý thiết bị nếu cần | Concurrent-session policy, lease/expiry | Không vượt giới hạn đã đăng ký; có cơ chế giải phóng phiên bất thường | B | OPTION | Giữ tính năng trong phạm vi đã phân tích; kiểm tra phụ thuộc pháp lý/vendor trước nghiệm thu. Luồng thương mại trả phí phải đáp ứng COMMERCIAL_RELEASE_GATE; xem G2-COMMERCIAL-RELEASE-GATE.md. |

**Quy ước:** T = nhóm yêu cầu trong tài liệu VTV8, B = bổ sung suy luận, C = có điều kiện. CORE = phạm vi cơ sở đề xuất, OPTION = tùy chọn, CONDITIONAL = phụ thuộc gate để chốt. Tất cả các chức năng trả phí G2-09/G2-10 phải vận hành thành một lát cắt xuyên module nếu được đưa vào đợt nghiệm thu. Xem [gói thương mại](G2-COMMERCIAL-RELEASE-GATE.md), [66 tính năng](G2-DANH-MUC-TINH-NANG.md), [mapping 72→66](G2-MAPPING-72-66.md). Chưa có giờ FE/BE.

[Trở về tổng quan GĐ2](README.md).

## Mã đã gộp

- **G2-10-F007 – Thời hạn khả dụng theo giấy phép nội dung:** chuyển vào G1-05-F004 + G2-10-F002/F004 (expiry và quyền DAM một nguồn duy nhất); không bỏ điều kiện quyền media, không xây policy mới.
