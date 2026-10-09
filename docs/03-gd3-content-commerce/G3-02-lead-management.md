# G3-02 – Tiếp nhận và quản lý khách hàng tiềm năng

> **GĐ3 Content Commerce – bản phân tích nghiệp vụ đề xuất, 09/10/2026.** Chưa có phê duyệt từ VTV8, chưa ước tính giờ FE/BE. Phạm vi theo ba bước trong tài liệu nguồn: Content + Lead → Affiliate/Booking → Sàn TMĐT khi đủ quy mô.

## Mục tiêu
Người xem để lại nhu cầu tư vấn; VTV8 có thể ghi nhận, chuyển tiếp và theo dõi chất lượng lead đến khi đóng.

## Giai đoạn nội bộ và trách nhiệm
- **Bước:** A – Content + Lead.
- **Chủ sở hữu nghiệp vụ:** Lead Management.
- **Kế thừa:** G2-01 identity/consent; G1-02 RBAC và audit; G3-03 đối tác; không tự xây tổng đài/CRM doanh nghiệp đầy đủ..
- Những mục `CONDITIONAL` chỉ triển khai khi đạt gate đối tác/pháp lý/kinh doanh tại [G3-RELEASE-GATES.md](G3-RELEASE-GATES.md). `OPTION` chỉ thực hiện khi chọn. `CORE` là cơ sở đề xuất cho bước A, không phải yêu cầu đã ký.

## Tính năng (7)

| Mã | Tính năng | Actor | Mô tả nghiệp vụ | FE phát triển mới | BE phát triển mới | Nghiệm thu sơ bộ | Phân loại | Nguồn |
|---|---|---|---|---|---|---|---|---|
| G3-02-F001 | **Biểu mẫu đăng ký tư vấn/liên hệ sản phẩm** | Người xem | Gửi nhu cầu từ bài, video, tour hoặc đặc sản; nhận xác nhận đã tiếp nhận. | Form có trường bắt buộc và trạng thái gửi | Lead create API liên kết source content/offering và thời điểm | Gửi được yêu cầu hợp lệ, không thất lạc liên kết nguồn | CORE | T |
| G3-02-F002 | **Thông báo và ghi nhận đồng ý chia sẻ thông tin** | Người xem | Hiển thị mục đích liên hệ và đối tác nhận dữ liệu; ghi thời điểm/nội dung chấp thuận trước khi chuyển lead. | Consent text, checkbox và mô tả đối tác nhận | Consent snapshot/audit cho lead, policy hạn lưu theo quyết định VTV8 | Không chuyển PII cho bên khác khi chưa đáp ứng điều kiện cho phép | CORE | B |
| G3-02-F003 | **Chống gửi trùng và spam lead** | Hệ thống | Validation số liên hệ, giới hạn tần suất, dedupe hợp lý; không cản người cần tư vấn lại trong dịp khác. | Validation/rate-feedback nhẹ | Rate limit, spam heuristics, safe dedupe | Một thao tác lặp không sinh vô hạn lead, vẫn cho phép nhu cầu hợp lệ mới | CORE | B |
| G3-02-F004 | **Hộp tiếp nhận lead của VTV8** | Nhân viên kinh doanh | Xem danh sách, nguồn bài, offering, trạng thái, người phụ trách và chi tiết theo quyền. | Lead list/detail với bộ lọc | Lead query API, role/ownership, audit khi truy cập thông tin riêng | Chỉ role được phép xem lead và biết được nguồn giới thiệu | CORE | B |
| G3-02-F005 | **Phân công và chuyển giao lead cho đối tác** | Điều phối kinh doanh | Chọn đối tác/nhân viên phụ trách, ghi nhận thời điểm và phương thức bàn giao; bước đầu hỗ trợ thao tác thủ công. | Assign/transfer action, trường ghi chú | Routing assignment/transfer log, export theo đối tác được phép | Lead được chuyển tới đúng đối tác, có bằng chứng giao nhận | CORE | T |
| G3-02-F006 | **Cập nhật tiến độ tư vấn và kết quả lead** | Nhân viên kinh doanh | Ghi trạng thái mới, đang liên hệ, có nhu cầu, thành công/không phù hợp, lý do; không coi đó là đơn hàng đã thanh toán. | State selector, nhật ký chăm sóc mức gọn | Lead status machine, timeline/audit, validation | Không biến lead thành booking/order nếu chưa có bằng chứng giao dịch | CORE | B |
| G3-02-F007 | **Thống kê chuyển đổi từ nội dung sang lead** | Quản lý kinh doanh | Theo dõi số lead theo video/bài/địa phương/offering/đối tác/kỳ và trạng thái, có nguồn truy vết. | Dashboard lead counts/filter/export gọn | Aggregate lead metrics, đối chiếu source content | Tổng theo nguồn và kỳ đối chiếu được với danh sách lead, không đếm trùng | CORE | B |

**Nhãn nguồn:** `T` = nhóm yêu cầu/ví dụ được đề xuất VTV8 nêu, nhưng thao tác cụ thể có thể suy luận; `B` = nghiệp vụ chi tiết bổ sung để có thể triển khai. `CORE/CONDITIONAL/OPTION` đều là quyết định phân kỳ **đề xuất**, chưa phải phạm vi khách hàng chốt.

[Trở về GĐ3](README.md).
