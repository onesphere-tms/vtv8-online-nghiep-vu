# G0-08 – Xây dựng hồ sơ triển khai, nghiệm thu và dự toán

> **Trạng thái module GĐ0:** Đã thống nhất nội bộ tên, mục tiêu và ranh giới module (09/10/2026).  
> **Danh sách công việc Fxxx:** DRAFT – đề xuất đầy đủ để rà soát toàn bộ GĐ0; chưa chốt nội bộ từng danh sách, chưa được VTV8 xác nhận.  
> **Chưa tính:** FE/BE Middle Developer, BA/Design/QA, MD, giá, timeline chi tiết.

## 1. Mục tiêu

Đóng gói đầu ra GĐ0 thành bộ hồ sơ quyết định phạm vi và căn cứ báo giá từng giai đoạn, tách phần chắc chắn/phương án/giả định và chi phí vendor.

**Nguồn đối chiếu:** GĐ0 là bước trước lập dự toán đầu tư chính thức; tài liệu nguồn nêu lộ trình GĐ0–GĐ4 và vai trò hợp tác VTV8–IIEL.

## 2. Đối tượng phối hợp, đầu vào và đầu ra

- **Đối tượng phối hợp dự kiến:** Product owner/ban chỉ đạo, BA, technical lead, UX lead, phụ trách media, phụ trách tài chính/hợp đồng và đại diện VTV8 phê duyệt.
- **Đầu vào cần có:** Các tài liệu và open questions của G0-01 đến G0-07, giới hạn template báo giá Excel và quyết định nhà cung cấp/giấy phép.
- **Sản phẩm bàn giao cấp module:** Tài liệu/tập bảng khảo sát và ma trận đánh giá tổng hợp từ danh mục bên dưới; các phần được tích hợp chung trong bộ hồ sơ GĐ0, không nhất thiết mỗi Fxxx là một báo cáo riêng.
- **Phương pháp:** rà soát tài liệu và hệ thống được phép tiếp cận, phỏng vấn stakeholder, thu thập bằng chứng, lập bảng đối chiếu, trình xác nhận các điểm mở. Sự kiện khảo sát thực tế **chưa diễn ra** trong bản phân tích này.

## 3. Danh mục công việc đề xuất (11 mục)

| ID | Công việc | Nội dung | Đầu ra |
|---|---|---|---|
| G0-08-F001 | Tổng hợp và phân loại yêu cầu/phạm vi | Hợp nhất các yêu cầu theo GĐ0–GĐ4, đánh dấu SOURCE/PROPOSED/TBC, Included/Optional/Excluded và trạng thái xác nhận. | Scope Register có ID, ranh giới và nguồn căn cứ. |
| G0-08-F002 | Phân rã WBS theo giai đoạn/module/feature | Tạo WBS cho GĐ1 ở mức có thể ước tính khi đủ dữ kiện; GĐ2–GĐ4 theo kịch bản và mức chi tiết phù hợp. | WBS theo phase/module/feature, ghi rõ làm mới hay nâng cấp/tái sử dụng. |
| G0-08-F003 | Danh mục sản phẩm bàn giao và nghiệm thu | Định nghĩa deliverable theo module/giai đoạn, thành phần bàn giao và acceptance criteria kiểm chứng được. | Deliverable & Acceptance Matrix có người xác nhận. |
| G0-08-F004 | Ma trận phụ thuộc, tích hợp và trách nhiệm | Gắn phụ thuộc codebase, dữ liệu, quyền, giấy phép, streaming vendor, payment/partner và người chịu trách nhiệm. | Dependency/RACI Matrix, điều kiện tiên quyết và các blocker. |
| G0-08-F005 | Mô hình nhân sự và tổ chức thực hiện | Xác định các vai trò BA, UX, architecture, FE, BE, QA, DevOps, media và cách huy động theo công đoạn. | Staffing/Role plan sơ bộ và phạm vi trách nhiệm. |
| G0-08-F006 | Roadmap, milestone và tiến độ | Xếp thứ tự các giai đoạn, hạng mục có thể song song, mốc khảo sát/thiết kế/kiểm thử/nghiệm thu và đường găng. | Timeline/Roadmap cấp pha cùng các giả định tiến độ. |
| G0-08-F007 | Quy tắc effort và hạch toán BA/Design | Lập nguyên tắc: code feature theo giờ 1 Middle FE/BE, Excel tính BA/Design/QA từ coding; GĐ0 tư vấn riêng và loại chi phí đã bàn giao khỏi phần tính trùng. | Estimation Rules & Overlap Register. |
| G0-08-F008 | Tách chi phí phát triển và chi phí vận hành | Phân loại development, DevOps/QA đặc biệt, media CDN/egress/storage, DRM, AI API, license, duy trì/bảo trì, dự phòng. | Cost Category Matrix: one-time, recurring, usage và bên thanh toán. |
| G0-08-F009 | Phương án đầu tư, rủi ro và giả định | Tạo lựa chọn theo phương án streaming VTVcab/tự vận hành, commerce A/B/C và công nghệ tương ứng; rủi ro nguồn dữ liệu/pháp lý. | Option & Risk Register, Assumption/Exclusion List. |
| G0-08-F010 | Quản trị thay đổi và hồ sơ quyết định | Xác định owner, quy trình xử lý yêu cầu mới, cách chốt baseline và ảnh hưởng effort/timeline. | Decision Log, Change Control Protocol và danh sách approval cần có. |
| G0-08-F011 | Ánh xạ vào workbook báo giá và rà soát | Ánh xạ WBS sang Overview/DetailEstimation/Team Estimation/Timeline/Assumption/Config, rà soát công thức và các nhóm chi phí. | Quotation Input Checklist và mapping WBS→Excel. |

