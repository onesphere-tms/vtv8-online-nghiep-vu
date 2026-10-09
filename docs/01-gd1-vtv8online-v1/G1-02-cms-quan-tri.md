# G1-02 – Quản trị tài khoản và phân quyền CMS

> **Phân rã GĐ1 V1 ngày 09/10/2026** · Danh sách module được người dùng chọn; **chi tiết tính năng là đề xuất DRAFT**, chưa được VTV8 phê duyệt, chưa tính FE/BE giờ công.

## Mục tiêu
Nhân sự nội bộ được xác thực và chỉ thực hiện thao tác đúng quyền.

## Ranh giới
G1-02 sở hữu identity, role/permission và nhật ký thay đổi quyền; workflow duyệt thuộc G1-03. Không xây tài khoản người xem hay SSO ngoài phạm vi V1.

## Danh sách tính năng (6)

| ID | Tính năng | Người sử dụng | Nghiệp vụ và đầu ra | FE cần làm | BE cần làm | Nghiệm thu riêng | Nguồn | Phạm vi | Ranh giới sau QA |
|---|---|---|---|---|---|---|---|---|---|
| G1-02-F001 | **Đăng nhập, đăng xuất và phiên CMS** | Nhân sự CMS | Đăng nhập bằng tài khoản nội bộ, quản lý phiên, timeout, logout, chặn truy cập khi chưa xác thực. | Login/logout, guard, thông báo lỗi | Hash mật khẩu, session/token an toàn, rate limit, revoke | Không đăng nhập sai mật khẩu; đăng xuất vô hiệu phiên | T | CORE | Giữ phạm vi và nghiệm thu đã mô tả. |
| G1-02-F002 | **Hồ sơ cá nhân và đổi/đặt lại mật khẩu** | Nhân sự CMS; quản trị | Xem/chỉnh thông tin cá nhân cho phép; đổi mật khẩu; quản trị cấp lại mật khẩu khi mất truy cập. | Form hồ sơ, đổi mật khẩu, màn admin reset | API đổi/reset và kiểm tra phiên, audit | Mật khẩu cũ không còn dùng được sau reset | B | CORE | Giữ đổi mật khẩu; giới hạn reset admin ở V1, chưa mặc định dịch vụ email/OTP bên ngoài. |
| G1-02-F003 | **Quản lý tài khoản nội bộ** | Quản trị | Danh sách, tạo, cập nhật, vô hiệu hóa tài khoản; không xóa cứng tài khoản đã có lịch sử biên tập. | Danh sách/filter/form CRUD, trạng thái | CRUD users, unique account, deactivate, liên kết audit | Tài khoản vô hiệu không truy cập được; lịch sử vẫn còn | T | CORE | Giữ phạm vi và nghiệm thu đã mô tả. |
| G1-02-F004 | **Quản lý vai trò và ma trận quyền** | Quản trị | Vai trò/ma trận quyền Biên tập, Duyệt, Xuất bản, Quản trị; policy dùng chung cho G1-03. Không xây workflow duyệt ở module này. | Gán vai trò/hiển thị quyền cơ bản | RBAC kiểm tra quyền server/API; role matrix mức V1 | API không cho người thiếu quyền duyệt hoặc xuất bản. | T | CORE | Giữ RBAC lõi, khởi đầu ma trận quyền cố định theo vai trò; màn thiết kế quyền động quá sâu là tùy chọn. |
| G1-02-F005 | **Phân quyền theo phòng ban hoặc chuyên mục** | Quản trị; người duyệt | Giới hạn quyền biên tập/duyệt theo phòng ban hoặc chuyên mục nếu quy trình VTV8 cần. | Bộ lọc phạm vi vai trò/đơn vị | Policy theo tổ chức/chuyên mục, kiểm tra ownership | Không đọc/sửa/duyệt vượt phạm vi được phân công | C | OPTION | Tiếp tục OPTION vì phân quyền theo phòng ban/chuyên mục chưa được nêu rõ. |
| G1-02-F006 | **Nhật ký thao tác quản trị nhạy cảm** | Quản trị | Ghi nhận đăng nhập thất bại, tạo/sửa/vô hiệu tài khoản, thay đổi quyền; cung cấp màn truy cứu cơ bản. | Danh sách log có lọc theo người/thời gian | Log bất biến ở mức ứng dụng và chỉ đọc, kiểm soát retention | Xem được ai đổi quyền, lúc nào, nội dung thay đổi | B | CORE | Giữ log quyền bảo mật thiết yếu nhưng phân biệt audit nghiệp vụ ở G1-03; giảm scope tìm kiếm/audit dashboard quá phức tạp. |

**Quy ước:** T = yêu cầu/chủ đề trong tài liệu (luồng chi tiết có thể suy ra); B = suy luận triển khai; C = phụ thuộc quyết định. CORE = đề xuất trong V1; OPTION/CONDITIONAL = chưa thuộc effort cơ sở. Xem [tiêu chí nghiệm thu dùng chung](G1-TIEU-CHI-NGHIEM-THU.md) và [thành phần dùng chung](G1-THANH-PHAN-DUNG-CHUNG.md). Chưa có số giờ FE/BE.

## Những điều cần xác nhận
- Số lượng hồ sơ và người dùng, quy trình hiện hữu của VTV8 và tiêu chí đầu ra tương ứng.
- Số mẫu màn hình và vòng phản hồi UX/UI theo kết quả GĐ0.
- Giới hạn nghiệp vụ đặc thù phải xác nhận trước khi báo giá cố định.

## Liên kết
[Xem toàn bộ danh mục GĐ1](README.md).