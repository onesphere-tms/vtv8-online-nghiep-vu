# G4-02 – Ứng dụng Smart TV

> **GĐ4 – DRAFT phân tích nghiệp vụ ngày 09/10/2026, chưa được VTV8 phê duyệt và chưa có dự toán FE/BE.** GĐ4 là định hướng dài hạn; CORE ở đây là phần cơ sở **nếu chọn kích hoạt nhóm năng lực tương ứng**, không phải yêu cầu triển khai đồng thời toàn GĐ4.

## Mục tiêu
Kênh phân phối trên TV được kiến trúc tổng thể đề cập cho tương lai; chưa phải yêu cầu GĐ4 bắt buộc. Chỉ phát triển sau khi chọn hệ điều hành TV cụ thể.

## Phân kỳ và kế thừa
- **Nhóm triển khai:** A+ – Smart TV (mở rộng).
- **Không tính trùng:** G1-06/07/08 media player/streaming, G2-01 tài khoản, G2-09/10 quyền premium, G2-11 QoE; TV focus/remote và packaging là phần mới.
- **Gate:** tham chiếu [G4-RELEASE-GATES.md](G4-RELEASE-GATES.md) cho các mục CONDITIONAL và các ràng buộc phát hành. Chi tiết UI/API là phân rã đề xuất, chưa được xác nhận trong nguồn.

## Danh mục tính năng (8)

| Mã | Tính năng | Actor | Nghiệp vụ/đầu ra | FE mới | BE/Integration mới | Nghiệm thu sơ bộ | Phạm vi | Căn cứ | Gate/giả định |
|---|---|---|---|---|---|---|---|---|---|
| G4-02-F001 | **Bộ ứng dụng TV và ma trận thiết bị** | Người xem TV | Khởi tạo app trên một dòng TV OS được chọn và xác nhận cấu hình phân phối, bộ nhớ, độ phân giải, remote. | TV-specific app shell, routes, compatibility và package | Device config/API compatibility chỉ theo OS mục tiêu | Ứng dụng chạy trên thiết bị/model pilot, lỗi và điều hướng cơ bản được thử. | CONDITIONAL | AKT | TV_OS |
| G4-02-F002 | **Điều hướng remote và focus/accessibility** | Người xem TV | Duyệt danh mục bằng D-pad, nút back, focus rõ, trạng thái idle và màn hình lớn. | TV focus management, remote event navigation, accessibility | Không cần service riêng ngoài dữ liệu đã có | Chỉ dùng remote vẫn duyệt, tìm và phát được nội dung. | CONDITIONAL | P | TV_OS |
| G4-02-F003 | **Trang khám phá chương trình và tìm kiếm trên TV** | Người xem TV | Xem các kệ nội dung, chương trình, video/series, tìm kiếm bằng bàn phím TV hoặc phương thức hệ điều hành cho phép. | Lean-back catalog UI, virtual keyboard | Query public G1/G2 search API, rights filtering | Chỉ nội dung published/được cấp quyền hiện trên catalog và tìm kiếm. | CONDITIONAL | P | SEARCH_API |
| G4-02-F004 | **Phát VOD/live trên thiết bị TV** | Người xem TV | Phát live và VOD dùng HLS/DASH/device player, xử lý audio/subtitle và chất lượng theo khả năng provider. | TV media SDK integration, playback errors, seek | G1-08 media manifest adapter, protected token qua G2-10 khi bật | Kiểm thử trên TV thật/giả lập được chọn, không chỉ web browser. | CONDITIONAL | AKT | TV_MEDIA |
| G4-02-F005 | **Đăng nhập bằng mã liên kết thiết bị** | Người xem TV | Đăng nhập với mã/QR và phiên hết hạn trên thiết bị TV; quản lý liên kết với tài khoản G2-01. | Pairing code/QR UI, logout | Pairing token exchange TTL, bind device/session to audience account | Mã liên kết một lần, hết hạn, không chiếm được phiên người khác. | CONDITIONAL | P | IDENTITY |
| G4-02-F006 | **Kiểm tra gói và quyền xem trên TV** | Người xem TV | Chỉ phát nội dung premium khi gói/DRM trên thiết bị đáp ứng entitlement; mua gói ngoài TV nếu chính sách yêu cầu. | Member state/CTA, error permission/unsupported device | Entitlement G2-10 và license integration hỗ trợ TV target | Không phát protected video trái quyền; thiết bị không DRM được báo đúng. | CONDITIONAL | T4 | TV_DRM |
| G4-02-F007 | **Theo dõi phiên phát và chất lượng TV** | Kỹ thuật; phân tích | Gửi event xem và lỗi/QoE tương thích G2-11; không lập kho analytics thứ hai. | Minimal telemetry hooks trong app | Event schema/adapters với consent và metric normalization | Lượt xem TV không đếm trùng, lỗi thiết bị truy vết được. | CONDITIONAL | P | TELEMETRY |
| G4-02-F008 | **Tìm kiếm giọng nói bằng tính năng TV OS** | Người xem TV | Tùy chọn dùng nhận giọng nói hệ điều hành nếu có API/phê duyệt; không tự vận hành STT riêng trên TV. | Voice search UX và permission | OS voice result → G2/G4 search API, permission/safety filter | Tắt tính năng thì tìm kiếm bằng remote vẫn hoạt động. | OPTION | P | TV_VOICE |

**Nguồn:** `T4` = hướng App/AI/Membership/Partner/Data được nêu tại lộ trình GĐ4; `TAI` = khả năng nêu ở mục VII AI (trang 11–12); `AKT` = Smart TV/Web/Mobile trong kiến trúc (trang 8); `P` = chi tiết phân tích bổ sung, không có yêu cầu chức năng trực tiếp trong nguồn. **Nhãn T4/TAI/AKT chỉ xác nhận chủ đề, không xác nhận từng thao tác.**

[Danh mục GĐ4](G4-DANH-MUC-TINH-NANG.md) · [Phân kỳ và release gates](G4-RELEASE-GATES.md).
