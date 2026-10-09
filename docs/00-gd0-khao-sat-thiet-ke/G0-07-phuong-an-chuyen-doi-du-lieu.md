# G0-07 – Phân tích và thiết kế phương án chuyển đổi dữ liệu

> **Trạng thái module GĐ0:** Đã thống nhất nội bộ tên, mục tiêu và ranh giới module (09/10/2026).  
> **Danh sách công việc Fxxx:** DRAFT – đề xuất đầy đủ để rà soát toàn bộ GĐ0; chưa chốt nội bộ từng danh sách, chưa được VTV8 xác nhận.  
> **Chưa tính:** FE/BE Middle Developer, BA/Design/QA, MD, giá, timeline chi tiết.

## 1. Mục tiêu

Thiết kế hướng chuyển nội dung lịch sử và media sang nền tảng mới có kiểm soát nguồn gốc/quyền, chất lượng và khả năng đối soát; làm rõ khối lượng để báo giá GĐ1.

**Nguồn đối chiếu:** GĐ0 yêu cầu migration plan; GĐ1 pipeline nguồn cũ / Website / Facebook / YouTube / TikTok → thu thập → chuẩn hóa → khử trùng → kiểm tra quyền → gắn nhãn → thư viện → xuất bản; DAM metadata.

## 2. Đối tượng phối hợp, đầu vào và đầu ra

- **Đối tượng phối hợp dự kiến:** Đội quản trị CMS cũ, quản lý kho nội dung, quyền media/pháp lý, kỹ thuật dữ liệu và chủ hệ thống đích.
- **Đầu vào cần có:** Data/source inventory G0-02, ma trận quyền G0-03, taxonomy G0-04, conceptual data model G0-05.
- **Sản phẩm bàn giao cấp module:** Tài liệu/tập bảng khảo sát và ma trận đánh giá tổng hợp từ danh mục bên dưới; các phần được tích hợp chung trong bộ hồ sơ GĐ0, không nhất thiết mỗi Fxxx là một báo cáo riêng.
- **Phương pháp:** rà soát tài liệu và hệ thống được phép tiếp cận, phỏng vấn stakeholder, thu thập bằng chứng, lập bảng đối chiếu, trình xác nhận các điểm mở. Sự kiện khảo sát thực tế **chưa diễn ra** trong bản phân tích này.

## 3. Danh mục công việc đề xuất (10 mục)

| ID | Công việc | Nội dung | Đầu ra |
|---|---|---|---|
| G0-07-F001 | Chốt phạm vi nguồn và đích | Liệt kê hệ thống/loại nội dung, giai đoạn dữ liệu, khối lượng, phạm vi bao gồm/ngoài phạm vi. | Source-to-Target Scope Matrix với nguồn/chủ sở hữu/quyền truy cập. |
| G0-07-F002 | Khảo sát khả năng trích xuất | Đánh giá API/export/database dump/manual files, phân trang, rate limit, định dạng và môi trường thao tác. | Extraction Feasibility Matrix cùng hạn chế/tần suất. |
| G0-07-F003 | Data mapping nội dung có cấu trúc | Ánh xạ bài viết/chuyên mục/tác giả/chương trình/series/tập/nhân vật/địa danh/di sản/sự kiện/tag. | Bảng mapping entity/field, khóa/ID liên kết và mapping chưa rõ. |
| G0-07-F004 | Mapping media và metadata | Ánh xạ file gốc, rendition, thumbnail, codec/định dạng, mô tả, ngày sản xuất và nguồn nội dung. | Media Metadata Mapping và danh sách trường thiếu cần bổ sung. |
| G0-07-F005 | Cổng kiểm tra quyền trước nhập/xuất bản | Xác định rule xét quyền sở hữu/khai thác, quyền người xuất hiện/nhạc/hạn dùng theo G0-03. | Rights Gate Rules: pass/review/block và hồ sơ chứng cứ. |
| G0-07-F006 | Chiến lược chuẩn hóa và khử trùng | Xác định quy tắc URL/ID, normalized text, media checksum/hash nếu khả thi, xử lý item thiếu/trùng. | Data Quality Rules và mức xử lý thủ công/ tự động. |
| G0-07-F007 | Thiết kế pipeline batch, retry và nhật ký | Xác định luồng extract→transform→validate→import, idempotency, retry, resume, logs và báo cáo lỗi. | Migration Pipeline Diagram và yêu cầu nonfunctional. |
| G0-07-F008 | Kịch bản dry-run, kiểm thử và đối soát | Đề xuất lấy mẫu, đối soát số lượng/bản ghi/media URL/metadata/quyền, tiêu chí đạt và cách báo cáo. | Dry-run checklist và Reconciliation Plan. |
| G0-07-F009 | Chiến lược cutover, rollback và SEO | Đề xuất từng đợt chuyển, thời gian đóng băng cập nhật, redirect URL cũ, backup, fallback, trách nhiệm chốt go-live. | Cutover/Rollback Plan và bảng rủi ro. |
| G0-07-F010 | Tổng hợp khối lượng và công việc triển khai | Đếm nguồn, connector, mapping, chất lượng dữ liệu, định dạng media, khối lượng kiểm thử và xử lý thủ công. | Migration WBS Inputs để GĐ1 ước tính code/tích hợp/nhân sự. |

