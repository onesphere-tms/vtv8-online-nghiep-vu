# G2-02 – Theo dõi chương trình và yêu thích

> **GĐ2 Media Platform – phạm vi nội bộ đã chuẩn hóa 09/10/2026.** Chưa được VTV8 phê duyệt, chưa tính giờ FE/BE.

## Mục tiêu
Người xem chủ động lưu sở thích theo chương trình và nội dung; đây là cơ sở cho cập nhật và gợi ý ở GĐ2.

## Ranh giới nghiệp vụ
Chỉ lưu trạng thái theo dõi/yêu thích; playlists/lịch sử ở G2-03, feed gợi ý ở G2-05, thông báo ở G2-07. Không theo dõi tài khoản người xem khác.

## Phụ thuộc và điều kiện
G2-01 Audience Account, G1-04 chương trình/series, G1-01/G1-06 public content.

## Danh mục tính năng (5)

| ID | Tính năng | Actor | Nghiệp vụ | FE mới | BE mới | Nghiệm thu | Nguồn | Phạm vi | Ranh giới sau rà soát |
|---|---|---|---|---|---|---|---|---|---|
| G2-02-F001 | **Theo dõi và bỏ theo dõi chương trình** | Người xem | Theo dõi hoặc bỏ theo dõi chương trình/series đã công khai từ trang nội dung. | Nút follow và trạng thái đã theo dõi | Follow relation user-program, idempotent API | Nhấn lại không tạo trùng; chương trình bị ẩn không phát sinh hiển thị sai | T | CORE | Giữ yêu cầu theo nguồn/đề xuất, chỉ phát triển phần mới sau GĐ1. |
| G2-02-F002 | **Lưu và bỏ yêu thích nội dung** | Người xem | Yêu thích bài viết/video công khai; trạng thái nhất quán trên các trang. | Nút favorite và thông báo trạng thái | Favorite relation và permission checks | Nội dung đã lưu hiển thị trạng thái đúng khi đăng nhập lại | T | CORE | Giữ yêu cầu theo nguồn/đề xuất, chỉ phát triển phần mới sau GĐ1. |
| G2-02-F003 | **Danh sách chương trình đang theo dõi** | Người xem | Xem, tìm/lọc và bỏ theo dõi trong thư viện cá nhân. | Trang My Library dùng chung với tab favorite G2-02-F004, danh sách theo dõi | Followed-program query, phân trang dùng dữ liệu F001 | Chỉ trả danh sách thuộc tài khoản đăng nhập | B | CORE | Tái dùng một trang My Library với F004; giữ dữ liệu/API theo dõi riêng, không làm lại layout và danh sách từ đầu. |
| G2-02-F004 | **Danh sách nội dung yêu thích** | Người xem | Xem bài/video đã lưu, phân loại cơ bản và loại khỏi danh sách; xử lý nội dung bị gỡ. | Tab favorite trong My Library G2-02-F003, dùng chung component và filter | Favorites query và kiểm tra visibility | Nội dung không còn quyền xem có trạng thái phù hợp, không lộ file | B | CORE | Tái dùng trang My Library F003 với tab yêu thích; nội dung hết quyền/gỡ không lộ file. |
| G2-02-F005 | **Chủ đề nội dung quan tâm** | Người xem | Lựa chọn hoặc thay đổi chủ đề sở thích từ taxonomy G1-04 làm tín hiệu gợi ý. | Trang chọn chủ đề, toggle | User-topic preferences, taxonomy references | Sở thích đồng bộ theo tài khoản và sử dụng được tại G2-05 | B | OPTION | Giữ yêu cầu theo nguồn/đề xuất, chỉ phát triển phần mới sau GĐ1. |

**Quy ước:** T = chủ đề có trong nguồn VTV8, B = nghiệp vụ phân tích bổ sung, C = có điều kiện. CORE = đề xuất nền tảng GĐ2, OPTION = tính riêng nếu chọn, CONDITIONAL = phụ thuộc pháp lý/đối tác. Xem [Danh mục 66 tính năng](G2-DANH-MUC-TINH-NANG.md), [mapping 72→66](G2-MAPPING-72-66.md) và [nghiệm thu](G2-TIEU-CHI-NGHIEM-THU.md). Chưa có giờ FE/BE.

[Trở về tổng quan GĐ2](README.md).
