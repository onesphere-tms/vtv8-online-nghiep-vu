# G2-09 – Đăng ký thuê bao và thanh toán nội dung

> **GĐ2 Media Platform – thiết kế nghiệp vụ sơ bộ 09/10/2026.** Module và tính năng **DRAFT, chưa được người dùng chốt hoặc VTV8 xác nhận**, chưa ước tính giờ FE/BE.

## Mục tiêu
VTV8Online có thể cấu hình và quản lý gói thuê bao trả phí khi mô hình kinh doanh và đối tác thanh toán đã sẵn sàng.

## Ranh giới
Nguồn trực tiếp nêu đăng ký thuê bao và nội dung trả phí, không đưa chi tiết cổng thanh toán, hóa đơn và giá gói. Phần giao dịch là suy luận có điều kiện: không tự xây ví điện tử, cổng thanh toán hoặc hệ thống kế toán/thuế.

## Phụ thuộc
VTV8 duyệt mô hình gói, giá, hoàn tiền, gia hạn; đối tác payment gateway; G2-01 audience account; G2-10 rights/entitlement.

## Danh mục tính năng (8)

| Mã | Tính năng | Người sử dụng | Luồng nghiệp vụ và đầu ra | Phần việc FE mới | Phần việc BE mới | Tiêu chí nghiệm thu sơ bộ | Nguồn | Phạm vi đề xuất |
|---|---|---|---|---|---|---|---|---|
| G2-09-F001 | **Danh mục gói thuê bao và quyền lợi** | Quản trị kinh doanh; người xem | Khai báo các gói, chu kỳ, mô tả lợi ích, trạng thái bán; quyền lợi trỏ sang G2-10. | Trang gói public; form quản trị gọn | Plan CRUD/versions, entitlement mapping references | Người xem chỉ nhìn thấy gói đang bán; quyền lợi hiển thị rõ | T | CORE |
| G2-09-F002 | **Giá, chu kỳ và điều kiện đăng ký** | Quản trị kinh doanh | Định nghĩa mức giá, đơn vị tiền tệ, chu kỳ, thời điểm áp dụng và các điều khoản VTV8 đã duyệt. | Bảng giá, lựa chọn chu kỳ và điều khoản | Price schedule, effective dates, validation | Giá mua hiển thị khớp giao dịch tính theo ngày hiệu lực | B | CONDITIONAL |
| G2-09-F003 | **Đăng ký gói và khởi tạo thanh toán** | Người xem đăng nhập | Chọn gói, xác nhận điều khoản và chuyển sang gateway thanh toán được phép, không giữ thông tin thẻ trên máy chủ ứng dụng. | Checkout, chuyển cổng, trạng thái chờ xử lý | Create payment intent/order, adapter gateway, signed callback | Chưa thanh toán thành công không cấp quyền trả phí | B | CONDITIONAL |
| G2-09-F004 | **Nhận trạng thái giao dịch và đối soát đơn** | Hệ thống; bộ phận vận hành | Nhận webhook/giao dịch, xác minh chữ ký, tránh cập nhật trùng; hiển thị tra soát lỗi cơ bản. | Trang trạng thái order và error/retry | Idempotent webhook, payment state machine, reconciliation refs | Webhook gửi lại không tạo hai thuê bao/cấp quyền trùng | B | CONDITIONAL |
| G2-09-F005 | **Vòng đời thuê bao và ngày hết hạn** | Người xem; hệ thống | Quản lý đã kích hoạt/chưa kích hoạt/hết hạn/hủy và thời điểm bắt đầu, kết thúc của gói; chuyển quyền xem cho G2-10. | Trang gói đang dùng, hạn sử dụng, nút hủy nếu hỗ trợ | Subscription state transitions và events cho entitlement | Hết hạn gói thì quyền xem bị rút đúng thời điểm | T | CORE |
| G2-09-F006 | **Gia hạn, hủy và xử lý thanh toán thất bại** | Người xem; vận hành | Thực hiện hủy/gia hạn theo chính sách hợp đồng và năng lực gateway; không mặc định tự thu tiền nếu chưa có cơ chế hợp pháp. | Manage subscription, xác nhận hủy, trạng thái lỗi | Renewal/cancel jobs, gateway callbacks nếu hỗ trợ | Hủy/gia hạn tuân thủ điều khoản, không thu trùng giao dịch | B | CONDITIONAL |
| G2-09-F007 | **Lịch sử thanh toán và chứng từ** | Người xem; bộ phận vận hành | Tra cứu giao dịch, chứng từ do nhà cung cấp hoặc hệ thống được phép phát hành; không tự mặc định chức năng hóa đơn điện tử. | History list, download receipts nếu có | Transaction read API, vendor receipt refs, access controls | Chỉ chủ tài khoản xem giao dịch của mình; chứng từ đúng nguồn | B | CONDITIONAL |
| G2-09-F008 | **Khuyến mại, dùng thử hoặc tặng quyền** | Bộ phận kinh doanh | Cấp ưu đãi, thời gian dùng thử hoặc mã giảm giá theo chính sách; có giới hạn sử dụng và ngày hết hạn. | Voucher/trial form, ưu đãi nếu chọn | Promo/trial validation, timebound entitlements | Không thể áp dụng lại sai giới hạn; hết hạn thì quyền tự cập nhật | B | OPTION |

**Quy ước:** `T` là nhóm yêu cầu VTV8 nêu trực tiếp (thao tác chi tiết có thể được suy luận); `B` là phân rã nghiệp vụ bổ sung; `C` là hạng mục có điều kiện pháp lý/vendor. `CORE` là đề xuất phạm vi cơ sở, `OPTION` và `CONDITIONAL` chưa mặc nhiên triển khai. Riêng **G2-08 toàn bộ CONDITIONAL** theo tài liệu GĐ2.

[Trở về tổng quan GĐ2](README.md).
