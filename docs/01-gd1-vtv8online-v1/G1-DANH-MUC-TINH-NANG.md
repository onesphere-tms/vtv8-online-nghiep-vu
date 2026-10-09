# GĐ1 – Danh mục 82 tính năng VTV8Online V1 sau rà soát

> **09/10/2026 · DRAFT với VTV8.** Cấu trúc 11 module + 2 nhóm hỗ trợ đã được người dùng chọn, 82 tính năng sau QA gồm **72 CORE, 10 OPTION/CONDITIONAL**. Chưa có giờ FE/BE hay xác nhận phạm vi từ VTV8.
> **Phạm vi điều chỉnh:** Không tích hợp, đồng bộ hoặc quản trị mạng xã hội. Dữ liệu chuyển đổi chỉ lấy từ hệ thống cũ/kho được VTV8 cấp. Phương án Streaming ưu tiên tích hợp năng lực vendor, không mặc định tự xây Media Server/CDN/transcoding.

## 1. Tổng hợp

| Module | Tổng tính năng | CORE | OPTION/CONDITIONAL |
|---|---:|---:|---:|
| [G1-01 – Website VTV8Online](G1-01-website-vtv8online.md) | 9 | 7 | 2 |
| [G1-02 – Tài khoản và phân quyền CMS](G1-02-cms-quan-tri.md) | 6 | 5 | 1 |
| [G1-03 – Biên tập và xuất bản](G1-03-bien-tap-xuat-ban.md) | 10 | 8 | 2 |
| [G1-04 – Nội dung có cấu trúc](G1-04-noi-dung-co-cau-truc.md) | 9 | 9 | 0 |
| [G1-05 – Thư viện media – DAM](G1-05-dam-thu-vien-media.md) | 8 | 8 | 0 |
| [G1-06 – Video VOD](G1-06-video-vod.md) | 6 | 6 | 0 |
| [G1-07 – Livestream và lịch phát](G1-07-livestream-lich-phat.md) | 8 | 8 | 0 |
| [G1-08 – Tích hợp Streaming](G1-08-streaming-integration.md) | 7 | 5 | 2 |
| [G1-09 – Báo cáo và thống kê](G1-09-bao-cao-thong-ke.md) | 6 | 4 | 2 |
| [G1-10 – Quản lý và tính nhuận bút](G1-10-nhuan-but.md) | 8 | 7 | 1 |
| [G1-11 – Chuyển đổi dữ liệu cũ](G1-11-chuyen-doi-du-lieu.md) | 5 | 5 | 0 |
| **Tổng** | **82** | **72** | **10** |

## 2. Danh sách 82 tính năng

