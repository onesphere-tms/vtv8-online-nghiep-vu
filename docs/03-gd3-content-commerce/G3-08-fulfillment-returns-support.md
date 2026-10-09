# G3-08 – Xử lý đơn, giao hàng và hậu mãi

> **Đã chuẩn hóa nội bộ 09/10/2026; chưa được VTV8 phê duyệt.** Marketplace là bước C chỉ triển khai theo quyết định đầu tư, pháp lý và đối tác; chưa ước tính giờ FE/BE.

## Mục tiêu
Chỉ mở khi VTV8/đối tác đã phân định rõ ai chịu trách nhiệm xử lý đơn, giao hàng, đổi trả và tranh chấp với người mua.

## Phạm vi và ranh giới
- **Nhóm phân kỳ:** C – Sàn TMĐT khi đủ quy mô.
- **Chủ sở hữu:** Fulfillment & Post-sales Operations.
- **Kế thừa:** G3-07 order; G3-03 seller/partner; G2-07 notification. GĐ3 không mặc định tự vận hành kho vận.
- Đối với marketplace, toàn bộ phần core commerce được đặt `CONDITIONAL` cho đến khi có [điều kiện TMĐT và trách nhiệm giao dịch](G3-RELEASE-GATES.md). Không mặc định VTV8 có nghĩa vụ pháp lý của seller/merchant trước khi mô hình được quyết định.

## Tính năng độc lập (6)

| Mã | Tính năng | Actor | Nghiệp vụ sau QA | FE mới | BE mới | Nghiệm thu sơ bộ | Phạm vi | Nguồn | Ranh giới/điều kiện QA |
|---|---|---|---|---|---|---|---|---|---|
| G3-08-F001 | **Bảng điều hành tiếp nhận và xử lý đơn** | Nhân sự vận hành; seller được hỗ trợ | Fulfillment console cho đơn marketplace, trạng thái chuẩn bị/bàn giao/xử lý, phân công và ghi nhận chuyển cho seller/đơn vị cung cấp (nhận G3-08-F002), xác nhận nhận và log chia sẻ PII tối thiểu. | Back-office order queue, nút chuyển/bàn giao/xác nhận và lịch sử | Fulfillment transitions + seller assignment, transfer/ack audit, policy PII | Không chuyển thông tin đơn sang nhầm seller; bàn giao có bằng chứng nhận/trạng thái xử lý; order state duy nhất G3-07. | CONDITIONAL | B | Điều hành đơn có người phụ trách và trạng thái; bao gồm bàn giao cho đối tác. |
| G3-08-F003 | **Tích hợp vận chuyển và mã theo dõi** | Người bán; người mua | OPTION: chỉ bổ sung carrier API và tracking tự động khi có hợp đồng/năng lực đối tác; nhập mã vận đơn và trạng thái thủ công tối thiểu thuộc G3-08-F001. | UI carrier tracking tự động nếu chọn, hiển thị mã đã có | Carrier adapter/webhook retry nếu hợp đồng cho phép, không tạo fulfillment state machine thứ hai | Không bật OPTION vẫn ghi được trạng thái giao hàng cơ bản từ fulfillment; không hiển thị 'đã giao' nếu chưa có bằng chứng. | OPTION | B | Tích hợp vận chuyển tự động là tùy chọn; theo dõi thủ công ở F001. |
| G3-08-F004 | **Xử lý yêu cầu hủy đơn** | Người mua; nhân viên CSKH | Tiếp nhận và quyết định yêu cầu hủy theo điều kiện order/seller, tách yêu cầu khỏi chấp thuận; trả tồn và xử lý tiền chỉ khi đủ điều kiện. | Cancel request, confirm/cannot cancel states | Cancellation eligibility, state/audit, trigger stock/payment reversal | Không cho hủy đơn đã giao trái điều khoản; không hoàn tiền trước quyết định | CONDITIONAL | B | Xử lý hủy theo trạng thái đơn và chính sách đối tác. |
| G3-08-F005 | **Đổi trả và hoàn tiền** | Người mua; CSKH; seller | Yêu cầu đổi/trả và hoàn tiền theo bên chịu trách nhiệm, ghi đủ lý do/chứng cứ; đặc biệt partial refund/chargeback cần chính sách trước khi chốt phạm vi. | Return/refund case UI, attachments | RMA/claim state machine, payment refund adapter nếu có, audit | Hoàn tiền có chứng từ/giao dịch hợp lệ, không trùng yêu cầu refund | CONDITIONAL | B | Đổi trả và hoàn theo trách nhiệm được VTV8 xác nhận. |
| G3-08-F006 | **Tiếp nhận khiếu nại và tranh chấp** | Người mua; CSKH | Khiếu nại gắn Order ID/seller/nhân viên và dòng thời gian xử lý; không tự tạo hệ CRM helpdesk riêng. | Support case page, timeline | Ticket workflow linked to order/seller, access controls | Có người phụ trách, diễn biến và kết quả; không mất bằng chứng | CONDITIONAL | B | Khiếu nại gắn với đơn, người phụ trách và lịch sử xử lý. |
| G3-08-F007 | **Theo dõi thời hạn xử lý và chất lượng người bán** | Quản lý vận hành | Đo đơn chậm xử lý, giao trễ, tỷ lệ hủy/hoàn theo seller để quyết định tạm khóa hoặc cải tiến; không xây BI enterprise. | Ops dashboard và cảnh báo cơ bản | Order SLA aggregates, link tới partner G3-03 | Báo cáo đối chiếu được với order, không tính gộp đơn thuộc nhiều seller sai | OPTION | B | Báo cáo chất lượng seller là phần nâng cao sau dữ liệu vận hành. |

**Nhãn nguồn:** `T` = hướng/ví dụ có trong đề xuất VTV8; `B` = phân rã suy luận, chưa là yêu cầu xác nhận. CORE/CONDITIONAL/OPTION phân kỳ nội bộ theo [gates](G3-RELEASE-GATES.md). [Danh mục 64](G3-DANH-MUC-TINH-NANG.md) · [Mapping 70→64](G3-MAPPING-70-64.md).

[Trở lại GĐ3](README.md).

## Mã đã gộp

- **G3-08-F002 – Chuyển đơn cho đối tác cung ứng:** chuyển vào G3-08-F001, đối tác đích lấy từ G3-03; thao tác bàn giao + xác nhận trong fulfillment. Không bỏ chức năng, chỉ không đếm là feature độc lập.
