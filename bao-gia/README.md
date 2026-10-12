# Khung ước tính và báo giá theo giai đoạn

**Trạng thái:** GĐ0 đã có [đề xuất giờ công chi tiết 320 giờ / 40 MD](DU-TOAN-EFFORT-GD0-DU-THAO.md) cho 33 công việc theo vai trò, **DRAFT ESTIMATE – chưa phê duyệt**. GĐ1–GĐ4 đã có dự toán giờ code DRAFT nhưng chưa có giờ code được VTV8 phê duyệt; không giả định mức lương, hệ số hoặc chi phí vendor khi chưa có dữ liệu.

## Tổng giờ hiện hành GĐ1–GĐ4 — V2

Giữ đủ **290 tính năng**; 1 MD = 8 giờ công. BA/Design/QA theo Config của mẫu; chưa cộng PM và công việc độc lập. Tổng hợp được tính từ FE/BE chính xác, không cộng các giá trị làm tròn.

| Giai đoạn | FE (h) | BE (h) | Coding (h) | Ngày chỉ code | Tổng effort (h) | MD gồm BA/Design/QA |
|---|---:|---:|---:|---:|---:|---:|
| GĐ1 | 240 | 615 | 855 | 106,88 | 1.554,55 | 194,32 |
| GĐ2 | 198 | 577 | 775 | 96,88 | 1.409,09 | 176,14 |
| GĐ3 | 275 | 871 | 1.146 | 143,25 | 2.083,64 | 260,45 |
| GĐ4 | 702 | 1.387 | 2.089 | 261,12 | 3.798,18 | 474,77 |
| **Tổng** | **1.415** | **3.450** | **4.865** | **608,12** | **8.845,45** | **1.105,68** |

[Báo cáo rà soát và giả định V2](RA-SOAT-ESTIMATE-FE-BE-VOI-AI.md). CSV/Markdown dự toán và [file báo giá Excel hiện tại](VTV8Online_Bao_gia_du_an_GD0-GD4_chua_tinh_gio.xlsx) đã được điền giờ V2. Tổng cuối trong Excel còn cộng các dòng NFR/hạ tầng và PM giữ theo mẫu; 4.865h là coding riêng của 290 tính năng.

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

## Dự toán FE/BE GĐ1 – VTV8Online V1 (DRAFT V2, cập nhật 12/10/2026)

- [Markdown chi tiết 82 tính năng](DU-TOAN-EFFORT-GD1-FE-BE-DU-THAO.md) · [CSV giờ V2](DU-TOAN-EFFORT-GD1-FE-BE.csv).
- **72 CORE:** FE 212h + BE 532h = **744h code**, tổng effort **169,09 MD** theo mẫu.
- **3 CONDITIONAL:** FE 6h + BE 30h = **36h code**, tổng effort **8,18 MD** theo mẫu.
- **7 OPTION:** FE 22h + BE 53h = **75h code**, tổng effort **17,05 MD** theo mẫu.
- **Toàn bộ 82 tính năng:** FE **240h** + BE **615h** = **855h code**; tổng effort **1.554,55h = 194,32 MD**. Chưa gồm GĐ0, foundations, H01/H02, hạ tầng/vendor, vận hành và PM.
- V2 đã tính cách phát triển có AI, component/API/nền dùng chung rõ. Giữ nguyên scope và nghiệm thu; dự toán nội bộ theo điều kiện, chưa đo thực tế hoặc được VTV8 phê duyệt.

## Mẫu Excel do người dùng cung cấp

- [Mô tả cấu trúc và các điểm cần kiểm tra trước khi báo giá](templates/Template-Bao-gia-Du-an-cau-truc.md).
- [Tệp gốc **Template Báo giá Dự án.xlsx**](templates/Template%20Báo%20giá%20Dự%20án.xlsx) đã được lưu trên Git. Khi lập báo giá, tạo workbook VTV8Online riêng, giữ template gốc làm bản chuẩn.

## Dự toán FE/BE GĐ2 – Media Platform (DRAFT V2, cập nhật 12/10/2026)

