# G2-02 – Theo dõi chương trình và yêu thích

> **GĐ2 Media Platform – thiết kế nghiệp vụ sơ bộ 09/10/2026.** Module/tính năng đều là **đề xuất DRAFT, chưa được người dùng chốt và chưa được VTV8 xác nhận**. Không tính giờ FE/BE hoặc thời gian triển khai.

## Mục tiêu
Người xem chủ động lưu sở thích theo chương trình và nội dung; đây là cơ sở cho cập nhật và gợi ý ở GĐ2.

## Ranh giới nghiệp vụ
Chỉ lưu trạng thái theo dõi/yêu thích; playlists/lịch sử ở G2-03, feed gợi ý ở G2-05, thông báo ở G2-07. Không theo dõi tài khoản người xem khác.

## Phụ thuộc và điều kiện
G2-01 Audience Account, G1-04 chương trình/series, G1-01/G1-06 public content.

## Danh mục tính năng (5)

| ID | Tính năng | Người dùng/actor | Nghiệp vụ và đầu ra | Phần FE mới | Phần BE mới | Nghiệm thu sơ bộ | Nguồn | Đề xuất phạm vi |
|---|---|---|---|---|---|---|---|---|
| G2-02-F001 | **Theo dõi và bỏ theo dõi chương trình** | Người xem | Theo dõi hoặc bỏ theo dõi chương trình/series đã công khai từ trang nội dung. | Nút follow và trạng thái đã theo dõi | Follow relation user-program, idempotent API | Nhấn lại không tạo trùng; chương trình bị ẩn không phát sinh hiển thị sai | T | CORE |
| G2-02-F002 | **Lưu và bỏ yêu thích nội dung** | Người xem | Yêu thích bài viết/video công khai; trạng thái nhất quán trên các trang. | Nút favorite và thông báo trạng thái | Favorite relation và permission checks | Nội dung đã lưu hiển thị trạng thái đúng khi đăng nhập lại | T | CORE |
| G2-02-F003 | **Danh sách chương trình đang theo dõi** | Người xem | Xem, tìm/lọc và bỏ theo dõi trong thư viện cá nhân. | Trang danh sách và thao tác bỏ theo dõi | Followed programs query API và phân trang | Chỉ trả danh sách thuộc tài khoản đăng nhập | B | CORE |
| G2-02-F004 | **Danh sách nội dung yêu thích** | Người xem | Xem bài/video đã lưu, phân loại cơ bản và loại khỏi danh sách; xử lý nội dung bị gỡ. | Trang yêu thích, tab bài/video | Favorites query với public availability policy | Nội dung không còn quyền xem có trạng thái phù hợp, không lộ file | B | CORE |
| G2-02-F005 | **Chủ đề nội dung quan tâm** | Người xem | Lựa chọn hoặc thay đổi chủ đề sở thích từ taxonomy G1-04 làm tín hiệu gợi ý. | Trang chọn chủ đề, toggle | User-topic preferences, taxonomy references | Sở thích đồng bộ theo tài khoản và sử dụng được tại G2-05 | B | OPTION |

**Ký hiệu:** `T` = nhóm yêu cầu được tài liệu VTV8 nêu trực tiếp (thao tác chi tiết có thể do phân tích bổ sung); `B` = nghiệp vụ suy luận để triển khai; `C` = phụ thuộc giấy phép/vendor/quy chế. `CORE` = đề xuất V1 Media Platform cơ sở, `OPTION`/`CONDITIONAL` = chưa mặc định thuộc phạm vi cơ sở. Mức phân loại là **đề xuất**, chưa phải hợp đồng.

[Trở về tổng quan GĐ2](README.md).
