# G0-02 – Khảo sát hiện trạng hệ thống và tài sản số

> **Trạng thái module GĐ0:** Đã thống nhất nội bộ tên, mục tiêu và ranh giới module (09/10/2026).  
> **Danh sách công việc Fxxx:** DRAFT – đề xuất đầy đủ để rà soát toàn bộ GĐ0; chưa chốt nội bộ từng danh sách, chưa được VTV8 xác nhận.  
> **Chưa tính:** FE/BE Middle Developer, BA/Design/QA, MD, giá, timeline chi tiết.

## 1. Mục tiêu

Lập bức tranh AS-IS có bằng chứng về phần mềm, dữ liệu, kênh phân phối, hạ tầng và lưu lượng; phân loại thành phần có khả năng kế thừa.

**Nguồn đối chiếu:** GĐ0: kiểm kê nền tảng hiện có, nội dung từ 2023; GĐ1: đồng bộ dữ liệu cũ; bối cảnh: quy mô bài viết/video và người xem.

## 2. Đối tượng phối hợp, đầu vào và đầu ra

- **Đối tượng phối hợp dự kiến:** Đại diện quản trị website/CMS, quản trị hạ tầng, nhóm phát triển hiện hữu, quản lý kho nội dung và chủ tài khoản các kênh số.
- **Đầu vào cần có:** Quyền xem website/CMS, repository hoặc tài liệu kỹ thuật (nếu được cung cấp), thống kê database/storage, tài liệu API, dashboard traffic và danh sách tài khoản kênh.
- **Sản phẩm bàn giao cấp module:** Tài liệu/tập bảng khảo sát và ma trận đánh giá tổng hợp từ danh mục bên dưới; các phần được tích hợp chung trong bộ hồ sơ GĐ0, không nhất thiết mỗi Fxxx là một báo cáo riêng.
- **Phương pháp:** rà soát tài liệu và hệ thống được phép tiếp cận, phỏng vấn stakeholder, thu thập bằng chứng, lập bảng đối chiếu, trình xác nhận các điểm mở. Sự kiện khảo sát thực tế **chưa diễn ra** trong bản phân tích này.

## 3. Danh mục công việc đề xuất (10 mục)

| ID | Công việc | Nội dung | Đầu ra |
|---|---|---|---|
| G0-02-F001 | Khảo sát website hiện tại | Liệt kê loại trang, chuyên mục, URL, tìm kiếm, SEO, responsive, điểm bất thường và chức năng đang vận hành. | Danh sách URL mẫu, page types, chức năng đang có/còn thiếu, ảnh minh chứng. |
| G0-02-F002 | Khảo sát CMS hiện tại | Ghi nhận màn hình, quản lý bài viết/chương trình/media, tài khoản, workflow duyệt/xuất bản, báo cáo và khả năng xuất dữ liệu. | Danh sách menu/module CMS, quyền truy cập được cấp và chức năng thực tế. |
| G0-02-F003 | Khảo sát mã nguồn và công nghệ | Kiểm tra công nghệ, repository, dependency, môi trường build, tình trạng bảo trì và điểm chặn kế thừa (nếu được phép đọc mã). | Ma trận codebase/stack/version/dependency và rủi ro kỹ thuật. |
| G0-02-F004 | Khảo sát database, API và tích hợp | Kiểm kê loại database, schema cấp cao, nhóm dữ liệu, danh sách API, bên sở hữu, loại xác thực, tích hợp hiện hữu. | Sơ đồ nguồn dữ liệu và bảng inventory endpoint/integration cấp cao. |
| G0-02-F005 | Khảo sát hạ tầng và vận hành | Kiểm kê môi trường, hosting/cloud/server, domain/DNS, storage, backup, phân quyền hệ thống, quy trình release, monitoring và trách nhiệm vận hành. | Bảng tài nguyên/môi trường và trạng thái tài liệu backup/log/giám sát. |
| G0-02-F006 | Kiểm kê kho tài sản số | Đếm theo nguồn/loại nội dung: bài viết, hình ảnh, chương trình, series, tập, video/file gốc/bản phát; dung lượng, định dạng và thời gian. | Bảng số lượng, dung lượng, định dạng, nơi lưu, khoảng thời gian bao phủ và phương pháp lấy số liệu. |
| G0-02-F007 | Khảo sát các kênh nội dung bên ngoài | Ghi nhận các kênh Facebook/TikTok/YouTube, cấu trúc nội dung, mức quyền quản trị, dữ liệu có thể xuất, API và hạn chế quyền truy cập. | Inventory kênh, người quản lý, định dạng được hỗ trợ, dữ liệu truy cập được/không được. |
| G0-02-F008 | Đánh giá chất lượng dữ liệu hiện có | Chọn mẫu đại diện để kiểm tra metadata, nội dung thiếu, ID/URL bất nhất, trùng lặp, broken links và liên kết bài–video–chương trình. | Báo cáo tỷ lệ lỗi theo mẫu, tiêu chí chọn mẫu, vấn đề dữ liệu và độ tin cậy. |
| G0-02-F009 | Khảo sát lưu lượng và hiệu năng thực tế | Tổng hợp traffic, người dùng đồng thời, lượt xem video, peak, log lỗi, tình trạng dừng/giật và công cụ đo hiện hữu. | Baseline từ logs/analytics thực có, khoảng thời gian đo và ghi chú chưa kiểm chứng. |
| G0-02-F010 | Đánh giá khả năng kế thừa và báo cáo hiện trạng | Tổng hợp F001–F009 để phân loại các thành phần giữ nguyên/nâng cấp/thay thế/chưa đủ dữ liệu. | Reuse Matrix và báo cáo AS-IS có luận cứ/nguồn bằng chứng, phạm vi chưa khảo sát. |

