# G0-08 – Tổng hợp phạm vi và kế hoạch triển khai

> **Danh sách 3 công việc đã chốt nội bộ ngày 09/10/2026.** Chưa có nghiệm thu từ VTV8. Chưa tính giờ công, MD hoặc chi phí.

## Mục tiêu

Tổng hợp đầu ra khảo sát G0-01 đến G0-07 thành phạm vi sản phẩm, kế hoạch triển khai sơ bộ và các điều kiện để lập báo giá đầu tư.

**Đơn vị phối hợp:** Product owner VTV8, BA/PM, kỹ thuật, thiết kế, vận hành và đại diện phụ trách báo giá.

## Công việc đã chốt

| Mã | Công việc | Nội dung cần làm rõ | Đầu ra |
|---|---|---|---|
| G0-08-F001 | Tổng hợp phạm vi phát triển từng giai đoạn | Phân bổ nhóm module và yêu cầu GĐ1–GĐ4 theo ưu tiên, trách nhiệm, phụ thuộc và mức độ chắc chắn | Bảng phạm vi theo giai đoạn |
| G0-08-F002 | Xây dựng kế hoạch triển khai sơ bộ | Tổ chức trình tự công việc, phụ thuộc, sản phẩm bàn giao và nguyên tắc nghiệm thu | Roadmap/WBS tổng thể |
| G0-08-F003 | Xây dựng cơ sở lập dự toán | Tổng hợp khối lượng, lựa chọn kỹ thuật, nhóm chi phí, giả định và điều kiện báo giá | Checklist đầu vào dự toán |

## Checklist nghiệp vụ

### G0-08-F001 – Tổng hợp phạm vi phát triển từng giai đoạn
- GĐ1: Website, CMS, nội dung có cấu trúc, video/live và migration.
- GĐ2: người dùng, Media Platform, VOD, tìm kiếm, paywall/analytics theo điều kiện.
- GĐ3: Content + Lead, Affiliate/Booking, thương mại điện tử theo quyết định mô hình kinh doanh.
- GĐ4: App, AI, membership, đối tác, dữ liệu dài hạn.
- Ghi rõ Included/Optional/TBC, nguồn đề xuất và những ràng buộc chưa được VTV8 xác nhận.
- **Đầu ra:** danh sách module/chức năng cấp cao theo giai đoạn.

### G0-08-F002 – Xây dựng kế hoạch triển khai sơ bộ
- Xác định công việc có thể thực hiện song song và công việc phụ thuộc quyền nội dung, hạ tầng, VTVcab, dữ liệu cũ.
- Dự kiến các mốc khảo sát, thiết kế chi tiết, phát triển, kiểm thử, chuyển đổi dữ liệu và nghiệm thu; không tự coi thời lượng nêu trong nguồn là cam kết.
- **Đầu ra:** WBS tổng quan, roadmap và điều kiện nghiệm thu cấp cao.

### G0-08-F003 – Xây dựng cơ sở lập dự toán
- Phân loại effort khảo sát/thiết kế GĐ0 và feature code GĐ1–GĐ4; ghi rõ những phần BA/Design đã hoàn thành tránh tính phí hai lần.
- Tách công sức xây dựng khỏi CDN, storage, băng thông, license, tích hợp vendor, DevOps, bảo trì và vận hành.
- Dùng giờ code của một Middle FE/BE Developer cho feature được chốt về sau; BA/Design/QA do Excel tự tính theo Config.
- **Đầu ra:** bộ giả định, nhóm chi phí và điều kiện/đầu vào để lập báo giá.

## Ranh giới

G0-08 không khảo sát lại G0-01 đến G0-07 và không tự tạo ra các tính năng chưa được thảo luận. Các giai đoạn dài hạn chưa đủ căn cứ chỉ được lập dự toán theo kịch bản, không coi là giá cố định đã được VTV8 phê duyệt.

Nguồn: [Đề xuất VTV8–IIEL](../../tai-lieu-nguon/Đề%20xuất%20hợp%20tác%20VTV8%20-%20IIEL_VTV8%20note.docx). Phiên bản 81 công việc trước đây có thể truy vết qua commit `0c3e781`.