# G1-02 – CMS quản trị và tài khoản nội bộ

> **Trạng thái:** DRAFT · **Phiên bản:** 0.1 · **Nguồn trực tiếp:** tài liệu đề xuất VTV8Online, phần GĐ1 / CMS Quản trị (trang 4) · **Người xác nhận:** Chưa có.

## 1. Mục tiêu
Cung cấp môi trường quản trị cho nhân sự VTV8, giúp quản lý người dùng nội bộ, biên tập, duyệt và xuất bản nội dung; phục vụ các phân hệ bài viết, hình ảnh, video, chương trình và báo cáo nhuận bút.

## 2. Căn cứ tài liệu
**SOURCE:** VTV8 yêu cầu quản trị tài khoản CMS (tạo/hủy/cập nhật/chỉnh sửa), phân quyền biên tập – duyệt – xuất bản, báo cáo số tin bài/lượt xem và tính nhuận bút.

**PROPOSED:** quy trình trạng thái bài viết, lịch sử phiên bản, nhật ký thao tác, lịch đăng, mô hình phân quyền chi tiết, job nền, tiêu chí an ninh ứng dụng. Đây là đề xuất nghiệp vụ/kỹ thuật để cụ thể hóa yêu cầu.

## 3. Vai trò người sử dụng (đề xuất, cần xác nhận)
| Actor | Quyền nghiệp vụ dự kiến | Nguồn |
|---|---|---|
| Quản trị hệ thống CMS | Tài khoản, vai trò, phân quyền, cấu hình | PROPOSED |
| Biên tập viên | Tạo/sửa bản nháp, gửi duyệt | SOURCE + PROPOSED |
| Người duyệt | Đọc, yêu cầu sửa, duyệt nội dung | SOURCE + PROPOSED |
| Người xuất bản | Công khai/gỡ nội dung sau phê duyệt | SOURCE + PROPOSED |
| Quản trị báo cáo/nhuận bút | Xem báo cáo, xác nhận dữ liệu nhuận bút | SOURCE + PROPOSED |

Cần xác định một người có thể đồng thời giữ nhiều vai trò không, phân quyền theo chuyên mục hay phòng ban, và phê duyệt bao nhiêu cấp.

## 4. Danh sách tính năng dự kiến
| Feature ID | Tính năng | Căn cứ | Phân tích kỹ thuật ở mức 2 |
|---|---|---|---|
| G1-02-F001 | Đăng nhập/đăng xuất CMS | SOURCE (tài khoản đăng nhập) | Session, login, logout, timeout, thông báo lỗi |
| G1-02-F002 | Tạo/sửa/vô hiệu hóa tài khoản | SOURCE | Form quản trị, CRUD account, uniqueness, status |
| G1-02-F003 | Vai trò & gán quyền | SOURCE | RBAC, permission matrix, API authorization |
| G1-02-F004 | Luồng biên tập – duyệt – xuất bản | SOURCE + PROPOSED | Workflow states, transition policies, content APIs |
| G1-02-F005 | Từ chối/yêu cầu sửa nội dung | PROPOSED | Transition có lý do, lịch sử xử lý, notification nội bộ |
| G1-02-F006 | Lịch sử phiên bản nội dung | PROPOSED | Revision snapshots, truy vấn và diff nội dung |
| G1-02-F007 | Lập lịch xuất bản | PROPOSED | Scheduled job, timezone, hủy lịch, retry |
| G1-02-F008 | Nhật ký hoạt động quản trị | PROPOSED | Audit event, actor, timestamp, operation |
| G1-02-F009 | Dashboard quản trị | SOURCE + PROPOSED | API tổng hợp thống kê, lọc thời gian |
| G1-02-F010 | Cấu hình chung | PROPOSED | Config permissions, validation, audit |

**Phân định:** Quản lý bài viết, media, danh mục thực hiện ở **G1-03/G1-04**; CMS-02 cung cấp xác thực, phân quyền và workflow dùng chung. Báo cáo tính nhuận bút chi tiết ở **G1-08**.

