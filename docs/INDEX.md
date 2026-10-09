# Mục lục hồ sơ VTV8Online

**Trạng thái:** DRAFT · Danh sách module là **khung phân rã đề xuất**, cần khảo sát/xác nhận trước khi chốt hợp đồng.

| Giai đoạn | Tên | Danh mục |
|---|---|---|
| GĐ0 | Khảo sát, BA, thiết kế | [GĐ0](00-gd0-khao-sat-thiet-ke/README.md) |
| GĐ1 | VTV8Online V1 | [GĐ1](01-gd1-vtv8online-v1/README.md) |
| GĐ2 | Media Platform | [GĐ2](02-gd2-media-platform/README.md) |
| GĐ3 | Content Commerce | [GĐ3](03-gd3-content-commerce/README.md) |
| GĐ4 | Digital Ecosystem | [GĐ4](04-gd4-digital-ecosystem/README.md) |

## Tài liệu dùng chung
- [Nguồn, cơ sở và giả định](nguon-va-gia-dinh.md)
- [Nguyên tắc kiến trúc xuyên giai đoạn](kien-truc-chung/README.md)
- [Quyết định & vấn đề chờ chốt](quyet-dinh/README.md)
- [Khung lập báo giá](../bao-gia/README.md)
- [Hướng dẫn đóng góp](../CONTRIBUTING.md)

## Luồng phân tích đến báo giá
```
Tài liệu đề xuất VTV8 → Danh mục giai đoạn → Module → Tính năng / Use case
  → Luồng nghiệp vụ & quy tắc → UI / API / DB / Tích hợp / NFR
  → Điều kiện nghiệm thu → Effort → Dự toán theo module / giai đoạn
```

## Thứ tự ưu tiên
1. GĐ0: xác minh hiện trạng, vai trò, quy trình và các quyết định hạ tầng.
2. GĐ1: phân tích sâu các module có yêu cầu trực tiếp từ tài liệu (CMS, Content, DAM, Migration, Video/Live).
3. GĐ2–GĐ4: khung chức năng, các kịch bản tích hợp/mô hình thương mại, sau đó chi tiết hóa theo quyết định.

**Chú ý:** Các giai đoạn trong nguồn có thời lượng dự kiến, nhưng chưa chốt quan hệ tuần tự/song song và chưa xác nhận ngân sách.
