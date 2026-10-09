# G3-08 – Xử lý đơn, giao hàng và hậu mãi

> **Đề xuất nghiệp vụ GĐ3 (09/10/2026), chưa được VTV8 xác nhận hoặc tính giờ FE/BE.** Ba bước trong nguồn: Content + Lead; Affiliate/Booking; Sàn TMĐT khi đủ quy mô. `G3-10` là mở rộng dựa mô hình kinh doanh chung, **không phải bước bắt buộc GĐ3 được nguồn khẳng định**.

## Mục tiêu
Chỉ mở khi VTV8/đối tác đã phân định rõ ai chịu trách nhiệm xử lý đơn, giao hàng, đổi trả và tranh chấp với người mua.

## Phạm vi và ranh giới
- **Nhóm phân kỳ:** C – Sàn TMĐT khi đủ quy mô.
- **Chủ sở hữu:** Fulfillment & Post-sales Operations.
- **Kế thừa:** G3-07 order; G3-03 seller/partner; G2-07 notification. GĐ3 không mặc định tự vận hành kho vận..
- Đối với marketplace, toàn bộ phần core commerce được đặt `CONDITIONAL` cho đến khi có [điều kiện TMĐT và trách nhiệm giao dịch](G3-RELEASE-GATES.md). Không mặc định VTV8 có nghĩa vụ pháp lý của seller/merchant trước khi mô hình được quyết định.

## Danh sách tính năng (7)

| Mã | Tính năng | Actor | Nghiệp vụ và đầu ra | FE mới | BE mới | Nghiệm thu riêng | Phạm vi đề xuất | Nguồn |
|---|---|---|---|---|---|---|---|---|
| G3-08-F001 | **Bảng điều hành tiếp nhận và xử lý đơn** | Nhân sự vận hành; seller được hỗ trợ | Xem đơn cần xử lý, xác nhận chuẩn bị/đã bàn giao và người chịu trách nhiệm; triển khai bằng CMS/admin thay vì cổng seller tự phục vụ GĐ4. | Back-office order queue, actions và trạng thái | Order fulfillment state transitions, role-based assignments | Đơn chỉ được chuyển trạng thái theo trách nhiệm và có audit | CONDITIONAL | B |
| G3-08-F002 | **Chuyển đơn cho đối tác cung ứng** | Nhân viên vận hành | Chuyển thông tin đơn tối thiểu đến đúng seller, lưu bằng chứng bàn giao, không chuyển PII ngoài mục đích hợp lệ. | Transfer/ack UI và export theo quyền | Order-to-seller dispatch, acknowledgments/log | Không gửi đơn cho nhầm đối tác; chỉ trường cần thiết được cung cấp | CONDITIONAL | B |
| G3-08-F003 | **Tích hợp vận chuyển và mã theo dõi** | Người bán; người mua | Gắn mã vận đơn theo nhà vận chuyển, tự động lấy trạng thái nếu có API; giai đoạn cơ sở có thể nhập thủ công. | Carrier/tracking UI trên order | Shipment refs, optional carrier adapter/webhooks | Có thể đối chiếu đơn-vận đơn; không xác nhận đã giao nếu chỉ mới tạo vận đơn | CONDITIONAL | B |
| G3-08-F004 | **Xử lý yêu cầu hủy đơn** | Người mua; nhân viên CSKH | Gửi yêu cầu hủy theo trạng thái đơn và điều kiện seller; xác nhận hủy mới trả tồn/hoàn tiền theo chính sách. | Cancel request, confirm/cannot cancel states | Cancellation eligibility, state/audit, trigger stock/payment reversal | Không cho hủy đơn đã giao trái điều khoản; không hoàn tiền trước quyết định | CONDITIONAL | B |
| G3-08-F005 | **Đổi trả và hoàn tiền** | Người mua; CSKH; seller | Ghi yêu cầu trả hàng/hoàn tiền, lý do/chứng cứ, trạng thái phê duyệt theo hợp đồng và gateway; không mặc định VTV8 chịu mọi nghĩa vụ. | Return/refund case UI, attachments | RMA/claim state machine, payment refund adapter nếu có, audit | Hoàn tiền có chứng từ/giao dịch hợp lệ, không trùng yêu cầu refund | CONDITIONAL | B |
| G3-08-F006 | **Tiếp nhận khiếu nại và tranh chấp** | Người mua; CSKH | Theo dõi ticket khiếu nại đơn/đối tác, lịch sử liên hệ, quyết định và thời hạn xử lý theo chính sách. | Support case page, timeline | Ticket workflow linked to order/seller, access controls | Có người phụ trách, diễn biến và kết quả; không mất bằng chứng | CONDITIONAL | B |
| G3-08-F007 | **Theo dõi thời hạn xử lý và chất lượng người bán** | Quản lý vận hành | Đo đơn chậm xử lý, giao trễ, tỷ lệ hủy/hoàn theo seller để quyết định tạm khóa hoặc cải tiến; không xây BI enterprise. | Ops dashboard và cảnh báo cơ bản | Order SLA aggregates, link tới partner G3-03 | Báo cáo đối chiếu được với order, không tính gộp đơn thuộc nhiều seller sai | OPTION | B |

**Nhãn nguồn:** `T` = hướng/ví dụ hoặc nhóm mô hình kinh doanh có trong đề xuất VTV8, không bảo đảm từng thao tác được tài liệu mô tả nguyên văn; `B` = phân rã nghiệp vụ được đề xuất. `CORE` đề xuất triển khai ngay trong bước Content + Lead, `CONDITIONAL` phụ thuộc điều kiện đối tác/pháp lý/đầu tư, `OPTION` là mở rộng chưa bắt buộc.

[Trở lại GĐ3](README.md).