## 5. Luồng nghiệp vụ TO-BE – đề xuất
1. Biên tập viên đăng nhập và có quyền truy cập chuyên mục liên quan.
2. Tạo bài viết trong G1-03, lưu `DRAFT`.
3. Gửi duyệt, nội dung chuyển `IN_REVIEW`.
4. Người duyệt xem, yêu cầu sửa `CHANGES_REQUESTED` hoặc phê duyệt `APPROVED`.
5. Người có quyền xuất bản phát hành `PUBLISHED` hoặc lập lịch (nếu được phê duyệt).
6. Hệ thống lưu nhật ký, phát sự kiện cập nhật chỉ mục tìm kiếm/cache.
7. Khi cần gỡ bài, người có quyền thực hiện thao tác với lý do và nhật ký.

**Tất cả trạng thái trên là thiết kế đề xuất**; trạng thái và thứ tự phê duyệt chính thức phải được xác nhận từ quy trình VTV8.

## 6. Phân tích kỹ thuật
### 6.1. Frontend CMS
- Màn hình login; trang danh sách tài khoản; thêm/sửa tài khoản; quản lý vai trò.
- Trang hàng đợi chờ duyệt; chi tiết/preview bản nội dung; thao tác duyệt/trả bài/xuất bản.
- Màn hình audit/revisions/dashboard chỉ triển khai nếu các tính năng PROPOSED được chốt.

### 6.2. Backend & API – định hướng, chưa phải hợp đồng API
- Identity endpoints cho login/logout, users, roles, permissions.
- Authorization middleware kiểm tra quyền trên API và bản ghi liên quan.
- Workflow endpoints hành động `submit`, `approve`, `request-changes`, `publish`, `unpublish`.
- Revision snapshots và audit events; job hẹn giờ nếu bật chức năng lên lịch.
- Các lệnh workflow phải kiểm tra trạng thái hiện tại, quyền và bảo vệ trước thao tác lặp.

### 6.3. Data model – sơ bộ
`cms_users`, `roles`, `permissions`, `user_roles`, `role_permissions`, `editorial_actions`, `content_revisions`, `audit_logs`; thực thể bài viết ở G1-03.

### 6.4. Bảo mật & NFR
- Phân quyền phía server; không dựa vào ẩn nút giao diện.
- Hash mật khẩu phù hợp, bảo vệ session, rate limiting đăng nhập, kiểm soát CSRF/XSS theo kiến trúc.
- Audit hành động quan trọng; backup và cơ chế phục hồi dữ liệu; thời hạn lưu audit sẽ được chốt.

## 7. Các tiêu chí nghiệm thu sơ bộ
- Tài khoản không có quyền xuất bản không thể xuất bản qua UI **hoặc trực tiếp gọi API**.
- Nội dung chưa được phê duyệt không thể công khai theo quy trình đã phê duyệt.
- Các thao tác tạo/sửa/duyệt xuất bản phản hồi đúng trạng thái, lỗi kiểm tra dữ liệu và quyền.
- Thao tác quyền nhạy cảm được ghi nhật ký nếu G1-02-F008 nằm trong scope.
- Số liệu dashboard đối chiếu được với dữ liệu CMS theo quy tắc đã chốt.

## 8. Câu hỏi bắt buộc trước khi báo giá cố định
1. Có mấy vai trò, các vai trò có thể kiêm nhiệm không?
2. Duyệt một hay nhiều cấp? Có duyệt theo phòng ban/chuyên mục không?
3. Có yêu cầu chữ ký số hoặc phê duyệt bằng văn bản không?
4. Bài đã xuất bản có được chỉnh sửa trực tiếp không hay phải duyệt lại?
5. Có lịch đăng, phiên bản bài viết và chức năng khôi phục không?
6. CMS có tích hợp hệ thống nhân sự/SSO hiện hữu không?
7. Nhuận bút dựa trên vai trò người tham gia, số từ, loại bài, hoặc công thức khác?
8. Báo cáo CMS có dữ liệu nguồn từ site hiện tại hay từ nền tảng mới?

## 9. Tác nhân ảnh hưởng chi phí
Số vai trò; số cấp duyệt; quy trình phê duyệt đặc biệt; lịch sử phiên bản và diff; SSO; phân quyền theo từng nội dung; yêu cầu audit và retention; số lượng dashboard/report.

## 10. Phạm vi chưa chốt
Tất cả tính năng `PROPOSED` cần review với đại diện nghiệp vụ VTV8 trước khi chuyển thành `CONFIRMED` hoặc `BASELINED`. Chưa có ước tính ngày công và báo giá module tại bản 0.1.
