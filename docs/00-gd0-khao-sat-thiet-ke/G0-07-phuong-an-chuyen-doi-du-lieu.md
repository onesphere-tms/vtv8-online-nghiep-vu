# G0-07 – Khảo sát và lập phương án chuyển đổi dữ liệu

> **Danh sách 3 công việc đã chốt nội bộ ngày 09/10/2026.** Đây là công việc khảo sát/phương án, chưa phải migration đã thực hiện; chưa có giờ công hoặc chi phí.

## Mục tiêu

Xác định nguồn và nhóm dữ liệu cần chuyển lên nền tảng mới, khả năng trích xuất/chuẩn hóa và hướng migration tổng thể để dự toán việc triển khai ở GĐ1.

**Đầu vào:** báo cáo dữ liệu/tài sản G0-02, ràng buộc quyền nội dung G0-03 và cấu trúc nội dung G0-04. **Phối hợp:** quản trị CMS cũ, quản lý nội dung, đội kỹ thuật dữ liệu và bộ phận bản quyền.

## Danh sách công việc

| Mã | Công việc | Nội dung thực hiện | Đầu ra |
|---|---|---|---|
| G0-07-F001 | Xác định phạm vi dữ liệu cần chuyển đổi | Xác định dữ liệu Website/CMS cũ, bài viết, video, chương trình và các kênh bên ngoài | Bảng nguồn, loại dữ liệu, khối lượng dự kiến |
| G0-07-F002 | Đánh giá khả năng chuyển đổi và chuẩn hóa | Đánh giá khả năng xuất dữ liệu, chất lượng metadata, tình trạng thiếu/trùng, giới hạn bản quyền | Danh mục vấn đề dữ liệu, khả năng xử lý |
| G0-07-F003 | Xây dựng phương án migration tổng thể | Đề xuất trình tự thu thập, chuẩn hóa, loại trùng, xác minh quyền, nhập dữ liệu và đối soát | Migration Plan cấp tổng thể |

## Checklist khảo sát

### G0-07-F001 – Xác định phạm vi dữ liệu cần chuyển đổi
- Tổng hợp các nguồn hiện tại từ kết quả G0-02: website, CMS, kho media, Facebook/TikTok/YouTube trong giới hạn kỹ thuật và pháp lý.
- Xác định nhóm cần chuyển, khoảng thời gian (bao gồm nội dung từ 2023), kích thước và người phụ trách.
- **Bàn giao:** danh sách nguồn/phạm vi dữ liệu cần chuyển.

### G0-07-F002 – Đánh giá khả năng chuyển đổi và chuẩn hóa
- Xác định nguồn có khả năng export qua API, dữ liệu thô, tệp hoặc phải xử lý thủ công.
- Kiểm tra sơ bộ dữ liệu thiếu metadata, nội dung trùng, chất lượng file và tình trạng quyền nội dung; dùng mẫu đại diện khi lượng dữ liệu lớn.
- **Bàn giao:** bảng mức độ sẵn sàng và vướng mắc cần xử lý.

### G0-07-F003 – Xây dựng phương án migration tổng thể
- Đề xuất các bước trích xuất → chuẩn hóa → kiểm tra bản quyền → loại trùng → nhập → đối soát.
- Ghi nhận các điểm cần kiểm thử, liên kết nội dung, URL cũ/SEO, khả năng phục hồi nếu chuyển đổi thất bại.
- **Bàn giao:** phương án chuyển đổi, rủi ro và điều kiện triển khai.

## Ranh giới

GĐ0 chưa thực hiện chuyển dữ liệu thật, viết connector, làm sạch toàn bộ dữ liệu, ánh xạ chi tiết mọi field hoặc chạy cutover. Các bước đó thuộc công việc triển khai sau GĐ0. Phương án dự kiến chỉ có thể xác nhận đầy đủ khi VTV8 cung cấp quyền truy cập và mẫu dữ liệu.

Nguồn: [Đề xuất VTV8–IIEL](../../tai-lieu-nguon/Đề%20xuất%20hợp%20tác%20VTV8%20-%20IIEL_VTV8%20note.docx). Danh sách 81 mục cũ xem trong lịch sử Git commit `0c3e781`.