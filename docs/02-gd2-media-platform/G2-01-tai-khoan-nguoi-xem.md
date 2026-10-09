# G2-01 – Tài khoản và định danh người xem

> **GĐ2 Media Platform – phạm vi nội bộ đã chuẩn hóa 09/10/2026.** Chưa được VTV8 phê duyệt, chưa tính giờ FE/BE.

## Mục tiêu
VTV8Online thiết lập quan hệ trực tiếp với người xem, xác thực và quản lý quyền riêng tư của tài khoản công khai.

## Ranh giới nghiệp vụ
Không tái làm tài khoản nội bộ CMS G1-02; dùng chung hạ tầng xác thực ở cấp phù hợp nhưng tách user domain, vai trò và chính sách. SSO phụ thuộc nhà cung cấp danh tính và phương án pháp lý.

## Phụ thuộc và điều kiện
G1-01 website, G1-02 IAM kỹ thuật; chính sách dữ liệu và bên SSO cần xác nhận.

## Danh mục tính năng (6)

| ID | Tính năng | Actor | Nghiệp vụ | FE mới | BE mới | Nghiệm thu | Nguồn | Phạm vi | Ranh giới sau rà soát |
|---|---|---|---|---|---|---|---|---|---|
| G2-01-F001 | **Đăng ký tài khoản người xem** | Người xem | Tạo tài khoản người xem bằng kênh định danh/xác minh được VTV8 chốt; xử lý trùng tài khoản, chưa xác minh và ghi nhận phiên bản điều khoản. | Trang đăng ký, validation, trạng thái kích hoạt | Audience user schema, register/verification endpoint, chống lạm dụng | Tài khoản trùng/không xác minh không kích hoạt trái quy định; lịch sử đồng ý được lưu. | T | CORE | Chốt định danh email/số điện thoại, kênh xác minh, xử lý đăng ký trùng. Không mặc định phát triển cả OTP SMS và email. |
| G2-01-F002 | **Đăng nhập, đăng xuất và khôi phục tài khoản** | Người xem | Đăng nhập/đăng xuất/khôi phục kèm bảo mật và thu hồi phiên, rate limit, audit tối thiểu; nhận nghiệp vụ G2-01-F006, không xây quản lý thiết bị riêng. | Login/reset/logout và thông báo phiên hết hạn; không mặc định màn hình quản lý thiết bị | Audience auth, token/session revoke, security log/rate-limit, reset theo kênh chọn | Phiên bị thu hồi không còn hợp lệ, không truy cập trái quyền; session của CMS tách người xem. | T | CORE | Login/logout/reset phải sở hữu security/session; gộp yêu cầu tối thiểu từ F006, không xây quản lý session hai nơi. |
| G2-01-F003 | **Đăng nhập một lần SSO** | Người xem | Kết nối nhà cung cấp định danh được VTV8 phê duyệt; tránh tạo tài khoản trùng khi liên kết. | Nút đăng nhập SSO, luồng callback/liên kết tài khoản | OIDC/OAuth adapter, callback, mapping user, bảo mật token | SSO hoạt động với bên cung cấp thực tế; không ghi đè tài khoản người khác | T | CONDITIONAL | Giữ yêu cầu theo nguồn/đề xuất, chỉ phát triển phần mới sau GĐ1. |
| G2-01-F004 | **Hồ sơ và thiết lập cá nhân** | Người xem | Hồ sơ người xem với trường cá nhân tối thiểu; không hình thành hồ sơ công khai kiểu mạng xã hội. | Trang hồ sơ, biểu mẫu, trạng thái lưu | Profile API, schema/validation, ràng buộc privacy | PII chỉ hiện/sửa bởi chính chủ hoặc role hỗ trợ được phê duyệt. | B | CORE | Giới hạn trường hồ sơ, không mặc định social profile công khai; bảo vệ PII theo quyền. |
| G2-01-F005 | **Chấp thuận dữ liệu và yêu cầu quyền riêng tư** | Người xem; bộ phận vận hành | Consent theo mục đích và phiên bản, quyền yêu cầu xử lý/xóa dữ liệu theo chính sách VTV8, dùng chung cho lịch sử G2-03 và events G2-11. | Thiết lập quyền riêng tư, xem chính sách, yêu cầu xử lý | Consent/versioning + data-request workflow; điều phối các kho dữ liệu theo retention policy | Ghi được nguồn/mục đích/thời gian đồng ý; xử lý yêu cầu không xóa nhầm dữ liệu có nghĩa vụ lưu. | B | CORE | Phân biệt đồng ý điều khoản, consent tracking và yêu cầu xử lý dữ liệu; thống nhất việc xóa với G2-03 và G2-11. Chính sách cần VTV8 xác nhận. |
| G2-01-F007 | **Quản trị tài khoản người xem** | Nhân sự hỗ trợ; quản trị | Quản trị tài khoản người xem tách hoàn toàn user quản trị CMS; khóa/mở có lý do, log, giới hạn truy cập lịch sử cá nhân. | Danh sách user, trạng thái, hành động hỗ trợ | Admin audience API và nhật ký thao tác; phân quyền theo G1-02 | Khóa tài khoản có log; nhân sự CMS không tự xem lịch sử cá nhân nhạy cảm | B | CORE | Quản trị người xem khác user CMS; phân quyền hỗ trợ tối thiểu, log khóa/mở, không cho xem lịch sử riêng tư trái quyền. |

**Quy ước:** T = chủ đề có trong nguồn VTV8, B = nghiệp vụ phân tích bổ sung, C = có điều kiện. CORE = đề xuất nền tảng GĐ2, OPTION = tính riêng nếu chọn, CONDITIONAL = phụ thuộc pháp lý/đối tác. Xem [Danh mục 66 tính năng](G2-DANH-MUC-TINH-NANG.md), [mapping 72→66](G2-MAPPING-72-66.md) và [nghiệm thu](G2-TIEU-CHI-NGHIEM-THU.md). Chưa có giờ FE/BE.

[Trở về tổng quan GĐ2](README.md).

## Mã đã gộp, không còn tính năng độc lập

- **G2-01-F006 – Bảo mật và quản lý phiên người xem:** chuyển vào G2-01-F002 + G2-H01-W001/W007, không bỏ nghiệp vụ, không nhân đôi effort.
