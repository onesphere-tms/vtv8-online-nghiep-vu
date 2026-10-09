# G0-03 – Phân tích bản quyền, giấy phép và điều kiện khai thác

> **Trạng thái module GĐ0:** Đã thống nhất nội bộ tên, mục tiêu và ranh giới module (09/10/2026).  
> **Danh sách công việc Fxxx:** DRAFT – đề xuất đầy đủ để rà soát toàn bộ GĐ0; chưa chốt nội bộ từng danh sách, chưa được VTV8 xác nhận.  
> **Chưa tính:** FE/BE Middle Developer, BA/Design/QA, MD, giá, timeline chi tiết.

## 1. Mục tiêu

Xác định điều kiện sử dụng tài sản nội dung và yêu cầu kiểm soát quyền để tránh đưa tính năng hoặc khối lượng migration không đủ quyền vào phạm vi giá cố định.

**Nguồn đối chiếu:** GĐ0: phân loại quyền sở hữu từng loại nội dung, tình trạng giấy phép và quyền hình ảnh/âm nhạc/footage/chương trình; GĐ1: quyền trên asset media; GĐ2: tương tác, paywall, DRM có điều kiện.

## 2. Đối tượng phối hợp, đầu vào và đầu ra

- **Đối tượng phối hợp dự kiến:** Đại diện VTV8 quản lý bản quyền/giấy phép, đơn vị sản xuất nội dung, đối tác cung cấp tư liệu, bộ phận pháp lý và nhóm sản phẩm.
- **Đầu vào cần có:** Danh mục asset từ G0-02; hồ sơ hợp đồng/giấy phép/quyền liên quan do VTV8 cung cấp; mô hình sử dụng nội dung dự kiến GĐ1–GĐ4.
- **Sản phẩm bàn giao cấp module:** Tài liệu/tập bảng khảo sát và ma trận đánh giá tổng hợp từ danh mục bên dưới; các phần được tích hợp chung trong bộ hồ sơ GĐ0, không nhất thiết mỗi Fxxx là một báo cáo riêng.
- **Phương pháp:** rà soát tài liệu và hệ thống được phép tiếp cận, phỏng vấn stakeholder, thu thập bằng chứng, lập bảng đối chiếu, trình xác nhận các điểm mở. Sự kiện khảo sát thực tế **chưa diễn ra** trong bản phân tích này.

## 3. Danh mục công việc đề xuất (9 mục)

| ID | Công việc | Nội dung | Đầu ra |
|---|---|---|---|
| G0-03-F001 | Phân nhóm tài sản và chủ thể quyền | Phân loại bài viết, ảnh, video, chương trình, footage, nhạc, live recording theo người/đơn vị sở hữu và nguồn gốc. | Bảng loại asset – chủ thể quyền – bằng chứng hợp đồng/tài liệu. |
| G0-03-F002 | Kiểm kê điều kiện sử dụng video/hình ảnh/âm nhạc | Làm rõ quyền phát lại, sửa dựng, cắt clip, tạo phụ đề, lưu trữ và phân phối theo kênh/thiết bị/địa lý. | Rights Matrix theo loại tác phẩm, phạm vi dùng và hạn chế. |
| G0-03-F003 | Kiểm tra nguồn nội dung từ nền tảng bên thứ ba | Phân biệt dữ liệu do VTV8 tạo sở hữu, nội dung được cấp phép và quyền theo điều khoản Facebook/TikTok/YouTube. | Danh sách nguồn/loại nội dung cần xác minh trước nhập kho và phát lại. |
| G0-03-F004 | Rà soát giấy phép hoạt động theo chức năng | Thu thập danh mục giấy phép/điều kiện hiện có liên quan phát nội dung, tương tác, thương mại và dịch vụ trả phí. | Ma trận loại nghiệp vụ → điều kiện pháp lý cần xác nhận → đơn vị chịu trách nhiệm. |
| G0-03-F005 | Đặc tả metadata quyền trong DAM/CMS | Xác định thông tin phải ghi cho mỗi asset: nguồn, chủ quyền, phạm vi/điều kiện sử dụng, hạn dùng, bằng chứng, trạng thái xác minh. | Danh mục trường nghiệp vụ quản lý quyền và business rules tham chiếu GĐ1. |
| G0-03-F006 | Quy trình xét duyệt quyền trước xuất bản/nhập kho | Xác định bước kiểm tra quyền, cấp phê duyệt, tình huống quyền hết hạn/không rõ/hạn chế. | Sơ đồ workflow quyền và quy tắc chặn/cảnh báo. |
| G0-03-F007 | Phân định trách nhiệm và phê duyệt | Xác định ai lập hồ sơ, ai cung cấp chứng cứ, ai xác nhận quyền và ai xử lý khiếu nại. | RACI kiểm soát quyền; danh sách cơ chế bàn giao yêu cầu kỹ thuật. |
| G0-03-F008 | Ràng buộc giai đoạn tương lai | Xem xét ràng buộc đối với comment/community, VOD trả phí/DRM, video 2K–8K, quảng cáo/affiliate và AI khai thác dữ liệu. | Danh mục điều kiện mở khóa tính năng theo GĐ2–GĐ4. |
| G0-03-F009 | Tổng hợp rủi ro và hồ sơ xin xác nhận | Nhận diện nội dung thiếu hợp đồng, hồ sơ quyền không đầy đủ, hạn khai thác hoặc xung đột phân phối. | Rights Risk Register, danh sách câu hỏi pháp lý và quyết định đang chờ. |

