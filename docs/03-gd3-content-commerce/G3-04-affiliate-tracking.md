# G3-04 – Affiliate tracking và ghi nhận chuyển đổi

> **GĐ3 – đã chuẩn hóa nội bộ 09/10/2026; chưa được VTV8 phê duyệt.** Phần B/C và đối tác chỉ triển khai khi gate được xác nhận; chưa tính giờ FE/BE.

## Mục tiêu
Ghi nhận VTV8Online đã giới thiệu traffic/đơn hàng đến đối tác và giữ chứng cứ attribution khi có hoa hồng.

## Giai đoạn nội bộ và trách nhiệm
- **Bước:** B – Affiliate / Booking.
- **Chủ sở hữu nghiệp vụ:** Affiliate Attribution.
- **Kế thừa:** G3-01 commercial CTA/QR, G3-02 lead source, G3-03 partner. G3-09 sở hữu đối soát tiền/hoa hồng được xác nhận, không làm hệ payout lần hai.
- Những mục `CONDITIONAL` chỉ triển khai khi đạt gate đối tác/pháp lý/kinh doanh tại [G3-RELEASE-GATES.md](G3-RELEASE-GATES.md). `OPTION` chỉ thực hiện khi chọn. `CORE` là cơ sở đề xuất cho bước A, không phải yêu cầu đã ký.

## Tính năng độc lập (6)

| Mã | Tính năng | Actor | Nghiệp vụ sau QA | FE mới | BE mới | Nghiệm thu sơ bộ | Phạm vi | Nguồn | Ranh giới/điều kiện QA |
|---|---|---|---|---|---|---|---|---|---|
| G3-04-F001 | **Chương trình affiliate và đường dẫn giới thiệu** | Kinh doanh; quản trị | Chương trình referral/link theo thỏa thuận đối tác, gắn campaign/đối tác/nội dung nguồn; không khẳng định có tracking conversion nếu đối tác không cung cấp dữ liệu. | Danh sách chương trình và link preview | Affiliate campaign/referral link schema, trạng thái hiệu lực | Mỗi link xác định được đối tác và nguồn nội dung khi người xem nhấp | CONDITIONAL | T | Link giới thiệu cần mã đối tác, nguồn nội dung và điều kiện hợp tác rõ |
| G3-04-F002 | **Ghi nhận nhấp và phiên giới thiệu** | Người xem; hệ thống | Theo dõi chuyển hướng/click theo quy tắc consent và phòng chống bot; click không phải đơn/booking/sale đã xác nhận. | CTA link-out hiện có, thông báo chuyển trang nếu cần | Click attribution event, referral id, anti-bot/dedupe | Click có source, không phát sinh sale hoặc commission chỉ nhờ điều hướng. | CONDITIONAL | B | Lượt chuyển hướng không phải giao dịch thành công; kiểm tra trùng và mục đích thu thập dữ liệu |
| G3-04-F003 | **Quy tắc quy kết và thời hạn attribution** | Kinh doanh | Attribution window và luật chọn nguồn dựa hợp đồng; không mặc định cookie hay định danh xuyên website không được phép. | Form rule cơ bản | Attribution policy/effective dates, audit | Một giao dịch có quy tắc chọn nguồn attribution được giải thích | CONDITIONAL | B | Thời hạn attribution theo hợp đồng, không tự giả định liên kết phiên xuyên website |
| G3-04-F004 | **Nhận conversion/callback từ đối tác** | Hệ thống; đối tác | Nhận sự kiện conversion thô có xác thực từ đối tác, xử lý idempotency; giao dịch/hoa hồng được đối soát tài chính tại G3-09. | Màn xem trạng thái conversion | Raw conversion callback/batch adapter, signature, idempotency và references; không tính tiền/ledger tại đây | Conversion lặp không làm phát sinh hai giao dịch hợp lệ | CONDITIONAL | B | G3-04 nhận tín hiệu chuyển đổi, G3-09 chịu đối soát tài chính |
| G3-04-F005 | **Theo dõi trạng thái chuyển đổi affiliate** | Kinh doanh | Quản lý trạng thái pending/accepted/rejected/cancelled của conversion và liên kết chứng cứ; không coi pending là hoa hồng phải trả. | Conversion log và filter theo đối tác | Conversion state machine, status reconciliation với vendor | Có thể phân biệt click, conversion và hoa hồng được duyệt | CONDITIONAL | B | Phải phân biệt các trạng thái và chứng cứ bên đối tác |
| G3-04-F006 | **Báo cáo hiệu quả affiliate theo nguồn nội dung** | Quản lý kinh doanh | Báo cáo click và conversion theo nguồn nội dung, chiến dịch và đối tác; số tiền hoa hồng/doanh thu đã đối soát thuộc G3-09. | Dashboard đơn giản, export | Affiliate metrics aggregate, links đến conversion và nguồn | Báo cáo truy vết được nguồn, không cộng tiền hoa hồng chưa duyệt | CONDITIONAL | B | Báo cáo click/conversion ở đây, doanh thu/hoa hồng đã chốt thuộc G3-09 |

**Nhãn nguồn:** `T` là chủ đề/ví dụ trong nguồn VTV8, thao tác chi tiết có thể do phân tích suy ra; `B` là nghiệp vụ đề xuất. CORE là phạm vi A, CONDITIONAL theo gate, OPTION chỉ khi lựa chọn. [Danh mục 64](G3-DANH-MUC-TINH-NANG.md) · [Mapping 70→64](G3-MAPPING-70-64.md) · [Release gates](G3-RELEASE-GATES.md).

[Trở về GĐ3](README.md).
