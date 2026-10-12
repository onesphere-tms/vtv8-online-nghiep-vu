# Phương pháp ước tính giờ công VTV8Online (đã thống nhất)

**Ngày thống nhất:** 09/10/2026 · **Nguồn:** Người dùng giải thích trực tiếp cách sử dụng `Template Báo giá Dự án.xlsx`.

## 1. Đầu vào duy nhất phải ước tính thủ công cho mỗi tính năng phần mềm

- `FE_hours`: số giờ **một lập trình viên Frontend** cần để code xong phần việc Frontend; chưa xét tăng/giảm tiến độ do huy động nhiều người.
- `BE_hours`: số giờ **một lập trình viên Backend** cần để code xong phần việc Backend; chưa xét số lượng nhân sự.
- `Coding_hours = FE_hours + BE_hours`.
- **Không có Contract/Blockchain** trong phạm vi VTV8Online. Cột `Contract` của file mẫu không được ước tính; khi tạo bản báo giá VTV8Online có thể loại cột này và cập nhật công thức, hoặc để trống/0 trong bản sao nếu muốn giữ nguyên vị trí công thức. Tuyệt đối không xóa cột trong template gốc khi chưa có bản sao.

## 2. Các giờ công phát sinh từ công thức (không nhập thủ công)

Sheet `Config` của file mẫu có `Req = 10%`, `Detail = 15%`, `Cod = 55%`, `UnitTest = 20%` và `MD = 8 giờ`.

| Hạng mục | Công thức |
|---|---|
| Tổng coding | `FE + BE` |
| BA / Hiểu nghiệp vụ | `Coding * 10% / 55%` |
| Design / Thiết kế | `Coding * 15% / 55%` |
| QA / Kiểm thử | `Coding * 20% / 55%` |
| Tổng effort | `Coding + BA + Design + QA = Coding / 55%` |
| Man-day | `Tổng effort / 8` |

Các tỷ trọng đang khớp với file Excel gốc và được coi là **công thức áp dụng cho các tính năng phần mềm theo thống nhất của người dùng**; không có nghĩa mọi hạng mục phi-code đều tự động có thể áp dụng tỷ trọng này.

**Ví dụ:** FE = 25 giờ, BE = 30 giờ ⇒ Coding = 55 giờ ⇒ BA = 10 giờ, Design = 15 giờ, QA = 20 giờ ⇒ Tổng = 100 giờ = 12,5 MD.

## 3. Ý nghĩa của giờ code và quy trình phân tích

- BA phải phân tích đủ luồng xử lý, UI, API, data model, xác thực/phân quyền, các ngoại lệ, kiểm thử và tích hợp để coder **ước tính FE và BE**.
- `FE_hours` và `BE_hours` là effort, không phải calendar duration. Khi lập `Timeline`, mới phân bổ nhân sự và xét song song/phụ thuộc để ra ngày bắt đầu/kết thúc.
- Các chức năng đã làm từ giai đoạn trước chỉ ước tính phần **phát triển mới/nâng cấp** để không tính hai lần.
- Với một tính năng nhiều loại công việc, cần ghi giả định rõ: phần nào được bao gồm trong FE/BE, phần nào tính riêng.

## 4. Các khoản KHÔNG nên ép vào công thức FE/BE

- GĐ0: khảo sát, làm việc với stakeholder, thiết kế kiến trúc, lập tài liệu yêu cầu và kế hoạch. **Đã có [bảng ước tính GĐ0 riêng theo 7 vai trò](DU-TOAN-EFFORT-GD0-DU-THAO.md), 320 giờ / 40 MD ở trạng thái DRAFT**, không phát sinh từ công thức FE/BE.
- Chi phí hạ tầng/CDN/video/băng thông/storage, license DRM, AI API, SMS, dịch vụ/giấy phép nhà cung cấp.
- Hoạt động thuần migration dữ liệu hàng loạt, chi phí vận hành streaming, mua/sử dụng media platform bên ngoài.
- Các hoạt động DevOps, kiểm thử tải/kiểm thử bảo mật chuyên sâu, nghiệm thu/chuyển giao độc lập khi scope đòi hỏi.
- PM và các hệ số khác ngoài bộ BA/Design/QA phải được xác nhận riêng, tránh cộng hai lần chi phí.

## 5. Quy tắc sử dụng template

1. Giữ `bao-gia/templates/Template Báo giá Dự án.xlsx` **nguyên bản**.
2. Tạo file báo giá VTV8Online ở đường dẫn khác dựa trên bản sao.
3. Chỉ điền **FE và BE** trên dòng feature; các cột BA, Design, QA, Total, MD do công thức điều khiển.
4. Không sử dụng đơn giá/nhân sự Blockchain, cấu hình Auto Furniture và các khoản chi dự án cũ.
5. Khi xóa cột `Contract` hoặc mở rộng số dòng feature, phải kiểm tra và cập nhật công thức mảng, vùng tổng, named ranges.
6. Bóc tách bảng dự toán theo **giai đoạn → module → feature**; cho phép tổng hợp tiền theo giai đoạn mà không đếm trùng effort.
7. Các công việc đặc thù ghi vào **dòng dự toán riêng** hoặc chi phí vendor/operation và ghi rõ cách tính, không tự pha vào giờ code tính tỷ trọng.

**Trạng thái:** phương pháp đã xác nhận bởi người dùng; giờ FE/BE dự toán nội bộ V2 được cập nhật vào CSV/Markdown ngày 12/10/2026 theo yêu cầu người dùng, chưa phải xác nhận phạm vi/giá chính thức của VTV8. Tỷ trọng và bảng lương/đơn giá trong template giữ nguyên.

## 7. Giờ hiện hành V2 – cập nhật 12/10/2026

- Dùng FE/BE theo [báo cáo V2](RA-SOAT-ESTIMATE-FE-BE-VOI-AI.md), mục 10 và 13, cho đủ 290 tính năng GĐ1–GĐ4. Giả định AI hỗ trợ phân tích/code, đặc tả rõ và component/API/nền dùng chung đã chạy; giờ vẫn gồm review, ghép chạy và developer checks.
- Tổng coding **4.865h = 1.415 FE + 3.450 BE**; BA **884,55h**, Design **1.326,82h**, QA **1.769,09h**; tổng effort **8.845,45h = 1.105,68 MD** trước PM/công việc độc lập.
- Các trường suy ra tính trực tiếp từ Coding chính xác rồi làm tròn 2 chữ số; không lấy tổng các dòng đã làm tròn để tính lại.
- V2 là dự toán nội bộ theo điều kiện; không giảm tính năng/nghiệm thu, không tự xóa QA/BA/PM hoặc nhân một hệ số giảm đồng đều. GĐ0 vẫn có bảng theo vai trò riêng, không đổi trong lần cập nhật này.
