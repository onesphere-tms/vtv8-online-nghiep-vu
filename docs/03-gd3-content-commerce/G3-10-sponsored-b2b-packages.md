# G3-10 – Gói truyền thông tài trợ và dịch vụ B2B

> **Đề xuất nghiệp vụ GĐ3 (09/10/2026), chưa được VTV8 xác nhận hoặc tính giờ FE/BE.** Ba bước trong nguồn: Content + Lead; Affiliate/Booking; Sàn TMĐT khi đủ quy mô. `G3-10` là mở rộng dựa mô hình kinh doanh chung, **không phải bước bắt buộc GĐ3 được nguồn khẳng định**.

## Mục tiêu
Hỗ trợ mô hình quảng bá địa phương/di sản/đặc sản, truyền thông doanh nghiệp và chương trình tài trợ đã được nêu trong phần mô hình kinh doanh chung của đề xuất.

## Phạm vi và ranh giới
- **Nhóm phân kỳ:** B2B – cơ hội kinh doanh bổ sung, chưa mặc định thuộc 3 bước GĐ3.
- **Chủ sở hữu:** B2B Sales & Sponsored Content.
- **Kế thừa:** G1-03 workflow biên tập, G1-04 nội dung, G3-03 partner, G3-02 lead source; không thay thế bán quảng cáo/programmatic ad-server, licensing archive sâu thuộc GĐ4..
- Đối với marketplace, toàn bộ phần core commerce được đặt `CONDITIONAL` cho đến khi có [điều kiện TMĐT và trách nhiệm giao dịch](G3-RELEASE-GATES.md). Không mặc định VTV8 có nghĩa vụ pháp lý của seller/merchant trước khi mô hình được quyết định.

## Danh sách tính năng (6)

| Mã | Tính năng | Actor | Nghiệp vụ và đầu ra | FE mới | BE mới | Nghiệm thu riêng | Phạm vi đề xuất | Nguồn |
|---|---|---|---|---|---|---|---|---|
| G3-10-F001 | **Danh mục gói dịch vụ truyền thông B2B** | Kinh doanh | Định nghĩa gói truyền thông điểm đến/di sản/OCOP/chương trình tài trợ theo mô tả, hạng mục bàn giao và điều kiện bán được VTV8 duyệt. | Package list/form back-office | B2B offer metadata, effective dates, terms | Gói có phạm vi bàn giao và trách nhiệm rõ, không là SKU vật lý marketplace | OPTION | T |
| G3-10-F002 | **Tiếp nhận yêu cầu quảng bá hoặc tài trợ** | Doanh nghiệp/địa phương; kinh doanh | Gửi nhu cầu và liên hệ B2B qua mẫu riêng dùng hạ tầng lead G3-02; không tạo lead store thứ hai. | B2B inquiry form dùng lại lead UI | Lead record có business category, nguồn và privacy policy | Yêu cầu có đủ contact/nội dung và được chuyển đúng bộ phận | OPTION | B |
| G3-10-F003 | **Lập và phê duyệt đề xuất truyền thông** | Kinh doanh; quản lý VTV8 | Tạo phạm vi gói, lịch thực hiện, đầu ra, giá dự kiến; phê duyệt nội bộ trước khi gửi khách, không thay hệ quản lý hợp đồng/ERP. | Proposal draft/approval và PDF nếu cần | Proposal records, workflow/audit, template export | Có lịch sử bản đề xuất, trạng thái nội bộ và người chịu trách nhiệm | OPTION | B |
| G3-10-F004 | **Liên kết nội dung tài trợ và nhãn hợp tác** | Biên tập; quản trị | Khi sản xuất nội dung theo hợp đồng, gắn ref chiến dịch/tài trợ, theo workflow CMS và nhãn công khai G3-01-F004. | CMS selector/nhãn hợp tác dùng lại | Campaign–content relation, rights/approval guard | Không đăng nội dung tài trợ thiếu trạng thái duyệt hoặc nhãn bắt buộc | OPTION | T |
| G3-10-F005 | **Theo dõi bàn giao nội dung, chương trình và báo cáo** | Quản lý tài trợ | Ghi đầu ra đã sản xuất/phát, bằng chứng liên kết và kết quả hiển thị/lượt xem từ G1-09/G2-11; không tự hứa kết quả quảng cáo. | Delivery checklist/report per campaign | Deliverables relation, measured metrics references | Đếm được đầu ra, chưa nghiệm thu không tự coi đã bàn giao | OPTION | B |
| G3-10-F006 | **Bảng quản lý khách hàng và hợp đồng B2B tối thiểu** | Kinh doanh; tài chính | Theo dõi đầu mối khách hàng, hợp đồng hiệu lực, đơn vị phụ trách và trạng thái doanh thu ghi nhận thủ công; không tự xây billing và CRM đầy đủ. | B2B account list, contract metadata | Customer/contract references + audit, không nhân đôi partner G3-03 nếu cùng đơn vị | Có thể tra cứu đối tác và hợp đồng đang hiệu lực, phân quyền thông tin | OPTION | B |

**Nhãn nguồn:** `T` = hướng/ví dụ hoặc nhóm mô hình kinh doanh có trong đề xuất VTV8, không bảo đảm từng thao tác được tài liệu mô tả nguyên văn; `B` = phân rã nghiệp vụ được đề xuất. `CORE` đề xuất triển khai ngay trong bước Content + Lead, `CONDITIONAL` phụ thuộc điều kiện đối tác/pháp lý/đầu tư, `OPTION` là mở rộng chưa bắt buộc.

[Trở lại GĐ3](README.md).
