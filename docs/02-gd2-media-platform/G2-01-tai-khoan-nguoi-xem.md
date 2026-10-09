# G2-01 – Tài khoản và định danh người xem

> **GĐ2 Media Platform – thiết kế nghiệp vụ sơ bộ 09/10/2026.** Module/tính năng đều là **đề xuất DRAFT, chưa được người dùng chốt và chưa được VTV8 xác nhận**. Không tính giờ FE/BE hoặc thời gian triển khai.

## Mục tiêu
VTV8Online thiết lập quan hệ trực tiếp với người xem, xác thực và quản lý quyền riêng tư của tài khoản công khai.

## Ranh giới nghiệp vụ
Không tái làm tài khoản nội bộ CMS G1-02; dùng chung hạ tầng xác thực ở cấp phù hợp nhưng tách user domain, vai trò và chính sách. SSO phụ thuộc nhà cung cấp danh tính và phương án pháp lý.

## Phụ thuộc và điều kiện
G1-01 website, G1-02 IAM kỹ thuật; chính sách dữ liệu và bên SSO cần xác nhận.

## Danh mục tính năng (7)

| ID | Tính năng | Người dùng/actor | Nghiệp vụ và đầu ra | Phần FE mới | Phần BE mới | Nghiệm thu sơ bộ | Nguồn | Đề xuất phạm vi |
|---|---|---|---|---|---|---|---|---|
| G2-01-F001 | **Đăng ký tài khoản người xem** | Người xem | Nhập thông tin tối thiểu, đồng ý điều khoản theo chính sách, xác nhận tài khoản qua kênh VTV8 chọn. | Trang đăng ký, validation, trạng thái kích hoạt | Audience user schema, register/verification endpoint, chống lạm dụng | Không tạo tài khoản trùng; xác thực thành công mới kích hoạt nếu chính sách yêu cầu | T | CORE |
| G2-01-F002 | **Đăng nhập, đăng xuất và khôi phục tài khoản** | Người xem | Đăng nhập bằng tài khoản VTV8Online, đăng xuất, khôi phục khi quên mật khẩu. | Form login/recovery, phản hồi lỗi, UX phiên | Password hashing/token/session, reset theo kênh đã chốt | Thao tác trái quyền bị chặn, token thu hồi sau logout khi cần | T | CORE |
| G2-01-F003 | **Đăng nhập một lần SSO** | Người xem | Kết nối nhà cung cấp định danh được VTV8 phê duyệt; tránh tạo tài khoản trùng khi liên kết. | Nút đăng nhập SSO, luồng callback/liên kết tài khoản | OIDC/OAuth adapter, callback, mapping user, bảo mật token | SSO hoạt động với bên cung cấp thực tế; không ghi đè tài khoản người khác | T | CONDITIONAL |
| G2-01-F004 | **Hồ sơ và thiết lập cá nhân** | Người xem | Chỉnh tên hiển thị, ảnh đại diện tùy chính sách, thông tin cá nhân tối thiểu và cài đặt hiển thị. | Trang hồ sơ, biểu mẫu, trạng thái lưu | Profile API, schema/validation, ràng buộc privacy | Chỉ chủ tài khoản được sửa hồ sơ; người khác không đọc thông tin riêng | B | CORE |
| G2-01-F005 | **Chấp thuận dữ liệu và yêu cầu quyền riêng tư** | Người xem; bộ phận vận hành | Lưu phiên bản điều khoản/chính sách đã chấp thuận; hỗ trợ yêu cầu xem hoặc xóa dữ liệu theo chính sách được duyệt. | Thiết lập quyền riêng tư, xem chính sách, yêu cầu xử lý | Consent history, data export/delete request workflow mức cơ bản | Có bằng chứng chấp thuận; yêu cầu được ghi trạng thái và không xóa nhầm dữ liệu bắt buộc lưu | B | CORE |
| G2-01-F006 | **Bảo mật và quản lý phiên người xem** | Người xem | Quản lý đăng nhập nhiều thiết bị mức cơ bản, giới hạn phiên và phát hiện thao tác bất thường cơ bản. | Danh sách phiên đang sử dụng nếu được duyệt | Session/revocation, rate limit, audit bảo mật | Phiên bị thu hồi không tiếp tục truy cập dữ liệu riêng | B | CORE |
| G2-01-F007 | **Quản trị tài khoản người xem** | Nhân sự hỗ trợ; quản trị | Tìm tài khoản, hỗ trợ khóa/mở theo quyền, xem trạng thái; không truy cập mật khẩu hoặc dữ liệu xem cá nhân trái quyền. | Danh sách user, trạng thái, hành động hỗ trợ | Admin audience API và nhật ký thao tác; phân quyền theo G1-02 | Khóa tài khoản có log; nhân sự CMS không tự xem lịch sử cá nhân nhạy cảm | B | CORE |

**Ký hiệu:** `T` = nhóm yêu cầu được tài liệu VTV8 nêu trực tiếp (thao tác chi tiết có thể do phân tích bổ sung); `B` = nghiệp vụ suy luận để triển khai; `C` = phụ thuộc giấy phép/vendor/quy chế. `CORE` = đề xuất V1 Media Platform cơ sở, `OPTION`/`CONDITIONAL` = chưa mặc định thuộc phạm vi cơ sở. Mức phân loại là **đề xuất**, chưa phải hợp đồng.

[Trở về tổng quan GĐ2](README.md).