## 4. Phân tích công việc và đầu ra

### G0-07-F001 – Chốt phạm vi nguồn và đích

- **Nội dung:** Liệt kê hệ thống/loại nội dung, giai đoạn dữ liệu, khối lượng, phạm vi bao gồm/ngoài phạm vi.
- **Sản phẩm/bằng chứng:** Source-to-Target Scope Matrix với nguồn/chủ sở hữu/quyền truy cập.
- **Điều kiện hoàn thành ở bước khảo sát:** Ghi rõ phần nguồn chưa có API hoặc chưa cấp quyền.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-07-F002 – Khảo sát khả năng trích xuất

- **Nội dung:** Đánh giá API/export/database dump/manual files, phân trang, rate limit, định dạng và môi trường thao tác.
- **Sản phẩm/bằng chứng:** Extraction Feasibility Matrix cùng hạn chế/tần suất.
- **Điều kiện hoàn thành ở bước khảo sát:** Không thực hiện crawl hàng loạt trong GĐ0.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-07-F003 – Data mapping nội dung có cấu trúc

- **Nội dung:** Ánh xạ bài viết/chuyên mục/tác giả/chương trình/series/tập/nhân vật/địa danh/di sản/sự kiện/tag.
- **Sản phẩm/bằng chứng:** Bảng mapping entity/field, khóa/ID liên kết và mapping chưa rõ.
- **Điều kiện hoàn thành ở bước khảo sát:** Schema đích được cập nhật cùng G0-05, chưa coi là thiết kế DB cuối.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-07-F004 – Mapping media và metadata

- **Nội dung:** Ánh xạ file gốc, rendition, thumbnail, codec/định dạng, mô tả, ngày sản xuất và nguồn nội dung.
- **Sản phẩm/bằng chứng:** Media Metadata Mapping và danh sách trường thiếu cần bổ sung.
- **Điều kiện hoàn thành ở bước khảo sát:** Không chuyển đổi video/transcode thực trong GĐ0.
- **Căn cứ:** SOURCE; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-07-F005 – Cổng kiểm tra quyền trước nhập/xuất bản

- **Nội dung:** Xác định rule xét quyền sở hữu/khai thác, quyền người xuất hiện/nhạc/hạn dùng theo G0-03.
- **Sản phẩm/bằng chứng:** Rights Gate Rules: pass/review/block và hồ sơ chứng cứ.
- **Điều kiện hoàn thành ở bước khảo sát:** Không tự khẳng định quyền nội dung được phê duyệt.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-07-F006 – Chiến lược chuẩn hóa và khử trùng

