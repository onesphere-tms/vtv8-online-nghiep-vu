# G3-05 – Kết nối và đặt dịch vụ du lịch

> **GĐ3 Content Commerce – bản phân tích nghiệp vụ đề xuất, 09/10/2026.** Chưa có phê duyệt từ VTV8, chưa ước tính giờ FE/BE. Phạm vi theo ba bước trong tài liệu nguồn: Content + Lead → Affiliate/Booking → Sàn TMĐT khi đủ quy mô.

## Mục tiêu
Cho phép tìm hiểu và chuyển sang đặt tour, trải nghiệm, khách sạn, homestay, vé hoặc dịch vụ thông qua đối tác; tùy năng lực API mới mở đặt chỗ trực tiếp.

## Giai đoạn nội bộ và trách nhiệm
- **Bước:** B – Affiliate / Booking.
- **Chủ sở hữu nghiệp vụ:** Travel Booking Integration.
- **Kế thừa:** G3-03 offering catalog và G3-04 affiliate attribution; G2-01 user; G2-09 payment subscription không phải booking payment mặc định..
- Những mục `CONDITIONAL` chỉ triển khai khi đạt gate đối tác/pháp lý/kinh doanh tại [G3-RELEASE-GATES.md](G3-RELEASE-GATES.md). `OPTION` chỉ thực hiện khi chọn. `CORE` là cơ sở đề xuất cho bước A, không phải yêu cầu đã ký.

## Tính năng (8)

| Mã | Tính năng | Actor | Mô tả nghiệp vụ | FE phát triển mới | BE phát triển mới | Nghiệm thu sơ bộ | Phân loại | Nguồn |
|---|---|---|---|---|---|---|---|---|
| G3-05-F001 | **Danh sách dịch vụ du lịch có thể đặt** | Người xem | Hiển thị những tour/lưu trú/trải nghiệm/vé/nhà hàng được đối tác mở bán, có phạm vi địa phương và loại dịch vụ. | Trang danh sách, filter và card dùng G3-03 | Query published bookable offerings, partner capability filter | Không liệt kê offering tạm khóa hoặc không đủ điều kiện đặt | CONDITIONAL | T |
| G3-05-F002 | **Trang chi tiết và điều kiện dịch vụ** | Người xem | Thông tin mô tả, ngày áp dụng, giờ/địa điểm, điều kiện và liên hệ theo dữ liệu đối tác; không tự bảo đảm giá/slot theo thời gian thực nếu không API. | Service booking detail, điều khoản, CTA | Booking offer detail API và vendor/offer references | Điều kiện dịch vụ/đối tác hiển thị rõ, dữ liệu có thời điểm cập nhật | CONDITIONAL | B |
| G3-05-F003 | **Chuyển hướng đặt dịch vụ tại hệ thống đối tác** | Người xem | Đường đặt dịch vụ outbound kèm mã giới thiệu nếu có; đối tác chịu checkout và xác nhận booking theo thỏa thuận. | Book-now redirect/confirmation cảnh báo nguồn đối tác | Safe redirect, affiliate reference, outbound event | Đến đúng trang booking và không hiển thị 'đặt thành công' khi chỉ vừa chuyển hướng | CONDITIONAL | T |
| G3-05-F004 | **Kiểm tra giá và tình trạng chỗ qua API đối tác** | Người xem | Lấy ngày/giờ/giá/slot theo API nếu vendor hỗ trợ; lưu mốc cập nhật và trạng thái không khả dụng. | Chọn ngày/người, trạng thái giá/chỗ và lỗi | Availability/quote adapter, TTL, rate limiting và mapping | Không xác nhận có chỗ/giá thực tế khi API không có dữ liệu | CONDITIONAL | B |
| G3-05-F005 | **Tạo yêu cầu đặt chỗ trực tiếp qua API** | Người xem | Gửi thông tin khách và dịch vụ theo yêu cầu tối thiểu, nhận ID yêu cầu từ đối tác; chỉ khi có API và trách nhiệm giao dịch xác nhận. | Booking form, review, trạng thái chờ xác nhận | Booking request API adapter, idempotency/PII protection | Có external booking reference hoặc trạng thái pending; không báo confirmed trước vendor | CONDITIONAL | B |
| G3-05-F006 | **Đồng bộ và hiển thị trạng thái đặt chỗ** | Người xem; hỗ trợ | Hiển thị booking pending/confirmed/rejected/completed/cancelled theo nguồn đối tác, xử lý webhooks trùng/trễ. | Booking history/detail và thông báo kết quả | Booking status sync, event mapping, retries | Trạng thái UI trùng trạng thái vendor gần nhất hoặc nêu thời điểm cập nhật | CONDITIONAL | B |
| G3-05-F007 | **Hủy/đổi lịch theo chính sách bên cung cấp** | Người xem; CSKH | Ghi nhận yêu cầu hủy/đổi và hướng dẫn sang đối tác; gọi API hủy nếu vendor hỗ trợ và VTV8 có trách nhiệm. | Cancel/reschedule request UX | Partner cancel adapter hoặc manual ticket, policies | Không tự xác nhận hoàn/hủy nếu chưa có phản hồi nguồn thật | CONDITIONAL | B |
| G3-05-F008 | **Theo dõi lỗi và đối soát booking với đối tác** | Kỹ thuật; vận hành | Phát hiện trạng thái booking mồ côi, lỗi kết nối hoặc sai lệch, có hàng đợi xử lý theo quyền. | Bảng trạng thái lỗi và retry theo đối tác | Failed booking queue, reconciliation/audit | Booking thất bại có dấu vết và không tạo hai đơn khi retry | CONDITIONAL | B |

**Nhãn nguồn:** `T` = nhóm yêu cầu/ví dụ được đề xuất VTV8 nêu, nhưng thao tác cụ thể có thể suy luận; `B` = nghiệp vụ chi tiết bổ sung để có thể triển khai. `CORE/CONDITIONAL/OPTION` đều là quyết định phân kỳ **đề xuất**, chưa phải phạm vi khách hàng chốt.

[Trở về GĐ3](README.md).
