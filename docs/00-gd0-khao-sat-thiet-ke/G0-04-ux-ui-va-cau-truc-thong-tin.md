# G0-04 – Thiết kế trải nghiệm và cấu trúc thông tin

> **Trạng thái module GĐ0:** Đã thống nhất nội bộ tên, mục tiêu và ranh giới module (09/10/2026).  
> **Danh sách công việc Fxxx:** DRAFT – đề xuất đầy đủ để rà soát toàn bộ GĐ0; chưa chốt nội bộ từng danh sách, chưa được VTV8 xác nhận.  
> **Chưa tính:** FE/BE Middle Developer, BA/Design/QA, MD, giá, timeline chi tiết.

## 1. Mục tiêu

Chốt kiến trúc thông tin, các hành trình sử dụng trọng tâm và mức thiết kế UX/UI đầu vào GĐ1; giữ khả năng mở rộng nội dung/đối tượng sau này.

**Nguồn đối chiếu:** GĐ0: xây taxonomy và thiết kế UX/UI; GĐ1: CMS nội dung có cấu trúc và website; định hướng xuyên giai đoạn về nội dung → du lịch → sản phẩm/dịch vụ.

## 2. Đối tượng phối hợp, đầu vào và đầu ra

- **Đối tượng phối hợp dự kiến:** Product owner, tòa soạn, quản trị CMS, nhóm truyền thông và người xem đại diện (nếu tiếp cận được).
- **Đầu vào cần có:** Danh mục actor/luồng nghiệp vụ G0-01, loại nội dung CMS từ nguồn, tham chiếu hiện trạng G0-02 và hạn chế bản quyền G0-03.
- **Sản phẩm bàn giao cấp module:** Tài liệu/tập bảng khảo sát và ma trận đánh giá tổng hợp từ danh mục bên dưới; các phần được tích hợp chung trong bộ hồ sơ GĐ0, không nhất thiết mỗi Fxxx là một báo cáo riêng.
- **Phương pháp:** rà soát tài liệu và hệ thống được phép tiếp cận, phỏng vấn stakeholder, thu thập bằng chứng, lập bảng đối chiếu, trình xác nhận các điểm mở. Sự kiện khảo sát thực tế **chưa diễn ra** trong bản phân tích này.

## 3. Danh mục công việc đề xuất (10 mục)

| ID | Công việc | Nội dung | Đầu ra |
|---|---|---|---|
| G0-04-F001 | Định nghĩa đối tượng và nhu cầu trải nghiệm | Phân biệt người xem không đăng nhập, quản trị viên, biên tập, người duyệt và định hướng người dùng/đối tác sau này. | Personas/roles phục vụ UX và danh mục nhu cầu ưu tiên. |
| G0-04-F002 | Thiết kế taxonomy nội dung | Quy ước loại nội dung, chuyên mục, tag/chủ đề, chương trình, series, nhân vật, địa danh, di sản, sự kiện và mối liên kết. | Cây taxonomy, glossary và quy tắc gắn nhãn/liên kết. |
| G0-04-F003 | Xây dựng sitemap website và CMS | Tổ chức cấu trúc trang, menu, cấp chuyên mục, trang chi tiết và chức năng quản trị theo nhóm. | Sitemap website + sơ đồ điều hướng CMS, xác định phần V1 và phần mở rộng. |
| G0-04-F004 | Phân tích hành trình người xem ưu tiên | Thiết kế luồng truy cập trang chủ → chuyên mục → bài/video; tìm chương trình; xem livestream và xem lại. | User journeys, trạng thái trang/case không có nội dung/lỗi. |
| G0-04-F005 | Phân tích hành trình sử dụng CMS | Luồng tạo nội dung, biên tập, duyệt, upload media, gắn taxonomy và xuất bản. | Task flow admin theo vai trò, trạng thái và quyền cơ bản. |
| G0-04-F006 | Wireframe nhóm trang website | Thiết kế khung các mẫu trang chính: trang chủ, chuyên mục, bài, chi tiết chương trình, trang video, lịch phát/live. | Wireframe có mã màn hình, mô tả cấu phần, trạng thái. |
| G0-04-F007 | Wireframe nhóm trang CMS | Thiết kế khung dashboard/danh sách/chỉnh sửa/nội dung chờ duyệt/thư viện media và nghiệp vụ quan trọng. | Wireframe CMS theo role/luồng, không bắt buộc pixel-perfect. |
| G0-04-F008 | Quy tắc responsive và accessibility | Xác định nguyên tắc điều hướng desktop/mobile, hiển thị player/media, typography, trạng thái lỗi và khả năng tiếp cận. | Danh mục yêu cầu UX phi chức năng, breakpoint định hướng. |
| G0-04-F009 | UI direction và thành phần giao diện dùng chung | Đề xuất định hướng nhận diện, mẫu thành phần card/video/list/editorial status và guideline sơ bộ. | Moodboard/design direction, danh sách component dùng chung. |
| G0-04-F010 | Prototype và vòng rà soát | Ghép luồng đại diện để review với VTV8; ghi nhận phản hồi và những quyết định còn mở. | Prototype theo mức fidelity thỏa thuận và log phản hồi/xác nhận. |

