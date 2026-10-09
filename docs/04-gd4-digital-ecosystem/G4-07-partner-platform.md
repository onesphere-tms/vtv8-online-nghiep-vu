# G4-07 – Partner Platform và API cho đối tác

> **GĐ4 Digital Ecosystem – DRAFT phân tích nghiệp vụ ngày 09/10/2026.** Nguồn chỉ định hướng dài hạn, chưa có yêu cầu cấp phép triển khai hoặc ngân sách được phê duyệt. CORE là phần cơ sở của **nhóm được chọn**, không có nghĩa toàn GĐ4 cùng mở.

## Mục tiêu
Mở cổng đối tác tự phục vụ trên nền master partner và nghiệp vụ GĐ3, để đối tác được cấp quyền cập nhật dịch vụ, nhận lead, xem booking/giao dịch và kết nối API. Không mặc định GĐ3 đã triển khai toàn bộ TMĐT.

## Phân kỳ và kế thừa
- **Nhóm phát hành:** C – Partner Ecosystem.
- **Không tính trùng:** G3-03 partner/offering master; G3-02 lead; G3-04 affiliate; G3-05 booking; G3-06–09 commerce/finance; G2-01 IAM và G1-02 admin RBAC (nhưng đối tác là tenant/quyền riêng). Không xây lại các domain business hoặc một ERP riêng.
- Các nội dung CONDITIONAL/OPTION cần xác nhận tại [G4-RELEASE-GATES.md](G4-RELEASE-GATES.md) trước khi cam kết nghiệm thu.

## Danh mục tính năng (9)

| Mã | Tính năng | Actor | Nghiệp vụ/đầu ra | FE mới | BE/Integration mới | Nghiệm thu sơ bộ | Phạm vi | Căn cứ | Gate/giả định |
|---|---|---|---|---|---|---|---|---|---|
| G4-07-F001 | **Cổng đăng nhập tổ chức đối tác và phân quyền** | Đơn vị đối tác | Khu vực truy cập cho tổ chức được VTV8 phê duyệt, có owner/staff và giới hạn dữ liệu theo tổ chức. | Partner portal shell, login/role management | Organization-scoped IAM/RBAC, audit, existing partner references | Đối tác A không đọc/sửa thông tin và giao dịch của đối tác B. | CORE | T4 | PARTNER_TENANCY |
| G4-07-F002 | **Đăng ký/thẩm định quyền tham gia portal** | Đối tác; quản trị VTV8 | Yêu cầu kích hoạt truy cập, xác minh đầu mối và cơ chế phê duyệt; dùng hồ sơ partner G3-03, không tạo một master pháp nhân thứ hai. | Partner invitation/onboarding/approval UI | Invitation, approval and partner account link, role lifecycle | Chưa duyệt không có quyền portal; khóa đối tác chặn truy cập hợp lệ. | CORE | P | PARTNER_LEGAL |
| G4-07-F003 | **Đối tác tự quản hồ sơ và offering được cho phép** | Đối tác | Đề xuất chỉnh thông tin liên hệ/offering, trạng thái cung cấp, gửi duyệt về G3-03; không cho tự duyệt nội dung công khai. | Partner profile/offering editor + review states | Partner-limited CRUD/submit workflows, existing G3-03 approval integration | Đối tác sửa chỉ offering của mình, thay đổi cần duyệt trước khi public. | CORE | T4 | G3_OFFERING |
| G4-07-F004 | **Nhận và cập nhật lead trên portal** | Đối tác | Được xem lead đã chuyển đến, xác nhận tiếp nhận và cập nhật kết quả theo phạm vi dữ liệu được đồng ý chia sẻ. | Lead queue/details with restricted PII, ack/status controls | Scoped G3-02 lead API, consent snapshot checks và audit | Không hiện PII ngoài quyền, lead có trạng thái bàn giao xác thực. | CONDITIONAL | P | G3_LEAD |
| G4-07-F005 | **Báo cáo referral và conversion cho đối tác** | Đối tác | Xem campaign, click, conversion đã được ghi nhận theo chương trình affiliate thực tế; không hiển thị hoa hồng pending như đã trả. | Partner referral/conversion view | Scoped G3-04 aggregates và conversion evidence | Báo cáo chỉ gồm dữ liệu của partner, có nguồn và trạng thái conversion. | CONDITIONAL | P | G3_AFFILIATE |
| G4-07-F006 | **Quản lý booking/đơn hàng phía đối tác** | Đối tác | Theo dõi yêu cầu booking hoặc đơn TMĐT được giao và cập nhật trạng thái theo quyền G3-05/G3-08; không tạo booking/order mới trong portal. | Partner booking/fulfillment action views | Partner-scoped adapters to G3-05/G3-07/G3-08 state machine | Một trạng thái hợp lệ cập nhật cùng domain gốc, không nhân đôi đơn. | CONDITIONAL | P | G3_BOOKING_COMMERCE |
| G4-07-F007 | **Bảng kê hoa hồng/đối soát cho đối tác** | Đối tác; tài chính | Đối tác xem kỳ và chứng từ thuộc quyền, xác nhận/tranh chấp bảng kê; G3-09 sở hữu sổ hoa hồng chung. | Statement download/ack/dispute UI | Partner-scope statements G3-09, audit và dispute refs | Tổng bảng kê khớp backoffice, không lộ tài chính đối tác khác. | CONDITIONAL | P | G3_FINANCE |
| G4-07-F008 | **Partner API và webhooks có xác thực** | Kỹ thuật đối tác | Nếu có nhu cầu tích hợp máy-máy: API key/OAuth client, scope theo đối tác, event webhook có chữ ký và quota. | Developer keys/events list, webhook status | API gateway scopes, webhook signing/delivery, rate limit, audit | Không thể dùng token đối tác này đọc dữ liệu đối tác khác, retry không nhân đôi nghiệp vụ. | CONDITIONAL | T4 | PARTNER_API |
| G4-07-F009 | **Sandbox, tài liệu tích hợp và thử nghiệm đối tác** | Kỹ thuật đối tác | Môi trường thử API/schema/events, tài liệu chức năng được hỗ trợ; chỉ sau khi Partner API được chọn. | Docs, sample payload, sandbox console | Sandbox routing/test data, API compatibility tests | Sandbox không dùng PII/giao dịch thật, đối tác test được callback và lỗi. | OPTION | P | PARTNER_API |

**Nhãn căn cứ:** `T4` = App/AI/Membership/Partner/Data hoặc archive dài hạn trong lộ trình GĐ4; `TBIZ` = mô hình kinh doanh Content Licensing/Archive Licensing trang 12–13; `P` = phân rã bổ sung. Ngay cả khi chủ đề có nguồn, các thao tác chi tiết và chính sách vẫn cần VTV8 xác nhận.

[Danh mục GĐ4](G4-DANH-MUC-TINH-NANG.md) · [Phân kỳ và gate](G4-RELEASE-GATES.md).
