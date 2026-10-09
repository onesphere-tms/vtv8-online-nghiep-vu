# GĐ1 – Ước tính giờ FE/BE theo tính năng VTV8Online V1 (DRAFT)

> **Ngày lập:** 09/10/2026 · **Phương pháp:** [FE/BE Middle Developer, BA10%/Design15%/Coding55%/QA20%, 8h/MD](PHUONG-PHAP-UOC-TINH.md). **Bản dự toán nội bộ lần 1, chưa được VTV8 xác nhận và chưa phải báo giá cố định.**
> **Nguồn khối lượng:** [82 tính năng GĐ1 đã QA](../docs/01-gd1-vtv8online-v1/G1-DANH-MUC-TINH-NANG.md), [thành phần tính một lần](../docs/01-gd1-vtv8online-v1/G1-THANH-PHAN-DUNG-CHUNG.md), tài liệu đề xuất VTV8. Không có tích hợp mạng xã hội.

## 1. Giả định chung

- FE/BE tính **giờ công một Middle Developer thực hiện từng phần**, đã tính lập trình, xử lý lỗi trong chức năng và tích hợp trực tiếp feature; **chưa bao gồm** giờ BA, thiết kế, QA riêng, DevOps, UAT ngoài QA thường, hệ thống Streaming tự xây, kiểm thử tải chuyên sâu, chi phí tài nguyên/CDN/vendor, migration thực địa và PM.
- Mỗi tính năng dùng framework, component UI/ORM/auth package hoặc media player thư viện thông dụng phù hợp; **không phát triển framework, rich-text editor, media server, transcoder, CDN, search engine, HRM hoặc hệ thanh toán mới từ đầu**. Mỗi thành phần chia sẻ chỉ tính effort lần đầu theo bảng owner.
- Website thiết kế responsive desktop/mobile; một bộ template cơ bản và một quy trình duyệt V1; hồ sơ nhân vật/di sản là metadata cơ bản, không triển khai page public riêng nếu không chọn OPTION.
- Nhuận bút: các con số G1-10 giả định **có quy chế tính mẫu** với loại sản phẩm, vai trò/hệ số, kỳ tính và mẫu bảng kê; thay đổi sang HRM/payroll, công thức đặc biệt, nhiều cấp tính hoặc các quy tắc mâu thuẫn phải ước tính lại.
- Streaming G1-08 ước tính theo **phương án A: tích hợp nhà cung cấp** có API playback, ingest/status, recording, CDN ở mức tương thích. Nếu tự vận hành các tầng RTMP/SRT/media server/transcoding/origin/CDN, **không thể lấy bảng này làm giá đầy đủ**.
- Migration G1-11 tính phát triển **CLI/ETL cho một hệ thống nguồn chính** và schema đầu vào tiếp cận được; FE=0 cho cả 5 mục vì không xây dashboard điều hành migration. Chi phí chạy thực tế, dọn thủ công, nhiều hệ thống nguồn và downtime tính riêng.
- Dùng bước giờ **4 giờ** cho hầu hết ước tính, phản ánh độ bất định; **H/M/L** biểu thị độ tin cậy Cao/Trung bình/Thấp, không phải độ ưu tiên. Đây là ước tính điểm, **không** phải cam kết giới hạn thời gian.

## 2. Tổng hợp theo module – chỉ 72 CORE