## 4. Phân tích công việc và đầu ra

### G0-04-F001 – Định nghĩa đối tượng và nhu cầu trải nghiệm

- **Nội dung:** Phân biệt người xem không đăng nhập, quản trị viên, biên tập, người duyệt và định hướng người dùng/đối tác sau này.
- **Sản phẩm/bằng chứng:** Personas/roles phục vụ UX và danh mục nhu cầu ưu tiên.
- **Điều kiện hoàn thành ở bước khảo sát:** Không lập lại toàn bộ phân tích stakeholder G0-01.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-04-F002 – Thiết kế taxonomy nội dung

- **Nội dung:** Quy ước loại nội dung, chuyên mục, tag/chủ đề, chương trình, series, nhân vật, địa danh, di sản, sự kiện và mối liên kết.
- **Sản phẩm/bằng chứng:** Cây taxonomy, glossary và quy tắc gắn nhãn/liên kết.
- **Điều kiện hoàn thành ở bước khảo sát:** Đây là mô hình thông tin nghiệp vụ, không phải schema DB cuối.
- **Căn cứ:** SOURCE; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-04-F003 – Xây dựng sitemap website và CMS

- **Nội dung:** Tổ chức cấu trúc trang, menu, cấp chuyên mục, trang chi tiết và chức năng quản trị theo nhóm.
- **Sản phẩm/bằng chứng:** Sitemap website + sơ đồ điều hướng CMS, xác định phần V1 và phần mở rộng.
- **Điều kiện hoàn thành ở bước khảo sát:** Không tạo những chức năng ngoài scope GĐ1 khi chưa chốt.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-04-F004 – Phân tích hành trình người xem ưu tiên

- **Nội dung:** Thiết kế luồng truy cập trang chủ → chuyên mục → bài/video; tìm chương trình; xem livestream và xem lại.
- **Sản phẩm/bằng chứng:** User journeys, trạng thái trang/case không có nội dung/lỗi.
- **Điều kiện hoàn thành ở bước khảo sát:** Chức năng GĐ2 (account/playlist/premium) chỉ thể hiện như hướng phát triển.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-04-F005 – Phân tích hành trình sử dụng CMS

- **Nội dung:** Luồng tạo nội dung, biên tập, duyệt, upload media, gắn taxonomy và xuất bản.
- **Sản phẩm/bằng chứng:** Task flow admin theo vai trò, trạng thái và quyền cơ bản.
- **Điều kiện hoàn thành ở bước khảo sát:** Quy trình nghiệp vụ gốc lấy từ G0-01, không tự chốt thêm cấp duyệt.
- **Căn cứ:** SOURCE+PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-04-F006 – Wireframe nhóm trang website

- **Nội dung:** Thiết kế khung các mẫu trang chính: trang chủ, chuyên mục, bài, chi tiết chương trình, trang video, lịch phát/live.
- **Sản phẩm/bằng chứng:** Wireframe có mã màn hình, mô tả cấu phần, trạng thái.
- **Điều kiện hoàn thành ở bước khảo sát:** Số lượng màn hình cuối cùng là đầu vào cần xác nhận/định giá.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-04-F007 – Wireframe nhóm trang CMS

