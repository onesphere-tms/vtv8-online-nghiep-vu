# G3-07 – Giỏ hàng, đơn hàng và thanh toán TMĐT

> **Đã chuẩn hóa nội bộ 09/10/2026; chưa được VTV8 phê duyệt.** Marketplace là bước C chỉ triển khai theo quyết định đầu tư, pháp lý và đối tác; chưa ước tính giờ FE/BE.

## Mục tiêu
Cho phép người dùng đặt và thanh toán sản phẩm bán trên VTV8Online khi trách nhiệm seller, merchant-of-record và đối tác thanh toán đã được chốt.

## Phạm vi và ranh giới
- **Nhóm phân kỳ:** C – Sàn TMĐT khi đủ quy mô.
- **Chủ sở hữu:** Commerce Order & Payment.
- **Kế thừa:** G2-01 account/consent; G2-09 gateway adapter nếu đã triển khai cho subscription và provider phù hợp cho TMĐT, nhưng order/fulfillment và ledger khác; G3-06 SKU/stock.
- Đối với marketplace, toàn bộ phần core commerce được đặt `CONDITIONAL` cho đến khi có [điều kiện TMĐT và trách nhiệm giao dịch](G3-RELEASE-GATES.md). Không mặc định VTV8 có nghĩa vụ pháp lý của seller/merchant trước khi mô hình được quyết định.

## Tính năng độc lập (8)

| Mã | Tính năng | Actor | Nghiệp vụ sau QA | FE mới | BE mới | Nghiệm thu sơ bộ | Phạm vi | Nguồn | Ranh giới/điều kiện QA |
|---|---|---|---|---|---|---|---|---|---|
| G3-07-F001 | **Giỏ hàng và điều chỉnh số lượng** | Người mua | Giỏ mua SKU hợp lệ, cơ sở giả định một seller cho một đơn; nếu nhiều seller phải chốt split order, delivery, settlement và tăng phạm vi. | Cart page, quantity, empty/error states | Cart session/account store, product eligibility và stock checks | Giỏ không chứa SKU không được bán, số lượng theo giới hạn sản phẩm | CONDITIONAL | T | Phải chốt giỏ một hay nhiều đơn vị bán và số đơn giao dịch phát sinh |
| G3-07-F002 | **Thu thập địa chỉ và thông tin giao hàng** | Người mua | Thu thập tên/địa chỉ/thông tin liên hệ người nhận đúng mục đích giao hàng, phân quyền và thời hạn lưu theo chính sách đã duyệt. | Shipping/contact checkout form | Order contact/address validation, privacy policy refs | Thông tin nhận hàng thuộc đúng đơn, không hiển thị trái quyền | CONDITIONAL | B | Người nhận và địa chỉ chỉ dùng theo mục đích giao hàng đã chốt |
| G3-07-F003 | **Tính phí giao hàng và cách nhận hàng** | Người mua | Phí ship/pickup được báo rõ trước khi người mua xác nhận đơn; khi chưa có carrier API chỉ có bảng quy tắc/phương thức được duyệt. | Shipping option, phí dự tính và mốc hiệu lực | Shipping quotation/manual table or carrier adapter nếu có | Tổng checkout có tách phí, không lấy giá chỉ tham khảo làm số tiền cuối | CONDITIONAL | B | Phí vận chuyển hoặc nhận tại điểm cần được xác nhận trước đặt đơn |
| G3-07-F004 | **Tạo đơn hàng với giá snapshot và kiểm tra tồn** | Người mua; hệ thống | CommerceOrder riêng với subscription order G2-09; snapshot giá/phí/tồn, idempotent create, giữ tồn có hạn và phát event trạng thái cho G2-07 (nhận G3-07-F008). | Review order, confirm action | Order state machine, pricing snapshot, inventory reservation, event adapter G2-07 dùng chung | Không sinh đơn kép khi bấm nhiều lần; trạng thái của đơn phản ánh thanh toán/fulfillment; tạo thông báo qua G2-07 không trùng. | CONDITIONAL | T | CommerceOrder có giá chốt, số lượng và trạng thái riêng, không trộn đơn thuê bao GĐ2 |
| G3-07-F005 | **Tích hợp thanh toán đơn hàng TMĐT** | Người mua | Payment đơn TMĐT theo nhà cung cấp và pháp nhân VTV8 chốt; chỉ tái dùng payment adapter G2-09 nếu thực sự tương thích với loại đơn, không dùng order thuê bao. | Payment method/redirect/status | Payment intent/order refs, provider adapter hoặc extension từ G2-09 | Không lưu thẻ nhạy cảm; trạng thái chờ khác với đã thanh toán | CONDITIONAL | T | Tái dùng kết nối thanh toán GĐ2 chỉ nếu đối tác phù hợp loại giao dịch |
| G3-07-F006 | **Nhận kết quả và đối soát thanh toán đơn hàng** | Hệ thống; vận hành | Đối soát trạng thái thanh toán với CommerceOrder, xử lý callback trễ/lặp và giao dịch pending; không tự coi chuyển hướng là đã thanh toán. | Order payment status/error | Idempotent webhook handler mapping vào order domain, reconcile queue | Một payment hợp lệ chỉ hoàn tất một đơn; đơn lỗi có thể đối soát | CONDITIONAL | B | Đồng bộ trạng thái trả tiền với đơn và có khả năng xử lý sai lệch |
| G3-07-F007 | **Tra cứu đơn hàng và trạng thái mua** | Người mua | Trang đơn của người mua với quyền sở hữu và trạng thái mới nhất; phát thay đổi để dùng inbox G2-07, không viết notification service mới. | Order history/detail, permission checks | Order history/detail API có ownership check, order status events tích hợp G2-07 | Người mua chỉ xem đơn của mình; trạng thái nhất quán bên vận hành | CONDITIONAL | B | Trang đơn cho người mua khác hàng đợi vận hành G3-08 |
| G3-07-F009 | **Mã ưu đãi và điều chỉnh giá khi đặt hàng** | Người mua; vận hành | OPTION voucher dành riêng cho SKU/giỏ, khác khuyến mại gói premium G2-09; chỉ làm khi có quy chế ưu đãi. | Coupon field và hiển thị giảm giá | Cart promotion conditions, usage limits và price snapshot | Không áp mã hết hạn/trùng giới hạn, tổng tiền khớp backend | OPTION | B | Mã khuyến mại chỉ sau khi chính sách giá và đơn hàng hoạt động |

**Nhãn nguồn:** `T` = hướng/ví dụ có trong đề xuất VTV8; `B` = phân rã suy luận, chưa là yêu cầu xác nhận. CORE/CONDITIONAL/OPTION phân kỳ nội bộ theo [gates](G3-RELEASE-GATES.md). [Danh mục 64](G3-DANH-MUC-TINH-NANG.md) · [Mapping 70→64](G3-MAPPING-70-64.md).

[Trở lại GĐ3](README.md).

## Mã đã gộp

- **G3-07-F008 – Thông báo thay đổi đơn hàng:** chuyển vào G3-07-F004/F007 phát sự kiện, G2-07 xử lý inbox/notification. Không bỏ chức năng, chỉ không đếm là feature độc lập.
