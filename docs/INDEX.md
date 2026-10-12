# Mục lục hồ sơ VTV8Online

**Trạng thái:** GĐ0–GĐ3 đã có hồ sơ nghiệp vụ và dự toán FE/BE DRAFT theo phạm vi đã phân tích. **GĐ4 đã có 9 module/78 tính năng và dự toán FE/BE sơ bộ V0** (34 CORE, 34 CONDITIONAL, 10 OPTION); chưa qua QA chuẩn hóa hoặc được VTV8 duyệt.

| Giai đoạn | Tên | Danh mục | Trạng thái |
|---|---|---|---|
| GĐ0 | Khảo sát, BA, thiết kế | [33 công việc đã chốt](00-gd0-khao-sat-thiet-ke/G0-TONG-HOP-PHAN-TICH-NGHIEP-VU.md) · [Ước tính chi tiết](../bao-gia/DU-TOAN-EFFORT-GD0-DU-THAO.md) | Danh mục chốt nội bộ; effort 320 giờ **DRAFT** |
| GĐ1 | VTV8Online V1 | [82 tính năng](01-gd1-vtv8online-v1/README.md) · [Dự toán FE/BE theo từng mã](../bao-gia/DU-TOAN-EFFORT-GD1-FE-BE-DU-THAO.md) · [CSV](../bao-gia/DU-TOAN-EFFORT-GD1-FE-BE.csv) | CORE: 1.616h FE / 2.600h BE = 4.216h Coding; 958,18 MD effort theo công thức, **DRAFT** |
| GĐ2 | Media Platform | [66 tính năng](02-gd2-media-platform/README.md) · [Ước tính FE/BE 66 mã](../bao-gia/DU-TOAN-EFFORT-GD2-FE-BE-DU-THAO.md) · [CSV](../bao-gia/DU-TOAN-EFFORT-GD2-FE-BE.csv) | CORE: 2.220h Coding / 504,55 MD; đủ 66: 5.028h Coding / 1.142,73 MD, **DRAFT** |
| GĐ3 | Content Commerce | [64 tính năng](03-gd3-content-commerce/README.md) · [Dự toán FE/BE](../bao-gia/DU-TOAN-EFFORT-GD3-FE-BE-DU-THAO.md) · [CSV](../bao-gia/DU-TOAN-EFFORT-GD3-FE-BE.csv) · [Tổng theo gói](../bao-gia/TONG-HOP-DU-TOAN-GD3-THEO-GOI.csv) | CORE 1.320h Coding / 300 MD; đủ 64 mã 7.308h Coding / 1.660,91 MD, **DRAFT** |
| GĐ4 | Digital Ecosystem | [9 module/78 tính năng](04-gd4-digital-ecosystem/README.md) · [Dự toán 78 mã](../bao-gia/DU-TOAN-EFFORT-GD4-FE-BE-DU-THAO.md) · [CSV FE/BE](../bao-gia/DU-TOAN-EFFORT-GD4-FE-BE.csv) · [Tổng theo module](../bao-gia/TONG-HOP-DU-TOAN-GD4-THEO-GOI.csv) | CORE 6.160h Coding / 1.400 MD; toàn bộ 14.904h Coding / 3.387,27 MD; DRAFT V0 chưa QA |

## Tài liệu dùng chung
- [Nguồn, cơ sở và giả định](nguon-va-gia-dinh.md)
- [Nguyên tắc kiến trúc xuyên giai đoạn](kien-truc-chung/README.md)
- [Quyết định & vấn đề chờ chốt](quyet-dinh/README.md)
- [Khung lập báo giá](../bao-gia/README.md)
- [Quy trình ước tính giờ code FE/BE](../bao-gia/PHUONG-PHAP-UOC-TINH.md)
- [Hướng dẫn đóng góp](../CONTRIBUTING.md)

## Quy trình đã thống nhất
1. Chọn **giai đoạn**, rà soát và chốt **danh sách module/hạng mục**.
2. Phân tích sâu **từng module**, thảo luận và chốt **các tính năng/công việc**.
3. Chỉ **sau khi chốt tính năng** mới ước tính giờ code **FE và BE**, lấy năng suất **một Middle Developer** làm chuẩn.
4. BA, Design và QA được Excel tính từ giờ coding theo sheet `Config`; Contract/Blockchain không áp dụng.
5. Riêng GĐ0 là dịch vụ khảo sát/thiết kế: dùng đầu ra và khối lượng tư vấn làm căn cứ dự toán, không suy luận chi phí từ FE/BE bằng 0.

## Thứ tự
- Hiện tại: GĐ0 đã chốt nội bộ **8 module và 33 công việc**; [đề xuất ước tính GĐ0 là 320 giờ / 40 MD](../bao-gia/DU-TOAN-EFFORT-GD0-DU-THAO.md), đang chờ rà soát/duyệt effort. Danh mục 81 mục trước đây đã được thay thế.
- Tiếp theo: QA 78 tính năng GĐ4 để gộp tránh trùng, chọn từng gói triển khai, xác nhận OS/provider/AI volumes/privacy/rights và năng lực đã có ở GĐ2–GĐ3 trước khi cập nhật dự toán FE/BE.

**Chú ý:** Thời lượng trong tài liệu nguồn là dự kiến. Chưa chốt đơn giá, thời hạn, khối lượng hay ngân sách thực hiện.