| Mã | Tính năng | Mô tả nghiệp vụ sau QA | Nguồn | Phạm vi |
|---|---|---|---|---|
| [G1-01-F001](G1-01-website-vtv8online.md) | Khung website và điều hướng | Giao diện responsive, header/footer, menu chuyên mục, breadcrumb và các trạng thái loading/404; điều hướng desktop/mobile. | B | CORE |
| [G1-01-F002](G1-01-website-vtv8online.md) | Trang chủ và các khối nổi bật | Hiển thị tin mới, bài nổi bật, video/chương trình, lịch live sắp phát; bố cục theo cấu hình biên tập đã có. | B | CORE |
| [G1-01-F003](G1-01-website-vtv8online.md) | Danh sách nội dung theo chuyên mục | Trang chuyên mục có danh sách bài, phân trang và tùy chọn lọc cơ bản theo thời gian/loại nội dung. | B | CORE |
| [G1-01-F004](G1-01-website-vtv8online.md) | Trang chi tiết bài viết | Hiển thị tiêu đề, sapo, nội dung rich-text, ảnh, tác giả, thời gian, tag và các liên kết liên quan. | T | CORE |
| [G1-01-F005](G1-01-website-vtv8online.md) | Trang chương trình, series và chủ đề | Trang giới thiệu chương trình/series, danh sách bài và các tập liên quan; trang chủ đề sử dụng cấu trúc dữ liệu G1-04. | B | CORE |
| [G1-01-F006](G1-01-website-vtv8online.md) | Trang hồ sơ thực thể nội dung | Hồ sơ nhân vật/địa danh/di sản/sự kiện với nội dung liên quan khi VTV8 muốn công khai từng loại hồ sơ. | C | OPTION |
| [G1-01-F007](G1-01-website-vtv8online.md) | Tìm kiếm cơ bản trên website | Tìm bài/video/chương trình theo từ khóa cơ bản trên dữ liệu published; V1 chỉ triển khai nếu chọn tùy chọn này, không yêu cầu OpenSearch/semantic search. | B | OPTION |
| [G1-01-F008](G1-01-website-vtv8online.md) | SEO, đường dẫn và metadata | URL ổn định, title/description, canonical, sitemap/robots; redirect URL cũ sử dụng mapping từ G1-11. | B | CORE |
| [G1-01-F009](G1-01-website-vtv8online.md) | Trang thông tin tĩnh và cấu hình điều hướng | Hiển thị trang giới thiệu, liên hệ, chính sách từ CMS G1-03-F010; template có sẵn, không có page builder. | B | CORE |
| [G1-02-F001](G1-02-cms-quan-tri.md) | Đăng nhập, đăng xuất và phiên CMS | Đăng nhập bằng tài khoản nội bộ, quản lý phiên, timeout, logout, chặn truy cập khi chưa xác thực. | T | CORE |
| [G1-02-F002](G1-02-cms-quan-tri.md) | Hồ sơ cá nhân và đổi/đặt lại mật khẩu | Xem/chỉnh thông tin cá nhân cho phép; đổi mật khẩu; quản trị cấp lại mật khẩu khi mất truy cập. | B | CORE |
| [G1-02-F003](G1-02-cms-quan-tri.md) | Quản lý tài khoản nội bộ | Danh sách, tạo, cập nhật, vô hiệu hóa tài khoản; không xóa cứng tài khoản đã có lịch sử biên tập. | T | CORE |
| [G1-02-F004](G1-02-cms-quan-tri.md) | Quản lý vai trò và ma trận quyền | Vai trò/ma trận quyền Biên tập, Duyệt, Xuất bản, Quản trị; policy dùng chung cho G1-03. Không xây workflow duyệt ở module này. | T | CORE |
| [G1-02-F005](G1-02-cms-quan-tri.md) | Phân quyền theo phòng ban hoặc chuyên mục | Giới hạn quyền biên tập/duyệt theo phòng ban hoặc chuyên mục nếu quy trình VTV8 cần. | C | OPTION |
| [G1-02-F006](G1-02-cms-quan-tri.md) | Nhật ký thao tác quản trị nhạy cảm | Ghi nhận đăng nhập thất bại, tạo/sửa/vô hiệu tài khoản, thay đổi quyền; cung cấp màn truy cứu cơ bản. | B | CORE |
| [G1-03-F001](G1-03-bien-tap-xuat-ban.md) | Soạn thảo và cập nhật bài viết | Soạn bài bằng rich-text editor có sẵn, quản lý tiêu đề/sapo/slug/ảnh/taxonomy; xác định block và cách dán Word được hỗ trợ, sanitize HTML. | T | CORE |
| [G1-03-F002](G1-03-bien-tap-xuat-ban.md) | Danh sách bài và quản lý bản nháp | Lọc bài theo trạng thái, tác giả, chuyên mục và thời gian; lưu nháp thủ công với cảnh báo chưa lưu. | B | CORE |
| [G1-03-F003](G1-03-bien-tap-xuat-ban.md) | Gửi duyệt và hàng đợi biên tập | Gửi bài lên hàng đợi, xem nội dung chờ xử lý, phân công/hiển thị người chịu trách nhiệm theo quy trình VTV8. | T | CORE |
| [G1-03-F004](G1-03-bien-tap-xuat-ban.md) | Yêu cầu chỉnh sửa và phê duyệt | Người duyệt xem, ghi lý do trả bài hoặc phê duyệt; người viết sửa và gửi lại. | B | CORE |
| [G1-03-F005](G1-03-bien-tap-xuat-ban.md) | Xem trước nội dung trước khi công khai | Preview bài nháp theo template website, không tạo liên kết public truy cập tự do. | B | CORE |
| [G1-03-F006](G1-03-bien-tap-xuat-ban.md) | Xuất bản, cập nhật và gỡ bài | Chỉ công khai bài đã duyệt và các media đủ quyền theo chính sách DAM; sửa bài published theo quy trình VTV8 xác nhận, gỡ có lý do. | T | CORE |
| [G1-03-F007](G1-03-bien-tap-xuat-ban.md) | Lập lịch xuất bản | Chọn giờ xuất bản tự động cho bài đã được duyệt, hủy/đổi lịch, trạng thái job. | C | OPTION |
| [G1-03-F008](G1-03-bien-tap-xuat-ban.md) | Lịch sử phiên bản và khôi phục | Xem các bản sửa đã lưu, so sánh và khôi phục phiên bản theo quyền; xác định rõ xử lý bài đang published. | C | OPTION |
| [G1-03-F009](G1-03-bien-tap-xuat-ban.md) | Điều phối vị trí hiển thị nội dung | Ghim nổi bật, thứ tự ưu tiên/trang chủ hoặc chuyên mục trong các slot đã định nghĩa; không xây page builder. | B | CORE |
| [G1-03-F010](G1-03-bien-tap-xuat-ban.md) | Quản lý trang thông tin tĩnh trên CMS | Tạo/sửa/lưu nháp/duyệt/xuất bản trang giới thiệu, liên hệ, chính sách. Tái dùng editor và quy trình CMS, không xây page builder. | B | CORE |
| [G1-04-F001](G1-04-noi-dung-co-cau-truc.md) | Chuyên mục và cây phân cấp | Tạo/sửa/ẩn/sắp xếp chuyên mục, slug, chuyên mục cha và mô tả; bảo vệ chuyên mục đang được sử dụng. | T | CORE |
| [G1-04-F002](G1-04-noi-dung-co-cau-truc.md) | Hồ sơ tác giả và cộng tác viên | Hồ sơ tác giả/người sản xuất độc lập với tài khoản CMS, có thể liên kết tùy chọn. G1-10 chỉ quản lý đóng góp theo sản phẩm, không tạo hồ sơ trùng. | T | CORE |
| [G1-04-F003](G1-04-noi-dung-co-cau-truc.md) | Chương trình truyền hình và series | Quản lý chương trình, series, mô tả, ảnh đại diện, thứ tự, trạng thái hiển thị; một chương trình có nhiều series/tập. | T | CORE |
| [G1-04-F004](G1-04-noi-dung-co-cau-truc.md) | Tập/chương trình phát hành | Quản lý tập như hồ sơ metadata thuộc chương trình/series, có thứ tự và ngày phát; trạng thái bản phát thuộc G1-06. | B | CORE |
| [G1-04-F005](G1-04-noi-dung-co-cau-truc.md) | Hồ sơ nhân vật | Quản lý nhân vật có tên, mô tả, ảnh đại diện, lĩnh vực và liên kết các nội dung liên quan. | T | CORE |
| [G1-04-F006](G1-04-noi-dung-co-cau-truc.md) | Hồ sơ địa danh và cấu trúc địa lý | Quản lý địa danh và quan hệ địa phương cha/con ở mức dữ liệu biên tập; không mặc định bản đồ, geocoding hoặc danh mục hành chính đầy đủ. | T | CORE |
| [G1-04-F007](G1-04-noi-dung-co-cau-truc.md) | Hồ sơ di sản | Quản lý di sản, loại, mô tả, địa danh liên quan và các sản phẩm nội dung nhắc tới di sản. | T | CORE |
| [G1-04-F008](G1-04-noi-dung-co-cau-truc.md) | Sự kiện và thời gian diễn ra | Quản lý sự kiện, thời gian, địa điểm, nội dung liên quan; dữ liệu sự kiện không đồng nghĩa lịch livestream. | T | CORE |
| [G1-04-F009](G1-04-noi-dung-co-cau-truc.md) | Tag, chủ đề và liên kết nội dung | Quản lý tag/chủ đề và quan hệ nội dung dùng chung cho bài, video, media, chương trình và thực thể; DAM dùng chung API. | T | CORE |
| [G1-05-F001](G1-05-dam-thu-vien-media.md) | Tải lên và tiếp nhận file media | Upload ảnh/video; giới hạn kích thước và cơ chế chunk/resume xác định sau GĐ0, có tiến trình, kiểm tra định dạng và lỗi. | T | CORE |
| [G1-05-F002](G1-05-dam-thu-vien-media.md) | Thư viện media và tìm lọc | Danh sách lưới/bảng, preview, tìm theo tên, loại, chủ đề, ngày tạo, quyền sử dụng. | B | CORE |
| [G1-05-F003](G1-05-dam-thu-vien-media.md) | Metadata gốc và thông tin sản xuất | Lưu nguồn gốc, ngày sản xuất, người xuất hiện, âm nhạc, địa phương, chủ đề, định dạng gốc và chú thích. | T | CORE |
| [G1-05-F004](G1-05-dam-thu-vien-media.md) | Quản lý quyền và thời hạn khai thác | Ghi quyền sở hữu, phát lại, thời hạn/chứng cứ; trạng thái WARN/BLOCK phải do VTV8 xác nhận, cung cấp rights gate dùng chung cho bài và video. | T | CORE |
| [G1-05-F005](G1-05-dam-thu-vien-media.md) | Quản lý bản gốc và phiên bản xuất bản | Liên kết file gốc với thumbnail, poster, phiên bản phát hành hoặc phiên bản kỹ thuật nhận từ nền tảng media; không tự lập trình transcoder. | T | CORE |
| [G1-05-F006](G1-05-dam-thu-vien-media.md) | Ảnh đại diện, thumbnail và chọn file dùng trong bài | Chọn/cắt hoặc dùng ảnh đại diện có sẵn, gắn vào bài, chương trình hoặc poster video theo thông tin asset. | B | CORE |
| [G1-05-F007](G1-05-dam-thu-vien-media.md) | Gắn tag, nhóm và liên kết đối tượng media | Gắn media vào chương trình, chủ đề, địa danh và các nhóm phục vụ tìm kiếm/tái sử dụng. | B | CORE |
| [G1-05-F008](G1-05-dam-thu-vien-media.md) | Thao tác xóa, lưu trữ và kiểm tra nơi sử dụng | Ẩn/lưu trữ asset, hạn chế xóa vật lý file đang được bài/video sử dụng, ghi lại lý do. | B | CORE |
| [G1-06-F001](G1-06-video-vod.md) | Quản lý bản phát VOD và trạng thái sẵn sàng | Gắn asset từ DAM với playback manifest/đường dẫn do hạ tầng media cung cấp, kiểm tra ready/failed trước công khai. | B | CORE |
| [G1-06-F002](G1-06-video-vod.md) | Xuất bản và danh mục video công khai | Xuất bản video sử dụng quy trình duyệt G1-03 và rights gate G1-05; chỉ bổ sung dữ liệu video, không tạo workflow thứ hai. | T | CORE |
| [G1-06-F003](G1-06-video-vod.md) | Trình phát VOD trên website | Một video player FE dùng chung cho VOD/live, nhận playback manifest/config từ G1-08-F004. | B | CORE |
| [G1-06-F004](G1-06-video-vod.md) | Trang video và điều hướng tập/chương trình | Trang chi tiết video, metadata, tập trước/sau và video cùng chương trình; sử dụng dữ liệu chương trình G1-04. | B | CORE |
| [G1-06-F005](G1-06-video-vod.md) | Trạng thái lỗi phát và dự phòng UI | Một bộ trạng thái lỗi player cho VOD/live với fallback UI và thử lại giới hạn; dùng chung G1-07-F008. | B | CORE |
| [G1-06-F006](G1-06-video-vod.md) | Phát lại sau sự kiện Livestream | Duyệt và phát lại bản ghi G1-08 nhận/G1-07 liên kết; không xử lý webhook recording ở đây. | T | CORE |
| [G1-07-F001](G1-07-livestream-lich-phat.md) | Danh mục chương trình/sự kiện livestream | Tạo phiên phát sóng thuộc chương trình/sự kiện sẵn có G1-04; chỉ lưu nội dung riêng của buổi live, không tạo danh mục sự kiện thứ hai. | T | CORE |
| [G1-07-F002](G1-07-livestream-lich-phat.md) | Lập và thay đổi lịch phát | Lên lịch ngày/giờ bắt đầu và thời lượng dự kiến, cập nhật/hủy buổi phát; cảnh báo lịch chồng nếu dùng cùng kênh. | T | CORE |
| [G1-07-F003](G1-07-livestream-lich-phat.md) | Gắn nguồn phát/kênh và kiểm tra sẵn sàng | Gắn nguồn/kênh đã được G1-08 cấu hình, kiểm tra trạng thái sẵn sàng nếu provider cung cấp API; không tự xây thiết bị/ingest. | B | CORE |
| [G1-07-F004](G1-07-livestream-lich-phat.md) | Trạng thái trước/đang/sau phát | Quản lý dự kiến/chuẩn bị/đang phát/kết thúc/hủy dựa trên tín hiệu provider hoặc thao tác vận hành có kiểm soát; không suy ra live chỉ từ lịch. | B | CORE |
| [G1-07-F005](G1-07-livestream-lich-phat.md) | Trang xem trực tiếp | Hiển thị chương trình đang phát, player, mô tả, lịch kế tiếp và thông báo khi chưa đến giờ; không cần tài khoản. | T | CORE |
| [G1-07-F006](G1-07-livestream-lich-phat.md) | Lịch phát sóng công khai | Xem danh sách bản tin và sự kiện theo ngày, bộ lọc thời gian/loại, điều hướng tới trang chương trình. | T | CORE |
| [G1-07-F007](G1-07-livestream-lich-phat.md) | Kết thúc live và chuyển sang phát lại | Đóng phiên live và liên kết recording đã do G1-08 nhận, gửi sang G1-06 chờ duyệt phát lại; không xử lý ingestion hoặc tạo VOD trùng. | T | CORE |
| [G1-07-F008](G1-07-livestream-lich-phat.md) | Thông báo gián đoạn và trạng thái sự cố | Hiển thị cảnh báo khi luồng lỗi/mất nguồn, tự thử lại có giới hạn và trạng thái chuyển phương án dự phòng do VTV8 xác nhận. | B | CORE |
| [G1-08-F002](G1-08-streaming-integration.md) | Cấu hình kết nối đối tác và kênh phát | Cấu hình adapter/provider và nguồn phát theo thông số đã xác nhận; secrets nằm trong secret manager/config an toàn, không mặc định UI nhập khóa bí mật. | B | CORE |
| [G1-08-F003](G1-08-streaming-integration.md) | Tích hợp nguồn RTMP/SRT ingest | Thiết lập hoặc tiếp nhận thông tin điểm ingest, stream key/quyền phát từ đối tác; tùy API có thể tự tạo kênh hay cấu hình thủ công. | C | CONDITIONAL |
| [G1-08-F004](G1-08-streaming-integration.md) | Playback manifest và tương thích trình phát | Playback adapter dùng chung cho VOD và live, HLS/DASH tùy provider; cấu hình player/token khi cần, không tạo player FE thứ hai. | B | CORE |
| [G1-08-F005](G1-08-streaming-integration.md) | Cấu hình transcoding và bitrate thích ứng | Chỉ cấu hình transcoding/ABR profile nếu provider cho API và trách nhiệm thuộc VTV8Online; không tự viết transcoder/media server. | C | CONDITIONAL |
| [G1-08-F006](G1-08-streaming-integration.md) | Kết nối Origin, lưu trữ phân phối và CDN | Tích hợp/cấu hình origin/CDN phân phối video theo phương án chọn; media traffic/chi phí vendor và cấu hình DevOps tách ngoài FE/BE. | B | CORE |
| [G1-08-F007](G1-08-streaming-integration.md) | Tiếp nhận bản ghi sau livestream | Nhận recording metadata/webhook từ provider, kiểm tra idempotency, liên kết asset DAM; G1-07 chỉ gắn phiên và G1-06 xuất bản phát lại. | T | CORE |
| [G1-08-F008](G1-08-streaming-integration.md) | Theo dõi trạng thái nguồn và cảnh báo cơ bản | Theo dõi ingest/playback/recording theo chỉ số nhà cung cấp cho phép, cảnh báo vận hành cơ bản; QoE analytics người xem nâng cao không mặc định. | B | CORE |
| [G1-09-F001](G1-09-bao-cao-thong-ke.md) | Tổng quan CMS/dashboard nội dung | Hiển thị số lượng nội dung theo loại/trạng thái, số bài trong kỳ và thông báo dữ liệu cập nhật đến mốc nào. | T | CORE |
| [G1-09-F002](G1-09-bao-cao-thong-ke.md) | Thống kê sản lượng theo tác giả và chuyên mục | Đếm sản lượng bài theo tác giả/chuyên mục/thời gian; phân biệt một bài với nhiều lượt tham gia sản xuất để tổng sản lượng không bị nhân đôi. | T | CORE |
| [G1-09-F003](G1-09-bao-cao-thong-ke.md) | Thu thập lượt xem bài viết | Thu thập và tổng hợp lượt xem bài đã công khai theo từng bài, chuyên mục và khoảng thời gian. Chốt định nghĩa view, lọc bot/đếm trùng cơ bản và quy tắc bài nhiều chuyên mục. | T | CORE |
| [G1-09-F004](G1-09-bao-cao-thong-ke.md) | Lượt xem video và livestream | Hiển thị số lượt xem video/live bằng dữ liệu có nguồn rõ; dữ liệu vendor chỉ dùng nếu đối tác cung cấp API/export và định nghĩa chỉ số. | C | CONDITIONAL |
| [G1-09-F005](G1-09-bao-cao-thong-ke.md) | Báo cáo theo thời gian và xuất dữ liệu | Lọc và xuất số liệu bài viết/lượt xem theo bài, chuyên mục, thời gian; hiển thị nguồn, ngày cập nhật và chọn một định dạng export CSV hoặc XLSX ban đầu. | B | CORE |
| [G1-09-F006](G1-09-bao-cao-thong-ke.md) | Quy tắc thống kê, đối soát và khóa kỳ dữ liệu | Tùy chọn: quản trị đối soát điều chỉnh và khóa kỳ thống kê nâng cao; nguồn chỉ số và thời điểm cập nhật cơ bản nằm ở G1-09-F003/F005. | B | OPTION |
| [G1-10-F001](G1-10-nhuan-but.md) | Quản lý người tham gia và vai trò trên sản phẩm | Gắn vai trò đóng góp của nhiều người trên từng bài/chương trình/video dùng hồ sơ contributor có sẵn ở G1-04-F002; không tạo hồ sơ nhân sự thứ hai. | B | CORE |
| [G1-10-F002](G1-10-nhuan-but.md) | Quản lý bảng mức và quy tắc nhuận bút | Theo quy chế thực tế VTV8 xác nhận, quản lý bảng mức/hệ số nhuận bút và ngày hiệu lực; chưa xây rule engine tổng quát. | B | CORE |
| [G1-10-F003](G1-10-nhuan-but.md) | Xác định sản phẩm đủ điều kiện tính | Xác định nội dung đủ tính theo kỳ, trạng thái xuất bản, vai trò đóng góp; bài sửa/gỡ, dữ liệu nhập cũ cần quy tắc VTV8 xác nhận. | B | CORE |
| [G1-10-F004](G1-10-nhuan-but.md) | Tạo kỳ và chạy tính nhuận bút | Tạo kỳ nhuận bút, xem trước/chạy tính theo sản phẩm và người; kết quả có snapshot quy tắc, dữ liệu, làm tròn và dấu thời điểm. Không tự tính lương HRM. | T | CORE |
| [G1-10-F005](G1-10-nhuan-but.md) | Bảng kê chi tiết theo người và sản phẩm | Xem tổng tiền, chi tiết từng bài/video, vai trò, quy tắc và biến số dẫn tới kết quả. | B | CORE |
| [G1-10-F006](G1-10-nhuan-but.md) | Điều chỉnh và xử lý ngoại lệ | Ghi nhận điều chỉnh khoản nhuận bút có lý do và người thực hiện; không xây sổ kế toán kép. | B | CORE |
| [G1-10-F007](G1-10-nhuan-but.md) | Rà soát, phê duyệt và khóa kỳ | Tùy chọn duyệt nhiều cấp/khóa kỳ theo quy chế VTV8; CORE đã lưu snapshot không tự đổi trong G1-10-F004. | C | OPTION |
| [G1-10-F008](G1-10-nhuan-but.md) | Xuất bảng kê phục vụ chi trả | Xuất bảng kê theo mẫu VTV8 cung cấp để phục vụ chi trả; không tự thanh toán tiền hoặc phát triển hệ thống HRM. | B | CORE |
| [G1-11-F002](G1-11-chuyen-doi-du-lieu.md) | Trích xuất website/CMS/kho dữ liệu cũ | Trích xuất từ website/CMS/kho dữ liệu do VTV8 cung cấp, baseline giả định một nguồn hệ thống chính; nguồn phát sinh định giá bổ sung, không có mạng xã hội. | T | CORE |
| [G1-11-F003](G1-11-chuyen-doi-du-lieu.md) | Mapping dữ liệu sang cấu trúc mới | Mapping bài viết, chương trình, tác giả, nội dung rich-text và liên kết ảnh/video từ hệ thống cũ sang schema V1; quy tắc không có trường tương ứng cần ghi rõ. | B | CORE |
| [G1-11-F004](G1-11-chuyen-doi-du-lieu.md) | Làm sạch, chuẩn hóa và khử trùng | Chuẩn hóa tên, mã ký tự, thời gian, đường dẫn và xử lý trùng theo ID/hash/quy tắc đã duyệt; dữ liệu không chắc chắn vào hàng đợi kiểm tra, không xóa tự động. | T | CORE |
| [G1-11-F005](G1-11-chuyen-doi-du-lieu.md) | Nhập dữ liệu nội dung/media có kiểm soát quyền | Nhập dữ liệu đã xử lý vào CMS/DAM; quyền khai thác chưa xác minh đặt pending và không công khai, đảm bảo việc nhập lặp lại không nhân đôi. | T | CORE |
| [G1-11-F006](G1-11-chuyen-doi-du-lieu.md) | Chạy thử, báo cáo lỗi và chạy lại lô | Dry-run, checkpoint, chạy lại lô và báo cáo lỗi; ưu tiên công cụ CLI/BE thay vì dashboard mới cho một lần chuyển dữ liệu. | B | CORE |