## 4. Phân tích công việc và đầu ra

### G0-02-F001 – Khảo sát website hiện tại

- **Nội dung:** Liệt kê loại trang, chuyên mục, URL, tìm kiếm, SEO, responsive, điểm bất thường và chức năng đang vận hành.
- **Sản phẩm/bằng chứng:** Danh sách URL mẫu, page types, chức năng đang có/còn thiếu, ảnh minh chứng.
- **Điều kiện hoàn thành ở bước khảo sát:** Bản kiểm kê website kèm nguồn đối chiếu.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-02-F002 – Khảo sát CMS hiện tại

- **Nội dung:** Ghi nhận màn hình, quản lý bài viết/chương trình/media, tài khoản, workflow duyệt/xuất bản, báo cáo và khả năng xuất dữ liệu.
- **Sản phẩm/bằng chứng:** Danh sách menu/module CMS, quyền truy cập được cấp và chức năng thực tế.
- **Điều kiện hoàn thành ở bước khảo sát:** Bản kiểm kê CMS AS-IS, không thay thế phân tích quy trình của G0-01.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-02-F003 – Khảo sát mã nguồn và công nghệ

- **Nội dung:** Kiểm tra công nghệ, repository, dependency, môi trường build, tình trạng bảo trì và điểm chặn kế thừa (nếu được phép đọc mã).
- **Sản phẩm/bằng chứng:** Ma trận codebase/stack/version/dependency và rủi ro kỹ thuật.
- **Điều kiện hoàn thành ở bước khảo sát:** Kết luận sơ bộ mức độ tiếp cận mã nguồn và khả năng tiếp tục phát triển.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-02-F004 – Khảo sát database, API và tích hợp

- **Nội dung:** Kiểm kê loại database, schema cấp cao, nhóm dữ liệu, danh sách API, bên sở hữu, loại xác thực, tích hợp hiện hữu.
- **Sản phẩm/bằng chứng:** Sơ đồ nguồn dữ liệu và bảng inventory endpoint/integration cấp cao.
- **Điều kiện hoàn thành ở bước khảo sát:** Không tự vẽ API/schema mới; ghi rõ phần không có quyền truy cập.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-02-F005 – Khảo sát hạ tầng và vận hành

- **Nội dung:** Kiểm kê môi trường, hosting/cloud/server, domain/DNS, storage, backup, phân quyền hệ thống, quy trình release, monitoring và trách nhiệm vận hành.
- **Sản phẩm/bằng chứng:** Bảng tài nguyên/môi trường và trạng thái tài liệu backup/log/giám sát.
- **Điều kiện hoàn thành ở bước khảo sát:** Không thực hiện penetration test hoặc thay đổi production.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-02-F006 – Kiểm kê kho tài sản số

- **Nội dung:** Đếm theo nguồn/loại nội dung: bài viết, hình ảnh, chương trình, series, tập, video/file gốc/bản phát; dung lượng, định dạng và thời gian.
- **Sản phẩm/bằng chứng:** Bảng số lượng, dung lượng, định dạng, nơi lưu, khoảng thời gian bao phủ và phương pháp lấy số liệu.
- **Điều kiện hoàn thành ở bước khảo sát:** Không coi mốc 70 bài/ngày và 20 GB/ngày trong đề xuất là kết quả kiểm kê thực tế.
- **Căn cứ:** SOURCE; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-02-F007 – Khảo sát các kênh nội dung bên ngoài