## 4. Phân tích công việc và đầu ra

### G0-08-F001 – Tổng hợp và phân loại yêu cầu/phạm vi

- **Nội dung:** Hợp nhất các yêu cầu theo GĐ0–GĐ4, đánh dấu SOURCE/PROPOSED/TBC, Included/Optional/Excluded và trạng thái xác nhận.
- **Sản phẩm/bằng chứng:** Scope Register có ID, ranh giới và nguồn căn cứ.
- **Điều kiện hoàn thành ở bước khảo sát:** Không biến backlog chưa được VTV8 duyệt thành phạm vi hợp đồng.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-08-F002 – Phân rã WBS theo giai đoạn/module/feature

- **Nội dung:** Tạo WBS cho GĐ1 ở mức có thể ước tính khi đủ dữ kiện; GĐ2–GĐ4 theo kịch bản và mức chi tiết phù hợp.
- **Sản phẩm/bằng chứng:** WBS theo phase/module/feature, ghi rõ làm mới hay nâng cấp/tái sử dụng.
- **Điều kiện hoàn thành ở bước khảo sát:** Không ước tính coding khi tính năng chưa chốt.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-08-F003 – Danh mục sản phẩm bàn giao và nghiệm thu

- **Nội dung:** Định nghĩa deliverable theo module/giai đoạn, thành phần bàn giao và acceptance criteria kiểm chứng được.
- **Sản phẩm/bằng chứng:** Deliverable & Acceptance Matrix có người xác nhận.
- **Điều kiện hoàn thành ở bước khảo sát:** Không mặc định duyệt khi chưa có biên bản/approval.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-08-F004 – Ma trận phụ thuộc, tích hợp và trách nhiệm

- **Nội dung:** Gắn phụ thuộc codebase, dữ liệu, quyền, giấy phép, streaming vendor, payment/partner và người chịu trách nhiệm.
- **Sản phẩm/bằng chứng:** Dependency/RACI Matrix, điều kiện tiên quyết và các blocker.
- **Điều kiện hoàn thành ở bước khảo sát:** Các phụ thuộc vendor TBC không được ẩn trong giá code.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-08-F005 – Mô hình nhân sự và tổ chức thực hiện

- **Nội dung:** Xác định các vai trò BA, UX, architecture, FE, BE, QA, DevOps, media và cách huy động theo công đoạn.
- **Sản phẩm/bằng chứng:** Staffing/Role plan sơ bộ và phạm vi trách nhiệm.
- **Điều kiện hoàn thành ở bước khảo sát:** Đơn giá và số nhân sự cụ thể chỉ ghi khi có thông tin xác nhận.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-08-F006 – Roadmap, milestone và tiến độ

- **Nội dung:** Xếp thứ tự các giai đoạn, hạng mục có thể song song, mốc khảo sát/thiết kế/kiểm thử/nghiệm thu và đường găng.
- **Sản phẩm/bằng chứng:** Timeline/Roadmap cấp pha cùng các giả định tiến độ.
- **Điều kiện hoàn thành ở bước khảo sát:** 2–4 tuần GĐ0, 8–12 tuần GĐ1 là dự kiến nguồn, không cam kết lịch chưa thẩm định.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-08-F007 – Quy tắc effort và hạch toán BA/Design

