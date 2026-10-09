# G0-06 – Đánh giá và thiết kế giải pháp Video/Livestream

> **Giai đoạn:** GĐ0 – Khảo sát và thiết kế tổng thể  
> **Danh mục module:** Đã chốt nội bộ ngày 09/10/2026  
> **Nội dung chi tiết:** DRAFT · Chưa có phê duyệt từ VTV8  
> **Căn cứ:** SOURCE – khảo sát VTVprime/VTVcab, CDN, livestream, SLA và bài toán 120.000 CCU

## 1. Mục tiêu
Sơ đồ pipeline VOD/live và tiêu chí lựa chọn nền tảng media. Hạng mục được xác định ở cấp phạm vi; mô tả này **không thay thế đặc tả công việc chi tiết**.

## 2. Phạm vi tổng quát
- Khảo sát pipeline media: ingest, transcoding, adaptive bitrate, player, ghi hình và phát lại.
- Đánh giá khả năng tích hợp/kế thừa hạ tầng VTVcab/VTVprime; quyền truy cập, API và SLA thực tế.
- Tính toán định hướng traffic, bitrate, lưu trữ, CDN, giám sát và các tình huống tải cao.
- So sánh phương án thuê/tích hợp media service với phương án tự triển khai/vận hành.

## 3. Đầu ra dự kiến cần làm rõ
- Sơ đồ pipeline VOD/live và tiêu chí lựa chọn nền tảng media.
- Ma trận phương án tích hợp, giới hạn kỹ thuật, trách nhiệm và điều kiện kiểm chứng.
- Dự toán hạ tầng/traffic theo các kịch bản đã ghi rõ giả định.

## 4. Ranh giới với hạng mục khác và giai đoạn sau
120.000 CCU là mục tiêu cần xác minh kịch bản đo; chưa được coi là kết quả benchmark đã đạt. Không bao gồm triển khai production hoặc kiểm thử tải thực tế nếu chưa có scope riêng.

## 5. Nội dung sẽ phân tích sau khi bắt đầu hạng mục
- Đầu vào và đối tượng phối hợp; công việc/hoạt động cụ thể.
- Khối lượng đầu việc, tiêu chí nghiệm thu của từng tài liệu/thiết kế.
- Giả định, phụ thuộc, trách nhiệm VTV8/IIEL và rủi ro thực hiện.
- Phương pháp dự toán phù hợp với công việc khảo sát/thiết kế GĐ0.

**Chưa ước tính giờ code FE/BE hoặc chi phí.** Theo quy trình đã thống nhất, chỉ phân tích tính năng/công việc và ước tính ở bước tiếp theo.