- **Nội dung:** Ghi nhận các kênh Facebook/TikTok/YouTube, cấu trúc nội dung, mức quyền quản trị, dữ liệu có thể xuất, API và hạn chế quyền truy cập.
- **Sản phẩm/bằng chứng:** Inventory kênh, người quản lý, định dạng được hỗ trợ, dữ liệu truy cập được/không được.
- **Điều kiện hoàn thành ở bước khảo sát:** Không khẳng định có quyền sao chép hoặc tái phân phối nội dung.
- **Căn cứ:** SOURCE; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-02-F008 – Đánh giá chất lượng dữ liệu hiện có

- **Nội dung:** Chọn mẫu đại diện để kiểm tra metadata, nội dung thiếu, ID/URL bất nhất, trùng lặp, broken links và liên kết bài–video–chương trình.
- **Sản phẩm/bằng chứng:** Báo cáo tỷ lệ lỗi theo mẫu, tiêu chí chọn mẫu, vấn đề dữ liệu và độ tin cậy.
- **Điều kiện hoàn thành ở bước khảo sát:** Không làm sạch dữ liệu hàng loạt hoặc chạy migration.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-02-F009 – Khảo sát lưu lượng và hiệu năng thực tế

- **Nội dung:** Tổng hợp traffic, người dùng đồng thời, lượt xem video, peak, log lỗi, tình trạng dừng/giật và công cụ đo hiện hữu.
- **Sản phẩm/bằng chứng:** Baseline từ logs/analytics thực có, khoảng thời gian đo và ghi chú chưa kiểm chứng.
- **Điều kiện hoàn thành ở bước khảo sát:** Phân biệt CCU website và CCU người xem stream; G0-06 phân tích tải tương lai.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-02-F010 – Đánh giá khả năng kế thừa và báo cáo hiện trạng

- **Nội dung:** Tổng hợp F001–F009 để phân loại các thành phần giữ nguyên/nâng cấp/thay thế/chưa đủ dữ liệu.
- **Sản phẩm/bằng chứng:** Reuse Matrix và báo cáo AS-IS có luận cứ/nguồn bằng chứng, phạm vi chưa khảo sát.
- **Điều kiện hoàn thành ở bước khảo sát:** Đây là khuyến nghị sơ bộ; quyết định kiến trúc cuối cùng thuộc G0-05/G0-06.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.


## 5. Giới hạn phạm vi và tránh trùng lặp

Chỉ khảo sát và lập đánh giá AS-IS. Nghiệp vụ người dùng là G0-01; quyền sở hữu/pháp lý là G0-03; kiến trúc mới là G0-05; streaming sâu là G0-06; mapping/công cụ migration là G0-07.

## 6. Rủi ro và dữ kiện còn thiếu

- VTV8 có thể không cung cấp source code hoặc quyền quản trị; kết luận cần phản ánh mức độ bằng chứng.
- Nội dung trên nền tảng ngoài có thể không xuất được đầy đủ bằng API.
- Khối lượng dữ liệu, tỷ lệ trùng lặp và CCU cần được đo/xác nhận thay vì suy luận từ đề xuất.
- Khối lượng khảo sát (số hệ thống/nguồn dữ liệu/buổi workshop/màn hình/tài liệu) chưa có xác nhận và phải là input khi dự toán.
- Nội dung chưa có bằng chứng được đánh dấu `TBC` kèm người/phương thức xác minh.

## 7. Nghiệm thu ở cấp module và bước tiếp theo

Một hạng mục khảo sát chỉ coi là hoàn thành khi có **sản phẩm/bảng kiểm/biên bản** được chỉ ra trong từng công việc, ghi **nguồn bằng chứng**, giới hạn khảo sát và câu hỏi đang mở; chủ sở hữu nghiệp vụ của VTV8 phải có cơ hội rà soát. **Chưa tự coi là đã nghiệm thu khi mới tạo tài liệu kế hoạch này.**

**Trạng thái hiện tại:** Danh mục Fxxx đã được **soạn đầy đủ để rà soát**, không tự coi là chốt bởi khách hàng hoặc đã thực thi. Sau khi thống nhất toàn bộ GĐ0 mới tiến hành xác định khối lượng và phương pháp effort cho GĐ0, không gán giờ code giả tạo.
