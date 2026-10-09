# GĐ1 – Danh mục 86 tính năng VTV8Online V1 (DRAFT)

> **Ngày phân rã:** 09/10/2026 · Cấu trúc **11 module + 2 nhóm hỗ trợ** được người dùng chọn. 86 tính năng dưới đây là **đề xuất phân tích và thiết kế V1**, **chưa được VTV8 phê duyệt**. 
> **Nguồn:** Đề xuất hợp tác VTV8–IIEL trang 3–11. **Điều chỉnh phạm vi của người dùng:** bỏ tích hợp và đồng bộ mạng xã hội, không có Facebook/TikTok/YouTube trong GĐ1.
> `T` = chủ đề/yêu cầu có trong tài liệu nguồn, thao tác chi tiết có thể được suy ra; `B` = yêu cầu triển khai do phân tích bổ sung; `C` = phụ thuộc quyết định/vendor. `CORE` = đề xuất đưa vào cơ sở lập dự toán; `OPTION`/`CONDITIONAL` = chờ chốt và không tự động tính vào dự toán cơ sở.

## Tổng hợp

| Module | Số tính năng | CORE | OPTION/CONDITIONAL |
|---|---:|---:|---:|
| [G1-01 – Website VTV8Online](G1-01-website-vtv8online.md) | 9 | 8 | 1 |
| [G1-02 – Quản trị tài khoản và phân quyền CMS](G1-02-cms-quan-tri.md) | 6 | 5 | 1 |
| [G1-03 – Sản xuất, biên tập và xuất bản nội dung](G1-03-bien-tap-xuat-ban.md) | 9 | 7 | 2 |
| [G1-04 – Quản lý danh mục và nội dung có cấu trúc](G1-04-noi-dung-co-cau-truc.md) | 9 | 9 | 0 |
| [G1-05 – Quản lý tài sản số – DAM cơ bản](G1-05-dam-thu-vien-media.md) | 8 | 8 | 0 |
| [G1-06 – Quản lý và phát video VOD cơ bản](G1-06-video-vod.md) | 6 | 6 | 0 |
| [G1-07 – Livestream và lịch phát sóng](G1-07-livestream-lich-phat.md) | 8 | 8 | 0 |
| [G1-08 – Tích hợp và vận hành nền tảng Streaming](G1-08-streaming-integration.md) | 9 | 7 | 2 |
| [G1-09 – Báo cáo và thống kê nội dung](G1-09-bao-cao-thong-ke.md) | 6 | 5 | 1 |
| [G1-10 – Quản lý và tính nhuận bút](G1-10-nhuan-but.md) | 8 | 7 | 1 |
| [G1-11 – Chuyển đổi dữ liệu từ hệ thống cũ](G1-11-chuyen-doi-du-lieu.md) | 8 | 8 | 0 |
| **Tổng** | **86** | **78** | **8** |

## 86 tính năng với mô tả nghiệp vụ cấp đầu việc

