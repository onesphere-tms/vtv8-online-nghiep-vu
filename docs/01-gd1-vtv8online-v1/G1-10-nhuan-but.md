# G1-10 – Quản lý và tính nhuận bút

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Cấu trúc module đã được người dùng chọn; chi tiết tính năng là **DRAFT để rà soát**, chưa được VTV8 xác nhận, chưa ước tính giờ FE/BE.

## Mục tiêu
Hỗ trợ quản lý sản phẩm nội dung, người tham gia và bảng kê nhuận bút cho từng kỳ; tránh nhầm với hệ thống tính lương HRM đầy đủ.

## Ranh giới
Tài liệu VTV8 nêu tính lương (nhuận bút), nhưng chưa có quy chế, công thức, đối tượng và kỳ tính. Mọi công thức/hệ số dưới đây chỉ là cấu trúc đề xuất có điều kiện xác nhận. Không chuyển tiền và không xử lý bảo hiểm/thuế/lương cố định mặc định.

## Danh sách tính năng (8)

| ID | Tính năng | Người sử dụng | Nghiệp vụ và đầu ra | FE cần làm | BE cần làm | Nghiệm thu riêng | Nguồn | Phạm vi | Ranh giới sau QA |
|---|---|---|---|---|---|---|---|---|---|
| G1-10-F001 | **Quản lý người tham gia và vai trò trên sản phẩm** | Biên tập; quản lý nhuận bút | Gắn vai trò đóng góp của nhiều người trên từng bài/chương trình/video dùng hồ sơ contributor có sẵn ở G1-04-F002; không tạo hồ sơ nhân sự thứ hai. | Contributor picker và danh sách vai trò | Quan hệ contributor-to-content/role dùng chung, không trùng contributor records | Một sản phẩm có nhiều người/role hợp lệ nhưng không nhân đôi số bài. | B | CORE | Giữ quan hệ người tham gia/sản phẩm; dữ liệu contributor gốc ở G1-04, G1-10 chỉ quản lý phần vai trò/công lao phục vụ nhuận bút, tránh hai người sở hữu một relation. |
| G1-10-F002 | **Quản lý bảng mức và quy tắc nhuận bút** | Quản trị nhuận bút | Theo quy chế thực tế VTV8 xác nhận, quản lý bảng mức/hệ số nhuận bút và ngày hiệu lực; chưa xây rule engine tổng quát. | Bảng mức và form loại nội dung/hệ số giới hạn | Policy versioning/effective dates theo mẫu quy chế đã duyệt | Chỉnh mức mới không thay đổi kỳ nhuận bút đã xuất. | B | CORE | Giữ yêu cầu quy tắc nhưng không tự xây rule-engine tổng quát trước khi có quy chế; V1 tối thiểu cấu hình bảng mức/hệ số theo mẫu được duyệt. |
| G1-10-F003 | **Xác định sản phẩm đủ điều kiện tính** | Quản lý nhuận bút | Xác định nội dung đủ tính theo kỳ, trạng thái xuất bản, vai trò đóng góp; bài sửa/gỡ, dữ liệu nhập cũ cần quy tắc VTV8 xác nhận. | Danh sách eligible/ineligible và lý do | Eligibility engine dựa trên policy, content, user role | Mỗi sản phẩm được/không được hưởng đều giải thích được theo quy chế. | B | CORE | Giữ điều kiện đủ tính; VTV8 phải xác nhận bài gỡ, bài sửa, nhiều vai trò, sản phẩm nhập từ dữ liệu cũ được xử lý ra sao. |
| G1-10-F004 | **Tạo kỳ và chạy tính nhuận bút** | Quản lý nhuận bút | Tạo kỳ nhuận bút, xem trước/chạy tính theo sản phẩm và người; kết quả có snapshot quy tắc, dữ liệu, làm tròn và dấu thời điểm. Không tự tính lương HRM. | Period setup, calculate preview, kết quả | Calculation engine theo quy chế được phê duyệt, idempotency và snapshots | Chạy lại không tạo trùng; kết quả kỳ đã xuất không tự đổi khi sửa bảng mức. | T | CORE | Giữ chạy tính theo kỳ; chốt làm tròn, thay đổi quy tắc có hiệu lực và chế độ xem trước/calc lại không trùng. |
| G1-10-F005 | **Bảng kê chi tiết theo người và sản phẩm** | Quản lý; người được phân quyền | Xem tổng tiền, chi tiết từng bài/video, vai trò, quy tắc và biến số dẫn tới kết quả. | Bảng kê, drill-down, filter | Aggregation period/person/product, authorizations | Tổng bảng kê bằng tổng từng khoản chi tiết | B | CORE | Giữ phạm vi đã mô tả. |
| G1-10-F006 | **Điều chỉnh và xử lý ngoại lệ** | Quản lý nhuận bút | Ghi nhận điều chỉnh khoản nhuận bút có lý do và người thực hiện; không xây sổ kế toán kép. | Adjustment form và reason | Adjustment record & audit, rights checks | Mọi điều chỉnh truy vết được giá trị trước/sau, người và lý do. | B | CORE | Giữ điều chỉnh có lý do nếu thực sự cần; tối thiểu audit thay đổi, không mặc định xây sổ kế toán đôi. |
| G1-10-F007 | **Rà soát, phê duyệt và khóa kỳ** | Người kiểm tra/phê duyệt | Tùy chọn duyệt nhiều cấp/khóa kỳ theo quy chế VTV8; CORE đã lưu snapshot không tự đổi trong G1-10-F004. | Màn duyệt/khóa kỳ khi duyệt OPTION | Period approval state transitions và audit nếu chọn | Khi tắt OPTION, vẫn xuất bảng kê từ kết quả tính đã lưu. | C | OPTION | Duyệt nhiều cấp là OPTION theo quy chế; cần trạng thái chốt kỳ tối thiểu để bản xuất số liệu không tự đổi sau khi phê duyệt. |
| G1-10-F008 | **Xuất bảng kê phục vụ chi trả** | Quản lý nhuận bút; kế toán | Xuất bảng kê theo mẫu VTV8 cung cấp để phục vụ chi trả; không tự thanh toán tiền hoặc phát triển hệ thống HRM. | Xem trước và tải bảng kê | Export một mẫu dữ liệu chuẩn theo quyền, audit | Bảng kê theo mẫu được duyệt, tổng khớp với chi tiết và điều chỉnh. | B | CORE | Giữ xuất bảng kê, nhãn nguồn 'T' chỉ xác nhận nhuận bút, không chứng minh xuất Excel là yêu cầu trực tiếp. Xác định mẫu VTV8. |

**Quy ước:** T = nhóm nghiệp vụ đã được VTV8 nêu nhưng không mặc định từng thao tác; B = suy luận phát triển; C = điều kiện/quy chế/vendor chưa chốt. CORE = phạm vi cơ sở nội bộ; OPTION/CONDITIONAL = chưa tính trong baseline. Xem [tiêu chí nghiệm thu](G1-TIEU-CHI-NGHIEM-THU.md), [phạm vi dùng chung](G1-THANH-PHAN-DUNG-CHUNG.md). Chưa có giờ FE/BE.

## Thông tin bắt buộc phải xác nhận
- Đầu vào thực tế, quy tắc/chính sách có hiệu lực, khối lượng và danh sách ngoại lệ.
- Các quyền và trách nhiệm dữ liệu do VTV8 xác nhận bằng văn bản hoặc tại buổi nghiệm thu GĐ0.
- Nếu thay đổi công thức/quy trình hoặc khối lượng lớn hơn giả định, phải phân rã và ước tính lại.

[Xem danh mục GĐ1](README.md).