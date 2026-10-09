# G1-09 – Báo cáo và thống kê nội dung

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Danh mục module đã được người dùng chọn; chi tiết tính năng **DRAFT chờ rà soát với VTV8**. Chưa ước tính giờ FE/BE.

## Mục tiêu
Ban quản lý và bộ phận biên tập theo dõi sản lượng nội dung và lượt xem; dữ liệu hỗ trợ kiểm kê và tính nhuận bút nếu được xác nhận.

## Ranh giới và phụ thuộc
Sở hữu tổng hợp dữ liệu và hiển thị thống kê; G1-10 sở hữu công thức/cấp duyệt nhuận bút; không mặc định analytics hành vi cá nhân, clickstream quy mô lớn của GĐ2.

## Danh sách tính năng (6)

| ID | Tính năng | Người sử dụng | Nghiệp vụ và đầu ra | FE cần làm | BE cần làm | Nghiệm thu riêng | Nguồn | Phạm vi | Ranh giới sau QA |
|---|---|---|---|---|---|---|---|---|---|
| G1-09-F001 | **Tổng quan CMS/dashboard nội dung** | Quản lý; biên tập | Hiển thị số lượng nội dung theo loại/trạng thái, số bài trong kỳ và thông báo dữ liệu cập nhật đến mốc nào. | Dashboard số liệu, lọc thời gian | Aggregate counts, permission filters | Tổng dashboard khớp danh sách nội dung cùng điều kiện | T | CORE | Giữ dashboard mức tổng quan; tái dùng số liệu báo cáo ở các tính năng G1-09 khác, không xây nền tảng BI. |
| G1-09-F002 | **Thống kê sản lượng theo tác giả và chuyên mục** | Quản lý; biên tập | Đếm sản lượng bài theo tác giả/chuyên mục/thời gian; phân biệt một bài với nhiều lượt tham gia sản xuất để tổng sản lượng không bị nhân đôi. | Table/filter/pagination | Aggregation on published content and contributor links | Một sản phẩm không bị đếm trùng trong tổng nếu nhiều người tham gia | T | CORE | Giữ báo cáo sản lượng; làm rõ 'bài theo tác giả' khác đóng góp nhiều người, tránh đếm trùng ở tổng bài. |
| G1-09-F003 | **Thu thập lượt xem bài viết** | Người xem; quản lý | Thu thập và tổng hợp lượt xem bài đã công khai theo từng bài, chuyên mục và khoảng thời gian. Chốt định nghĩa view, lọc bot/đếm trùng cơ bản và quy tắc bài nhiều chuyên mục. | Ghi lượt xem hợp lệ từ trang bài, báo cáo lọc thời gian | Thu view events và aggregate article/category/time buckets | Đối soát được view theo bài, chuyên mục và kỳ; báo cáo không đếm gộp sai khi một bài nhiều chuyên mục. | T | CORE | Giữ đo và tổng hợp view bài; yêu cầu VTV8 bao gồm view theo bài, chuyên mục, thời gian. Cần ghi rõ cả ba chiều; định nghĩa bot/dedupe không quá sâu. |
| G1-09-F004 | **Lượt xem video và livestream** | Quản lý; kỹ thuật | Hiển thị số lượt xem video/live bằng dữ liệu có nguồn rõ; dữ liệu vendor chỉ dùng nếu đối tác cung cấp API/export và định nghĩa chỉ số. | Lọc tab video/live, trạng thái số liệu | Import/aggregate vendor stats có nguồn, fallback no data | Không suy diễn số view live từ pageview khi không có số liệu | C | CONDITIONAL | Thống kê view video/live theo API/export và định nghĩa metric của provider; nếu không có thì ghi không khả dụng, không tự suy từ pageview. |
| G1-09-F005 | **Báo cáo theo thời gian và xuất dữ liệu** | Quản lý; nhân sự nghiệp vụ | Lọc và xuất số liệu bài viết/lượt xem theo bài, chuyên mục, thời gian; hiển thị nguồn, ngày cập nhật và chọn một định dạng export CSV hoặc XLSX ban đầu. | Filter/export actions | Aggregate API/export theo quyền; thông tin nguồn và thời điểm cập nhật | Màn hình và file xuất cùng kỳ cho cùng tổng bài và lượt xem. | B | CORE | Giữ lọc/xuất báo cáo; Excel/CSV chọn một định dạng ban đầu, bảo đảm tổng số lượt xem/chuyên mục có thể đối chiếu. |
| G1-09-F006 | **Quy tắc thống kê, đối soát và khóa kỳ dữ liệu** | Quản lý | Tùy chọn: quản trị đối soát điều chỉnh và khóa kỳ thống kê nâng cao; nguồn chỉ số và thời điểm cập nhật cơ bản nằm ở G1-09-F003/F005. | Màn xem phiên bản kỳ, điều chỉnh/khóa kỳ nếu chọn | Snapshot/versioning kỳ và audit nếu chọn | Nếu không bật OPTION, số liệu bài/view cơ bản vẫn đúng và xem được. | B | OPTION | Khóa kỳ báo cáo và ledger điều chỉnh vượt yêu cầu thống kê V1. CORE chỉ giữ định nghĩa chỉ số và thời điểm đồng bộ trong F003/F005; chi tiết audit/khóa kỳ nên OPTION. |

**Quy ước:** T = chủ đề trong tài liệu VTV8 (chi tiết suy luận phải xác nhận); B = bổ sung; C = phụ thuộc vendor/quyết định. CORE = đề xuất V1; CONDITIONAL/OPTION = chưa tính giờ cơ sở. Xem [nghiệm thu chung](G1-TIEU-CHI-NGHIEM-THU.md) và [thành phần dùng chung](G1-THANH-PHAN-DUNG-CHUNG.md). Chưa có giờ FE/BE.

## Điểm xác nhận trước dự toán
- Cần bản phân công trách nhiệm VTV8/IIEL/VTVcab, tài khoản kỹ thuật, mẫu dữ liệu và trường hợp lỗi thực tế.
- Nếu nhà cung cấp không cung cấp API/kênh recording/cơ sở dữ liệu cần thiết, cập nhật phương án và ước tính lại.
- Mục tiêu 120.000 CCU/SLA trong tài liệu là **yêu cầu kiểm chứng** chứ không phải năng lực đã được đo đạt.

[Xem danh mục GĐ1](README.md).