| ID | Tính năng | Nội dung cần làm | Nguồn | Phạm vi |
|---|---|---|---|---|
| [G1-01-F001](G1-01-website-vtv8online.md) | Khung website và điều hướng | Giao diện responsive, header/footer, menu chuyên mục, breadcrumb và các trạng thái loading/404; điều hướng desktop/mobile. | B | CORE |
| [G1-01-F002](G1-01-website-vtv8online.md) | Trang chủ và các khối nổi bật | Hiển thị tin mới, bài nổi bật, video/chương trình, lịch live sắp phát; bố cục theo cấu hình biên tập đã có. | B | CORE |
| [G1-01-F003](G1-01-website-vtv8online.md) | Danh sách nội dung theo chuyên mục | Trang chuyên mục có danh sách bài, phân trang và tùy chọn lọc cơ bản theo thời gian/loại nội dung. | B | CORE |
| [G1-01-F004](G1-01-website-vtv8online.md) | Trang chi tiết bài viết | Hiển thị tiêu đề, sapo, nội dung rich-text, ảnh, tác giả, thời gian, tag và các liên kết liên quan. | T | CORE |
| [G1-01-F005](G1-01-website-vtv8online.md) | Trang chương trình, series và chủ đề | Trang giới thiệu chương trình/series, danh sách bài và các tập liên quan; trang chủ đề sử dụng cấu trúc dữ liệu G1-04. | B | CORE |
| [G1-01-F006](G1-01-website-vtv8online.md) | Trang hồ sơ thực thể nội dung | Hồ sơ nhân vật/địa danh/di sản/sự kiện với nội dung liên quan khi VTV8 muốn công khai từng loại hồ sơ. | C | OPTION |
| [G1-01-F007](G1-01-website-vtv8online.md) | Tìm kiếm cơ bản trên website | Tìm theo tiêu đề/từ khóa bài viết, video và chương trình; hỗ trợ phân trang, không phải semantic search. | B | CORE |
| [G1-01-F008](G1-01-website-vtv8online.md) | SEO, đường dẫn và metadata | URL ổn định, title/description, canonical, sitemap/robots; redirect URL cũ sử dụng mapping từ G1-11. | B | CORE |
| [G1-01-F009](G1-01-website-vtv8online.md) | Trang thông tin tĩnh và cấu hình điều hướng | Trang giới thiệu/liên hệ/chính sách, hiển thị từ nội dung được cấu hình trong CMS; không xây page builder nâng cao. | B | CORE |
| [G1-02-F001](G1-02-cms-quan-tri.md) | Đăng nhập, đăng xuất và phiên CMS | Đăng nhập bằng tài khoản nội bộ, quản lý phiên, timeout, logout, chặn truy cập khi chưa xác thực. | T | CORE |
| [G1-02-F002](G1-02-cms-quan-tri.md) | Hồ sơ cá nhân và đổi/đặt lại mật khẩu | Xem/chỉnh thông tin cá nhân cho phép; đổi mật khẩu; quản trị cấp lại mật khẩu khi mất truy cập. | B | CORE |
| [G1-02-F003](G1-02-cms-quan-tri.md) | Quản lý tài khoản nội bộ | Danh sách, tạo, cập nhật, vô hiệu hóa tài khoản; không xóa cứng tài khoản đã có lịch sử biên tập. | T | CORE |
| [G1-02-F004](G1-02-cms-quan-tri.md) | Quản lý vai trò và ma trận quyền | Định nghĩa vai trò Biên tập/Duyệt/Xuất bản/Quản trị và quyền theo hành động; một người có thể có nhiều vai trò nếu được duyệt. | T | CORE |
| [G1-02-F005](G1-02-cms-quan-tri.md) | Phân quyền theo phòng ban hoặc chuyên mục | Giới hạn quyền biên tập/duyệt theo phòng ban hoặc chuyên mục nếu quy trình VTV8 cần. | C | OPTION |
| [G1-02-F006](G1-02-cms-quan-tri.md) | Nhật ký thao tác quản trị nhạy cảm | Ghi nhận đăng nhập thất bại, tạo/sửa/vô hiệu tài khoản, thay đổi quyền; cung cấp màn truy cứu cơ bản. | B | CORE |
| [G1-03-F001](G1-03-bien-tap-xuat-ban.md) | Soạn thảo và cập nhật bài viết | Tạo/sửa tiêu đề, sapo, rich-text, slug, ảnh đại diện, tác giả, chuyên mục, tag và nội dung liên quan. | T | CORE |
| [G1-03-F002](G1-03-bien-tap-xuat-ban.md) | Danh sách bài và quản lý bản nháp | Lọc bài theo trạng thái, tác giả, chuyên mục và thời gian; lưu nháp thủ công với cảnh báo chưa lưu. | B | CORE |
| [G1-03-F003](G1-03-bien-tap-xuat-ban.md) | Gửi duyệt và hàng đợi biên tập | Gửi bài lên hàng đợi, xem nội dung chờ xử lý, phân công/hiển thị người chịu trách nhiệm theo quy trình VTV8. | T | CORE |
| [G1-03-F004](G1-03-bien-tap-xuat-ban.md) | Yêu cầu chỉnh sửa và phê duyệt | Người duyệt xem, ghi lý do trả bài hoặc phê duyệt; người viết sửa và gửi lại. | B | CORE |
| [G1-03-F005](G1-03-bien-tap-xuat-ban.md) | Xem trước nội dung trước khi công khai | Preview bài nháp theo template website, không tạo liên kết public truy cập tự do. | B | CORE |
| [G1-03-F006](G1-03-bien-tap-xuat-ban.md) | Xuất bản, cập nhật và gỡ bài | Xuất bản bài đã duyệt, xác lập thời điểm, gỡ bài có lý do; cập nhật sau xuất bản phải tuân thủ quy trình duyệt đã chốt. | T | CORE |
| [G1-03-F007](G1-03-bien-tap-xuat-ban.md) | Lập lịch xuất bản | Chọn giờ xuất bản tự động cho bài đã được duyệt, hủy/đổi lịch, trạng thái job. | C | OPTION |
| [G1-03-F008](G1-03-bien-tap-xuat-ban.md) | Lịch sử phiên bản và khôi phục | Xem các bản sửa đã lưu, so sánh và khôi phục phiên bản theo quyền; xác định rõ xử lý bài đang published. | C | OPTION |
| [G1-03-F009](G1-03-bien-tap-xuat-ban.md) | Điều phối vị trí hiển thị nội dung | Ghim nổi bật, thứ tự ưu tiên/trang chủ hoặc chuyên mục trong các slot đã định nghĩa; không xây page builder. | B | CORE |
| [G1-04-F001](G1-04-noi-dung-co-cau-truc.md) | Chuyên mục và cây phân cấp | Tạo/sửa/ẩn/sắp xếp chuyên mục, slug, chuyên mục cha và mô tả; bảo vệ chuyên mục đang được sử dụng. | T | CORE |
| [G1-04-F002](G1-04-noi-dung-co-cau-truc.md) | Hồ sơ tác giả và cộng tác viên | Hồ sơ tác giả/người sản xuất, tên hiển thị, mô tả, liên kết tài khoản CMS nếu có; không đồng nhất tài khoản và hồ sơ tác giả. | T | CORE |
| [G1-04-F003](G1-04-noi-dung-co-cau-truc.md) | Chương trình truyền hình và series | Quản lý chương trình, series, mô tả, ảnh đại diện, thứ tự, trạng thái hiển thị; một chương trình có nhiều series/tập. | T | CORE |
| [G1-04-F004](G1-04-noi-dung-co-cau-truc.md) | Tập/chương trình phát hành | Tạo hồ sơ tập: số tập, tiêu đề, ngày phát, mô tả, quan hệ chương trình và asset/VOD; không xử lý video file. | B | CORE |
| [G1-04-F005](G1-04-noi-dung-co-cau-truc.md) | Hồ sơ nhân vật | Quản lý nhân vật có tên, mô tả, ảnh đại diện, lĩnh vực và liên kết các nội dung liên quan. | T | CORE |
| [G1-04-F006](G1-04-noi-dung-co-cau-truc.md) | Hồ sơ địa danh và cấu trúc địa lý | Quản lý địa danh, địa phương cấp cha, mô tả, tọa độ tùy chọn, liên kết nội dung; xác định danh mục đơn vị hành chính từ dữ liệu VTV8. | T | CORE |
| [G1-04-F007](G1-04-noi-dung-co-cau-truc.md) | Hồ sơ di sản | Quản lý di sản, loại, mô tả, địa danh liên quan và các sản phẩm nội dung nhắc tới di sản. | T | CORE |
| [G1-04-F008](G1-04-noi-dung-co-cau-truc.md) | Sự kiện và thời gian diễn ra | Quản lý sự kiện, thời gian, địa điểm, nội dung liên quan; dữ liệu sự kiện không đồng nghĩa lịch livestream. | T | CORE |
| [G1-04-F009](G1-04-noi-dung-co-cau-truc.md) | Tag, chủ đề và liên kết nội dung | Quản lý tag/chủ đề, gắn nhiều loại thực thể và quan hệ giữa bài, chương trình, nhân vật, địa danh, di sản; hạn chế tạo dữ liệu trùng. | T | CORE |
| [G1-05-F001](G1-05-dam-thu-vien-media.md) | Tải lên và tiếp nhận file media | Upload hình ảnh/video, kiểm tra định dạng, kích thước, dung lượng; có tiến trình upload và báo lỗi. | T | CORE |
| [G1-05-F002](G1-05-dam-thu-vien-media.md) | Thư viện media và tìm lọc | Danh sách lưới/bảng, preview, tìm theo tên, loại, chủ đề, ngày tạo, quyền sử dụng. | B | CORE |
| [G1-05-F003](G1-05-dam-thu-vien-media.md) | Metadata gốc và thông tin sản xuất | Lưu nguồn gốc, ngày sản xuất, người xuất hiện, âm nhạc, địa phương, chủ đề, định dạng gốc và chú thích. | T | CORE |
| [G1-05-F004](G1-05-dam-thu-vien-media.md) | Quản lý quyền và thời hạn khai thác | Ghi quyền sở hữu, phát lại, thời hạn, chứng cứ/tài liệu tham chiếu và trạng thái xác nhận quyền; cảnh báo khi không đủ điều kiện. | T | CORE |
| [G1-05-F005](G1-05-dam-thu-vien-media.md) | Quản lý bản gốc và phiên bản xuất bản | Liên kết file gốc với thumbnail, poster, phiên bản phát hành hoặc phiên bản kỹ thuật nhận từ nền tảng media; không tự lập trình transcoder. | T | CORE |
| [G1-05-F006](G1-05-dam-thu-vien-media.md) | Ảnh đại diện, thumbnail và chọn file dùng trong bài | Chọn/cắt hoặc dùng ảnh đại diện có sẵn, gắn vào bài, chương trình hoặc poster video theo thông tin asset. | B | CORE |
| [G1-05-F007](G1-05-dam-thu-vien-media.md) | Gắn tag, nhóm và liên kết đối tượng media | Gắn media vào chương trình, chủ đề, địa danh và các nhóm phục vụ tìm kiếm/tái sử dụng. | B | CORE |
| [G1-05-F008](G1-05-dam-thu-vien-media.md) | Thao tác xóa, lưu trữ và kiểm tra nơi sử dụng | Ẩn/lưu trữ asset, hạn chế xóa vật lý file đang được bài/video sử dụng, ghi lại lý do. | B | CORE |
| [G1-06-F001](G1-06-video-vod.md) | Quản lý bản phát VOD và trạng thái sẵn sàng | Gắn asset từ DAM với playback manifest/đường dẫn do hạ tầng media cung cấp, kiểm tra ready/failed trước công khai. | B | CORE |
| [G1-06-F002](G1-06-video-vod.md) | Xuất bản và danh mục video công khai | Xác định tiêu đề, thumbnail, mô tả, chương trình/tập liên quan, trạng thái xuất bản và danh sách video. | T | CORE |
| [G1-06-F003](G1-06-video-vod.md) | Trình phát VOD trên website | Player hỗ trợ play/pause/seek/fullscreen, âm lượng, poster và nguồn phát phù hợp từ Streaming Infrastructure. | B | CORE |
| [G1-06-F004](G1-06-video-vod.md) | Trang video và điều hướng tập/chương trình | Trang chi tiết video, metadata, tập trước/sau và video cùng chương trình; sử dụng dữ liệu chương trình G1-04. | B | CORE |
| [G1-06-F005](G1-06-video-vod.md) | Trạng thái lỗi phát và dự phòng UI | Xử lý manifest lỗi, media không khả dụng, quá hạn quyền, đường truyền gián đoạn; hiển thị lỗi có thể hiểu được. | B | CORE |
| [G1-06-F006](G1-06-video-vod.md) | Phát lại sau sự kiện Livestream | Nhận bản ghi từ G1-08 và liên kết với sự kiện G1-07, phê duyệt trước khi xuất bản như một video. | T | CORE |
| [G1-07-F001](G1-07-livestream-lich-phat.md) | Danh mục chương trình/sự kiện livestream | Tạo/sửa thông tin chương trình trực tiếp, loại bản tin trưa/tối/chương trình đặc biệt/sự kiện, ảnh đại diện và mô tả. | T | CORE |
| [G1-07-F002](G1-07-livestream-lich-phat.md) | Lập và thay đổi lịch phát | Lên lịch ngày/giờ bắt đầu và thời lượng dự kiến, cập nhật/hủy buổi phát; cảnh báo lịch chồng nếu dùng cùng kênh. | T | CORE |
| [G1-07-F003](G1-07-livestream-lich-phat.md) | Gắn nguồn phát/kênh và kiểm tra sẵn sàng | Chọn kênh/stream từ G1-08 cho sự kiện, kiểm tra đã có thông tin phát hợp lệ trước giờ lên sóng. | B | CORE |
| [G1-07-F004](G1-07-livestream-lich-phat.md) | Trạng thái trước/đang/sau phát | Quản lý dự kiến, chuẩn bị, đang live, kết thúc, hủy; ưu tiên trạng thái thật từ bên Streaming, cho phép thao tác tay có kiểm soát khi tích hợp hạn chế. | B | CORE |
| [G1-07-F005](G1-07-livestream-lich-phat.md) | Trang xem trực tiếp | Hiển thị chương trình đang phát, player, mô tả, lịch kế tiếp và thông báo khi chưa đến giờ; không cần tài khoản. | T | CORE |
| [G1-07-F006](G1-07-livestream-lich-phat.md) | Lịch phát sóng công khai | Xem danh sách bản tin và sự kiện theo ngày, bộ lọc thời gian/loại, điều hướng tới trang chương trình. | T | CORE |
| [G1-07-F007](G1-07-livestream-lich-phat.md) | Kết thúc live và chuyển sang phát lại | Khi live kết thúc, lấy trạng thái recording, tạo nội dung bản ghi chờ biên tập, liên kết VOD G1-06; có thể không có recording. | T | CORE |
| [G1-07-F008](G1-07-livestream-lich-phat.md) | Thông báo gián đoạn và trạng thái sự cố | Hiển thị cảnh báo khi luồng lỗi/mất nguồn, tự thử lại có giới hạn và trạng thái chuyển phương án dự phòng do VTV8 xác nhận. | B | CORE |
| [G1-08-F001](G1-08-streaming-integration.md) | Ma trận năng lực và hợp đồng tích hợp media | Xác nhận API, cấp stream/channel, quyền truy cập, HLS/DASH, recording, transcoding, CDN, monitoring, giới hạn và đầu mối SLA theo kết quả GĐ0. | B | CORE |
| [G1-08-F002](G1-08-streaming-integration.md) | Cấu hình kết nối đối tác và kênh phát | Thiết lập môi trường kết nối, kênh streaming, credential và liên kết với sự kiện; secret không hiển thị public. | B | CORE |
| [G1-08-F003](G1-08-streaming-integration.md) | Tích hợp nguồn RTMP/SRT ingest | Thiết lập hoặc tiếp nhận thông tin điểm ingest, stream key/quyền phát từ đối tác; tùy API có thể tự tạo kênh hay cấu hình thủ công. | C | CONDITIONAL |
| [G1-08-F004](G1-08-streaming-integration.md) | Playback manifest và tương thích trình phát | Kết nối HLS/DASH/URL media hợp lệ, kiểm soát trạng thái nguồn, player config và các trường hợp hết hạn token nếu nhà cung cấp có. | B | CORE |
| [G1-08-F005](G1-08-streaming-integration.md) | Cấu hình transcoding và bitrate thích ứng | Thống nhất các profile 360p/720p/1080p theo năng lực hạ tầng; nếu đối tác cung cấp API cấu hình, hệ thống dùng tích hợp, không tự viết transcoder. | C | CONDITIONAL |
| [G1-08-F006](G1-08-streaming-integration.md) | Kết nối Origin, lưu trữ phân phối và CDN | Cấu hình origin/CDN, cache, domain và đường truyền theo kiến trúc/nhà cung cấp; CDN fees và thiết bị là chi phí riêng. | B | CORE |
| [G1-08-F007](G1-08-streaming-integration.md) | Tiếp nhận bản ghi sau livestream | Nhận webhook/status bản ghi, metadata, URL/file ID; chuyển liên kết về DAM và G1-06 mà không công khai tự động. | T | CORE |
| [G1-08-F008](G1-08-streaming-integration.md) | Theo dõi trạng thái nguồn và cảnh báo cơ bản | Nhận status ingest/playback/recording và các chỉ số đối tác cung cấp, cảnh báo qua kênh nội bộ đã chốt; không mặc định QoE analytics sâu. | B | CORE |
| [G1-08-F009](G1-08-streaming-integration.md) | Kiểm chứng khả năng tải, QoE và SLA | Lập kế hoạch kiểm chứng CCU website khác viewer video; test thực tế theo tầng và bằng chứng từ vendor; phân định SLA ứng dụng/CDN/streaming. | T | CORE |
| [G1-09-F001](G1-09-bao-cao-thong-ke.md) | Tổng quan CMS/dashboard nội dung | Hiển thị số lượng nội dung theo loại/trạng thái, số bài trong kỳ và thông báo dữ liệu cập nhật đến mốc nào. | T | CORE |
| [G1-09-F002](G1-09-bao-cao-thong-ke.md) | Thống kê sản lượng theo tác giả và chuyên mục | Báo cáo bài được xuất bản theo tác giả, chuyên mục, loại bài, trạng thái và mốc thời gian. | T | CORE |
| [G1-09-F003](G1-09-bao-cao-thong-ke.md) | Thu thập lượt xem bài viết | Ghi lượt xem nội dung public với định nghĩa sự kiện rõ ràng, chống ghi đúp cơ bản và không cần định danh cá nhân. | T | CORE |
| [G1-09-F004](G1-09-bao-cao-thong-ke.md) | Lượt xem video và livestream | Hiển thị số lượt xem video/live bằng dữ liệu có nguồn rõ; dữ liệu vendor chỉ dùng nếu đối tác cung cấp API/export và định nghĩa chỉ số. | C | CONDITIONAL |
| [G1-09-F005](G1-09-bao-cao-thong-ke.md) | Báo cáo theo thời gian và xuất dữ liệu | Lọc khoảng thời gian, loại nội dung/chuyên mục, xuất bảng CSV/XLSX dữ liệu tổng hợp theo quyền. | B | CORE |
| [G1-09-F006](G1-09-bao-cao-thong-ke.md) | Quy tắc thống kê, đối soát và khóa kỳ dữ liệu | Lưu định nghĩa chỉ số, mốc cập nhật và cách sửa số liệu khi dữ liệu chuyển đổi hoặc vendor điều chỉnh; không tự tính là số đã đối soát nếu chưa xác minh. | B | CORE |
| [G1-10-F001](G1-10-nhuan-but.md) | Quản lý người tham gia và vai trò trên sản phẩm | Gắn nhiều người vào một bài/chương trình/video với vai trò viết, quay, dựng, biên tập... theo danh mục VTV8 duyệt; liên kết hồ sơ G1-04. | B | CORE |
| [G1-10-F002](G1-10-nhuan-but.md) | Quản lý bảng mức và quy tắc nhuận bút | Khai báo loại nội dung, đơn giá/hệ số và điều kiện được hưởng theo quy chế VTV8 cung cấp; quản lý ngày hiệu lực của quy tắc. | B | CORE |
| [G1-10-F003](G1-10-nhuan-but.md) | Xác định sản phẩm đủ điều kiện tính | Lọc sản phẩm theo kỳ, ngày xuất bản, trạng thái duyệt và vai trò tham gia; loại trừ sản phẩm bị hủy/gỡ theo quy chế. | B | CORE |
| [G1-10-F004](G1-10-nhuan-but.md) | Tạo kỳ và chạy tính nhuận bút | Chọn kỳ tính, xem trước tổng, chạy tính từng sản phẩm/người và lưu công thức áp dụng tại thời điểm tính. | T | CORE |
| [G1-10-F005](G1-10-nhuan-but.md) | Bảng kê chi tiết theo người và sản phẩm | Xem tổng tiền, chi tiết từng bài/video, vai trò, quy tắc và biến số dẫn tới kết quả. | B | CORE |
| [G1-10-F006](G1-10-nhuan-but.md) | Điều chỉnh và xử lý ngoại lệ | Cho phép ghi nhận điều chỉnh có lý do theo chính sách, lưu bản trước/sau; không tự sửa số tiền tổng mà không có dấu vết. | B | CORE |
| [G1-10-F007](G1-10-nhuan-but.md) | Rà soát, phê duyệt và khóa kỳ | Kỳ dự thảo, đối soát, phê duyệt và khóa nếu VTV8 có quy trình; khi mở lại cần quyền và log. | C | OPTION |
| [G1-10-F008](G1-10-nhuan-but.md) | Xuất bảng kê phục vụ chi trả | Xuất bảng tổng hợp theo cá nhân/kỳ và chi tiết để chuyển bộ phận thanh toán; **không** chi tiền trực tiếp. | T | CORE |
| [G1-11-F001](G1-11-chuyen-doi-du-lieu.md) | Khóa danh mục nguồn và phạm vi dữ liệu | Lập manifest nguồn: bài, ảnh, video, chuyên mục, tác giả, URL và thời kỳ chuyển đổi; chốt loại dữ liệu bị loại và quyền truy cập. | T | CORE |
| [G1-11-F002](G1-11-chuyen-doi-du-lieu.md) | Trích xuất website/CMS/kho dữ liệu cũ | Viết hoặc cấu hình công cụ đọc export/API/database đã được VTV8 cho phép, không cào mạng xã hội. | T | CORE |
| [G1-11-F003](G1-11-chuyen-doi-du-lieu.md) | Mapping dữ liệu sang cấu trúc mới | Mapping trường bài viết, nội dung, taxonomy, contributor, chương trình, trạng thái và media links; ghi rõ trường không tương ứng. | B | CORE |
| [G1-11-F004](G1-11-chuyen-doi-du-lieu.md) | Làm sạch, chuẩn hóa và khử trùng | Chuẩn hóa mã ký tự, thời gian, tên, đường dẫn, trùng lặp bài/file theo ID/hash/quy tắc; không tự xóa tài sản nghi ngờ. | T | CORE |
| [G1-11-F005](G1-11-chuyen-doi-du-lieu.md) | Nhập dữ liệu nội dung/media có kiểm soát quyền | Nhập bài và assets vào CMS/DAM; gắn metadata quyền đã được VTV8 xác minh, đưa thiếu quyền vào chờ duyệt. | T | CORE |
| [G1-11-F006](G1-11-chuyen-doi-du-lieu.md) | Chạy thử, báo cáo lỗi và chạy lại lô | Dry-run trên mẫu, log lỗi từng bản ghi, checkpoint, retry/skip theo trường hợp; cho phép khởi chạy lại an toàn. | B | CORE |
| [G1-11-F007](G1-11-chuyen-doi-du-lieu.md) | Đối soát và nghiệm thu dữ liệu | Đối chiếu số lượng/loại bản ghi, media links, metadata quan trọng, các mẫu bài/video và danh sách lỗi tồn. | T | CORE |
| [G1-11-F008](G1-11-chuyen-doi-du-lieu.md) | Chuyển URL cũ và cutover dữ liệu | Lập mapping URL nguồn/đích, cung cấp cho G1-01 redirect, đồng bộ delta cuối và phương án rollback/cutover. | B | CORE |

