# G1-04 – Quản lý danh mục và nội dung có cấu trúc

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Cấu trúc module đã được người dùng chọn; tính năng chi tiết là **DRAFT chờ rà soát**, không phải xác nhận của VTV8. Chưa ước tính giờ FE/BE.

## Mục tiêu
Xây taxonomy và các thực thể nội dung có thể liên kết, tìm kiếm, tái sử dụng trên website, DAM, VOD và CMS.

## Ranh giới và phụ thuộc
Chỉ quản lý metadata, thực thể, quan hệ; soạn thảo/xuất bản bài thuộc G1-03, upload file thuộc G1-05; không có booking, khách sạn/tour/commerce V1.

## Danh sách tính năng (9)

| ID | Tính năng | Người sử dụng | Nghiệp vụ và đầu ra | FE cần làm | BE cần làm | Nghiệm thu riêng | Nguồn | Phạm vi | Ranh giới sau QA |
|---|---|---|---|---|---|---|---|---|---|
| G1-04-F001 | **Chuyên mục và cây phân cấp** | Biên tập; quản trị nội dung | Tạo/sửa/ẩn/sắp xếp chuyên mục, slug, chuyên mục cha và mô tả; bảo vệ chuyên mục đang được sử dụng. | Tree editor, drag/order, form | CRUD taxonomy, slug unique, reference rules | Không tạo vòng lặp parent và không xóa làm mất liên kết | T | CORE | Giữ phạm vi và nghiệm thu đã mô tả. |
| G1-04-F002 | **Hồ sơ tác giả và cộng tác viên** | Biên tập; quản trị | Hồ sơ tác giả/người sản xuất độc lập với tài khoản CMS, có thể liên kết tùy chọn. G1-10 chỉ quản lý đóng góp theo sản phẩm, không tạo hồ sơ trùng. | Danh sách/form, chọn trong bài viết | CRUD contributor, link user optional, trạng thái | Một tác giả có thể gắn nhiều bài, vẫn còn hồ sơ khi khóa user | T | CORE | Giữ hồ sơ tác giả, phân biệt với tài khoản nội bộ và người tham gia thực tế; tái dùng G1-10, không xây nhân sự/HRM. |
| G1-04-F003 | **Chương trình truyền hình và series** | Biên tập; bộ phận chương trình | Quản lý chương trình, series, mô tả, ảnh đại diện, thứ tự, trạng thái hiển thị; một chương trình có nhiều series/tập. | CRUD program/series, bộ sắp tập | APIs, hierarchies, quan hệ metadata | Hiển thị được danh sách series đúng chương trình | T | CORE | Giữ chương trình/series; xác định quan hệ giữa chương trình và series, không nhân đôi hồ sơ tập G1-04-F004. |
| G1-04-F004 | **Tập/chương trình phát hành** | Biên tập; bộ phận chương trình | Quản lý tập như hồ sơ metadata thuộc chương trình/series, có thứ tự và ngày phát; trạng thái bản phát thuộc G1-06. | Form tập, chọn media, sort | Episode entity, references program/asset | Tập có thể liên kết video khác nhau mà không nhân đôi file | B | CORE | Giữ tập tối thiểu cho VOD; cần phân rõ 'tập' là metadata G1-04, trạng thái bản phát là G1-06. |
| G1-04-F005 | **Hồ sơ nhân vật** | Biên tập | Quản lý nhân vật có tên, mô tả, ảnh đại diện, lĩnh vực và liên kết các nội dung liên quan. | List/form, chọn nội dung liên quan | CRUD person metadata, relation API | Tìm và liên kết cùng một nhân vật từ nhiều bài | T | CORE | Giữ hồ sơ nhân vật ở mức dữ liệu gọn; không thêm trang thông tin public ngoài G1-01-F006. |
| G1-04-F006 | **Hồ sơ địa danh và cấu trúc địa lý** | Biên tập | Quản lý địa danh và quan hệ địa phương cha/con ở mức dữ liệu biên tập; không mặc định bản đồ, geocoding hoặc danh mục hành chính đầy đủ. | Form địa danh, chọn cha/map field tùy chọn | Location entity/hierarchy, kiểm tra tham chiếu | Một bài/video gắn được nhiều địa danh | T | CORE | Giữ địa danh với quan hệ cha và tham chiếu cơ bản; bản đồ, chuẩn hóa toàn bộ đơn vị hành chính và geocoding không mặc định. |
| G1-04-F007 | **Hồ sơ di sản** | Biên tập | Quản lý di sản, loại, mô tả, địa danh liên quan và các sản phẩm nội dung nhắc tới di sản. | CRUD di sản, liên kết địa danh | Heritage entity, relation constraints | Hiển thị được quan hệ di sản và địa danh | T | CORE | Giữ di sản như thực thể có cấu trúc, không tự đưa bộ hồ sơ di sản chuyên sâu/giấy phép chuyên ngành vào V1. |
| G1-04-F008 | **Sự kiện và thời gian diễn ra** | Biên tập | Quản lý sự kiện, thời gian, địa điểm, nội dung liên quan; dữ liệu sự kiện không đồng nghĩa lịch livestream. | Form sự kiện, danh sách | Event CRUD, relation mapping | Sự kiện liên kết được bài viết/video mà không trùng lịch live | T | CORE | Giữ sự kiện dạng metadata và liên kết; phân biệt 'sự kiện nội dung' với lịch livestream G1-07-F001. |
| G1-04-F009 | **Tag, chủ đề và liên kết nội dung** | Biên tập | Quản lý tag/chủ đề và quan hệ nội dung dùng chung cho bài, video, media, chương trình và thực thể; DAM dùng chung API. | Tag picker, relation UI, tìm thực thể | Một taxonomy/relation service dùng chung, kiểm tra trùng và tham chiếu | Một tag liên kết được nhiều loại nội dung, không có hệ tag song song. | T | CORE | Giữ tag và quan hệ nhiều-nhiều nhưng xây một bộ chọn/quan hệ tái sử dụng, không ước tính giao diện gắn tag riêng cho từng thực thể. |

**Quy ước:** T = chủ đề trực tiếp trong nguồn VTV8 (luồng chi tiết có thể suy ra); B = bổ sung triển khai; C = quyết định/vendor. CORE = đề xuất V1 cơ sở; OPTION/CONDITIONAL = chưa cộng giờ cơ sở. Xem [nghiệm thu dùng chung](G1-TIEU-CHI-NGHIEM-THU.md) và [thành phần dùng chung](G1-THANH-PHAN-DUNG-CHUNG.md). Chưa có giờ FE/BE.

## Điều kiện xác nhận
- Quy trình thực tế, trường dữ liệu và mẫu giao diện do GĐ0 khảo sát và các bên thống nhất.
- Tài liệu VTV8 mới nêu nhóm đối tượng/ý tưởng; việc triển khai các hành động và tiêu chí nghiệm thu là phân tích đề xuất.
- Tích hợp media và dữ liệu bên ngoài chỉ chốt sau khi xác định nguồn cung cấp và quyền truy cập.

[Xem danh mục GĐ1](README.md).