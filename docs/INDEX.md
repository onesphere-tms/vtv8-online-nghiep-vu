# Mục lục hồ sơ VTV8Online

**Trạng thái:** GĐ0 có 33 việc và 320 giờ effort DRAFT. GĐ1: 11 module + 2 nhóm hỗ trợ, đã chuẩn hóa **82 tính năng nội bộ (72 CORE, 10 OPTION/CONDITIONAL)** và chuyển 5 việc phi-feature sang WBS, chưa có giờ FE/BE hoặc xác nhận VTV8. GĐ2–GĐ4 vẫn là dự thảo.

| Giai đoạn | Tên | Danh mục | Trạng thái |
|---|---|---|---|
| GĐ0 | Khảo sát, BA, thiết kế | [33 công việc đã chốt](00-gd0-khao-sat-thiet-ke/G0-TONG-HOP-PHAN-TICH-NGHIEP-VU.md) · [Ước tính chi tiết](../bao-gia/DU-TOAN-EFFORT-GD0-DU-THAO.md) | Danh mục chốt nội bộ; effort 320 giờ **DRAFT** |
| GĐ1 | VTV8Online V1 | [11 module + 2 nhóm hỗ trợ](01-gd1-vtv8online-v1/README.md) · [82 tính năng sau QA](01-gd1-vtv8online-v1/G1-DANH-MUC-TINH-NANG.md) | 72 CORE, 10 tùy chọn/điều kiện; chưa ước tính giờ |
| GĐ2 | Media Platform | [GĐ2](02-gd2-media-platform/README.md) | DRAFT |
| GĐ3 | Content Commerce | [GĐ3](03-gd3-content-commerce/README.md) | DRAFT |
| GĐ4 | Digital Ecosystem | [GĐ4](04-gd4-digital-ecosystem/README.md) | DRAFT |

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
- Tiếp theo: xác minh các quyết định P0 (nhuận bút, quyền media, streaming, migration), ước tính FE/BE và effort đặc thù H01/H02, sau đó đánh giá mốc 8–12 tuần.

**Chú ý:** Thời lượng trong tài liệu nguồn là dự kiến. Chưa chốt đơn giá, thời hạn, khối lượng hay ngân sách thực hiện.