- **Nội dung:** Lập nguyên tắc: code feature theo giờ 1 Middle FE/BE, Excel tính BA/Design/QA từ coding; GĐ0 tư vấn riêng và loại chi phí đã bàn giao khỏi phần tính trùng.
- **Sản phẩm/bằng chứng:** Estimation Rules & Overlap Register.
- **Điều kiện hoàn thành ở bước khảo sát:** Không gán giờ code giả cho khảo sát hoặc cộng trùng BA/Design GĐ0 và GĐ1.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-08-F008 – Tách chi phí phát triển và chi phí vận hành

- **Nội dung:** Phân loại development, DevOps/QA đặc biệt, media CDN/egress/storage, DRM, AI API, license, duy trì/bảo trì, dự phòng.
- **Sản phẩm/bằng chứng:** Cost Category Matrix: one-time, recurring, usage và bên thanh toán.
- **Điều kiện hoàn thành ở bước khảo sát:** Không chèn chi phí vendor chưa chốt dưới dạng con số chắc chắn.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-08-F009 – Phương án đầu tư, rủi ro và giả định

- **Nội dung:** Tạo lựa chọn theo phương án streaming VTVcab/tự vận hành, commerce A/B/C và công nghệ tương ứng; rủi ro nguồn dữ liệu/pháp lý.
- **Sản phẩm/bằng chứng:** Option & Risk Register, Assumption/Exclusion List.
- **Điều kiện hoàn thành ở bước khảo sát:** Không trình bày chọn công nghệ/phương án thương mại đã được quyết định nếu mới là đề xuất.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-08-F010 – Quản trị thay đổi và hồ sơ quyết định

- **Nội dung:** Xác định owner, quy trình xử lý yêu cầu mới, cách chốt baseline và ảnh hưởng effort/timeline.
- **Sản phẩm/bằng chứng:** Decision Log, Change Control Protocol và danh sách approval cần có.
- **Điều kiện hoàn thành ở bước khảo sát:** Chỉ đánh dấu BASELINED sau phê duyệt thực tế.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-08-F011 – Ánh xạ vào workbook báo giá và rà soát

- **Nội dung:** Ánh xạ WBS sang Overview/DetailEstimation/Team Estimation/Timeline/Assumption/Config, rà soát công thức và các nhóm chi phí.
- **Sản phẩm/bằng chứng:** Quotation Input Checklist và mapping WBS→Excel.
- **Điều kiện hoàn thành ở bước khảo sát:** Không sửa template gốc; không sử dụng Contract/Blockchain; chưa điền số giờ nếu chưa bước estimation.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.


## 5. Giới hạn phạm vi và tránh trùng lặp

Không khảo sát lại các module G0-01 đến G0-07; không tạo giả định đơn giá vendor chưa có; không định giá cố định GĐ2–GĐ4 khi scope chưa đủ chốt.

## 6. Rủi ro và dữ kiện còn thiếu

- Không đủ cơ sở báo giá fixed-price GĐ2–GĐ4; cần phương án/khoảng kèm điều kiện.
- Template Excel mẫu có cột Contract và dữ liệu dự án khác: phải làm bản sao đã kiểm tra công thức.
- Các hạng mục tư vấn GĐ0 có thể chồng effort BA/Design giai đoạn code sau nếu không có overlap register.
- Khối lượng khảo sát (số hệ thống/nguồn dữ liệu/buổi workshop/màn hình/tài liệu) chưa có xác nhận và phải là input khi dự toán.
- Nội dung chưa có bằng chứng được đánh dấu `TBC` kèm người/phương thức xác minh.

## 7. Nghiệm thu ở cấp module và bước tiếp theo

Một hạng mục khảo sát chỉ coi là hoàn thành khi có **sản phẩm/bảng kiểm/biên bản** được chỉ ra trong từng công việc, ghi **nguồn bằng chứng**, giới hạn khảo sát và câu hỏi đang mở; chủ sở hữu nghiệp vụ của VTV8 phải có cơ hội rà soát. **Chưa tự coi là đã nghiệm thu khi mới tạo tài liệu kế hoạch này.**

**Trạng thái hiện tại:** Danh mục Fxxx đã được **soạn đầy đủ để rà soát**, không tự coi là chốt bởi khách hàng hoặc đã thực thi. Sau khi thống nhất toàn bộ GĐ0 mới tiến hành xác định khối lượng và phương pháp effort cho GĐ0, không gán giờ code giả tạo.
