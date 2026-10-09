# G3-06 – Danh mục hàng hóa và vận hành người bán

> **GĐ3 – đã chuẩn hóa nội bộ 09/10/2026; chưa được VTV8 phê duyệt.** Phần B/C và đối tác chỉ triển khai khi gate được xác nhận; chưa tính giờ FE/BE.

## Mục tiêu
Nâng từ offering giới thiệu thành danh mục sản phẩm bán được thực sự, có người bán, tồn kho, giá và kiểm duyệt.

## Phạm vi và ranh giới
- **Nhóm phân kỳ:** C – Sàn TMĐT khi đủ quy mô.
- **Chủ sở hữu:** Marketplace Catalog & Seller Operations.
- **Kế thừa:** G3-03 master partner và offering; G1-04 taxonomy; G1-05 DAM. Không xây lại cổng Partner Platform self-service của GĐ4; vận hành qua admin ở GĐ3.
- Đối với marketplace, toàn bộ phần core commerce được đặt `CONDITIONAL` cho đến khi có [điều kiện TMĐT và trách nhiệm giao dịch](G3-RELEASE-GATES.md). Không mặc định VTV8 có nghĩa vụ pháp lý của seller/merchant trước khi mô hình được quyết định.

## Tính năng độc lập (7)

| Mã | Tính năng | Actor | Nghiệp vụ sau QA | FE mới | BE mới | Nghiệm thu sơ bộ | Phạm vi | Nguồn | Ranh giới/điều kiện QA |
|---|---|---|---|---|---|---|---|---|---|
| G3-06-F001 | **Đánh giá và kích hoạt đối tác thành người bán** | VTV8; kinh doanh; pháp lý | Merchant/seller activation là vai trò mở rộng của partner master G3-03; phải xác định merchant-of-record, trách nhiệm giao hàng/hoá đơn theo phê duyệt VTV8. | Merchant activation form/checklist | Merchant role/status mapping tới G3-03, audit | Chỉ đối tác đủ điều kiện mới trở thành seller; không nhân đôi hồ sơ đối tác | CONDITIONAL | B | Vai trò merchant dựa partner master G3-03, phải xác nhận trách nhiệm bán. |
| G3-06-F002 | **Danh mục sản phẩm bán trực tiếp** | Người bán thông qua nhân sự vận hành | SKU thực bán khác offering giới thiệu, cần owner seller, thuộc tính/biến thể tối thiểu, chứng cứ nguồn gốc và loại hàng được phép kinh doanh. | Product/SKU admin list/form | Marketplace product schema, relations to offering/partner, publish eligibility | SKU thuộc đúng seller, có trạng thái và link nội dung VTV8 tương ứng | CONDITIONAL | T | SKU giao dịch khác offering giới thiệu; xác định loại sản phẩm và chứng cứ nguồn gốc. |
| G3-06-F003 | **Giá niêm yết và điều kiện bán hàng** | Kinh doanh; người bán | Quản lý giá/điều kiện bán và mốc hiệu lực; khi xác nhận CommerceOrder G3-07 lưu snapshot giá/thuế/phí, không mặc định nhiều tiền tệ. | Pricing/variant form, product price display | Price/version rules, currency/tax assumptions refs | Giá checkout ghi snapshot theo thời điểm đặt đơn, không tự đổi sau khi khách xác nhận | CONDITIONAL | B | Giá và thuế được ghi snapshot tại đơn, không mặc định nhiều tiền tệ. |
| G3-06-F004 | **Quản lý tồn kho cơ bản** | Vận hành người bán | Quản lý tồn, giữ/hoàn tồn chỉ nếu VTV8/seller có nguồn inventory đáng tin cậy; điều kiện khóa đồng thời và timeout phải được chốt. | Stock admin, cảnh báo hết hàng | Inventory/reservation service, concurrency control | Không oversell ở lượng đặt thử đã thống nhất; hết hàng không tạo đơn thành công | CONDITIONAL | B | Chỉ quản tồn khi có nguồn inventory và quy tắc giữ/hoàn tồn rõ. |
| G3-06-F005 | **Tổ chức danh mục và lọc sản phẩm** | Người mua | Xem sản phẩm theo địa phương, chủ đề, OCOP/đặc sản, người bán và trạng thái bán; dùng taxonomy G1-04. | List/filter/catalog pages dùng card G3-01 | Catalog query/filter/index delta, visibility check | Sản phẩm kết nối đúng taxonomy, lọc không hiện SKU inactive | CONDITIONAL | B | Danh sách SKU dùng taxonomy GĐ1, khác listing offering G3-01. |
| G3-06-F006 | **Kiểm duyệt thông tin và quyền sử dụng hình ảnh sản phẩm** | Biên tập; vận hành | Kiểm duyệt nội dung hàng hóa/nguồn gốc/nhãn OCOP khi có chứng cứ; ảnh/media kế thừa DAM G1-05, không tự cấp chứng chỉ mới. | Review queue và nhãn thông tin đã xác minh khi đủ bằng chứng | Publish guard, evidence references và DAM media rights | Không gắn nhãn đã xác minh hoặc công khai nội dung thiếu quyền/bằng chứng | CONDITIONAL | B | Quyền hình ảnh, nhãn OCOP hoặc chứng nhận cần bằng chứng xác minh. |
| G3-06-F007 | **Trang gian hàng người bán mức cơ bản** | Người mua | Xem thông tin người bán, các sản phẩm có thể mua và kênh hỗ trợ, không cung cấp cổng quản trị riêng cho seller. | Public merchant profile/storefront | Seller-facing catalog read API và partner status | Chỉ hiện seller đã đủ điều kiện; tự khóa khi seller bị đình chỉ | OPTION | B | Gian hàng public có thể hoãn, nhưng thông tin người bán vẫn cần hiển thị trên sản phẩm. |

**Nhãn nguồn:** `T` là chủ đề/ví dụ trong nguồn VTV8, thao tác chi tiết có thể do phân tích suy ra; `B` là nghiệp vụ đề xuất. CORE là phạm vi A, CONDITIONAL theo gate, OPTION chỉ khi lựa chọn. [Danh mục 64](G3-DANH-MUC-TINH-NANG.md) · [Mapping 70→64](G3-MAPPING-70-64.md) · [Release gates](G3-RELEASE-GATES.md).

[Trở lại GĐ3](README.md).
