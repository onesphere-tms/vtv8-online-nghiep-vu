# G0-06 – Khảo sát và lựa chọn phương án Video/Livestream

> **Danh sách 4 công việc đã chốt nội bộ ngày 09/10/2026.** Chưa được VTV8 xác nhận và chưa có kết quả khảo sát từ đơn vị cung cấp hạ tầng. Chưa có giờ công hoặc giá.

## Mục tiêu

Xác định cách VTV8 đang vận hành video/livestream, điều kiện kế thừa VTVcab/VTVprime và hướng triển khai VOD/live, bao gồm yêu cầu tải lớn.

**Đơn vị phối hợp dự kiến:** bộ phận kỹ thuật VTV8, đối tác VTVcab/VTVprime và nhóm kiến trúc.

## Danh mục công việc

| Mã | Công việc | Nội dung khảo sát/đánh giá | Sản phẩm dự kiến |
|---|---|---|---|
| G0-06-F001 | Khảo sát hạ tầng livestream đang sử dụng | Xem xét cách phát live, sự cố gián đoạn/giật-lag và việc chuyển sang nhúng YouTube | Báo cáo hiện trạng livestream |
| G0-06-F002 | Đánh giá khả năng tích hợp VTVcab/VTVprime | Năng lực streaming, API, player, transcoding, CDN, SLA và trách nhiệm của đối tác | Bảng năng lực và điều kiện tích hợp |
| G0-06-F003 | Đề xuất phương án phát video và livestream | Hướng triển khai nhận luồng, xử lý, lưu trữ, phát trực tiếp, phát lại và phân phối qua CDN | Sơ đồ phương án Video/Livestream tổng thể |
| G0-06-F004 | Đánh giá khả năng chịu tải và các phương án đầu tư | Kịch bản 120.000 CCU, bitrate, băng thông, nhu cầu CDN, chi phí và xác minh tải | Bảng giả định tải, lựa chọn đầu tư và điều kiện kiểm chứng |

## Checklist cho từng công việc

### G0-06-F001 – Khảo sát hạ tầng livestream đang sử dụng
- Tìm hiểu các chương trình đã live, cách kết nối nguồn và những hạn chế thực tế.
- Ghi nhận tình huống dừng live, giật/lag và việc nhúng YouTube; nguyên nhân thực tế phải có bằng chứng.
- **Đầu ra:** báo cáo hiện trạng và các điểm cần cải thiện.

### G0-06-F002 – Đánh giá khả năng tích hợp VTVcab/VTVprime
- Xác định có thể sử dụng dịch vụ ingest, transcoding, recording, CDN, player và API đến mức nào.
- Ghi rõ đối tác nào chịu trách nhiệm cung cấp hạ tầng, SLA, hỗ trợ vận hành, giới hạn kết nối.
- **Đầu ra:** ma trận khả năng tích hợp đã xác nhận/chờ xác nhận.

### G0-06-F003 – Đề xuất phương án phát video và livestream
- Đề xuất luồng cung cấp VOD/livestream từ nguồn phát đến người xem.
- So sánh cách kế thừa hệ thống đối tác với phương án thuê/tự vận hành ở mức tổng thể.
- **Đầu ra:** sơ đồ media pipeline và các điều kiện lựa chọn.

### G0-06-F004 – Đánh giá khả năng chịu tải và các phương án đầu tư
- Phân biệt CCU truy cập website với CCU xem livestream/video, phân tích bitrate và dung lượng truyền tải theo kịch bản.
- Mục tiêu 120.000 CCU là **yêu cầu cần chứng minh**, không phải thành tích đã đạt.
- **Đầu ra:** bảng tính tải minh họa và đề xuất cách kiểm chứng/đánh giá chi phí khi có dữ liệu đối tác.

## Ranh giới và điều kiện hoàn thành

GĐ0 **không bao gồm** triển khai live production, thuê CDN, viết mã player, thực hiện stress test hoặc cam kết SLA/120.000 CCU khi chưa có bài thử và hợp đồng riêng. Kết quả bàn giao là báo cáo/phương án có giả định và bằng chứng nguồn.

Nguồn: [Tài liệu đề xuất VTV8–IIEL](../../tai-lieu-nguon/Đề%20xuất%20hợp%20tác%20VTV8%20-%20IIEL_VTV8%20note.docx). Bản 81 công việc trước đây nằm tại commit `0c3e781`.