# G1-09 – Báo cáo và thống kê nội dung

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Danh mục module đã được người dùng chọn; chi tiết tính năng **DRAFT chờ rà soát với VTV8**. Chưa ước tính giờ FE/BE.

## Mục tiêu
Ban quản lý và bộ phận biên tập theo dõi sản lượng nội dung và lượt xem; dữ liệu hỗ trợ kiểm kê và tính nhuận bút nếu được xác nhận.

## Ranh giới và phụ thuộc
Sở hữu tổng hợp dữ liệu và hiển thị thống kê; G1-10 sở hữu công thức/cấp duyệt nhuận bút; không mặc định analytics hành vi cá nhân, clickstream quy mô lớn của GĐ2.

## Danh sách tính năng (6)

| ID | Tính năng | Actor | Luồng xử lý/đầu ra | FE cần làm | BE cần làm | Nghiệm thu sơ bộ | Nguồn | Phạm vi |
|---|---|---|---|---|---|---|---|---|
| G1-09-F001 | **Tổng quan CMS/dashboard nội dung** | Quản lý; biên tập | Hiển thị số lượng nội dung theo loại/trạng thái, số bài trong kỳ và thông báo dữ liệu cập nhật đến mốc nào. | Dashboard số liệu, lọc thời gian | Aggregate counts, permission filters | Tổng dashboard khớp danh sách nội dung cùng điều kiện | T | CORE |
| G1-09-F002 | **Thống kê sản lượng theo tác giả và chuyên mục** | Quản lý; biên tập | Báo cáo bài được xuất bản theo tác giả, chuyên mục, loại bài, trạng thái và mốc thời gian. | Table/filter/pagination | Aggregation on published content and contributor links | Một sản phẩm không bị đếm trùng trong tổng nếu nhiều người tham gia | T | CORE |
| G1-09-F003 | **Thu thập lượt xem bài viết** | Người xem; quản lý | Ghi lượt xem nội dung public với định nghĩa sự kiện rõ ràng, chống ghi đúp cơ bản và không cần định danh cá nhân. | Client event tracking/SSR integration nếu cần | View event collection/aggregation, bot filters cơ bản, retention | Bài nháp không phát sinh page-view public; báo cáo giải thích đơn vị đo | T | CORE |
| G1-09-F004 | **Lượt xem video và livestream** | Quản lý; kỹ thuật | Hiển thị số lượt xem video/live bằng dữ liệu có nguồn rõ; dữ liệu vendor chỉ dùng nếu đối tác cung cấp API/export và định nghĩa chỉ số. | Lọc tab video/live, trạng thái số liệu | Import/aggregate vendor stats có nguồn, fallback no data | Không suy diễn số view live từ pageview khi không có số liệu | C | CONDITIONAL |
| G1-09-F005 | **Báo cáo theo thời gian và xuất dữ liệu** | Quản lý; nhân sự nghiệp vụ | Lọc khoảng thời gian, loại nội dung/chuyên mục, xuất bảng CSV/XLSX dữ liệu tổng hợp theo quyền. | Filter/export actions | Export API, permission check, max records | File xuất khớp bộ lọc và dữ liệu trên màn hình | B | CORE |
| G1-09-F006 | **Quy tắc thống kê, đối soát và khóa kỳ dữ liệu** | Quản lý | Lưu định nghĩa chỉ số, mốc cập nhật và cách sửa số liệu khi dữ liệu chuyển đổi hoặc vendor điều chỉnh; không tự tính là số đã đối soát nếu chưa xác minh. | Ghi chú chỉ số/trạng thái đối soát | Data lineage/reporting snapshots khi cần | Mỗi báo cáo thể hiện kỳ, nguồn số liệu và phạm vi | B | CORE |

**Nguồn:** `T` = nêu trực tiếp trong tài liệu VTV8 về nghiệp vụ hoặc yêu cầu kỹ thuật (chi tiết triển khai vẫn có phần suy luận); `B` = suy luận cần thiết; `C` = phụ thuộc vendor/quyết định. **Phạm vi:** `CORE` = baseline đề xuất, `CONDITIONAL` = chỉ tính effort sau khi phương án được xác nhận. Không nhầm `CORE` với yêu cầu đã được VTV8 ký duyệt.

## Điểm xác nhận trước dự toán
- Cần bản phân công trách nhiệm VTV8/IIEL/VTVcab, tài khoản kỹ thuật, mẫu dữ liệu và trường hợp lỗi thực tế.
- Nếu nhà cung cấp không cung cấp API/kênh recording/cơ sở dữ liệu cần thiết, cập nhật phương án và ước tính lại.
- Mục tiêu 120.000 CCU/SLA trong tài liệu là **yêu cầu kiểm chứng** chứ không phải năng lực đã được đo đạt.

[Xem danh mục GĐ1](README.md).