| Module | CORE | FE (giờ) | BE (giờ) | Coding (giờ) | Tổng effort (giờ) | MD | Optional/conditional coding (giờ) |
|---|---:|---:|---:|---:|---:|---:|---:|
| [G1-01 – Website VTV8Online](../docs/01-gd1-vtv8online-v1/G1-01-website-vtv8online.md) | 7 | 184 | 140 | 324 | 589.09 | 73.64 | 80 |
| [G1-02 – Tài khoản và phân quyền CMS](../docs/01-gd1-vtv8online-v1/G1-02-cms-quan-tri.md) | 5 | 104 | 176 | 280 | 509.09 | 63.64 | 64 |
| [G1-03 – Biên tập và xuất bản](../docs/01-gd1-vtv8online-v1/G1-03-bien-tap-xuat-ban.md) | 8 | 212 | 256 | 468 | 850.91 | 106.36 | 124 |
| [G1-04 – Nội dung có cấu trúc](../docs/01-gd1-vtv8online-v1/G1-04-noi-dung-co-cau-truc.md) | 9 | 216 | 264 | 480 | 872.73 | 109.09 | 0 |
| [G1-05 – Thư viện media – DAM](../docs/01-gd1-vtv8online-v1/G1-05-dam-thu-vien-media.md) | 8 | 224 | 320 | 544 | 989.09 | 123.64 | 0 |
| [G1-06 – Video VOD](../docs/01-gd1-vtv8online-v1/G1-06-video-vod.md) | 6 | 168 | 144 | 312 | 567.27 | 70.91 | 0 |
| [G1-07 – Livestream và lịch phát](../docs/01-gd1-vtv8online-v1/G1-07-livestream-lich-phat.md) | 8 | 192 | 228 | 420 | 763.64 | 95.45 | 0 |
| [G1-08 – Tích hợp Streaming](../docs/01-gd1-vtv8online-v1/G1-08-streaming-integration.md) | 5 | 44 | 216 | 260 | 472.73 | 59.09 | 96 |
| [G1-09 – Báo cáo và thống kê](../docs/01-gd1-vtv8online-v1/G1-09-bao-cao-thong-ke.md) | 4 | 80 | 160 | 240 | 436.36 | 54.55 | 136 |
| [G1-10 – Tính nhuận bút](../docs/01-gd1-vtv8online-v1/G1-10-nhuan-but.md) | 7 | 192 | 328 | 520 | 945.45 | 118.18 | 72 |
| [G1-11 – Chuyển đổi dữ liệu cũ](../docs/01-gd1-vtv8online-v1/G1-11-chuyen-doi-du-lieu.md) | 5 | 0 | 368 | 368 | 669.09 | 83.64 | 0 |
| **TỔNG CORE** | **72** | **1616** | **2600** | **4216** | **7665.45** | **958.18** | **572** |

## 3. Chi tiết 82 tính năng FE/BE

**Lưu ý:** `CORE` được tính vào tổng cơ sở; `OPTION/CONDITIONAL` chỉ cộng khi chọn/đủ điều kiện. `0 FE` nghĩa là không lập trình giao diện trong giả định, **không phải công việc không có chi phí**.

