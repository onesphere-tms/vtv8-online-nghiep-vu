# GĐ0 – Khảo sát và thiết kế tổng thể

> **Danh mục module: ĐÃ THỐNG NHẤT NỘI BỘ (09/10/2026)** theo cuộc trao đổi về phạm vi phân tích và báo giá. **Đặc tả chi tiết: DRAFT**; chưa phải phê duyệt phạm vi từ VTV8.

- **Thời lượng dự kiến nêu trong tài liệu VTV8:** 2–4 tuần; phải kiểm chứng sau khi biết điều kiện khảo sát và đầu ra.
- **Mục tiêu:** khảo sát hiện trạng, xác định phạm vi sản phẩm, lập phương án UX/UI, kiến trúc, streaming, migration, pháp lý và đầu vào báo giá.
- **Tính chất:** đây là **8 hạng mục khảo sát/thiết kế**, không phải 8 module phần mềm đã lập trình.
- **Mức độ phân tích hiện tại:** đã chốt **8 tên/ranh giới module GĐ0** và danh sách **11 hạng mục khảo sát G0-01**; chi tiết nghiệp vụ, khối lượng, giờ công và chi phí chưa chốt.

## 1. Danh sách 8 hạng mục đã chốt

| Mã | Hạng mục | Đầu ra chính |
|---|---|---|
| G0-01 | [G0-01 – Khảo sát nghiệp vụ và xác định phạm vi sản phẩm](G0-01-khao-sat-nghiep-vu-va-pham-vi-san-pham.md) | Bản đồ stakeholder/actor và mô hình quy trình nghiệp vụ cần nghiên cứu sâu. |
| G0-02 | [G0-02 – Khảo sát hiện trạng hệ thống và tài sản số](G0-02-khao-sat-hien-trang-he-thong-va-tai-san-so.md) | Báo cáo hiện trạng hệ thống và danh mục tài sản số. |
| G0-03 | [G0-03 – Phân tích bản quyền, giấy phép và điều kiện khai thác](G0-03-ban-quyen-giay-phep-dieu-kien-khai-thac.md) | Ma trận quyền khai thác từng nhóm nội dung và trường dữ liệu bản quyền cần có. |
| G0-04 | [G0-04 – Thiết kế trải nghiệm và cấu trúc thông tin](G0-04-ux-ui-va-cau-truc-thong-tin.md) | Sitemap, taxonomy và các luồng trải nghiệm trọng tâm. |
| G0-05 | [G0-05 – Thiết kế kiến trúc nền tảng, dữ liệu và bảo mật](G0-05-kien-truc-nen-tang-du-lieu-va-bao-mat.md) | Sơ đồ kiến trúc tổng thể, data-flow và khung data model. |
| G0-06 | [G0-06 – Đánh giá và thiết kế giải pháp Video/Livestream](G0-06-video-livestream.md) | Sơ đồ pipeline VOD/live và tiêu chí lựa chọn nền tảng media. |
| G0-07 | [G0-07 – Phân tích và thiết kế phương án chuyển đổi dữ liệu](G0-07-phuong-an-chuyen-doi-du-lieu.md) | Migration Strategy, bảng mapping dữ liệu và chiến lược xử lý lỗi/đối soát. |
| G0-08 | [G0-08 – Xây dựng hồ sơ triển khai, nghiệm thu và dự toán](G0-08-ho-so-trien-khai-nghiem-thu-va-du-toan.md) | Hồ sơ phạm vi/WBS/roadmap tổng thể và dự toán theo mức độ chắc chắn của từng giai đoạn. |

## 2. Phân nhóm và thứ tự phụ thuộc

- **Nghiệp vụ và khảo sát:** G0-01 định hướng phạm vi sản phẩm; G0-02 kiểm kê hệ thống/tài sản.
- **Ràng buộc nội dung:** G0-03 đánh giá bản quyền/giấy phép dựa trên dữ liệu kiểm kê.
- **Thiết kế sản phẩm và giải pháp:** G0-04 phụ trách trải nghiệm/taxonomy; G0-05 phụ trách kiến trúc và dữ liệu.
- **Chuyên sâu media và dữ liệu:** G0-06 phân tích video/streaming/CDN; G0-07 xây dựng chiến lược chuyển dữ liệu từ kết quả G0-02/G0-03/G0-05.
- **Tổng hợp:** G0-08 xây hồ sơ triển khai, điều kiện nghiệm thu và dự toán từ đầu ra của các hạng mục trước.