## 4. Phân tích công việc và đầu ra

### G0-03-F001 – Phân nhóm tài sản và chủ thể quyền

- **Nội dung:** Phân loại bài viết, ảnh, video, chương trình, footage, nhạc, live recording theo người/đơn vị sở hữu và nguồn gốc.
- **Sản phẩm/bằng chứng:** Bảng loại asset – chủ thể quyền – bằng chứng hợp đồng/tài liệu.
- **Điều kiện hoàn thành ở bước khảo sát:** Mỗi nhóm tài sản có phương án tra cứu quyền hoặc trạng thái chưa rõ.
- **Căn cứ:** SOURCE; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-03-F002 – Kiểm kê điều kiện sử dụng video/hình ảnh/âm nhạc

- **Nội dung:** Làm rõ quyền phát lại, sửa dựng, cắt clip, tạo phụ đề, lưu trữ và phân phối theo kênh/thiết bị/địa lý.
- **Sản phẩm/bằng chứng:** Rights Matrix theo loại tác phẩm, phạm vi dùng và hạn chế.
- **Điều kiện hoàn thành ở bước khảo sát:** Không mặc định quyền đăng trên mạng xã hội đồng nghĩa quyền tự lưu và phát trên website.
- **Căn cứ:** SOURCE; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-03-F003 – Kiểm tra nguồn nội dung từ nền tảng bên thứ ba

- **Nội dung:** Phân biệt dữ liệu do VTV8 tạo sở hữu, nội dung được cấp phép và quyền theo điều khoản Facebook/TikTok/YouTube.
- **Sản phẩm/bằng chứng:** Danh sách nguồn/loại nội dung cần xác minh trước nhập kho và phát lại.
- **Điều kiện hoàn thành ở bước khảo sát:** Chưa quyết định tự động tải video nếu không có cơ sở quyền và phương thức được phép.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-03-F004 – Rà soát giấy phép hoạt động theo chức năng

- **Nội dung:** Thu thập danh mục giấy phép/điều kiện hiện có liên quan phát nội dung, tương tác, thương mại và dịch vụ trả phí.
- **Sản phẩm/bằng chứng:** Ma trận loại nghiệp vụ → điều kiện pháp lý cần xác nhận → đơn vị chịu trách nhiệm.
- **Điều kiện hoàn thành ở bước khảo sát:** Chỉ ghi điều kiện cần kiểm chứng, không tự công bố đầy đủ giấy phép đã có.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-03-F005 – Đặc tả metadata quyền trong DAM/CMS

- **Nội dung:** Xác định thông tin phải ghi cho mỗi asset: nguồn, chủ quyền, phạm vi/điều kiện sử dụng, hạn dùng, bằng chứng, trạng thái xác minh.
- **Sản phẩm/bằng chứng:** Danh mục trường nghiệp vụ quản lý quyền và business rules tham chiếu GĐ1.
- **Điều kiện hoàn thành ở bước khảo sát:** Không thiết kế bảng DB/API (G0-05) hay code DAM (GĐ1).
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-03-F006 – Quy trình xét duyệt quyền trước xuất bản/nhập kho

