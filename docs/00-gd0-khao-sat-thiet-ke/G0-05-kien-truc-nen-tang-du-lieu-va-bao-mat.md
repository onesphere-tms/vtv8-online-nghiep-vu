# G0-05 – Thiết kế kiến trúc nền tảng, dữ liệu và bảo mật

> **Giai đoạn:** GĐ0 – Khảo sát và thiết kế tổng thể  
> **Danh mục module:** Đã chốt nội bộ ngày 09/10/2026  
> **Nội dung chi tiết:** DRAFT · Chưa có phê duyệt từ VTV8  
> **Căn cứ:** SOURCE – kiến trúc hệ thống, dữ liệu, SLA, khả năng mở rộng; PROPOSED – quyết định kiến trúc, NFR

## 1. Mục tiêu
Sơ đồ kiến trúc tổng thể, data-flow và khung data model. Hạng mục được xác định ở cấp phạm vi; mô tả này **không thay thế đặc tả công việc chi tiết**.

## 2. Phạm vi tổng quát
- Định hình các lớp frontend, backend, API, domain/module và kết nối liên hệ thống.
- Chọn phương án database, cache, object storage, search và định hướng mô hình dữ liệu tổng thể.
- Đánh giá bảo mật, phân quyền, backup/restore, logging, monitoring, availability và yêu cầu phi chức năng.
- Đưa ra phương án kiến trúc đáp ứng GĐ1 và có đường mở rộng lên GĐ2–GĐ4, so sánh trade-off kỹ thuật/chi phí.

## 3. Đầu ra dự kiến cần làm rõ
- Sơ đồ kiến trúc tổng thể, data-flow và khung data model.
- Danh sách yêu cầu phi chức năng, tích hợp và quyết định kỹ thuật cần xác nhận.
- Các phương án triển khai và những giả định ảnh hưởng tới sizing/hạ tầng.

## 4. Ranh giới với hạng mục khác và giai đoạn sau
Không đi sâu lựa chọn/transcoding/CDN/video stream chi tiết (G0-06) và không thiết kế mọi API endpoint hoặc triển khai hạ tầng production trong GĐ0.

## 5. Nội dung sẽ phân tích sau khi bắt đầu hạng mục
- Đầu vào và đối tượng phối hợp; công việc/hoạt động cụ thể.
- Khối lượng đầu việc, tiêu chí nghiệm thu của từng tài liệu/thiết kế.
- Giả định, phụ thuộc, trách nhiệm VTV8/IIEL và rủi ro thực hiện.
- Phương pháp dự toán phù hợp với công việc khảo sát/thiết kế GĐ0.

**Chưa ước tính giờ code FE/BE hoặc chi phí.** Theo quy trình đã thống nhất, chỉ phân tích tính năng/công việc và ước tính ở bước tiếp theo.
