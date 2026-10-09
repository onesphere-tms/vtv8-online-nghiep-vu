# G1-02 – Quản trị tài khoản và phân quyền CMS

> **Phân rã GĐ1 V1 ngày 09/10/2026** · Danh sách module được người dùng chọn; **chi tiết tính năng là đề xuất DRAFT**, chưa được VTV8 phê duyệt, chưa tính FE/BE giờ công.

## Mục tiêu
Nhân sự nội bộ được xác thực và chỉ thực hiện thao tác đúng quyền.

## Ranh giới
G1-02 sở hữu identity, role/permission và nhật ký thay đổi quyền; workflow duyệt thuộc G1-03. Không xây tài khoản người xem hay SSO ngoài phạm vi V1.

## Danh sách tính năng (6)

| ID | Tính năng | Người sử dụng | Nghiệp vụ / luồng chính | Phần việc FE | Phần việc BE | Tiêu chí nghiệm thu sơ bộ | Nguồn | Phạm vi |
|---|---|---|---|---|---|---|---|---|
| G1-02-F001 | **Đăng nhập, đăng xuất và phiên CMS** | Nhân sự CMS | Đăng nhập bằng tài khoản nội bộ, quản lý phiên, timeout, logout, chặn truy cập khi chưa xác thực. | Login/logout, guard, thông báo lỗi | Hash mật khẩu, session/token an toàn, rate limit, revoke | Không đăng nhập sai mật khẩu; đăng xuất vô hiệu phiên | T | CORE |
| G1-02-F002 | **Hồ sơ cá nhân và đổi/đặt lại mật khẩu** | Nhân sự CMS; quản trị | Xem/chỉnh thông tin cá nhân cho phép; đổi mật khẩu; quản trị cấp lại mật khẩu khi mất truy cập. | Form hồ sơ, đổi mật khẩu, màn admin reset | API đổi/reset và kiểm tra phiên, audit | Mật khẩu cũ không còn dùng được sau reset | B | CORE |
| G1-02-F003 | **Quản lý tài khoản nội bộ** | Quản trị | Danh sách, tạo, cập nhật, vô hiệu hóa tài khoản; không xóa cứng tài khoản đã có lịch sử biên tập. | Danh sách/filter/form CRUD, trạng thái | CRUD users, unique account, deactivate, liên kết audit | Tài khoản vô hiệu không truy cập được; lịch sử vẫn còn | T | CORE |
| G1-02-F004 | **Quản lý vai trò và ma trận quyền** | Quản trị | Định nghĩa vai trò Biên tập/Duyệt/Xuất bản/Quản trị và quyền theo hành động; một người có thể có nhiều vai trò nếu được duyệt. | Giao diện ma trận quyền/gán vai trò | RBAC và quyền kiểm tra tại API, dữ liệu gán quyền | Gọi API trực tiếp không vượt được quyền | T | CORE |
| G1-02-F005 | **Phân quyền theo phòng ban hoặc chuyên mục** | Quản trị; người duyệt | Giới hạn quyền biên tập/duyệt theo phòng ban hoặc chuyên mục nếu quy trình VTV8 cần. | Bộ lọc phạm vi vai trò/đơn vị | Policy theo tổ chức/chuyên mục, kiểm tra ownership | Không đọc/sửa/duyệt vượt phạm vi được phân công | C | OPTION |
| G1-02-F006 | **Nhật ký thao tác quản trị nhạy cảm** | Quản trị | Ghi nhận đăng nhập thất bại, tạo/sửa/vô hiệu tài khoản, thay đổi quyền; cung cấp màn truy cứu cơ bản. | Danh sách log có lọc theo người/thời gian | Log bất biến ở mức ứng dụng và chỉ đọc, kiểm soát retention | Xem được ai đổi quyền, lúc nào, nội dung thay đổi | B | CORE |

**Chú giải:** `T` = có chủ đề/yêu cầu trực tiếp trong đề xuất VTV8 (thao tác chi tiết có thể được suy ra); `B` = bổ sung suy luận để V1 hoạt động trọn luồng; `C` = có điều kiện hoặc lựa chọn cần xác nhận. `CORE` = đề xuất đưa vào phạm vi V1 cơ sở để lập dự toán; `OPTION` = chưa đưa vào giờ cơ sở khi chưa chốt. Các cột FE/BE là **phạm vi việc**, chưa phải ước tính thời gian.

## Những điều cần xác nhận
- Số lượng hồ sơ và người dùng, quy trình hiện hữu của VTV8 và tiêu chí đầu ra tương ứng.
- Số mẫu màn hình và vòng phản hồi UX/UI theo kết quả GĐ0.
- Giới hạn nghiệp vụ đặc thù phải xác nhận trước khi báo giá cố định.

## Liên kết
[Xem toàn bộ danh mục GĐ1](README.md).