- **Nội dung:** Xác định quy tắc URL/ID, normalized text, media checksum/hash nếu khả thi, xử lý item thiếu/trùng.
- **Sản phẩm/bằng chứng:** Data Quality Rules và mức xử lý thủ công/ tự động.
- **Điều kiện hoàn thành ở bước khảo sát:** Khối lượng sửa tay phải định lượng sau khi có mẫu.
- **Căn cứ:** SOURCE; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-07-F007 – Thiết kế pipeline batch, retry và nhật ký

- **Nội dung:** Xác định luồng extract→transform→validate→import, idempotency, retry, resume, logs và báo cáo lỗi.
- **Sản phẩm/bằng chứng:** Migration Pipeline Diagram và yêu cầu nonfunctional.
- **Điều kiện hoàn thành ở bước khảo sát:** Không ấn định stack công nghệ khi chưa có kiến trúc G0-05.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-07-F008 – Kịch bản dry-run, kiểm thử và đối soát

- **Nội dung:** Đề xuất lấy mẫu, đối soát số lượng/bản ghi/media URL/metadata/quyền, tiêu chí đạt và cách báo cáo.
- **Sản phẩm/bằng chứng:** Dry-run checklist và Reconciliation Plan.
- **Điều kiện hoàn thành ở bước khảo sát:** Kết quả kiểm thử chỉ có sau khi chạy ở GĐ1.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-07-F009 – Chiến lược cutover, rollback và SEO

- **Nội dung:** Đề xuất từng đợt chuyển, thời gian đóng băng cập nhật, redirect URL cũ, backup, fallback, trách nhiệm chốt go-live.
- **Sản phẩm/bằng chứng:** Cutover/Rollback Plan và bảng rủi ro.
- **Điều kiện hoàn thành ở bước khảo sát:** Không cam kết downtime nếu chưa có kế hoạch vận hành.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-07-F010 – Tổng hợp khối lượng và công việc triển khai

- **Nội dung:** Đếm nguồn, connector, mapping, chất lượng dữ liệu, định dạng media, khối lượng kiểm thử và xử lý thủ công.
- **Sản phẩm/bằng chứng:** Migration WBS Inputs để GĐ1 ước tính code/tích hợp/nhân sự.
- **Điều kiện hoàn thành ở bước khảo sát:** Đây là input effort; chưa tính giờ FE/BE hoặc MD.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.


## 5. Giới hạn phạm vi và tránh trùng lặp

Xây migration strategy, không chạy migration thật, không tự thu thập nội dung trái quyền; việc xây connector, import/rollback ở GĐ1.

## 6. Rủi ro và dữ kiện còn thiếu

- Quyền và điều khoản nền tảng ngoài có thể khiến nội dung chỉ phù hợp nhúng thay vì tải về.
- Metadata video/thời hạn bản quyền không đầy đủ sẽ phát sinh kiểm tra thủ công.
- Mất liên kết SEO/URL và duplicate content nếu migration không có mapping và redirect.
- Khối lượng khảo sát (số hệ thống/nguồn dữ liệu/buổi workshop/màn hình/tài liệu) chưa có xác nhận và phải là input khi dự toán.
- Nội dung chưa có bằng chứng được đánh dấu `TBC` kèm người/phương thức xác minh.

## 7. Nghiệm thu ở cấp module và bước tiếp theo

Một hạng mục khảo sát chỉ coi là hoàn thành khi có **sản phẩm/bảng kiểm/biên bản** được chỉ ra trong từng công việc, ghi **nguồn bằng chứng**, giới hạn khảo sát và câu hỏi đang mở; chủ sở hữu nghiệp vụ của VTV8 phải có cơ hội rà soát. **Chưa tự coi là đã nghiệm thu khi mới tạo tài liệu kế hoạch này.**

**Trạng thái hiện tại:** Danh mục Fxxx đã được **soạn đầy đủ để rà soát**, không tự coi là chốt bởi khách hàng hoặc đã thực thi. Sau khi thống nhất toàn bộ GĐ0 mới tiến hành xác định khối lượng và phương pháp effort cho GĐ0, không gán giờ code giả tạo.