Một số hạng mục có thể khảo sát song song; phụ thuộc trên là quan hệ dữ liệu/đầu ra, không phải cam kết timeline.

## 3. Ranh giới để tránh tính trùng GĐ1

| Hoạt động GĐ0 | Thuộc giai đoạn triển khai sau |
|---|---|
| Khảo sát quy trình và đề xuất phạm vi CMS | Lập trình CMS và hoàn thiện luồng chi tiết |
| Sitemap, wireframe/prototype theo mức đã chốt | Code giao diện và phần Design chưa thực hiện trong GĐ0 |
| Kiến trúc tổng thể, NFR, data model cấp cao | Xây API, database, triển khai production |
| Đánh giá phương án Video/Live/CDN | Tích hợp/phát triển media pipeline và kiểm thử tải thực tế |
| Chiến lược migration, data mapping | Công cụ import, chạy migration và đối soát thực tế |
| WBS, dự toán, điều kiện nghiệm thu | Phát triển, QA, UAT, vận hành theo hợp đồng |

**Quy tắc báo giá:** Theo phương pháp đã thống nhất, tính năng code ở GĐ1–GĐ4 chỉ nhập giờ FE và BE của một Middle Developer, BA/Design/QA do Excel tính. GĐ0 chủ yếu là khảo sát/thiết kế, cần bóc tách khối lượng dịch vụ riêng và tránh tính trùng phần thiết kế đã bàn giao.

## 4. Đổi mã từ danh mục 9 hạng mục cũ

| Danh mục cũ | Danh mục mới | Ghi chú |
|---|---|---|
| G0-01 + G0-04 | **G0-01** | Gộp khảo sát nghiệp vụ và phạm vi sản phẩm |
| G0-02 + phần kiểm kê tài sản của G0-03 | **G0-02** | Khảo sát hệ thống và kiểm kê tài sản số |
| Phần quyền/giấy phép của G0-03 | **G0-03** | Phân tích bản quyền và điều kiện khai thác |
| G0-05 | **G0-04** | UX/UI và taxonomy |
| G0-06 | **G0-05** | Kiến trúc nền tảng/dữ liệu/bảo mật |
| G0-07 | **G0-06** | Video/livestream và CDN |
| G0-08 | **G0-07** | Migration |
| G0-09 | **G0-08** | WBS, nghiệm thu, dự toán |

Các mã mới thay thế danh sách cũ kể từ ngày thống nhất. Thông tin chi tiết chưa được khách hàng xác nhận vẫn là DRAFT.

## 5. Nguồn căn cứ

- Tệp gốc: [Đề xuất hợp tác VTV8 – IIEL](../../tai-lieu-nguon/Đề%20xuất%20hợp%20tác%20VTV8%20-%20IIEL_VTV8%20note.docx).
- Nguồn GĐ0: phần **“Giai đoạn 0 – Thiết kế tổng thể”** trong tài liệu; G0-01 và G0-08 được phân rã bổ sung để đủ căn cứ nghiên cứu và dự toán.
- Cấu trúc **8 hạng mục** là quyết định phạm vi nội bộ của nhóm phân tích, **không phải 8 module được nêu nguyên văn trong tài liệu VTV8**.

## 6. Trạng thái và bước kế tiếp

**Hoàn thành:** thống nhất **8 module GĐ0** và **11 hạng mục cấp dưới của G0-01 (F001–F011)**. [Xem danh sách 11 hạng mục G0-01](G0-01-khao-sat-nghiep-vu-va-pham-vi-san-pham.md).

**Chưa thực hiện:** phê duyệt từ VTV8, xác định khối lượng chi tiết từng công việc, dự toán giờ công/MD và báo giá.

**Bước kế tiếp:** tiếp tục phân tích/định lượng G0-01 theo danh sách đã chốt hoặc chuyển sang thống nhất danh mục G0-02 theo cùng quy trình.