- **Nội dung:** Thiết kế khung dashboard/danh sách/chỉnh sửa/nội dung chờ duyệt/thư viện media và nghiệp vụ quan trọng.
- **Sản phẩm/bằng chứng:** Wireframe CMS theo role/luồng, không bắt buộc pixel-perfect.
- **Điều kiện hoàn thành ở bước khảo sát:** Tránh phát sinh thiết kế chức năng chưa khảo sát.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-04-F008 – Quy tắc responsive và accessibility

- **Nội dung:** Xác định nguyên tắc điều hướng desktop/mobile, hiển thị player/media, typography, trạng thái lỗi và khả năng tiếp cận.
- **Sản phẩm/bằng chứng:** Danh mục yêu cầu UX phi chức năng, breakpoint định hướng.
- **Điều kiện hoàn thành ở bước khảo sát:** Chưa cam kết chuẩn WCAG cụ thể khi chưa thỏa thuận.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-04-F009 – UI direction và thành phần giao diện dùng chung

- **Nội dung:** Đề xuất định hướng nhận diện, mẫu thành phần card/video/list/editorial status và guideline sơ bộ.
- **Sản phẩm/bằng chứng:** Moodboard/design direction, danh sách component dùng chung.
- **Điều kiện hoàn thành ở bước khảo sát:** Không cam kết xây design system đầy đủ nếu GĐ0 không có scope.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.

### G0-04-F010 – Prototype và vòng rà soát

- **Nội dung:** Ghép luồng đại diện để review với VTV8; ghi nhận phản hồi và những quyết định còn mở.
- **Sản phẩm/bằng chứng:** Prototype theo mức fidelity thỏa thuận và log phản hồi/xác nhận.
- **Điều kiện hoàn thành ở bước khảo sát:** Số vòng phản hồi và mức độ hoàn thiện phải chốt trước khi báo giá.
- **Căn cứ:** PROPOSED; áp dụng chủ đề từ nguồn, còn cách chia việc và cách làm là đề xuất phân tích.


## 5. Giới hạn phạm vi và tránh trùng lặp

Thiết kế cấu trúc thông tin, user flow và wireframe/prototype theo số lượng được thống nhất. Không mặc định thiết kế pixel-perfect mọi trang GĐ1–GĐ4, không lập trình giao diện.

## 6. Rủi ro và dữ kiện còn thiếu

- Chưa có brand guideline, tài sản thiết kế hoặc người duyệt UI có thể kéo dài thời gian.
- Cấu trúc nội dung/taxonomy chưa được chủ sở hữu nghiệp vụ xác nhận.
- Trùng phần Design ở GĐ1 nếu GĐ0 đã bao gồm UI chi tiết: cần hạch toán phạm vi đã bàn giao.
- Khối lượng khảo sát (số hệ thống/nguồn dữ liệu/buổi workshop/màn hình/tài liệu) chưa có xác nhận và phải là input khi dự toán.
- Nội dung chưa có bằng chứng được đánh dấu `TBC` kèm người/phương thức xác minh.

## 7. Nghiệm thu ở cấp module và bước tiếp theo

Một hạng mục khảo sát chỉ coi là hoàn thành khi có **sản phẩm/bảng kiểm/biên bản** được chỉ ra trong từng công việc, ghi **nguồn bằng chứng**, giới hạn khảo sát và câu hỏi đang mở; chủ sở hữu nghiệp vụ của VTV8 phải có cơ hội rà soát. **Chưa tự coi là đã nghiệm thu khi mới tạo tài liệu kế hoạch này.**

**Trạng thái hiện tại:** Danh mục Fxxx đã được **soạn đầy đủ để rà soát**, không tự coi là chốt bởi khách hàng hoặc đã thực thi. Sau khi thống nhất toàn bộ GĐ0 mới tiến hành xác định khối lượng và phương pháp effort cho GĐ0, không gán giờ code giả tạo.
