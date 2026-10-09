# G4-06 – Membership và quyền lợi thành viên nâng cao

> **GĐ4 – DRAFT phân tích nghiệp vụ 09/10/2026; chưa được VTV8 phê duyệt hoặc dự toán FE/BE.** Đây là nhóm năng lực dài hạn, CORE là nền tảng **khi nhóm được chọn kích hoạt**, không có nghĩa cả GĐ4 phải đồng thời phát triển.

## Mục tiêu
Phát triển sản phẩm thành viên VTV8Online với quyền lợi theo cấp, tận dụng subscription/entitlement GĐ2; mô hình nguồn nêu xem không quảng cáo, chất lượng cao và chương trình trả phí.

## Phân kỳ và kế thừa
- **Nhóm:** C – Audience Membership.
- **Tái sử dụng:** G2-01 audience, G2-09 package/payment/subscription, G2-10 rights/paywall/DRM và G2-11 analytics; G4-01/02 chỉ là các kênh hiển thị quyền lợi. Không tạo bảng thanh toán hay entitlement thứ hai.
- Chỉ làm CONDITIONAL/OPTION sau khi xác định điều kiện liên quan ở [release gates](G4-RELEASE-GATES.md).

## Danh mục tính năng (8)

| Mã | Tính năng | Actor | Nghiệp vụ/đầu ra | FE mới | BE/Integration mới | Nghiệm thu sơ bộ | Phạm vi | Căn cứ | Gate/giả định |
|---|---|---|---|---|---|---|---|---|---|
| G4-06-F001 | **Danh mục hạng thành viên và tập quyền lợi** | Kinh doanh; quản trị | Cấu hình tier/benefit, giá hoặc điều kiện đạt, ngày hiệu lực dựa subscription G2 nếu có; không phát hành gói trùng cấu trúc. | Membership tiers form, benefits descriptions | Tier/benefit configuration tham chiếu G2-09, versioning và eligibility | Không bán hai gói khác tên nhưng quyền/thu phí xử lý bởi hai hệ độc lập. | CORE | T4 | SUBSCRIPTION_MODEL |
| G4-06-F002 | **Hồ sơ/thẻ trạng thái thành viên** | Người xem | Trang xem hạng, ngày hiệu lực, quyền lợi có thể dùng trên web/mobile/TV và lý do không được dùng. | Member profile/status/card trên kênh có sẵn | Membership projection API từ subscription + entitlements | Trạng thái hiển thị trùng dữ liệu quyền thật, không tự sinh thành viên ảo. | CORE | T4 | G2_IDENTITY |
| G4-06-F003 | **Kiểm tra quyền lợi thành viên qua entitlement chung** | Người xem; hệ thống | Xác định quyền xem chương trình trả phí, tính năng không quảng cáo, chất lượng đặc biệt theo gói; dùng G2-10 là nguồn quyết định. | Member-gated views, benefit unavailable states | Extend entitlement policy matrix G2-10, check at media/provider | Đổi hạng/hết hạn thu hồi đúng quyền và không bypass bằng API. | CORE | T4 | ENTITLEMENT |
| G4-06-F004 | **Đổi hạng/gia hạn/hủy Membership** | Người xem | Nâng/hạ hạng, gia hạn/hủy và hiệu lực phí theo hợp đồng, dùng subscription G2-09 và chính sách payment hiện có. | Manage membership UI, billing state/terms | Subscription change adapters/pro-rating only if provider supports | Đổi gói không cấp quyền sớm hoặc thu phí hai lần; có trạng thái xử lý rõ. | CONDITIONAL | P | BILLING_POLICY |
| G4-06-F005 | **Chế độ xem không quảng cáo cho hội viên** | Người xem | Tắt vị trí quảng cáo trên kênh/app áp dụng khi ad inventory thật được triển khai; không gỡ nội dung tài trợ đã tích hợp vào chương trình. | Ad suppression behavior on supported surfaces | Server-side ad eligibility policy và provider integration khi có | Member không bị chèn loại quảng cáo được chính sách loại trừ, không hứa xóa tài trợ nằm trong video. | CONDITIONAL | T4 | AD_PLATFORM |
| G4-06-F006 | **Chất lượng video cao cấp theo gói** | Người xem | Quyền phát video 2K/4K/8K chỉ khi nhà cung cấp có rendition, CDN, DRM và thiết bị thật hỗ trợ; không coi cấp quyền là đã có nguồn 8K. | Quality options và thông báo device/provider support | Entitlement + provider rendition selection/DRM adaptation | Không hiện tùy chọn độ phân giải mà media/CDN chưa cung cấp, không bypass quyền cao cấp. | CONDITIONAL | T4 | PREMIUM_MEDIA |
| G4-06-F007 | **Sự kiện/chương trình dành riêng cho thành viên** | Kinh doanh; người xem | Giữ chỗ/đăng ký hoạt động đặc biệt theo chương trình thành viên khi VTV8 thực sự vận hành sự kiện; không mặc định booking ticketing riêng. | Event/member register UX | Member eligibility, enrollment state và notification events | Chỉ thành viên đủ quyền đăng ký và có quy tắc giới hạn/sửa hủy khi được mở. | OPTION | P | EVENT_PROGRAM |
| G4-06-F008 | **Báo cáo duy trì, chuyển hạng và giá trị membership** | Kinh doanh; phân tích | Phân tích số hội viên, chuyển gói, tỉ lệ duy trì dựa G2-09/11, phân biệt active/subscription revenue và quyền lợi thật. | Membership KPI dashboard/filter trên analytics chung | Membership aggregates theo consent và plan state | Các số active, churn và revenue đối chiếu được, không tự coi trial là doanh thu. | OPTION | P | DATA_POLICY |

**Căn cứ:** `T4` = nhóm định hướng trong GĐ4 hoặc Membership trong mô hình kinh doanh; `TAI` = AI và ví dụ trang 11–12; `P` = chi tiết bổ sung để vận hành/kiểm thử. Chủ đề có nguồn **không có nghĩa từng thao tác chi tiết đã được VTV8 xác nhận**.

[Danh mục GĐ4](G4-DANH-MUC-TINH-NANG.md) · [Gates](G4-RELEASE-GATES.md).
