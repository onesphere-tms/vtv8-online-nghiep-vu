# G1-01 – Website VTV8Online

> **Phân rã GĐ1 V1 ngày 09/10/2026** · Danh sách module được người dùng chọn; **chi tiết tính năng là đề xuất DRAFT**, chưa được VTV8 phê duyệt, chưa tính FE/BE giờ công.

## Mục tiêu
Người xem truy cập miễn phí, không cần tài khoản; đọc nội dung và điều hướng đến các trải nghiệm video/live.

## Ranh giới
Phần khung và hiển thị tin bài thuộc website; trải nghiệm phát VOD ở G1-06, xem trực tiếp ở G1-07. Dữ liệu chuyên mục/thực thể từ G1-04.

## Danh sách tính năng (9)

| ID | Tính năng | Người sử dụng | Nghiệp vụ / luồng chính | Phần việc FE | Phần việc BE | Tiêu chí nghiệm thu sơ bộ | Nguồn | Phạm vi |
|---|---|---|---|---|---|---|---|---|
| G1-01-F001 | **Khung website và điều hướng** | Người xem | Giao diện responsive, header/footer, menu chuyên mục, breadcrumb và các trạng thái loading/404; điều hướng desktop/mobile. | Trang hiển thị và điều hướng nhất quán | Giao API cấu hình menu/trang, cache cấu hình | Menu dùng được trên desktop/mobile, trang lỗi có điều hướng | B | CORE |
| G1-01-F002 | **Trang chủ và các khối nổi bật** | Người xem | Hiển thị tin mới, bài nổi bật, video/chương trình, lịch live sắp phát; bố cục theo cấu hình biên tập đã có. | Layout các khối, responsive, empty state | API tổng hợp nội dung đã duyệt, thứ tự ưu tiên, cache | Không lộ nội dung chưa xuất bản; mỗi khối dẫn đúng trang | B | CORE |
| G1-01-F003 | **Danh sách nội dung theo chuyên mục** | Người xem | Trang chuyên mục có danh sách bài, phân trang và tùy chọn lọc cơ bản theo thời gian/loại nội dung. | Danh sách, bộ lọc, phân trang | API query published theo taxonomy, sort/page | Không trùng/mất tin khi chuyển trang, đúng chuyên mục | B | CORE |
| G1-01-F004 | **Trang chi tiết bài viết** | Người xem | Hiển thị tiêu đề, sapo, nội dung rich-text, ảnh, tác giả, thời gian, tag và các liên kết liên quan. | Renderer nội dung an toàn và bố cục bài | Read API, kiểm tra trạng thái published, nội dung đã sanitize | Bài chưa duyệt hoặc đã gỡ không công khai | T | CORE |
| G1-01-F005 | **Trang chương trình, series và chủ đề** | Người xem | Trang giới thiệu chương trình/series, danh sách bài và các tập liên quan; trang chủ đề sử dụng cấu trúc dữ liệu G1-04. | Template trang danh mục/chương trình | API truy vấn chương trình, series, liên kết nội dung | Xem được đúng các tập, tin liên quan đã công khai | B | CORE |
| G1-01-F006 | **Trang hồ sơ thực thể nội dung** | Người xem | Hồ sơ nhân vật/địa danh/di sản/sự kiện với nội dung liên quan khi VTV8 muốn công khai từng loại hồ sơ. | Template hồ sơ tái sử dụng | API public entity và các quan hệ | Ẩn trường nội bộ; hồ sơ chỉ xuất hiện khi được cho phép | C | OPTION |
| G1-01-F007 | **Tìm kiếm cơ bản trên website** | Người xem | Tìm theo tiêu đề/từ khóa bài viết, video và chương trình; hỗ trợ phân trang, không phải semantic search. | Ô tìm kiếm, kết quả, empty state | API search đơn giản trên dữ liệu đã công khai | Không tìm ra nội dung nháp; kết quả hợp lệ khi không dấu | B | CORE |
| G1-01-F008 | **SEO, đường dẫn và metadata** | Người xem; máy tìm kiếm | URL ổn định, title/description, canonical, sitemap/robots; redirect URL cũ sử dụng mapping từ G1-11. | Metadata SSR/SEO, route xử lý 404/redirect | Public metadata, sitemap generation, đọc bảng redirect | URL công khai có metadata đúng, redirect theo bảng migration | B | CORE |
| G1-01-F009 | **Trang thông tin tĩnh và cấu hình điều hướng** | Người xem; biên tập | Trang giới thiệu/liên hệ/chính sách, hiển thị từ nội dung được cấu hình trong CMS; không xây page builder nâng cao. | Template trang tĩnh, footer links | API nội dung tĩnh và xuất bản | Chỉnh nội dung CMS phản ánh lên website đúng trạng thái | B | CORE |

**Chú giải:** `T` = có chủ đề/yêu cầu trực tiếp trong đề xuất VTV8 (thao tác chi tiết có thể được suy ra); `B` = bổ sung suy luận để V1 hoạt động trọn luồng; `C` = có điều kiện hoặc lựa chọn cần xác nhận. `CORE` = đề xuất đưa vào phạm vi V1 cơ sở để lập dự toán; `OPTION` = chưa đưa vào giờ cơ sở khi chưa chốt. Các cột FE/BE là **phạm vi việc**, chưa phải ước tính thời gian.

## Những điều cần xác nhận
- Số lượng hồ sơ và người dùng, quy trình hiện hữu của VTV8 và tiêu chí đầu ra tương ứng.
- Số mẫu màn hình và vòng phản hồi UX/UI theo kết quả GĐ0.
- Giới hạn nghiệp vụ đặc thù phải xác nhận trước khi báo giá cố định.

## Liên kết
[Xem toàn bộ danh mục GĐ1](README.md).