## 3. Quyết định sau rà soát

- **Chuyển G1-01-F007 (tìm kiếm website) và G1-09-F006 (khóa kỳ thống kê) sang OPTION**, không bỏ yêu cầu báo cáo số tin/lượt xem theo bài, chuyên mục, thời gian ở G1-09-F003/F005.
- **Bổ sung G1-03-F010 quản lý trang thông tin tĩnh trên CMS**, tái dùng editor và workflow, phục vụ G1-01-F009; không xây page builder.
- **5 mã cũ** không còn là feature FE/BE; đưa vào [H02 – kiểm thử, migration và triển khai](G1-H02-nghiem-thu-chuyen-giao.md), có tham chiếu GĐ0 nếu đã khảo sát:

| Mã gốc | Công việc | Mã WBS hiện hành |
|---|---|---|
| G1-08-F001 | Ma trận/hợp đồng tích hợp Streaming | G1-H02-W011; kế thừa G0-06 |
| G1-08-F009 | Kiểm chứng tải, QoE, SLA, mục tiêu 120.000 CCU | G1-H02-W007; kiểm thử hiệu năng chuyên sâu |
| G1-11-F001 | Chốt nguồn và manifest migration | G1-H02-W008; kế thừa G0-07 |
| G1-11-F007 | Đối soát dữ liệu nguồn/đích | G1-H02-W009; data operation/UAT |
| G1-11-F008 | Cutover dữ liệu và rollback | G1-H02-W010; redirect public tại G1-01-F008 |