- **Nội dung:** Xác định bước kiểm tra quyền, cấp phê duyệt, tình huống quyền hết hạn/không rõ/hạn chế.
- **Sản phẩm/bằng chứng:** Sơ đồ workflow quyền và quy tắc chặn/cảnh báo.
- **Điều kiện hoàn thành ở bước khảo sát:** Chỉ phân tích quy trình nghiệp vụ, chưa triển khai tự động hóa.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-03-F007 – Phân định trách nhiệm và phê duyệt

- **Nội dung:** Xác định ai lập hồ sơ, ai cung cấp chứng cứ, ai xác nhận quyền và ai xử lý khiếu nại.
- **Sản phẩm/bằng chứng:** RACI kiểm soát quyền; danh sách cơ chế bàn giao yêu cầu kỹ thuật.
- **Điều kiện hoàn thành ở bước khảo sát:** VTV8 xác nhận quyền/giấy phép, không chuyển trách nhiệm pháp lý cho tool phân tích.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-03-F008 – Ràng buộc giai đoạn tương lai

- **Nội dung:** Xem xét ràng buộc đối với comment/community, VOD trả phí/DRM, video 2K–8K, quảng cáo/affiliate và AI khai thác dữ liệu.
- **Sản phẩm/bằng chứng:** Danh mục điều kiện mở khóa tính năng theo GĐ2–GĐ4.
- **Điều kiện hoàn thành ở bước khảo sát:** Tính năng chưa đủ cơ sở pháp lý được đánh dấu TBC/OPTIONAL thay vì mặc định included.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-03-F009 – Tổng hợp rủi ro và hồ sơ xin xác nhận

- **Nội dung:** Nhận diện nội dung thiếu hợp đồng, hồ sơ quyền không đầy đủ, hạn khai thác hoặc xung đột phân phối.
- **Sản phẩm/bằng chứng:** Rights Risk Register, danh sách câu hỏi pháp lý và quyết định đang chờ.
- **Điều kiện hoàn thành ở bước khảo sát:** Không kết luận quyền hợp pháp khi thiếu tài liệu/bằng chứng.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.


## 5. Giới hạn phạm vi và tránh trùng lặp

Là phân tích ràng buộc nghiệp vụ và ma trận kiểm soát quyền, KHÔNG phải dịch vụ kết luận hoặc tư vấn pháp lý chính thức; việc xác nhận hiệu lực pháp lý do VTV8/bộ phận pháp lý có thẩm quyền thực hiện.

## 6. Rủi ro và dữ kiện còn thiếu

- Thiếu hồ sơ hợp đồng/giấy phép sẽ khiến quyền sử dụng phải để TBC.
- Một tài sản có thể chứa nhiều lớp quyền độc lập: chương trình, nhạc, người xuất hiện, ảnh/footage.
- Điều kiện luật/giấy phép cụ thể cần chuyên gia pháp lý xác minh tại thời điểm triển khai.
- Khối lượng khảo sát (số hệ thống/nguồn dữ liệu/buổi workshop/màn hình/tài liệu) chưa có xác nhận và phải là input khi dự toán.
- Nội dung chưa có bằng chứng được đánh dấu `TBC` kèm người/phương thức xác minh.

## 7. Nghiệm thu ở cấp module và bước tiếp theo

Một hạng mục khảo sát chỉ coi là hoàn thành khi có **sản phẩm/bảng kiểm/biên bản** được chỉ ra trong từng công việc, ghi **nguồn bằng chứng**, giới hạn khảo sát và câu hỏi đang mở; chủ sở hữu nghiệp vụ của VTV8 phải có cơ hội rà soát. **Chưa tự coi là đã nghiệm thu khi mới tạo tài liệu kế hoạch này.**

**Trạng thái hiện tại:** Danh mục Fxxx đã được **soạn đầy đủ để rà soát**, không tự coi là chốt bởi khách hàng hoặc đã thực thi. Sau khi thống nhất toàn bộ GĐ0 mới tiến hành xác định khối lượng và phương pháp effort cho GĐ0, không gán giờ code giả tạo.
