# G3-06 – Danh mục hàng hóa và vận hành người bán

> **Đề xuất nghiệp vụ GĐ3 (09/10/2026), chưa được VTV8 xác nhận hoặc tính giờ FE/BE.** Ba bước trong nguồn: Content + Lead; Affiliate/Booking; Sàn TMĐT khi đủ quy mô. `G3-10` là mở rộng dựa mô hình kinh doanh chung, **không phải bước bắt buộc GĐ3 được nguồn khẳng định**.

## Mục tiêu
Nâng từ offering giới thiệu thành danh mục sản phẩm bán được thực sự, có người bán, tồn kho, giá và kiểm duyệt.

## Phạm vi và ranh giới
- **Nhóm phân kỳ:** C – Sàn TMĐT khi đủ quy mô.
- **Chủ sở hữu:** Marketplace Catalog & Seller Operations.
- **Kế thừa:** G3-03 master partner và offering; G1-04 taxonomy; G1-05 DAM. Không xây lại cổng Partner Platform self-service của GĐ4; vận hành qua admin ở GĐ3..
- Đối với marketplace, toàn bộ phần core commerce được đặt `CONDITIONAL` cho đến khi có [điều kiện TMĐT và trách nhiệm giao dịch](G3-RELEASE-GATES.md). Không mặc định VTV8 có nghĩa vụ pháp lý của seller/merchant trước khi mô hình được quyết định.

## Danh sách tính năng (7)

| Mã | Tính năng | Actor | Nghiệp vụ và đầu ra | FE mới | BE mới | Nghiệm thu riêng | Phạm vi đề xuất | Nguồn |
|---|---|---|---|---|---|---|---|---|
| G3-06-F001 | **Đánh giá và kích hoạt đối tác thành người bán** | VTV8; kinh doanh; pháp lý | Xác nhận người bán nào được đăng sản phẩm và chịu trách nhiệm giao hàng/hóa đơn; kế thừa partner G3-03, lưu điều kiện giao dịch theo mô hình kinh doanh. | Merchant activation form/checklist | Merchant role/status mapping tới G3-03, audit | Chỉ đối tác đủ điều kiện mới trở thành seller; không nhân đôi hồ sơ đối tác | CONDITIONAL | B |
| G3-06-F002 | **Danh mục sản phẩm bán trực tiếp** | Người bán thông qua nhân sự vận hành | Lưu sản phẩm/SKU, phân loại, mô tả, ảnh, đơn vị tính và tình trạng bán; tách rõ offering giới thiệu khỏi SKU thực giao dịch. | Product/SKU admin list/form | Marketplace product schema, relations to offering/partner, publish eligibility | SKU thuộc đúng seller, có trạng thái và link nội dung VTV8 tương ứng | CONDITIONAL | T |
| G3-06-F003 | **Giá niêm yết và điều kiện bán hàng** | Kinh doanh; người bán | Giá/biến thể hiệu lực và cấu hình quy tắc bán tối thiểu, chi phí không mặc định thuộc giá; tuân theo chính sách thương mại được duyệt. | Pricing/variant form, product price display | Price/version rules, currency/tax assumptions refs | Giá checkout ghi snapshot theo thời điểm đặt đơn, không tự đổi sau khi khách xác nhận | CONDITIONAL | B |
| G3-06-F004 | **Quản lý tồn kho cơ bản** | Vận hành người bán | Theo dõi tồn có sẵn, giữ chỗ và hoàn tồn khi đơn hủy; inventory owner phải được xác nhận nếu đối tác xử lý kho riêng. | Stock admin, cảnh báo hết hàng | Inventory/reservation service, concurrency control | Không oversell ở lượng đặt thử đã thống nhất; hết hàng không tạo đơn thành công | CONDITIONAL | B |
| G3-06-F005 | **Tổ chức danh mục và lọc sản phẩm** | Người mua | Xem sản phẩm theo địa phương, chủ đề, OCOP/đặc sản, người bán và trạng thái bán; dùng taxonomy G1-04. | List/filter/catalog pages dùng card G3-01 | Catalog query/filter/index delta, visibility check | Sản phẩm kết nối đúng taxonomy, lọc không hiện SKU inactive | CONDITIONAL | B |
| G3-06-F006 | **Kiểm duyệt thông tin và quyền sử dụng hình ảnh sản phẩm** | Biên tập; vận hành | Kiểm tra hình ảnh/nguồn gốc/thông tin cam kết được phép sử dụng; chính sách chứng nhận OCOP/truy xuất cần đối tác xác minh. | Review queue và nhãn thông tin đã xác minh khi đủ bằng chứng | Publish guard, evidence references và DAM media rights | Không gắn nhãn đã xác minh hoặc công khai nội dung thiếu quyền/bằng chứng | CONDITIONAL | B |
| G3-06-F007 | **Trang gian hàng người bán mức cơ bản** | Người mua | Xem thông tin người bán, các sản phẩm có thể mua và kênh hỗ trợ, không cung cấp cổng quản trị riêng cho seller. | Public merchant profile/storefront | Seller-facing catalog read API và partner status | Chỉ hiện seller đã đủ điều kiện; tự khóa khi seller bị đình chỉ | OPTION | B |

**Nhãn nguồn:** `T` = hướng/ví dụ hoặc nhóm mô hình kinh doanh có trong đề xuất VTV8, không bảo đảm từng thao tác được tài liệu mô tả nguyên văn; `B` = phân rã nghiệp vụ được đề xuất. `CORE` đề xuất triển khai ngay trong bước Content + Lead, `CONDITIONAL` phụ thuộc điều kiện đối tác/pháp lý/đầu tư, `OPTION` là mở rộng chưa bắt buộc.

[Trở lại GĐ3](README.md).