## 4. Nguyên tắc tránh trùng và nghiệm thu

- [Thành phần dùng chung và chủ sở hữu tính giờ](G1-THANH-PHAN-DUNG-CHUNG.md): xác thực/RBAC, editor, workflow, taxonomy, DAM rights gate, player, recording, số liệu view, redirects.
- [Checklist nghiệm thu và các kịch bản end-to-end](G1-TIEU-CHI-NGHIEM-THU.md): áp dụng cùng tiêu chí riêng từng feature.
- [H01](G1-H01-ha-tang-van-hanh.md) chỉ ứng dụng/web/DB; [H02](G1-H02-nghiem-thu-chuyen-giao.md) sở hữu công tác UAT, kiểm thử tải media, migration operations/cutover và bàn giao. QA tiêu chuẩn trong công thức Excel không được tính lại.
- [Báo cáo QA đối chiếu 86 mã trước chỉnh](G1-BAO-CAO-RA-SOAT-86-TINH-NANG.md) là hồ sơ lịch sử, không còn là bản scope đang sử dụng.

## 5. Các điều kiện cần chốt trước báo giá cố định

Quy chế nhuận bút; số cấp duyệt; trường dữ liệu biên tập; bản quyền và rights gate; giới hạn file video lớn; nguồn/khối lượng migration; khả năng ingest, playback, recording, CDN, giám sát của VTVcab/VTVprime; tiêu chí phân biệt **CCU website** với **số người đang xem video đồng thời**; trách nhiệm và điều kiện SLA. Tài liệu VTV8 mô tả mục tiêu 120.000 CCU và đề xuất SLA V1 ≥99,9%, không phải kết quả đã kiểm chứng.

**Ước tính:** chỉ feature coding/tích hợp dùng FE/BE Middle Developer theo phương pháp thống nhất; DevOps/vendor/migration thực tế/kiểm thử tải chuyên sâu thuộc dòng dự toán khác. `T` = chủ đề trực tiếp trong đề xuất VTV8 (chi tiết có thể suy luận); `B` = bổ sung để sản phẩm hoạt động; `C` = tính năng phụ thuộc đối tác/quyết định. `CORE` = đề xuất triển khai trong V1 nội bộ; `OPTION`/`CONDITIONAL` chưa tự cộng vào dự toán cơ sở.
