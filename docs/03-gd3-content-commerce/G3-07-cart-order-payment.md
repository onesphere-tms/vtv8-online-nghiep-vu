# G3-07 – Giỏ hàng, đơn hàng và thanh toán TMĐT

> **Đề xuất nghiệp vụ GĐ3 (09/10/2026), chưa được VTV8 xác nhận hoặc tính giờ FE/BE.** Ba bước trong nguồn: Content + Lead; Affiliate/Booking; Sàn TMĐT khi đủ quy mô. `G3-10` là mở rộng dựa mô hình kinh doanh chung, **không phải bước bắt buộc GĐ3 được nguồn khẳng định**.

## Mục tiêu
Cho phép người dùng đặt và thanh toán sản phẩm bán trên VTV8Online khi trách nhiệm seller, merchant-of-record và đối tác thanh toán đã được chốt.

## Phạm vi và ranh giới
- **Nhóm phân kỳ:** C – Sàn TMĐT khi đủ quy mô.
- **Chủ sở hữu:** Commerce Order & Payment.
- **Kế thừa:** G2-01 account/consent; G2-09 gateway adapter nếu đã triển khai cho subscription và provider phù hợp cho TMĐT, nhưng order/fulfillment và ledger khác; G3-06 SKU/stock..
- Đối với marketplace, toàn bộ phần core commerce được đặt `CONDITIONAL` cho đến khi có [điều kiện TMĐT và trách nhiệm giao dịch](G3-RELEASE-GATES.md). Không mặc định VTV8 có nghĩa vụ pháp lý của seller/merchant trước khi mô hình được quyết định.

## Danh sách tính năng (9)

| Mã | Tính năng | Actor | Nghiệp vụ và đầu ra | FE mới | BE mới | Nghiệm thu riêng | Phạm vi đề xuất | Nguồn |
|---|---|---|---|---|---|---|---|---|
| G3-07-F001 | **Giỏ hàng và điều chỉnh số lượng** | Người mua | Thêm/bỏ SKU đang bán, cập nhật số lượng, phản hồi hết hàng; giao dịch nhiều người bán chỉ khi mô hình vận hành đủ điều kiện. | Cart page, quantity, empty/error states | Cart session/account store, product eligibility và stock checks | Giỏ không chứa SKU không được bán, số lượng theo giới hạn sản phẩm | CONDITIONAL | T |
| G3-07-F002 | **Thu thập địa chỉ và thông tin giao hàng** | Người mua | Nhập người nhận/địa chỉ/số liên lạc phù hợp cách giao hàng, ghi nhận điều khoản và chính sách dữ liệu. | Shipping/contact checkout form | Order contact/address validation, privacy policy refs | Thông tin nhận hàng thuộc đúng đơn, không hiển thị trái quyền | CONDITIONAL | B |
| G3-07-F003 | **Tính phí giao hàng và cách nhận hàng** | Người mua | Đề xuất phương án giao hàng/nhận tại điểm theo đối tác hỗ trợ; phí được xác nhận trước khi tạo đơn, không cam kết thời gian khi chưa có carrier API. | Shipping option, phí dự tính và mốc hiệu lực | Shipping quotation/manual table or carrier adapter nếu có | Tổng checkout có tách phí, không lấy giá chỉ tham khảo làm số tiền cuối | CONDITIONAL | B |
| G3-07-F004 | **Tạo đơn hàng với giá snapshot và kiểm tra tồn** | Người mua; hệ thống | Chốt SKU/giá/số lượng/ưu đãi đã được phép, snapshot thời điểm mua, giữ tồn có giới hạn, trạng thái chờ thanh toán. | Review order, confirm action | Order state machine, stock reservation/idempotency, snapshot totals | Click nhiều lần không sinh hai đơn; giá và tồn sau khi đặt không tự thay đổi sai | CONDITIONAL | T |
| G3-07-F005 | **Tích hợp thanh toán đơn hàng TMĐT** | Người mua | Thanh toán qua nhà cung cấp đã được VTV8 chọn; chỉ tái dùng adapter G2-09 nếu cùng gateway và phù hợp loại giao dịch, không tự xây gateway. | Payment method/redirect/status | Payment intent/order refs, provider adapter hoặc extension từ G2-09 | Không lưu thẻ nhạy cảm; trạng thái chờ khác với đã thanh toán | CONDITIONAL | T |
| G3-07-F006 | **Nhận kết quả và đối soát thanh toán đơn hàng** | Hệ thống; vận hành | Webhook xác minh, xử lý trùng/trễ; thanh toán sai lệch phải vào hàng đợi xử lý, không nhân đôi payment gateway infrastructure GĐ2. | Order payment status/error | Idempotent webhook handler mapping vào order domain, reconcile queue | Một payment hợp lệ chỉ hoàn tất một đơn; đơn lỗi có thể đối soát | CONDITIONAL | B |
| G3-07-F007 | **Tra cứu đơn hàng và trạng thái mua** | Người mua | Xem danh sách/chi tiết đơn và trạng thái thanh toán/xử lý/đã giao/hủy; định nghĩa rõ trạng thái seller và buyer. | Order history/detail, permission checks | Order query API, ownership, state timeline | Người mua chỉ xem đơn của mình; trạng thái nhất quán bên vận hành | CONDITIONAL | B |
| G3-07-F008 | **Thông báo thay đổi đơn hàng** | Người mua | Nhận thông báo xác nhận đơn và thay đổi trạng thái; dùng inbox G2-07, email chỉ nếu kênh được kích hoạt. | Order status notice trong inbox, link tới đơn | Order events → notification API G2-07, dedupe | Một trạng thái không gửi trùng; không gửi thông tin đơn cho account khác | CONDITIONAL | B |
| G3-07-F009 | **Mã ưu đãi và điều chỉnh giá khi đặt hàng** | Người mua; vận hành | OPTION voucher dành riêng cho SKU/giỏ, khác khuyến mại gói premium G2-09; chỉ làm khi có quy chế ưu đãi. | Coupon field và hiển thị giảm giá | Cart promotion conditions, usage limits và price snapshot | Không áp mã hết hạn/trùng giới hạn, tổng tiền khớp backend | OPTION | B |

**Nhãn nguồn:** `T` = hướng/ví dụ hoặc nhóm mô hình kinh doanh có trong đề xuất VTV8, không bảo đảm từng thao tác được tài liệu mô tả nguyên văn; `B` = phân rã nghiệp vụ được đề xuất. `CORE` đề xuất triển khai ngay trong bước Content + Lead, `CONDITIONAL` phụ thuộc điều kiện đối tác/pháp lý/đầu tư, `OPTION` là mở rộng chưa bắt buộc.

[Trở lại GĐ3](README.md).
