# G0-07 – Phân tích và thiết kế phương án chuyển đổi dữ liệu

> **Giai đoạn:** GĐ0 – Khảo sát và thiết kế tổng thể  
> **Danh mục module:** Đã chốt nội bộ ngày 09/10/2026  
> **Nội dung chi tiết:** DRAFT · Chưa có phê duyệt từ VTV8  
> **Căn cứ:** SOURCE – kế hoạch migration, chuẩn hóa, loại trùng, kiểm tra bản quyền và metadata

## 1. Mục tiêu
Migration Strategy, bảng mapping dữ liệu và chiến lược xử lý lỗi/đối soát. Hạng mục được xác định ở cấp phạm vi; mô tả này **không thay thế đặc tả công việc chi tiết**.

## 2. Phạm vi tổng quát
- Xác định phạm vi nguồn/định dạng/khối lượng dữ liệu cần chuyển dựa trên kiểm kê G0-02.
- Thiết kế data mapping từ nguồn cũ sang schema mới và quy tắc metadata.
- Xác định chiến lược chuẩn hóa, phát hiện trùng lặp, kiểm tra quyền trước import.
- Thiết kế phương án import, retry, dry-run, đối soát và cutover/rollback ở mức kế hoạch.

## 3. Đầu ra dự kiến cần làm rõ
- Migration Strategy, bảng mapping dữ liệu và chiến lược xử lý lỗi/đối soát.
- Danh mục công cụ/connector cần phát triển ở GĐ1 và ước lượng độ khó dựa trên quyền truy cập thực tế.
- Giả định về tỷ lệ tự động hóa, lượng xử lý thủ công và quyền dữ liệu.

## 4. Ranh giới với hạng mục khác và giai đoạn sau
Không thực hiện migration thật trong GĐ0; không trùng với kiểm kê G0-02 hoặc kiểm tra quyền sở hữu chuyên môn G0-03.

## 5. Nội dung sẽ phân tích sau khi bắt đầu hạng mục
- Đầu vào và đối tượng phối hợp; công việc/hoạt động cụ thể.
- Khối lượng đầu việc, tiêu chí nghiệm thu của từng tài liệu/thiết kế.
- Giả định, phụ thuộc, trách nhiệm VTV8/IIEL và rủi ro thực hiện.
- Phương pháp dự toán phù hợp với công việc khảo sát/thiết kế GĐ0.

**Chưa ước tính giờ code FE/BE hoặc chi phí.** Theo quy trình đã thống nhất, chỉ phân tích tính năng/công việc và ước tính ở bước tiếp theo.
