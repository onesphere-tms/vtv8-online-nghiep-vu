# G3-04 – Affiliate tracking và ghi nhận chuyển đổi

> **GĐ3 Content Commerce – bản phân tích nghiệp vụ đề xuất, 09/10/2026.** Chưa có phê duyệt từ VTV8, chưa ước tính giờ FE/BE. Phạm vi theo ba bước trong tài liệu nguồn: Content + Lead → Affiliate/Booking → Sàn TMĐT khi đủ quy mô.

## Mục tiêu
Ghi nhận VTV8Online đã giới thiệu traffic/đơn hàng đến đối tác và giữ chứng cứ attribution khi có hoa hồng.

## Giai đoạn nội bộ và trách nhiệm
- **Bước:** B – Affiliate / Booking.
- **Chủ sở hữu nghiệp vụ:** Affiliate Attribution.
- **Kế thừa:** G3-01 commercial CTA/QR, G3-02 lead source, G3-03 partner. G3-09 sở hữu đối soát tiền/hoa hồng được xác nhận, không làm hệ payout lần hai..
- Những mục `CONDITIONAL` chỉ triển khai khi đạt gate đối tác/pháp lý/kinh doanh tại [G3-RELEASE-GATES.md](G3-RELEASE-GATES.md). `OPTION` chỉ thực hiện khi chọn. `CORE` là cơ sở đề xuất cho bước A, không phải yêu cầu đã ký.

## Tính năng (6)

| Mã | Tính năng | Actor | Mô tả nghiệp vụ | FE phát triển mới | BE phát triển mới | Nghiệm thu sơ bộ | Phân loại | Nguồn |
|---|---|---|---|---|---|---|---|---|
| G3-04-F001 | **Chương trình affiliate và đường dẫn giới thiệu** | Kinh doanh; quản trị | Khai báo chương trình giới thiệu theo đối tác/offering/kênh, link hoặc mã giới thiệu có hiệu lực. | Danh sách chương trình và link preview | Affiliate campaign/referral link schema, trạng thái hiệu lực | Mỗi link xác định được đối tác và nguồn nội dung khi người xem nhấp | CONDITIONAL | T |
| G3-04-F002 | **Ghi nhận nhấp và phiên giới thiệu** | Người xem; hệ thống | Ghi click-out hoặc chuyển hướng khi người xem mở CTA affiliate, có giới hạn lưu dữ liệu và consent. | CTA link-out hiện có, thông báo chuyển trang nếu cần | Click attribution event, referral id, anti-bot/dedupe | Một click có source/offer/campaign và không làm lộ thông tin cá nhân không cần thiết | CONDITIONAL | B |
| G3-04-F003 | **Quy tắc quy kết và thời hạn attribution** | Kinh doanh | Cấu hình thời hạn ghi nhận giới thiệu, xử lý trùng/cùng khách qua nhiều nguồn theo hợp đồng đối tác; không hứa cookie xuyên miền khi không được phép. | Form rule cơ bản | Attribution policy/effective dates, audit | Một giao dịch có quy tắc chọn nguồn attribution được giải thích | CONDITIONAL | B |
| G3-04-F004 | **Nhận conversion/callback từ đối tác** | Hệ thống; đối tác | Nhận conversion do đối tác gửi hoặc file đối soát định kỳ, xác minh nguồn và chống xử lý trùng. | Màn xem trạng thái conversion | Webhook/batch import, signature/idempotency, mapping affiliate id | Conversion lặp không làm phát sinh hai giao dịch hợp lệ | CONDITIONAL | B |
| G3-04-F005 | **Theo dõi trạng thái chuyển đổi affiliate** | Kinh doanh | Quản lý trạng thái pending/accepted/rejected/cancelled của conversion và liên kết chứng cứ; không coi pending là hoa hồng phải trả. | Conversion log và filter theo đối tác | Conversion state machine, status reconciliation với vendor | Có thể phân biệt click, conversion và hoa hồng được duyệt | CONDITIONAL | B |
| G3-04-F006 | **Báo cáo hiệu quả affiliate theo nguồn nội dung** | Quản lý kinh doanh | Số click/conversion theo bài/video/đối tác/kỳ, chuyển bảng dữ liệu được chấp thuận sang G3-09 để đối soát hoa hồng. | Dashboard đơn giản, export | Affiliate metrics aggregate, links đến conversion và nguồn | Báo cáo truy vết được nguồn, không cộng tiền hoa hồng chưa duyệt | CONDITIONAL | B |

**Nhãn nguồn:** `T` = nhóm yêu cầu/ví dụ được đề xuất VTV8 nêu, nhưng thao tác cụ thể có thể suy luận; `B` = nghiệp vụ chi tiết bổ sung để có thể triển khai. `CORE/CONDITIONAL/OPTION` đều là quyết định phân kỳ **đề xuất**, chưa phải phạm vi khách hàng chốt.

[Trở về GĐ3](README.md).
