# G3-02 – Tiếp nhận và quản lý khách hàng tiềm năng

> **GĐ3 – phạm vi nội bộ sau QA 09/10/2026.** 64 tính năng trên 10 module đã được chọn để chuẩn hóa; chưa được VTV8 phê duyệt, chưa ước tính giờ FE/BE.

## Mục tiêu
Người xem để lại nhu cầu tư vấn; VTV8 có thể ghi nhận, chuyển tiếp và theo dõi chất lượng lead đến khi đóng.

## Giai đoạn nội bộ và trách nhiệm
- **Bước:** A – Content + Lead.
- **Chủ sở hữu nghiệp vụ:** Lead Management.
- **Kế thừa:** G2-01 identity/consent; G1-02 RBAC và audit; G3-03 đối tác; không tự xây tổng đài/CRM doanh nghiệp đầy đủ.
- Những mục `CONDITIONAL` chỉ triển khai khi đạt gate đối tác/pháp lý/kinh doanh tại [G3-RELEASE-GATES.md](G3-RELEASE-GATES.md). `OPTION` chỉ thực hiện khi chọn. `CORE` là cơ sở đề xuất cho bước A, không phải yêu cầu đã ký.

## Tính năng độc lập (6)

| Mã | Tính năng | Actor | Nghiệp vụ sau QA | FE mới | BE mới | Nghiệm thu sơ bộ | Phạm vi | Nguồn | Ranh giới/điều kiện QA |
|---|---|---|---|---|---|---|---|---|---|
| G3-02-F001 | **Biểu mẫu đăng ký tư vấn/liên hệ sản phẩm** | Người xem | Tạo lead từ bài/video/offering đến một đối tác đích có nguồn, mục đích, mã lead, trạng thái. Tích hợp chống gửi trùng và spam từ mã cũ G3-02-F003; gửi lead không phải booking. | Biểu mẫu/validation/feedback rate-limit và trạng thái gửi | Lead create API, idempotency/dedupe, rate-limit, content/offer/partner source và audit | Gửi lặp thao tác không tạo trùng vô hạn; lead luôn truy vết nguồn và chỉ tiếp nhận khi đối tác hợp lệ. | CORE | T | Form cần nguồn bài/offering, đối tác đích, mã lead và trạng thái; không coi là booking. |
| G3-02-F002 | **Thông báo và ghi nhận đồng ý chia sẻ thông tin** | Người xem | Thông tin và sự đồng ý chia sẻ dữ liệu cho đúng bên nhận và mục đích theo chính sách VTV8, kế thừa consent nền tảng G2-01 nhưng lưu snapshot riêng cho lead. | Consent text, checkbox và mô tả đối tác nhận | Consent snapshot/audit cho lead, policy hạn lưu theo quyết định VTV8 | Không bàn giao lead ngoài đối tác/mục đích đã được phép; lưu được thời điểm và phiên bản văn bản đồng ý. | CORE | B | Đồng ý chia sẻ đúng đối tác/mục đích, giữ dấu vết và chính sách lưu giữ dữ liệu. |
| G3-02-F004 | **Hộp tiếp nhận lead của VTV8** | Nhân viên kinh doanh | Hộp tiếp nhận có quyền truy cập PII, các trạng thái mới, đã phân công, đã gửi, đã nhận, đóng và nhật ký người thao tác. | Lead list/detail với bộ lọc | Lead query API, role/ownership, audit khi truy cập thông tin riêng | Chỉ role được phép xem lead và biết được nguồn giới thiệu | CORE | B | Lead inbox cần role riêng, các trạng thái và log truy cập dữ liệu. |
| G3-02-F005 | **Phân công và chuyển giao lead cho đối tác** | Điều phối kinh doanh | Chuyển giao thủ công hoặc theo kênh được duyệt, có xác nhận nhận/không nhận, người chịu trách nhiệm và chặn đối tác không còn hiệu lực. | Assign/transfer action, trường ghi chú | Routing assignment/transfer log, export theo đối tác được phép | Có dấu vết bàn giao và lý do chuyển thất bại, không gửi thông tin sang đơn vị sai hoặc đã bị khóa. | CORE | T | Bàn giao cần bằng chứng nhận hoặc thất bại, có thao tác thủ công và chặn đối tác khóa. |
| G3-02-F006 | **Cập nhật tiến độ tư vấn và kết quả lead** | Nhân viên kinh doanh | Ghi nhận liên hệ, qualified/unqualified và kết quả xử lý lead; không đồng nhất với booking confirmed/conversion được đối tác duyệt hoặc doanh thu. | State selector, nhật ký chăm sóc mức gọn | Lead status machine, timeline/audit, validation | Không biến lead thành booking/order nếu chưa có bằng chứng giao dịch | CORE | B | Kết quả tư vấn/qualified lead không đồng nghĩa sale hoặc commission được xác nhận. |
| G3-02-F007 | **Thống kê chuyển đổi từ nội dung sang lead** | Quản lý kinh doanh | Theo dõi số lead theo video/bài/địa phương/offering/đối tác/kỳ và trạng thái, có nguồn truy vết. | Dashboard lead counts/filter/export gọn | Aggregate lead metrics, đối chiếu source content | Tổng theo nguồn và kỳ đối chiếu được với danh sách lead, không đếm trùng | CORE | B | Thống kê số lead theo nguồn, chưa bao gồm doanh thu/commission G3-09. |

**Nhãn nguồn:** `T` = chủ đề/ví dụ có trong đề xuất VTV8, không phải xác nhận từng chi tiết; `B` = nghiệp vụ đề xuất. `CORE` = nền tảng Content + Lead; `CONDITIONAL` = theo gate đối tác/pháp lý/đầu tư; `OPTION` = tùy chọn. [Danh mục 64 mã](G3-DANH-MUC-TINH-NANG.md) · [Mapping 70→64](G3-MAPPING-70-64.md) · [Nghiệm thu](G3-TIEU-CHI-NGHIEM-THU.md).

[Trở về GĐ3](README.md).

## Mã cũ đã gộp, không còn feature độc lập

- **G3-02-F003 – Chống gửi trùng và spam lead:** chuyển vào **G3-02-F001 và G3-H01-W001: anti-spam, dedupe, rate limit và bảo vệ dữ liệu**. Nghiệp vụ vẫn được duy trì.
