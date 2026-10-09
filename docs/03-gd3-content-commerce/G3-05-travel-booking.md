# G3-05 – Kết nối và đặt dịch vụ du lịch

> **GĐ3 – đã chuẩn hóa nội bộ 09/10/2026; chưa được VTV8 phê duyệt.** Phần B/C và đối tác chỉ triển khai khi gate được xác nhận; chưa tính giờ FE/BE.

## Mục tiêu
Cho phép tìm hiểu và chuyển sang đặt tour, trải nghiệm, khách sạn, homestay, vé hoặc dịch vụ thông qua đối tác; tùy năng lực API mới mở đặt chỗ trực tiếp.

## Giai đoạn nội bộ và trách nhiệm
- **Bước:** B – Affiliate / Booking.
- **Chủ sở hữu nghiệp vụ:** Travel Booking Integration.
- **Kế thừa:** G3-03 offering catalog và G3-04 affiliate attribution; G2-01 user; G2-09 payment subscription không phải booking payment mặc định.
- Những mục `CONDITIONAL` chỉ triển khai khi đạt gate đối tác/pháp lý/kinh doanh tại [G3-RELEASE-GATES.md](G3-RELEASE-GATES.md). `OPTION` chỉ thực hiện khi chọn. `CORE` là cơ sở đề xuất cho bước A, không phải yêu cầu đã ký.

## Tính năng độc lập (7)

| Mã | Tính năng | Actor | Nghiệp vụ sau QA | FE mới | BE mới | Nghiệm thu sơ bộ | Phạm vi | Nguồn | Ranh giới/điều kiện QA |
|---|---|---|---|---|---|---|---|---|---|
| G3-05-F001 | **Danh sách dịch vụ du lịch có thể đặt** | Người xem | OPTION trong bước B: trang tổng hợp dịch vụ bookable riêng theo loại/địa phương khi đã có đủ dữ liệu đối tác; B1 có thể dùng offering detail G3-01-F003 để redirect. | Trang danh sách, filter và card dùng G3-03 | Query published bookable offerings, partner capability filter | Không bật OPTION vẫn có thể đi từ nội dung đến dịch vụ của đối tác; trang riêng không hiển thị dịch vụ bị khóa. | OPTION | T | Trang listing riêng có thể hoãn vì bước B1 đã có trang offering ở G3-01/03. |
| G3-05-F003 | **Chuyển hướng đặt dịch vụ tại hệ thống đối tác** | Người xem | Chuyển hướng an toàn đến trang đặt dịch vụ bên đối tác, mang referral id khi thỏa thuận cho phép; chỉ là giới thiệu, không xác nhận booking trên VTV8. | CTA redirect phân biệt 'đặt trên trang đối tác', hiển thị điều kiện cần thiết | Safe redirect URL và outbound attribution qua G3-04 khi được kích hoạt | Người xem thấy bên chịu trách nhiệm checkout; việc chuyển hướng không tạo trạng thái CONFIRMED. | CONDITIONAL | T | Chuyển qua website đối tác không đồng nghĩa đặt chỗ thành công. |
| G3-05-F004 | **Kiểm tra giá và tình trạng chỗ qua API đối tác** | Người xem | B2 có API: lấy báo giá/chỗ theo ngày/giờ/số khách, có TTL/timezone và kiểm tra thay đổi giá/slot; tích hợp bổ sung vào trang G3-01-F003 chứ không có trang detail thứ hai. | Date/time/guest fields và báo giá/availability trong offering detail dùng chung | Partner quote/availability adapter, TTL, timeout, mapping và audit | Lỗi/stale API không bị hiển thị như giá hoặc chỗ đã được xác nhận. | CONDITIONAL | B | Giá/chỗ cần API thật, ngày cập nhật và xử lý giá thay đổi. |
| G3-05-F005 | **Tạo yêu cầu đặt chỗ trực tiếp qua API** | Người xem | B2 khi được phép: gửi booking request idempotent theo provider, ghi external reference, trạng thái chờ và trách nhiệm bên nhận tiền/chăm sóc khách. | Booking form, review, trạng thái chờ xác nhận | Booking request API adapter, idempotency/PII protection | Đặt lại yêu cầu không tạo nhiều booking; chỉ vendor response hợp lệ mới cho CONFIRMED. | CONDITIONAL | B | Booking trực tiếp cần mã đối tác và trạng thái chờ trước xác nhận. |
| G3-05-F006 | **Đồng bộ và hiển thị trạng thái đặt chỗ** | Người xem; hỗ trợ | Đồng bộ booking status từ webhook/polling theo quyền đối tác, hiển thị nguồn và thời điểm cập nhật; không sử dụng CommerceOrder G3-07. | Booking history/detail và thông báo kết quả | Booking status sync, event mapping, retries | Trạng thái UI trùng trạng thái vendor gần nhất hoặc nêu thời điểm cập nhật | CONDITIONAL | B | Đồng bộ trạng thái từ đối tác, không dùng trạng thái order của G3-07. |
| G3-05-F007 | **Hủy/đổi lịch theo chính sách bên cung cấp** | Người xem; CSKH | Gửi yêu cầu hủy/đổi lịch và đồng bộ quyết định vendor theo chính sách; redirect-only thì hướng dẫn khách liên hệ đối tác, không tự hứa hoàn tiền. | Cancel/reschedule request UX | Partner cancel adapter hoặc manual ticket, policies | Không tự xác nhận hoàn/hủy nếu chưa có phản hồi nguồn thật | CONDITIONAL | B | Hủy/đổi chỉ xác nhận theo kết quả từ bên cung cấp. |
| G3-05-F008 | **Theo dõi lỗi và đối soát booking với đối tác** | Kỹ thuật; vận hành | Đối soát trạng thái kỹ thuật booking bị mồ côi, webhook/retry sai lệch; G3-09 quản lý đối soát giá trị giao dịch/hoa hồng. | Bảng trạng thái lỗi và retry theo đối tác | Failed booking queue, reconciliation/audit | Booking thất bại có dấu vết và không tạo hai đơn khi retry | CONDITIONAL | B | Đối soát trạng thái booking khác đối soát hoa hồng G3-09. |

**Nhãn nguồn:** `T` là chủ đề/ví dụ trong nguồn VTV8, thao tác chi tiết có thể do phân tích suy ra; `B` là nghiệp vụ đề xuất. CORE là phạm vi A, CONDITIONAL theo gate, OPTION chỉ khi lựa chọn. [Danh mục 64](G3-DANH-MUC-TINH-NANG.md) · [Mapping 70→64](G3-MAPPING-70-64.md) · [Release gates](G3-RELEASE-GATES.md).

[Trở về GĐ3](README.md).

## Mã cũ đã gộp

- **G3-05-F002 – Trang chi tiết và điều kiện dịch vụ:** vào G3-01-F003 + G3-03-F002 (detail), G3-05-F004 (giá/slot thời gian thực) (vẫn giữ nghiệp vụ, không tính feature riêng).