| ID | Tính năng | Phạm vi | FE (giờ) | BE (giờ) | Coding | Độ tin cậy | Căn cứ công sức |
|---|---|---|---:|---:|---:|---|---|
| [G1-01-F001](../docs/01-gd1-vtv8online-v1/G1-01-website-vtv8online.md) | Khung website và điều hướng | CORE | 28 | 12 | 40 | M | Khung responsive, điều hướng dùng chung; API menu/cấu hình gọn |
| [G1-01-F002](../docs/01-gd1-vtv8online-v1/G1-01-website-vtv8online.md) | Trang chủ và các khối nổi bật | CORE | 40 | 24 | 64 | M | Nhiều khối trang chủ và ưu tiên biên tập; API tổng hợp/cache |
| [G1-01-F003](../docs/01-gd1-vtv8online-v1/G1-01-website-vtv8online.md) | Danh sách nội dung theo chuyên mục | CORE | 24 | 20 | 44 | H | Danh sách + lọc/phân trang; API chỉ lấy published |
| [G1-01-F004](../docs/01-gd1-vtv8online-v1/G1-01-website-vtv8online.md) | Trang chi tiết bài viết | CORE | 32 | 24 | 56 | M | Renderer rich-text, metadata và truy vấn bài public |
| [G1-01-F005](../docs/01-gd1-vtv8online-v1/G1-01-website-vtv8online.md) | Trang chương trình, series và chủ đề | CORE | 32 | 24 | 56 | M | Template chương trình/series dùng lại danh sách; API quan hệ |
| [G1-01-F006](../docs/01-gd1-vtv8online-v1/G1-01-website-vtv8online.md) | Trang hồ sơ thực thể nội dung | OPTION | 20 | 12 | 32 | L | Trang thực thể tùy chọn tái dùng template, public relations |
| [G1-01-F007](../docs/01-gd1-vtv8online-v1/G1-01-website-vtv8online.md) | Tìm kiếm cơ bản trên website | OPTION | 24 | 24 | 48 | M | Keyword search V1 tùy chọn, không có engine tìm kiếm riêng |
| [G1-01-F008](../docs/01-gd1-vtv8online-v1/G1-01-website-vtv8online.md) | SEO, đường dẫn và metadata | CORE | 16 | 24 | 40 | M | Metadata/sitemap và redirect từ bảng migration |
| [G1-01-F009](../docs/01-gd1-vtv8online-v1/G1-01-website-vtv8online.md) | Trang thông tin tĩnh và cấu hình điều hướng | CORE | 12 | 12 | 24 | H | Trang tĩnh public dùng API CMS F010 và template có sẵn |
| [G1-02-F001](../docs/01-gd1-vtv8online-v1/G1-02-cms-quan-tri.md) | Đăng nhập, đăng xuất và phiên CMS | CORE | 24 | 40 | 64 | M | Login/route guard và auth/session/rate-limit phía server |
| [G1-02-F002](../docs/01-gd1-vtv8online-v1/G1-02-cms-quan-tri.md) | Hồ sơ cá nhân và đổi/đặt lại mật khẩu | CORE | 16 | 24 | 40 | H | Form hồ sơ/đổi mật khẩu và reset có kiểm tra phiên |
| [G1-02-F003](../docs/01-gd1-vtv8online-v1/G1-02-cms-quan-tri.md) | Quản lý tài khoản nội bộ | CORE | 24 | 32 | 56 | H | User CRUD, trạng thái vô hiệu, lịch sử sử dụng |
| [G1-02-F004](../docs/01-gd1-vtv8online-v1/G1-02-cms-quan-tri.md) | Quản lý vai trò và ma trận quyền | CORE | 24 | 48 | 72 | M | RBAC shared middleware và role matrix giới hạn V1 |
| [G1-02-F005](../docs/01-gd1-vtv8online-v1/G1-02-cms-quan-tri.md) | Phân quyền theo phòng ban hoặc chuyên mục | OPTION | 24 | 40 | 64 | L | OPTION: policy theo phòng ban/chuyên mục và UI phạm vi |
| [G1-02-F006](../docs/01-gd1-vtv8online-v1/G1-02-cms-quan-tri.md) | Nhật ký thao tác quản trị nhạy cảm | CORE | 16 | 32 | 48 | M | Audit các thao tác nhạy cảm và màn lọc tối thiểu |
| [G1-03-F001](../docs/01-gd1-vtv8online-v1/G1-03-bien-tap-xuat-ban.md) | Soạn thảo và cập nhật bài viết | CORE | 64 | 56 | 120 | M | Editor tích hợp, quản lý dữ liệu bài/HTML và media references |
| [G1-03-F002](../docs/01-gd1-vtv8online-v1/G1-03-bien-tap-xuat-ban.md) | Danh sách bài và quản lý bản nháp | CORE | 24 | 28 | 52 | H | Danh sách bài, nháp, lọc và kiểm tra quyền sở hữu |
| [G1-03-F003](../docs/01-gd1-vtv8online-v1/G1-03-bien-tap-xuat-ban.md) | Gửi duyệt và hàng đợi biên tập | CORE | 24 | 32 | 56 | M | Hàng đợi duyệt, chuyển trạng thái và xác thực quyền |
| [G1-03-F004](../docs/01-gd1-vtv8online-v1/G1-03-bien-tap-xuat-ban.md) | Yêu cầu chỉnh sửa và phê duyệt | CORE | 24 | 40 | 64 | M | Trả bài/phê duyệt và audit chuyển trạng thái có lý do |
| [G1-03-F005](../docs/01-gd1-vtv8online-v1/G1-03-bien-tap-xuat-ban.md) | Xem trước nội dung trước khi công khai | CORE | 12 | 12 | 24 | H | Preview dùng lại renderer website, API nháp bảo vệ quyền |
| [G1-03-F006](../docs/01-gd1-vtv8online-v1/G1-03-bien-tap-xuat-ban.md) | Xuất bản, cập nhật và gỡ bài | CORE | 20 | 40 | 60 | M | Publish/unpublish, quyền media, log và cache invalidation |
| [G1-03-F007](../docs/01-gd1-vtv8online-v1/G1-03-bien-tap-xuat-ban.md) | Lập lịch xuất bản | OPTION | 12 | 32 | 44 | M | OPTION: lịch tự động và job timezone/retry |
| [G1-03-F008](../docs/01-gd1-vtv8online-v1/G1-03-bien-tap-xuat-ban.md) | Lịch sử phiên bản và khôi phục | OPTION | 32 | 48 | 80 | L | OPTION: snapshots, giao diện diff và khôi phục có duyệt |
| [G1-03-F009](../docs/01-gd1-vtv8online-v1/G1-03-bien-tap-xuat-ban.md) | Điều phối vị trí hiển thị nội dung | CORE | 24 | 24 | 48 | M | Slot nổi bật giới hạn và thứ tự hiển thị |
| [G1-03-F010](../docs/01-gd1-vtv8online-v1/G1-03-bien-tap-xuat-ban.md) | Quản lý trang thông tin tĩnh trên CMS | CORE | 20 | 24 | 44 | M | Trang tĩnh dùng lại editor/workflow/renderer, CRUD riêng |
| [G1-04-F001](../docs/01-gd1-vtv8online-v1/G1-04-noi-dung-co-cau-truc.md) | Chuyên mục và cây phân cấp | CORE | 32 | 32 | 64 | M | Cây chuyên mục/sắp xếp và kiểm tra cây/slug phía BE |
| [G1-04-F002](../docs/01-gd1-vtv8online-v1/G1-04-noi-dung-co-cau-truc.md) | Hồ sơ tác giả và cộng tác viên | CORE | 20 | 24 | 44 | H | Hồ sơ contributor tái dùng form/list CRUD |
| [G1-04-F003](../docs/01-gd1-vtv8online-v1/G1-04-noi-dung-co-cau-truc.md) | Chương trình truyền hình và series | CORE | 32 | 36 | 68 | M | Chương trình và series, quan hệ phân cấp và thứ tự |
| [G1-04-F004](../docs/01-gd1-vtv8online-v1/G1-04-noi-dung-co-cau-truc.md) | Tập/chương trình phát hành | CORE | 24 | 28 | 52 | M | Tập/episode metadata và quan hệ tới media |
| [G1-04-F005](../docs/01-gd1-vtv8online-v1/G1-04-noi-dung-co-cau-truc.md) | Hồ sơ nhân vật | CORE | 16 | 20 | 36 | H | Hồ sơ nhân vật dạng metadata và link nội dung |
| [G1-04-F006](../docs/01-gd1-vtv8online-v1/G1-04-noi-dung-co-cau-truc.md) | Hồ sơ địa danh và cấu trúc địa lý | CORE | 24 | 28 | 52 | M | Địa danh phân cấp mức cơ bản, không geocoding |
| [G1-04-F007](../docs/01-gd1-vtv8online-v1/G1-04-noi-dung-co-cau-truc.md) | Hồ sơ di sản | CORE | 20 | 24 | 44 | H | Hồ sơ di sản và tham chiếu địa danh |
| [G1-04-F008](../docs/01-gd1-vtv8online-v1/G1-04-noi-dung-co-cau-truc.md) | Sự kiện và thời gian diễn ra | CORE | 20 | 24 | 44 | H | Hồ sơ sự kiện, thời gian và liên kết nội dung |
| [G1-04-F009](../docs/01-gd1-vtv8online-v1/G1-04-noi-dung-co-cau-truc.md) | Tag, chủ đề và liên kết nội dung | CORE | 28 | 48 | 76 | M | Một hệ tag/quan hệ nhiều loại thực thể dùng chung |
| [G1-05-F001](../docs/01-gd1-vtv8online-v1/G1-05-dam-thu-vien-media.md) | Tải lên và tiếp nhận file media | CORE | 48 | 64 | 112 | L | Upload object storage, progress/validation, cơ chế file lớn có điều kiện |
| [G1-05-F002](../docs/01-gd1-vtv8online-v1/G1-05-dam-thu-vien-media.md) | Thư viện media và tìm lọc | CORE | 32 | 40 | 72 | M | Thư viện file, preview/filter và truy vấn bảo vệ quyền |
| [G1-05-F003](../docs/01-gd1-vtv8online-v1/G1-05-dam-thu-vien-media.md) | Metadata gốc và thông tin sản xuất | CORE | 24 | 40 | 64 | M | Metadata tài sản theo nguồn VTV8, validation và lưu trữ |
| [G1-05-F004](../docs/01-gd1-vtv8online-v1/G1-05-dam-thu-vien-media.md) | Quản lý quyền và thời hạn khai thác | CORE | 32 | 64 | 96 | L | Chính sách quyền media, hiệu lực và publish eligibility dùng chung |
| [G1-05-F005](../docs/01-gd1-vtv8online-v1/G1-05-dam-thu-vien-media.md) | Quản lý bản gốc và phiên bản xuất bản | CORE | 24 | 40 | 64 | M | Liên kết file gốc, thumbnail và phiên bản asset |
| [G1-05-F006](../docs/01-gd1-vtv8online-v1/G1-05-dam-thu-vien-media.md) | Ảnh đại diện, thumbnail và chọn file dùng trong bài | CORE | 32 | 24 | 56 | M | Asset picker, preview/crop cơ bản, refs/thumbnail |
| [G1-05-F007](../docs/01-gd1-vtv8online-v1/G1-05-dam-thu-vien-media.md) | Gắn tag, nhóm và liên kết đối tượng media | CORE | 12 | 16 | 28 | H | Chỉ tích hợp bộ tag/quan hệ đã xây G1-04-F009 |
| [G1-05-F008](../docs/01-gd1-vtv8online-v1/G1-05-dam-thu-vien-media.md) | Thao tác xóa, lưu trữ và kiểm tra nơi sử dụng | CORE | 20 | 32 | 52 | M | Archive/soft-delete, kiểm tra nơi sử dụng và nhật ký |
| [G1-06-F001](../docs/01-gd1-vtv8online-v1/G1-06-video-vod.md) | Quản lý bản phát VOD và trạng thái sẵn sàng | CORE | 20 | 32 | 52 | M | Bản phát video/status và quan hệ DAM-provider |
| [G1-06-F002](../docs/01-gd1-vtv8online-v1/G1-06-video-vod.md) | Xuất bản và danh mục video công khai | CORE | 24 | 32 | 56 | M | Danh mục/xuất bản video dùng lại workflow và rights gate |
| [G1-06-F003](../docs/01-gd1-vtv8online-v1/G1-06-video-vod.md) | Trình phát VOD trên website | CORE | 56 | 16 | 72 | M | Một player FE cho VOD/live, adapter media tính ở G1-08 |
| [G1-06-F004](../docs/01-gd1-vtv8online-v1/G1-06-video-vod.md) | Trang video và điều hướng tập/chương trình | CORE | 24 | 20 | 44 | H | Trang video/điều hướng tập dùng lại template chương trình |
| [G1-06-F005](../docs/01-gd1-vtv8online-v1/G1-06-video-vod.md) | Trạng thái lỗi phát và dự phòng UI | CORE | 24 | 12 | 36 | M | Error/retry UI player dùng chung cho cả video và live |
| [G1-06-F006](../docs/01-gd1-vtv8online-v1/G1-06-video-vod.md) | Phát lại sau sự kiện Livestream | CORE | 20 | 32 | 52 | M | Duyệt và công khai recording đã nhận, không tính webhook lần hai |
| [G1-07-F001](../docs/01-gd1-vtv8online-v1/G1-07-livestream-lich-phat.md) | Danh mục chương trình/sự kiện livestream | CORE | 24 | 32 | 56 | M | Hồ sơ phiên phát trực tiếp tham chiếu chương trình có sẵn |
| [G1-07-F002](../docs/01-gd1-vtv8online-v1/G1-07-livestream-lich-phat.md) | Lập và thay đổi lịch phát | CORE | 40 | 40 | 80 | M | Lịch phát, thay đổi, timezone và chống trùng kênh |
| [G1-07-F003](../docs/01-gd1-vtv8online-v1/G1-07-livestream-lich-phat.md) | Gắn nguồn phát/kênh và kiểm tra sẵn sàng | CORE | 20 | 28 | 48 | M | Gán kênh từ Streaming adapter và kiểm tra readiness |
| [G1-07-F004](../docs/01-gd1-vtv8online-v1/G1-07-livestream-lich-phat.md) | Trạng thái trước/đang/sau phát | CORE | 24 | 40 | 64 | L | Trạng thái live theo vendor/override có audit |
| [G1-07-F005](../docs/01-gd1-vtv8online-v1/G1-07-livestream-lich-phat.md) | Trang xem trực tiếp | CORE | 28 | 16 | 44 | M | Trang xem live tái dùng player FE từ G1-06 |
| [G1-07-F006](../docs/01-gd1-vtv8online-v1/G1-07-livestream-lich-phat.md) | Lịch phát sóng công khai | CORE | 24 | 24 | 48 | H | Lịch phát công khai theo ngày, dữ liệu đã duyệt |
| [G1-07-F007](../docs/01-gd1-vtv8online-v1/G1-07-livestream-lich-phat.md) | Kết thúc live và chuyển sang phát lại | CORE | 20 | 32 | 52 | M | Kết thúc phiên và liên kết recording với VOD |
| [G1-07-F008](../docs/01-gd1-vtv8online-v1/G1-07-livestream-lich-phat.md) | Thông báo gián đoạn và trạng thái sự cố | CORE | 12 | 16 | 28 | M | UI offline tái dùng player error và health provider |
| [G1-08-F002](../docs/01-gd1-vtv8online-v1/G1-08-streaming-integration.md) | Cấu hình kết nối đối tác và kênh phát | CORE | 8 | 48 | 56 | L | Kết nối provider/kênh an toàn, chủ yếu BE adapter |
| [G1-08-F003](../docs/01-gd1-vtv8online-v1/G1-08-streaming-integration.md) | Tích hợp nguồn RTMP/SRT ingest | CONDITIONAL | 8 | 40 | 48 | L | CONDITIONAL: API/cấu hình ingest RTMP/SRT do vendor cho phép |
| [G1-08-F004](../docs/01-gd1-vtv8online-v1/G1-08-streaming-integration.md) | Playback manifest và tương thích trình phát | CORE | 12 | 48 | 60 | L | Một playback adapter HLS/DASH cho VOD/live và URL/token |
| [G1-08-F005](../docs/01-gd1-vtv8online-v1/G1-08-streaming-integration.md) | Cấu hình transcoding và bitrate thích ứng | CONDITIONAL | 8 | 40 | 48 | L | CONDITIONAL: API cấu hình ABR/transcoding profile của vendor |
| [G1-08-F006](../docs/01-gd1-vtv8online-v1/G1-08-streaming-integration.md) | Kết nối Origin, lưu trữ phân phối và CDN | CORE | 0 | 24 | 24 | L | Chỉ BE ứng dụng cho URL/routing media; thiết lập CDN/Origin bởi DevOps/vendor riêng |
| [G1-08-F007](../docs/01-gd1-vtv8online-v1/G1-08-streaming-integration.md) | Tiếp nhận bản ghi sau livestream | CORE | 8 | 56 | 64 | L | Webhook/recording idempotent sang DAM và chuẩn hóa dữ liệu |
| [G1-08-F008](../docs/01-gd1-vtv8online-v1/G1-08-streaming-integration.md) | Theo dõi trạng thái nguồn và cảnh báo cơ bản | CORE | 16 | 40 | 56 | L | Health status/alerts mức API có sẵn của provider |
| [G1-09-F001](../docs/01-gd1-vtv8online-v1/G1-09-bao-cao-thong-ke.md) | Tổng quan CMS/dashboard nội dung | CORE | 24 | 32 | 56 | M | Dashboard chỉ số CMS và tổng hợp đếm trạng thái |
| [G1-09-F002](../docs/01-gd1-vtv8online-v1/G1-09-bao-cao-thong-ke.md) | Thống kê sản lượng theo tác giả và chuyên mục | CORE | 24 | 32 | 56 | M | Sản lượng theo tác giả/chuyên mục và tránh trùng đóng góp |
| [G1-09-F003](../docs/01-gd1-vtv8online-v1/G1-09-bao-cao-thong-ke.md) | Thu thập lượt xem bài viết | CORE | 8 | 64 | 72 | L | Bộ đếm bài và aggregations theo bài/chuyên mục/thời gian |
| [G1-09-F004](../docs/01-gd1-vtv8online-v1/G1-09-bao-cao-thong-ke.md) | Lượt xem video và livestream | CONDITIONAL | 24 | 48 | 72 | L | CONDITIONAL: API/import analytics video/live từ vendor |
| [G1-09-F005](../docs/01-gd1-vtv8online-v1/G1-09-bao-cao-thong-ke.md) | Báo cáo theo thời gian và xuất dữ liệu | CORE | 24 | 32 | 56 | M | Bộ lọc báo cáo và một định dạng xuất file |
| [G1-09-F006](../docs/01-gd1-vtv8online-v1/G1-09-bao-cao-thong-ke.md) | Quy tắc thống kê, đối soát và khóa kỳ dữ liệu | OPTION | 24 | 40 | 64 | L | OPTION: đối soát/khóa kỳ dữ liệu nâng cao |
| [G1-10-F001](../docs/01-gd1-vtv8online-v1/G1-10-nhuan-but.md) | Quản lý người tham gia và vai trò trên sản phẩm | CORE | 24 | 32 | 56 | M | Gán nhiều contributor/role vào sản phẩm, tái dùng G1-04 |
| [G1-10-F002](../docs/01-gd1-vtv8online-v1/G1-10-nhuan-but.md) | Quản lý bảng mức và quy tắc nhuận bút | CORE | 32 | 56 | 88 | L | Bảng mức/hệ số và hiệu lực theo quy chế được cung cấp |
| [G1-10-F003](../docs/01-gd1-vtv8online-v1/G1-10-nhuan-but.md) | Xác định sản phẩm đủ điều kiện tính | CORE | 24 | 48 | 72 | L | Quy tắc đủ tính và giải thích loại trừ sản phẩm |
| [G1-10-F004](../docs/01-gd1-vtv8online-v1/G1-10-nhuan-but.md) | Tạo kỳ và chạy tính nhuận bút | CORE | 40 | 88 | 128 | L | Tính theo kỳ, snapshot, rounding, tính lại an toàn |
| [G1-10-F005](../docs/01-gd1-vtv8online-v1/G1-10-nhuan-but.md) | Bảng kê chi tiết theo người và sản phẩm | CORE | 32 | 40 | 72 | L | Bảng kê theo người/sản phẩm, tổng hợp và drill-down |
| [G1-10-F006](../docs/01-gd1-vtv8online-v1/G1-10-nhuan-but.md) | Điều chỉnh và xử lý ngoại lệ | CORE | 24 | 40 | 64 | L | Khoản điều chỉnh có lý do và audit riêng |
| [G1-10-F007](../docs/01-gd1-vtv8online-v1/G1-10-nhuan-but.md) | Rà soát, phê duyệt và khóa kỳ | OPTION | 32 | 40 | 72 | L | OPTION: duyệt nhiều cấp và khóa/mở kỳ theo quy chế |
| [G1-10-F008](../docs/01-gd1-vtv8online-v1/G1-10-nhuan-but.md) | Xuất bảng kê phục vụ chi trả | CORE | 16 | 24 | 40 | M | Xuất mẫu nhuận bút để chi trả ngoài hệ thống |
| [G1-11-F002](../docs/01-gd1-vtv8online-v1/G1-11-chuyen-doi-du-lieu.md) | Trích xuất website/CMS/kho dữ liệu cũ | CORE | 0 | 64 | 64 | L | Trích xuất từ một nguồn CMS/website chính qua API/export, CLI |
| [G1-11-F003](../docs/01-gd1-vtv8online-v1/G1-11-chuyen-doi-du-lieu.md) | Mapping dữ liệu sang cấu trúc mới | CORE | 0 | 80 | 80 | L | Mapping nội dung rich-text, media refs và schema đích |
| [G1-11-F004](../docs/01-gd1-vtv8online-v1/G1-11-chuyen-doi-du-lieu.md) | Làm sạch, chuẩn hóa và khử trùng | CORE | 0 | 80 | 80 | L | Chuẩn hóa/khử trùng, xử lý ngoại lệ bằng batch scripts |
| [G1-11-F005](../docs/01-gd1-vtv8online-v1/G1-11-chuyen-doi-du-lieu.md) | Nhập dữ liệu nội dung/media có kiểm soát quyền | CORE | 0 | 80 | 80 | L | Import idempotent vào CMS/DAM, kiểm tra quyền media |
| [G1-11-F006](../docs/01-gd1-vtv8online-v1/G1-11-chuyen-doi-du-lieu.md) | Chạy thử, báo cáo lỗi và chạy lại lô | CORE | 0 | 64 | 64 | M | Dry-run, checkpoint, retry và báo cáo lỗi dạng CLI/file |

