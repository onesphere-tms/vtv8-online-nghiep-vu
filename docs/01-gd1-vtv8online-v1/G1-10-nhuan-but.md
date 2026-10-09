# G1-10 – Quản lý và tính nhuận bút

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Cấu trúc module đã được người dùng chọn; chi tiết tính năng là **DRAFT để rà soát**, chưa được VTV8 xác nhận, chưa ước tính giờ FE/BE.

## Mục tiêu
Hỗ trợ quản lý sản phẩm nội dung, người tham gia và bảng kê nhuận bút cho từng kỳ; tránh nhầm với hệ thống tính lương HRM đầy đủ.

## Ranh giới
Tài liệu VTV8 nêu tính lương (nhuận bút), nhưng chưa có quy chế, công thức, đối tượng và kỳ tính. Mọi công thức/hệ số dưới đây chỉ là cấu trúc đề xuất có điều kiện xác nhận. Không chuyển tiền và không xử lý bảo hiểm/thuế/lương cố định mặc định.

## Danh sách tính năng (8)

| ID | Tính năng | Actor | Luồng xử lý/đầu ra | FE cần làm | BE cần làm | Nghiệm thu sơ bộ | Nguồn | Phạm vi |
|---|---|---|---|---|---|---|---|---|
| G1-10-F001 | **Quản lý người tham gia và vai trò trên sản phẩm** | Biên tập; quản lý nhuận bút | Gắn nhiều người vào một bài/chương trình/video với vai trò viết, quay, dựng, biên tập... theo danh mục VTV8 duyệt; liên kết hồ sơ G1-04. | Contributor picker và danh sách vai trò | Content-contribution relation, unique roles, audit | Một sản phẩm hỗ trợ nhiều người, không nhân đôi báo cáo sản lượng | B | CORE |
| G1-10-F002 | **Quản lý bảng mức và quy tắc nhuận bút** | Quản trị nhuận bút | Khai báo loại nội dung, đơn giá/hệ số và điều kiện được hưởng theo quy chế VTV8 cung cấp; quản lý ngày hiệu lực của quy tắc. | Bảng chính sách/form, validation | Versioned rate policies và effective date | Thay đổi bảng giá không làm đổi kết quả kỳ đã chốt | B | CORE |
| G1-10-F003 | **Xác định sản phẩm đủ điều kiện tính** | Quản lý nhuận bút | Lọc sản phẩm theo kỳ, ngày xuất bản, trạng thái duyệt và vai trò tham gia; loại trừ sản phẩm bị hủy/gỡ theo quy chế. | Danh sách eligible/ineligible và lý do | Eligibility engine dựa trên policy, content, user role | Giải thích được vì sao sản phẩm được/không được tính | B | CORE |
| G1-10-F004 | **Tạo kỳ và chạy tính nhuận bút** | Quản lý nhuận bút | Chọn kỳ tính, xem trước tổng, chạy tính từng sản phẩm/người và lưu công thức áp dụng tại thời điểm tính. | Period setup, calculate preview, kết quả | Idempotent calculation, snapshot rule/data, rounding | Tính lại không tạo hai dòng trùng, kết quả truy vết được | T | CORE |
| G1-10-F005 | **Bảng kê chi tiết theo người và sản phẩm** | Quản lý; người được phân quyền | Xem tổng tiền, chi tiết từng bài/video, vai trò, quy tắc và biến số dẫn tới kết quả. | Bảng kê, drill-down, filter | Aggregation period/person/product, authorizations | Tổng bảng kê bằng tổng từng khoản chi tiết | B | CORE |
| G1-10-F006 | **Điều chỉnh và xử lý ngoại lệ** | Quản lý nhuận bút | Cho phép ghi nhận điều chỉnh có lý do theo chính sách, lưu bản trước/sau; không tự sửa số tiền tổng mà không có dấu vết. | Adjustment form và reason | Adjustment ledger/audit, permission guards | Mọi điều chỉnh có người, thời điểm, lý do và giá trị | B | CORE |
| G1-10-F007 | **Rà soát, phê duyệt và khóa kỳ** | Người kiểm tra/phê duyệt | Kỳ dự thảo, đối soát, phê duyệt và khóa nếu VTV8 có quy trình; khi mở lại cần quyền và log. | Approval UI, status, lock warning | Period state transitions, access controls, immutable snapshot | Kỳ đã khóa không chỉnh trực tiếp mà không có quy trình | C | OPTION |
| G1-10-F008 | **Xuất bảng kê phục vụ chi trả** | Quản lý nhuận bút; kế toán | Xuất bảng tổng hợp theo cá nhân/kỳ và chi tiết để chuyển bộ phận thanh toán; **không** chi tiền trực tiếp. | Export table/button | Export CSV/XLSX, record export audit | File xuất khớp kỳ, tổng tiền và các khoản điều chỉnh | T | CORE |

**Nguồn:** `T` = nghiệp vụ/nhóm chức năng được nêu trực tiếp, quy trình chi tiết có thể là suy luận; `B` = bổ sung để hoàn thiện luồng; `C` = phụ thuộc quyết định. **Phạm vi:** `CORE` = đề xuất tính vào V1 cơ sở; `OPTION` = chưa đưa vào giờ cơ sở khi chưa duyệt. Không coi mô tả suy luận là quy chế VTV8.

## Thông tin bắt buộc phải xác nhận
- Đầu vào thực tế, quy tắc/chính sách có hiệu lực, khối lượng và danh sách ngoại lệ.
- Các quyền và trách nhiệm dữ liệu do VTV8 xác nhận bằng văn bản hoặc tại buổi nghiệm thu GĐ0.
- Nếu thay đổi công thức/quy trình hoặc khối lượng lớn hơn giả định, phải phân rã và ước tính lại.

[Xem danh mục GĐ1](README.md).