- [Markdown chi tiết 66 tính năng](DU-TOAN-EFFORT-GD2-FE-BE-DU-THAO.md) · [CSV giờ V2](DU-TOAN-EFFORT-GD2-FE-BE.csv).
- **33 CORE:** FE 85h + BE 223h = **308h code**, tổng effort **70,00 MD** theo mẫu.
- **24 CONDITIONAL:** FE 88h + BE 280h = **368h code**, tổng effort **83,64 MD** theo mẫu.
- **9 OPTION:** FE 25h + BE 74h = **99h code**, tổng effort **22,50 MD** theo mẫu.
- **Toàn bộ 66 tính năng:** FE **198h** + BE **577h** = **775h code**; tổng effort **1.409,09h = 176,14 MD**. Chưa gồm GĐ0, foundations, H01/H02, hạ tầng/vendor, vận hành và PM.
- V2 đã tính cách phát triển có AI, component/API/nền dùng chung rõ. Giữ nguyên scope và nghiệm thu; dự toán nội bộ theo điều kiện, chưa đo thực tế hoặc được VTV8 phê duyệt.

## Dự toán FE/BE GĐ3 – Content Commerce (DRAFT V2, cập nhật 12/10/2026)

- [Markdown chi tiết 64 tính năng](DU-TOAN-EFFORT-GD3-FE-BE-DU-THAO.md) · [CSV giờ V2](DU-TOAN-EFFORT-GD3-FE-BE.csv).
- [CSV tổng theo gói/module](TONG-HOP-DU-TOAN-GD3-THEO-GOI.csv) được tính lại từ các mã tính năng, không cộng trùng.
- **15 CORE:** FE 60h + BE 123h = **183h code**, tổng effort **41,59 MD** theo mẫu.
- **35 CONDITIONAL:** FE 163h + BE 628h = **791h code**, tổng effort **179,77 MD** theo mẫu.
- **14 OPTION:** FE 52h + BE 120h = **172h code**, tổng effort **39,09 MD** theo mẫu.
- **Toàn bộ 64 tính năng:** FE **275h** + BE **871h** = **1.146h code**; tổng effort **2.083,64h = 260,45 MD**. Chưa gồm GĐ0, foundations, H01/H02, hạ tầng/vendor, vận hành và PM.
- V2 đã tính cách phát triển có AI, component/API/nền dùng chung rõ. Giữ nguyên scope và nghiệm thu; dự toán nội bộ theo điều kiện, chưa đo thực tế hoặc được VTV8 phê duyệt.
- Finance G3-09 chỉ tính một lần khi dùng chung Affiliate/Marketplace; các gói vẫn theo gate và danh mục hiện hành.

## Dự toán FE/BE GĐ4 – Digital Ecosystem (DRAFT V2, cập nhật 12/10/2026)

- [Markdown chi tiết 78 tính năng](DU-TOAN-EFFORT-GD4-FE-BE-DU-THAO.md) · [CSV giờ V2](DU-TOAN-EFFORT-GD4-FE-BE.csv).
- [CSV tổng theo gói/module](TONG-HOP-DU-TOAN-GD4-THEO-GOI.csv) được tính lại từ các mã tính năng, không cộng trùng.
- **34 CORE:** FE 262h + BE 515h = **777h code**, tổng effort **176,59 MD** theo mẫu.
- **34 CONDITIONAL:** FE 353h + BE 666h = **1.019h code**, tổng effort **231,59 MD** theo mẫu.
- **10 OPTION:** FE 87h + BE 206h = **293h code**, tổng effort **66,59 MD** theo mẫu.
- **Toàn bộ 78 tính năng:** FE **702h** + BE **1.387h** = **2.089h code**; tổng effort **3.798,18h = 474,77 MD**. Chưa gồm GĐ0, foundations, H01/H02, hạ tầng/vendor, vận hành và PM.
- V2 đã tính cách phát triển có AI, component/API/nền dùng chung rõ. Giữ nguyên scope và nghiệm thu; dự toán nội bộ theo điều kiện, chưa đo thực tế hoặc được VTV8 phê duyệt.
- CORE vẫn là cơ sở cho từng module được chọn; không phải một package bắt buộc của cả hệ sinh thái. Danh mục GĐ4 chưa QA chuẩn hóa.
