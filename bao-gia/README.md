# Khung ước tính và báo giá theo giai đoạn

**Trạng thái:** GĐ0 đã có [đề xuất giờ công chi tiết 320 giờ / 40 MD](DU-TOAN-EFFORT-GD0-DU-THAO.md) cho 33 công việc theo vai trò, **DRAFT ESTIMATE – chưa phê duyệt**. GĐ1–GĐ4 chưa có giờ code chốt; không giả định mức lương, hệ số hoặc chi phí vendor khi chưa có dữ liệu.

## Đơn vị bóc tách
**Giai đoạn → Module → Tính năng/use case → Công việc → Effort → Chi phí.**

Mỗi use case phải có mô tả nghiệp vụ, UI/API/data/tích hợp, ngoại lệ, NFR, tiêu chí nghiệm thu và giả định trước khi ước tính ở mức chi tiết.

## Nhóm chi phí
| Nhóm | Ví dụ | Ghi chú |
|---|---|---|
| Phân tích & thiết kế | BA, PO, UX/UI, Architect | One-time |
| Phát triển phần mềm | Web, CMS, Backend, Mobile | One-time |
| Tích hợp | Streaming, CDN, SSO, DRM, payment, partner API | One-time + có thể thêm phí nhà cung cấp |
| Kiểm thử | QA, UAT, security, performance | One-time |
| Triển khai | DevOps, migration, go-live, training | One-time |
| Hạ tầng | Compute, DB, object storage, CDN, băng thông | Định kỳ/biến đổi |
| License/API | AI, DRM, SMS/OTP, search, video service | Theo hợp đồng hoặc usage |
| Bảo trì/vận hành | Monitoring, support, incident response, backup | Định kỳ |

## Cột bắt buộc của bảng ước tính
`Phase | Module ID | Feature ID | Source | Scope | Complexity | FE hours [nhập] | BE hours [nhập] | BA hours [công thức] | Design hours [công thức] | QA hours [công thức] | Total hours [công thức] | MD [công thức] | Dependency | Assumption | Separate cost | Confidence`

- [Phương pháp ước tính chính thức](PHUONG-PHAP-UOC-TINH.md): **chỉ nhập giờ FE, BE cho feature**; BA, Design và QA tự tính theo tỷ trọng từ Config. Contract/Blockchain không thuộc VTV8Online.
- Giờ FE/BE là công sức **nếu 1 người thực hiện phần code tương ứng**, không phải thời gian lịch của cả team.
- Công việc GĐ0, hạ tầng, license, streaming, DevOps và các hoạt động ngoài coding có thể cần bảng effort/chi phí riêng; tránh cộng trùng.
- Không cộng trùng một tính năng đã xây ở giai đoạn trước; phase sau tính phần *incremental*.
- Chi phí CDN/media phụ thuộc bitrate, traffic, địa lý phân phối, retention và vendor; cần tách khỏi đơn giá viết code.
- `TBC` báo giá theo kịch bản hoặc khoảng, kèm điều kiện loại trừ.
- Mỗi bản chốt giá phải tham chiếu phiên bản/tên commit của hồ sơ yêu cầu.

## Trước khi chốt giá
1. Xác nhận chức năng nào nằm trong scope giai đoạn.
2. Làm rõ các tích hợp và ai cung cấp hạ tầng/giấy phép.
3. Chốt tiêu chí nghiệm thu, bảo hành, SLA, chuyển giao.
4. Tổng hợp rủi ro, phụ thuộc, dự phòng thay đổi.
5. Xác nhận đơn giá nhân sự, thuế, đơn vị tiền tệ, thời hạn hiệu lực.

## Bảng effort khảo sát GĐ0

- [Chi tiết 33 công việc GĐ0: vai trò, giờ công, MD, giả định và tiến độ](DU-TOAN-EFFORT-GD0-DU-THAO.md).
- **Tổng cơ sở đề xuất:** 320 giờ = 40 MD. Không áp dụng công thức FE/BE (Coding 55%) cho GĐ0; chưa có đơn giá hay số tiền và chưa điền vào template phần mềm.

## Dự toán phát triển GĐ1 – FE/BE Middle Developer (DRAFT)

- [Bảng **82 tính năng** có giờ FE, BE và căn cứ estimate từng mã](DU-TOAN-EFFORT-GD1-FE-BE-DU-THAO.md).
- [CSV 82 tính năng có sẵn cột BA/Design/QA/MD để đối chiếu và nhập workbook](DU-TOAN-EFFORT-GD1-FE-BE.csv).
- **CORE 72 tính năng:** FE **1.616h**, BE **2.600h**, Coding **4.216h**; theo tỷ trọng Coding 55%, tổng effort **7.665,45h = 958,18 MD** (chưa gồm H01/H02/Streaming vendor/migration execution/PM).
- **10 OPTION/CONDITIONAL:** Coding **572h** (FE **208h**, BE **364h**) tính riêng, không mặc định cộng vào V1 cơ sở.
- Chỉ là **ước tính nội bộ lần 1**, phụ thuộc vào quy chế nhuận bút, khả năng vendor streaming, khối lượng dữ liệu, phân quyền CMS và phương án kỹ thuật từ GĐ0.

## Mẫu Excel do người dùng cung cấp

- [Mô tả cấu trúc và các điểm cần kiểm tra trước khi báo giá](templates/Template-Bao-gia-Du-an-cau-truc.md).
- [Tệp gốc **Template Báo giá Dự án.xlsx**](templates/Template%20Báo%20giá%20Dự%20án.xlsx) đã được lưu trên Git. Khi lập báo giá, tạo workbook VTV8Online riêng, giữ template gốc làm bản chuẩn.

## Dự toán FE/BE GĐ2 – Media Platform (DRAFT, 09/10/2026)

- [Ước tính chi tiết 66 tính năng FE/BE theo Middle Developer](DU-TOAN-EFFORT-GD2-FE-BE-DU-THAO.md).
- [CSV 66 dòng để sử dụng trong Excel](DU-TOAN-EFFORT-GD2-FE-BE.csv).
- **CORE:** FE 748h + BE 1.472h = 2.220h Coding, quy đổi **504,55 MD** với BA/Design/QA.
- **CONDITIONAL:** FE 688h + BE 1.500h = 2.188h Coding, **497,27 MD**, chỉ chọn theo điều kiện pháp lý/vendor/thương mại.
- **OPTION:** FE 212h + BE 408h = 620h Coding, **140,91 MD**, tính riêng.
- **Làm đủ 66 tính năng:** 5.028h Coding = **1.142,73 MD** theo công thức. Chưa gồm G2-H01/H02, phí vendor/CDN/payment/DRM, vận hành kiểm duyệt, bảo mật/hiệu năng chuyên sâu và PM.