## 4. Tính theo công thức báo giá

| Hạng mục | CORE | OPTION/CONDITIONAL riêng | Tổng nếu làm đủ 82 |
|---|---:|---:|---:|
| Số tính năng | 72 | 10 | 82 |
| FE Coding (giờ) | 1616 | 208 | 1824 |
| BE Coding (giờ) | 2600 | 364 | 2964 |
| **Tổng Coding (giờ)** | **4216** | **572** | **4788** |
| BA 10% / Coding 55% (giờ) | 766.55 | 104.00 | 870.55 |
| Design 15% / Coding 55% (giờ) | 1149.82 | 156.00 | 1305.82 |
| QA 20% / Coding 55% (giờ) | 1533.09 | 208.00 | 1741.09 |
| **Tổng effort (giờ)** | **7665.45** | **1040.00** | **8705.45** |
| **MD 8 giờ** | **958.18** | **130.00** | **1088.18** |

## 5. Công việc đặc thù không được nhầm vào giờ FE/BE

| Nhóm | Có trong Coding phía trên? | Cách xử lý khi làm báo giá |
|---|---|---|
| [G1-H01](../docs/01-gd1-vtv8online-v1/G1-H01-ha-tang-van-hanh.md) – DevOps/hạ tầng ứng dụng | Không | Dự toán giờ DevOps, hosting, DB/storage/CDN tĩnh, backup, monitoring, security riêng |
| [G1-H02](../docs/01-gd1-vtv8online-v1/G1-H02-nghiem-thu-chuyen-giao.md) – UAT/training/cutover | Không, ngoài QA cơ bản trong tỷ lệ | Tách hỗ trợ kiểm thử thực tế, đào tạo/bàn giao, data cutover mà không tính QA chuẩn hai lần |
| G1-H02-W007 – kiểm thử 120.000 CCU/QoE/SLA | Không | Chỉ dự toán sau khi xác nhận loại CCU, topology, bitrate, thời gian test, trách nhiệm CDN/vendor |
| G1-H02-W008/009/010 – nguồn/đối soát/cutover migration | Không | Công sức thực thi và xử lý dữ liệu thực tế theo số record/media và tình trạng nguồn; mã BE G1-11 chỉ ETL/tool |
| VTVcab/VTVprime/nhà cung cấp streaming | Chỉ giờ **adapter FE/BE** tại G1-08 | Chi phí ingest/transcoding/origin/CDN/video egress, license/SLA/monitoring vendor và thiết lập hạ tầng không nằm trong Coding |
| GĐ0 – khảo sát và kiến trúc | Không | Giữ bảng GĐ0 320 giờ DRAFT độc lập, không cộng công sức cùng nội dung hai lần |
| PM, dự phòng rủi ro, thuế, đơn giá | Không | Chỉ đưa vào báo giá sau khi được thống nhất; không giả định số tiền |

## 6. Độ bất định và điều kiện sử dụng

- **Mức tin cậy thấp (L):** G1-08 Streaming/vendor; G1-10 nhuận bút chưa có quy chế; G1-11 migration chưa rõ nguồn và khối lượng; một số DAM/media và analytics. **Không sử dụng tổng như báo giá cố định** trước khi khóa đầu vào.
- Gợi ý xem xét nhạy cảm **±25% tổng coding CORE** để đánh giá sơ bộ rủi ro phạm vi; đây chỉ là phép thử kịch bản, **không** phải mức dự phòng đã chốt. Với Streaming/vendor và dữ liệu cũ, biến động có thể cao hơn.
- Mốc **8–12 tuần** nêu trong tài liệu chỉ là mục tiêu: effort người-ngày không đồng nghĩa số ngày lịch; cần xếp dependency, số FE/BE, QA, DevOps, vendor, dữ liệu thực tế để tính timeline. Chưa khẳng định mốc này khả thi.

**Trạng thái:** BẢN ƯỚC TÍNH THỦ CÔNG LẦN 1, CHƯA CHỐT GIÁ, NHÂN SỰ VÀ LỊCH TRIỂN KHAI.
