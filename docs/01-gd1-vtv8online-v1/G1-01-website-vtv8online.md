# G1-01 – Website VTV8Online

> **Phân rã GĐ1 V1 ngày 09/10/2026** · Danh sách module được người dùng chọn; **chi tiết tính năng là đề xuất DRAFT**, chưa được VTV8 phê duyệt, chưa tính FE/BE giờ công.

## Mục tiêu
Người xem truy cập miễn phí, không cần tài khoản; đọc nội dung và điều hướng đến các trải nghiệm video/live.

## Ranh giới
Phần khung và hiển thị tin bài thuộc website; trải nghiệm phát VOD ở G1-06, xem trực tiếp ở G1-07. Dữ liệu chuyên mục/thực thể từ G1-04.

## Danh sách tính năng (9)

| ID | Tính năng | Người sử dụng | Nghiệp vụ và đầu ra | FE cần làm | BE cần làm | Nghiệm thu riêng | Nguồn | Phạm vi | Ranh giới sau QA |
|---|---|---|---|---|---|---|---|---|---|
| G1-01-F001 | **Khung website và điều hướng** | Người xem | Giao diện responsive, header/footer, menu chuyên mục, breadcrumb và các trạng thái loading/404; điều hướng desktop/mobile. | Trang hiển thị và điều hướng nhất quán | Giao API cấu hình menu/trang, cache cấu hình | Menu dùng được trên desktop/mobile, trang lỗi có điều hướng | B | CORE | Giữ khung giao diện; bỏ yêu cầu thiết kế hoàn chỉnh mọi template khác vào F001, chỉ tính shell và điều hướng. |
| G1-01-F002 | **Trang chủ và các khối nổi bật** | Người xem | Hiển thị tin mới, bài nổi bật, video/chương trình, lịch live sắp phát; bố cục theo cấu hình biên tập đã có. | Layout các khối, responsive, empty state | API tổng hợp nội dung đã duyệt, thứ tự ưu tiên, cache | Không lộ nội dung chưa xuất bản; mỗi khối dẫn đúng trang | B | CORE | Giữ trang chủ; cần giới hạn số khối và nguồn dữ liệu, không tự xây hệ page builder. |
| G1-01-F003 | **Danh sách nội dung theo chuyên mục** | Người xem | Trang chuyên mục có danh sách bài, phân trang và tùy chọn lọc cơ bản theo thời gian/loại nội dung. | Danh sách, bộ lọc, phân trang | API query published theo taxonomy, sort/page | Không trùng/mất tin khi chuyển trang, đúng chuyên mục | B | CORE | Giữ phạm vi và nghiệm thu đã mô tả. |
| G1-01-F004 | **Trang chi tiết bài viết** | Người xem | Hiển thị tiêu đề, sapo, nội dung rich-text, ảnh, tác giả, thời gian, tag và các liên kết liên quan. | Renderer nội dung an toàn và bố cục bài | Read API, kiểm tra trạng thái published, nội dung đã sanitize | Bài chưa duyệt hoặc đã gỡ không công khai | T | CORE | Giữ bắt buộc nhưng xác định nội dung nào do renderer dùng chung hỗ trợ; nhãn T chỉ chứng minh chủ đề bài viết, không chứng minh từng trường. |
| G1-01-F005 | **Trang chương trình, series và chủ đề** | Người xem | Trang giới thiệu chương trình/series, danh sách bài và các tập liên quan; trang chủ đề sử dụng cấu trúc dữ liệu G1-04. | Template trang danh mục/chương trình | API truy vấn chương trình, series, liên kết nội dung | Xem được đúng các tập, tin liên quan đã công khai | B | CORE | Giữ trang chương trình/series; trang chủ đề dùng chung template, không tách thành nhiều bộ thiết kế độc lập. |
| G1-01-F006 | **Trang hồ sơ thực thể nội dung** | Người xem | Hồ sơ nhân vật/địa danh/di sản/sự kiện với nội dung liên quan khi VTV8 muốn công khai từng loại hồ sơ. | Template hồ sơ tái sử dụng | API public entity và các quan hệ | Ẩn trường nội bộ; hồ sơ chỉ xuất hiện khi được cho phép | C | OPTION | Giữ OPTION: trang công khai nhân vật/địa danh/di sản/sự kiện chưa được VTV8 yêu cầu rõ, tránh tự mở rộng phạm vi. |
| G1-01-F007 | **Tìm kiếm cơ bản trên website** | Người xem | Tìm bài/video/chương trình theo từ khóa cơ bản trên dữ liệu published; V1 chỉ triển khai nếu chọn tùy chọn này, không yêu cầu OpenSearch/semantic search. | Ô tìm kiếm, trang kết quả và phân trang khi chọn | API keyword search published khi chọn | Không trả nội dung nháp/gỡ; kết quả hợp lệ theo từ khóa. | B | OPTION | Đổi CORE sang OPTION cho tìm kiếm website V1. GĐ2 mới nêu rõ tìm kiếm; nếu chốt V1 chỉ làm keyword đơn giản, không OpenSearch riêng. |
| G1-01-F008 | **SEO, đường dẫn và metadata** | Người xem; máy tìm kiếm | URL ổn định, title/description, canonical, sitemap/robots; redirect URL cũ sử dụng mapping từ G1-11. | Metadata SSR/SEO, route xử lý 404/redirect | Public metadata, sitemap generation, đọc bảng redirect | URL công khai có metadata đúng, redirect theo bảng migration | B | CORE | Giữ SEO cơ bản; redirect thuộc G1-01, việc sinh mapping do G1-11, không tính một giải pháp SEO/migration hai lần. |
| G1-01-F009 | **Trang thông tin tĩnh và cấu hình điều hướng** | Người xem; biên tập | Hiển thị trang giới thiệu, liên hệ, chính sách từ CMS G1-03-F010; template có sẵn, không có page builder. | Trang tĩnh public, footer links, 404 | API đọc trang tĩnh đã published từ G1-03-F010 | Bản nháp không public; nội dung published hiển thị đúng URL. | B | CORE | Giữ trang tĩnh công khai; THIẾU nơi nhập liệu trong CMS. Đề xuất thêm feature quản lý trang tĩnh ở G1-03 hoặc giảm xuống nội dung cấu hình cố định. |

**Quy ước:** T = yêu cầu/chủ đề trong tài liệu (luồng chi tiết có thể suy ra); B = suy luận triển khai; C = phụ thuộc quyết định. CORE = đề xuất trong V1; OPTION/CONDITIONAL = chưa thuộc effort cơ sở. Xem [tiêu chí nghiệm thu dùng chung](G1-TIEU-CHI-NGHIEM-THU.md) và [thành phần dùng chung](G1-THANH-PHAN-DUNG-CHUNG.md). Chưa có số giờ FE/BE.

## Những điều cần xác nhận
- Số lượng hồ sơ và người dùng, quy trình hiện hữu của VTV8 và tiêu chí đầu ra tương ứng.
- Số mẫu màn hình và vòng phản hồi UX/UI theo kết quả GĐ0.
- Giới hạn nghiệp vụ đặc thù phải xác nhận trước khi báo giá cố định.

## Liên kết
[Xem toàn bộ danh mục GĐ1](README.md).