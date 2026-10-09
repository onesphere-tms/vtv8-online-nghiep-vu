# G1-04 – Quản lý danh mục và nội dung có cấu trúc

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Cấu trúc module đã được người dùng chọn; tính năng chi tiết là **DRAFT chờ rà soát**, không phải xác nhận của VTV8. Chưa ước tính giờ FE/BE.

## Mục tiêu
Xây taxonomy và các thực thể nội dung có thể liên kết, tìm kiếm, tái sử dụng trên website, DAM, VOD và CMS.

## Ranh giới và phụ thuộc
Chỉ quản lý metadata, thực thể, quan hệ; soạn thảo/xuất bản bài thuộc G1-03, upload file thuộc G1-05; không có booking, khách sạn/tour/commerce V1.

## Danh sách tính năng (9)

| ID | Tính năng | Actor | Luồng xử lý/đầu ra | FE cần làm | BE cần làm | Nghiệm thu sơ bộ | Nguồn | Phạm vi |
|---|---|---|---|---|---|---|---|---|
| G1-04-F001 | **Chuyên mục và cây phân cấp** | Biên tập; quản trị nội dung | Tạo/sửa/ẩn/sắp xếp chuyên mục, slug, chuyên mục cha và mô tả; bảo vệ chuyên mục đang được sử dụng. | Tree editor, drag/order, form | CRUD taxonomy, slug unique, reference rules | Không tạo vòng lặp parent và không xóa làm mất liên kết | T | CORE |
| G1-04-F002 | **Hồ sơ tác giả và cộng tác viên** | Biên tập; quản trị | Hồ sơ tác giả/người sản xuất, tên hiển thị, mô tả, liên kết tài khoản CMS nếu có; không đồng nhất tài khoản và hồ sơ tác giả. | Danh sách/form, chọn trong bài viết | CRUD contributor, link user optional, trạng thái | Một tác giả có thể gắn nhiều bài, vẫn còn hồ sơ khi khóa user | T | CORE |
| G1-04-F003 | **Chương trình truyền hình và series** | Biên tập; bộ phận chương trình | Quản lý chương trình, series, mô tả, ảnh đại diện, thứ tự, trạng thái hiển thị; một chương trình có nhiều series/tập. | CRUD program/series, bộ sắp tập | APIs, hierarchies, quan hệ metadata | Hiển thị được danh sách series đúng chương trình | T | CORE |
| G1-04-F004 | **Tập/chương trình phát hành** | Biên tập; bộ phận chương trình | Tạo hồ sơ tập: số tập, tiêu đề, ngày phát, mô tả, quan hệ chương trình và asset/VOD; không xử lý video file. | Form tập, chọn media, sort | Episode entity, references program/asset | Tập có thể liên kết video khác nhau mà không nhân đôi file | B | CORE |
| G1-04-F005 | **Hồ sơ nhân vật** | Biên tập | Quản lý nhân vật có tên, mô tả, ảnh đại diện, lĩnh vực và liên kết các nội dung liên quan. | List/form, chọn nội dung liên quan | CRUD person metadata, relation API | Tìm và liên kết cùng một nhân vật từ nhiều bài | T | CORE |
| G1-04-F006 | **Hồ sơ địa danh và cấu trúc địa lý** | Biên tập | Quản lý địa danh, địa phương cấp cha, mô tả, tọa độ tùy chọn, liên kết nội dung; xác định danh mục đơn vị hành chính từ dữ liệu VTV8. | Form địa danh, chọn cha/map field tùy chọn | Location entity/hierarchy, kiểm tra tham chiếu | Một bài/video gắn được nhiều địa danh | T | CORE |
| G1-04-F007 | **Hồ sơ di sản** | Biên tập | Quản lý di sản, loại, mô tả, địa danh liên quan và các sản phẩm nội dung nhắc tới di sản. | CRUD di sản, liên kết địa danh | Heritage entity, relation constraints | Hiển thị được quan hệ di sản và địa danh | T | CORE |
| G1-04-F008 | **Sự kiện và thời gian diễn ra** | Biên tập | Quản lý sự kiện, thời gian, địa điểm, nội dung liên quan; dữ liệu sự kiện không đồng nghĩa lịch livestream. | Form sự kiện, danh sách | Event CRUD, relation mapping | Sự kiện liên kết được bài viết/video mà không trùng lịch live | T | CORE |
| G1-04-F009 | **Tag, chủ đề và liên kết nội dung** | Biên tập | Quản lý tag/chủ đề, gắn nhiều loại thực thể và quan hệ giữa bài, chương trình, nhân vật, địa danh, di sản; hạn chế tạo dữ liệu trùng. | Tag picker, relation UI, tìm thực thể | Tag taxonomy, typed relations, duplicate prevention | Cùng một thực thể xuất hiện trong nhiều nội dung với liên kết đúng | T | CORE |

**Nguồn:** `T` = có chủ đề/yêu cầu trực tiếp trong đề xuất VTV8 (luồng chi tiết có thể suy ra); `B` = bổ sung nghiệp vụ cần thiết; `C` = tùy chọn/điều kiện. **Phạm vi:** `CORE` = đề xuất tính trong baseline GĐ1; `OPTION` = chờ quyết định, chưa tính giờ baseline. Các cột FE/BE mô tả phần việc, **không phải số giờ**.

## Điều kiện xác nhận
- Quy trình thực tế, trường dữ liệu và mẫu giao diện do GĐ0 khảo sát và các bên thống nhất.
- Tài liệu VTV8 mới nêu nhóm đối tượng/ý tưởng; việc triển khai các hành động và tiêu chí nghiệm thu là phân tích đề xuất.
- Tích hợp media và dữ liệu bên ngoài chỉ chốt sau khi xác định nguồn cung cấp và quyền truy cập.

[Xem danh mục GĐ1](README.md).