## Nguyên tắc đối chiếu để không tính trùng

1. **G1-02** chỉ đăng nhập/tài khoản/phân quyền; **G1-03** có luồng duyệt và vòng đời bài viết; tác giả/người tham gia ở **G1-04/G1-10**, không phải mặc định trùng với tài khoản CMS.
2. **G1-03** tạo bài và xuất bản; **G1-04** quản lý các thực thể có cấu trúc; **G1-05** quản lý file và quyền media.
3. **G1-01** hiển thị website và danh sách tin; **G1-06** sở hữu trải nghiệm phát video; **G1-07** sở hữu hoạt động phát trực tiếp; **G1-08** sở hữu tích hợp media server/CDN/provider và kiểm chứng tải. Cùng một player component được dùng lại, không tính như phát triển hai lần.
4. **G1-09** sở hữu thống kê và định nghĩa view; **G1-10** sở hữu công thức, kỳ và bảng kê nhuận bút.
5. **G1-11** sở hữu công cụ/chạy migration; redirect public được hiển thị tại **G1-01**, không lập trình hai lần. Thực hiện migration dữ liệu thực tế tách công sức khỏi code.
6. **G1-H01/H02** là công việc hỗ trợ, chi phí ngoài chức năng; QA tiêu chuẩn theo tỷ trọng Excel không được tính lại; performance test streaming ở **G1-08-F009** không thêm lần nữa ở H02.

## Thông tin còn thiếu bắt buộc cần xác minh
- Số cấp duyệt; số bộ phận/quyền; quy tắc xuất bản sau sửa; lịch đăng và revision.
- Những loại hồ sơ di sản/nhân vật/sự kiện có trang công khai hay chỉ làm dữ liệu liên kết.
- Quy chế nhuận bút chính thức, đối tượng nhận, các hệ số, kỳ, quy trình phê duyệt và mẫu bảng kê.
- Quy mô hệ thống cũ, chất lượng và quyền khai thác dữ liệu; nguồn nào VTV8 cung cấp và khối lượng chuyển thật.
- Ranh giới streaming: các API/ingest/transcoding/recording/CDN/SLA do VTVcab/VTVprime/đối tác cung cấp và phần do nhóm phát triển đảm nhận.
- Phân biệt CCU truy cập website với người xem video đồng thời; chuẩn nghiệm thu 120.000 CCU dựa trên bài test có căn cứ.

## Tài liệu tham chiếu
- [Tài liệu nguồn VTV8](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md).
- [Ước tính GĐ0 đang DRAFT](../../bao-gia/DU-TOAN-EFFORT-GD0-DU-THAO.md).
- [Hạ tầng và triển khai ứng dụng](G1-H01-ha-tang-van-hanh.md).
- [Kiểm thử, nghiệm thu và chuyển giao](G1-H02-nghiem-thu-chuyen-giao.md).
