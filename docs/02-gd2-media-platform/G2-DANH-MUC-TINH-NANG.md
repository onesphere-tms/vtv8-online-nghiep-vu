# GĐ2 – Media Platform: thiết kế lại module và 72 tính năng sơ bộ

> **Ngày tạo:** 09/10/2026. **Trạng thái: ĐỀ XUẤT/DRAFT, CHƯA CHỐT** với người dùng hoặc VTV8. Bắt đầu từ 9 nhóm module đã có, phân rã lại thành 11 module để không gộp giao dịch thuê bao với quyền phát nội dung hoặc gợi ý với tìm kiếm. Chưa phân tích giờ FE/BE, chưa xác nhận 3–6 tháng khả thi.
> **Nguồn chính:** [Đề xuất VTV8–IIEL](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md), GĐ2 trang 6–7 và bảng lộ trình trang 3; các quyết định media/privacy từ phần kiến trúc trang 8–11. **Không được tự coi suy luận thành yêu cầu do VTV8 xác nhận.**

## I. Mục tiêu và dữ liệu kế thừa

- **Mục tiêu nguồn:** làm chủ người dùng và video, nâng cấp website V1 thành Media Platform có account, SSO, theo dõi, lịch sử, yêu thích, playlist, gợi ý, bình luận nếu có giấy phép, bản tin cập nhật, push, livestream, VOD, thuê bao, nội dung trả phí, DRM và phân tích tương tác.
- Kế thừa **GĐ1**: website, CMS/taxonomy, DAM/rights, VOD/player, live/calendar, streaming adapter/CDN, số lượng view theo bài/chuyên mục/thời gian. **Không xây lại** phần gốc khi tạo tính năng mới ở GĐ2.
- Tìm kiếm được ghi trong **bảng lộ trình GĐ2** và kiến trúc tìm kiếm, dù không tách một bullet riêng trong đoạn danh sách chi tiết GĐ2.
- Từ 'Bản tin cập nhật' không mặc định đồng nghĩa với newsletter email trả phí; thông báo trong app/web khác hạ tầng push mobile. Email/web push có điều kiện.

## II. Đề xuất 11 module

| Mã | Module | Tổng tính năng | CORE đề xuất | OPTION | CONDITIONAL | Tài liệu |
|---|---|---:|---:|---:|---:|---|
| G2-01 | Tài khoản và định danh người xem | 7 | 6 | 0 | 1 | [Chi tiết](G2-01-tai-khoan-nguoi-xem.md) |
| G2-02 | Theo dõi chương trình và yêu thích | 5 | 4 | 1 | 0 | [Chi tiết](G2-02-theo-doi-yeu-thich.md) |
| G2-03 | Lịch sử xem và danh sách phát cá nhân | 6 | 6 | 0 | 0 | [Chi tiết](G2-03-lich-su-playlist.md) |
| G2-04 | Tìm kiếm và khám phá nội dung | 6 | 5 | 1 | 0 | [Chi tiết](G2-04-tim-kiem-kham-pha.md) |
| G2-05 | Gợi ý và cá nhân hóa nội dung | 6 | 4 | 2 | 0 | [Chi tiết](G2-05-goi-y-ca-nhan-hoa.md) |
| G2-06 | Nâng cấp VOD và trải nghiệm Livestream | 6 | 4 | 0 | 2 | [Chi tiết](G2-06-nang-cap-vod-livestream.md) |
| G2-07 | Bản tin cập nhật và thông báo | 7 | 5 | 1 | 1 | [Chi tiết](G2-07-ban-tin-thong-bao.md) |
| G2-08 | Bình luận và tương tác cộng đồng | 6 | 0 | 0 | 6 | [Chi tiết](G2-08-binh-luan-tuong-tac.md) |
| G2-09 | Đăng ký thuê bao và thanh toán nội dung | 8 | 2 | 1 | 5 | [Chi tiết](G2-09-thue-bao-thanh-toan.md) |
| G2-10 | Paywall, quyền xem và DRM | 7 | 5 | 1 | 1 | [Chi tiết](G2-10-quyen-xem-drm.md) |
| G2-11 | Phân tích hành vi người xem và chất lượng phát | 8 | 6 | 1 | 1 | [Chi tiết](G2-11-analytics-qoe.md) |
| **Tổng** | **11 module** | **72** | **47** | **8** | **17** | |

**Chú giải:** `T` = nhóm yêu cầu có trong tài liệu nguồn (các thao tác có thể vẫn là suy luận); `B` = suy luận để quy trình vận hành; `C` = điều kiện pháp lý/vendor. `CORE` chỉ là cơ sở phân tích đề xuất, **không phải phạm vi đã được phê duyệt**. `OPTION`/`CONDITIONAL` không tự động tính vào baseline.

## III. Danh sách 72 tính năng

| ID | Tính năng | Nghiệp vụ/đầu ra | Nguồn | Phạm vi |
|---|---|---|---|---|
| [G2-01-F001](G2-01-tai-khoan-nguoi-xem.md) | Đăng ký tài khoản người xem | Nhập thông tin tối thiểu, đồng ý điều khoản theo chính sách, xác nhận tài khoản qua kênh VTV8 chọn. | T | CORE |
| [G2-01-F002](G2-01-tai-khoan-nguoi-xem.md) | Đăng nhập, đăng xuất và khôi phục tài khoản | Đăng nhập bằng tài khoản VTV8Online, đăng xuất, khôi phục khi quên mật khẩu. | T | CORE |
| [G2-01-F003](G2-01-tai-khoan-nguoi-xem.md) | Đăng nhập một lần SSO | Kết nối nhà cung cấp định danh được VTV8 phê duyệt; tránh tạo tài khoản trùng khi liên kết. | T | CONDITIONAL |
| [G2-01-F004](G2-01-tai-khoan-nguoi-xem.md) | Hồ sơ và thiết lập cá nhân | Chỉnh tên hiển thị, ảnh đại diện tùy chính sách, thông tin cá nhân tối thiểu và cài đặt hiển thị. | B | CORE |
| [G2-01-F005](G2-01-tai-khoan-nguoi-xem.md) | Chấp thuận dữ liệu và yêu cầu quyền riêng tư | Lưu phiên bản điều khoản/chính sách đã chấp thuận; hỗ trợ yêu cầu xem hoặc xóa dữ liệu theo chính sách được duyệt. | B | CORE |
| [G2-01-F006](G2-01-tai-khoan-nguoi-xem.md) | Bảo mật và quản lý phiên người xem | Quản lý đăng nhập nhiều thiết bị mức cơ bản, giới hạn phiên và phát hiện thao tác bất thường cơ bản. | B | CORE |
| [G2-01-F007](G2-01-tai-khoan-nguoi-xem.md) | Quản trị tài khoản người xem | Tìm tài khoản, hỗ trợ khóa/mở theo quyền, xem trạng thái; không truy cập mật khẩu hoặc dữ liệu xem cá nhân trái quyền. | B | CORE |
| [G2-02-F001](G2-02-theo-doi-yeu-thich.md) | Theo dõi và bỏ theo dõi chương trình | Theo dõi hoặc bỏ theo dõi chương trình/series đã công khai từ trang nội dung. | T | CORE |
| [G2-02-F002](G2-02-theo-doi-yeu-thich.md) | Lưu và bỏ yêu thích nội dung | Yêu thích bài viết/video công khai; trạng thái nhất quán trên các trang. | T | CORE |
| [G2-02-F003](G2-02-theo-doi-yeu-thich.md) | Danh sách chương trình đang theo dõi | Xem, tìm/lọc và bỏ theo dõi trong thư viện cá nhân. | B | CORE |
| [G2-02-F004](G2-02-theo-doi-yeu-thich.md) | Danh sách nội dung yêu thích | Xem bài/video đã lưu, phân loại cơ bản và loại khỏi danh sách; xử lý nội dung bị gỡ. | B | CORE |
| [G2-02-F005](G2-02-theo-doi-yeu-thich.md) | Chủ đề nội dung quan tâm | Lựa chọn hoặc thay đổi chủ đề sở thích từ taxonomy G1-04 làm tín hiệu gợi ý. | B | OPTION |
| [G2-03-F001](G2-03-lich-su-playlist.md) | Ghi tiến độ xem theo tài khoản | Lưu video, vị trí xem cuối, thời điểm, trạng thái đã xem; đồng bộ khi sử dụng thiết bị khác. | T | CORE |
| [G2-03-F002](G2-03-lich-su-playlist.md) | Danh sách xem tiếp | Hiển thị video/tập đang xem dở từ dữ liệu tiến độ, bỏ các nội dung đã xem xong hoặc hết quyền xem. | B | CORE |
| [G2-03-F003](G2-03-lich-su-playlist.md) | Xem lịch sử video đã xem | Lọc lịch sử theo thời gian và truy cập lại nội dung có thể xem. | T | CORE |
| [G2-03-F004](G2-03-lich-su-playlist.md) | Xóa lịch sử hoặc từng mục xem | Xóa mục lịch sử hay xóa toàn bộ thông tin xem theo chính sách dữ liệu của VTV8. | B | CORE |
| [G2-03-F005](G2-03-lich-su-playlist.md) | Tạo và quản lý danh sách phát cá nhân | Tạo, đặt tên, sửa, xóa danh sách phát và thêm/bỏ video có quyền xem. | T | CORE |
| [G2-03-F006](G2-03-lich-su-playlist.md) | Sắp xếp và phát tuần tự danh sách cá nhân | Kéo sắp thứ tự video, phát tiếp trong danh sách sau khi nội dung kết thúc. | B | CORE |
| [G2-04-F001](G2-04-tim-kiem-kham-pha.md) | Chỉ mục tìm kiếm nội dung có cấu trúc | Lập chỉ mục bài viết, video, chương trình, nhân vật, địa danh/di sản có thể công khai; không index bản nháp. | T | CORE |
| [G2-04-F002](G2-04-tim-kiem-kham-pha.md) | Trang kết quả tìm kiếm thống nhất | Tìm và đọc kết quả đa loại nội dung với tiêu đề, mô tả, thumbnail và liên kết. | T | CORE |
| [G2-04-F003](G2-04-tim-kiem-kham-pha.md) | Tự động gợi ý từ khóa khi nhập | Autocomplete tên chương trình, địa danh, chủ đề và từ khóa khi gõ. | B | CORE |
| [G2-04-F004](G2-04-tim-kiem-kham-pha.md) | Lọc kết quả theo loại và chủ đề | Lọc theo bài/video/chương trình, chuyên mục, chủ đề và khoảng thời gian được hỗ trợ. | B | CORE |
| [G2-04-F005](G2-04-tim-kiem-kham-pha.md) | Đồng bộ chỉ mục và tái tạo khi cần | Cập nhật index từ CMS/DAM khi có thay đổi và cung cấp job xây dựng lại chỉ mục có kiểm soát. | B | CORE |
| [G2-04-F006](G2-04-tim-kiem-kham-pha.md) | Điều chỉnh mức liên quan/khả năng chịu lỗi gõ | Xử lý typo đơn giản, ưu tiên tiêu đề và sắp xếp độ phù hợp theo quy tắc đã duyệt. | B | OPTION |
| [G2-05-F001](G2-05-goi-y-ca-nhan-hoa.md) | Gợi ý nội dung liên quan theo metadata | Gợi ý bài/video cùng chủ đề, chương trình, nhân vật, địa danh/di sản ở trang chi tiết. | T | CORE |
| [G2-05-F002](G2-05-goi-y-ca-nhan-hoa.md) | Gợi ý theo chương trình đang theo dõi | Hiển thị chương trình/tập mới từ danh sách theo dõi, sắp xếp theo ngày công khai. | B | CORE |
| [G2-05-F003](G2-05-goi-y-ca-nhan-hoa.md) | Gợi ý theo chủ đề và lịch sử xem | Chọn nội dung phù hợp sở thích/hành vi cơ bản; bỏ nội dung đã hết quyền hoặc không phù hợp. | B | CORE |
| [G2-05-F004](G2-05-goi-y-ca-nhan-hoa.md) | Gợi ý cho người mới chưa có lịch sử | Hiển thị nội dung mới, chương trình nổi bật và lựa chọn biên tập theo cấu hình GĐ1. | B | CORE |
| [G2-05-F005](G2-05-goi-y-ca-nhan-hoa.md) | Quy tắc ưu tiên nội dung biên tập | Cho phép nội dung nổi bật do biên tập ưu tiên trong một số vị trí, kế thừa slot/editorial placement G1-03. | B | OPTION |
| [G2-05-F006](G2-05-goi-y-ca-nhan-hoa.md) | Theo dõi hiệu quả gợi ý | Đo số lần hiển thị, click, bắt đầu xem từ khối gợi ý để điều chỉnh quy tắc. | B | OPTION |
| [G2-06-F001](G2-06-nang-cap-vod-livestream.md) | Tiếp tục phát từ vị trí đang xem | Khi mở video, lấy progress G2-03 và đề nghị tiếp tục hoặc phát từ đầu; cập nhật vị trí xem. | B | CORE |
| [G2-06-F002](G2-06-nang-cap-vod-livestream.md) | Chọn chất lượng video theo nguồn cung cấp | Cho phép lựa chọn Auto/chất lượng được provider xuất bản; không tự sinh độ phân giải nếu chưa có. | B | CONDITIONAL |
| [G2-06-F003](G2-06-nang-cap-vod-livestream.md) | Phụ đề và bản âm thanh thay thế | Hiển thị và chọn track phụ đề/âm thanh nếu asset/provider cung cấp; GĐ2 không tự sản xuất transcript hoặc dịch bằng AI. | B | CONDITIONAL |
| [G2-06-F004](G2-06-nang-cap-vod-livestream.md) | Điều hướng tập kế tiếp và tự phát | Chuyển tập tiếp theo trong series, tùy chọn auto-play sau khi tập kết thúc. | B | CORE |
| [G2-06-F005](G2-06-nang-cap-vod-livestream.md) | Quản lý giới hạn thời gian xem nội dung | Hiển thị thời hạn khả dụng của video/live replay theo quyền nội dung; tận dụng DAM rights và G2-10 entitlements. | B | CORE |
| [G2-06-F006](G2-06-nang-cap-vod-livestream.md) | Tối ưu trải nghiệm chuyển Live sang VOD | Hiển thị tình trạng đã kết thúc live, liên kết tới bản phát lại khi được xuất bản, không xử lý recording ingestion lại. | B | CORE |
| [G2-07-F001](G2-07-ban-tin-thong-bao.md) | Quản lý nội dung bản tin cập nhật | Soạn mục cập nhật/chuyên mục và chọn liên kết bài/video/chương trình đã công khai; tái dùng CMS hiện có. | T | CORE |
| [G2-07-F002](G2-07-ban-tin-thong-bao.md) | Sinh thông báo theo chương trình đang theo dõi | Khi chương trình có tập mới hoặc lịch phát quan trọng, hệ thống tạo thông báo theo đối tượng follow. | B | CORE |
| [G2-07-F003](G2-07-ban-tin-thong-bao.md) | Hộp thư thông báo trong tài khoản | Xem thông báo theo mới/cũ, đánh dấu đã đọc, mở nội dung liên quan. | B | CORE |
| [G2-07-F004](G2-07-ban-tin-thong-bao.md) | Thông báo đẩy trên trình duyệt | Xin quyền nhận web push, đăng ký/bỏ đăng ký thiết bị và nhận thông báo ngay cả khi không ở trang. | T | CONDITIONAL |
| [G2-07-F005](G2-07-ban-tin-thong-bao.md) | Bản tin cập nhật qua email | Đăng ký/huỷ email nhận bản tin với danh mục nội dung được chọn; dùng nhà cung cấp email được VTV8 cho phép. | B | OPTION |
| [G2-07-F006](G2-07-ban-tin-thong-bao.md) | Thiết lập sở thích và tần suất thông báo | Chọn loại thông báo, theo dõi chương trình, kênh nhận và khả năng tạm dừng. | B | CORE |
| [G2-07-F007](G2-07-ban-tin-thong-bao.md) | Theo dõi trạng thái gửi và lỗi | Xem thống kê gửi, thành công/thất bại và thử lại có giới hạn; không phát triển email campaign suite. | B | CORE |
| [G2-08-F001](G2-08-binh-luan-tuong-tac.md) | Bật/tắt tương tác theo loại nội dung | Cấu hình cho phép bình luận trên bài/video/chương trình đủ điều kiện, chặn nội dung hạn chế. | C | CONDITIONAL |
| [G2-08-F002](G2-08-binh-luan-tuong-tac.md) | Gửi và hiển thị bình luận | Nhập bình luận, xem danh sách bình luận hợp lệ theo thời gian và trạng thái duyệt. | T | CONDITIONAL |
| [G2-08-F003](G2-08-binh-luan-tuong-tac.md) | Phản hồi bình luận có kiểm soát | Trả lời bình luận theo cấu trúc tối đa một cấp hoặc độ sâu do VTV8 duyệt. | B | CONDITIONAL |
| [G2-08-F004](G2-08-binh-luan-tuong-tac.md) | Kiểm duyệt, ẩn và xóa bình luận | Xem hàng đợi, phê duyệt, ẩn/xóa và ghi lý do; tách khỏi workflow biên tập bài viết G1-03. | B | CONDITIONAL |
| [G2-08-F005](G2-08-binh-luan-tuong-tac.md) | Báo cáo bình luận vi phạm | Báo cáo bình luận và lựa chọn lý do; nhân sự được phân công xử lý, tránh báo cáo spam. | B | CONDITIONAL |
| [G2-08-F006](G2-08-binh-luan-tuong-tac.md) | Chống spam và kiểm soát lạm dụng | Giới hạn tốc độ gửi, phát hiện trùng đơn giản, chặn tài khoản vi phạm theo quy trình. | B | CONDITIONAL |
| [G2-09-F001](G2-09-thue-bao-thanh-toan.md) | Danh mục gói thuê bao và quyền lợi | Khai báo các gói, chu kỳ, mô tả lợi ích, trạng thái bán; quyền lợi trỏ sang G2-10. | T | CORE |
| [G2-09-F002](G2-09-thue-bao-thanh-toan.md) | Giá, chu kỳ và điều kiện đăng ký | Định nghĩa mức giá, đơn vị tiền tệ, chu kỳ, thời điểm áp dụng và các điều khoản VTV8 đã duyệt. | B | CONDITIONAL |
| [G2-09-F003](G2-09-thue-bao-thanh-toan.md) | Đăng ký gói và khởi tạo thanh toán | Chọn gói, xác nhận điều khoản và chuyển sang gateway thanh toán được phép, không giữ thông tin thẻ trên máy chủ ứng dụng. | B | CONDITIONAL |
| [G2-09-F004](G2-09-thue-bao-thanh-toan.md) | Nhận trạng thái giao dịch và đối soát đơn | Nhận webhook/giao dịch, xác minh chữ ký, tránh cập nhật trùng; hiển thị tra soát lỗi cơ bản. | B | CONDITIONAL |
| [G2-09-F005](G2-09-thue-bao-thanh-toan.md) | Vòng đời thuê bao và ngày hết hạn | Quản lý đã kích hoạt/chưa kích hoạt/hết hạn/hủy và thời điểm bắt đầu, kết thúc của gói; chuyển quyền xem cho G2-10. | T | CORE |
| [G2-09-F006](G2-09-thue-bao-thanh-toan.md) | Gia hạn, hủy và xử lý thanh toán thất bại | Thực hiện hủy/gia hạn theo chính sách hợp đồng và năng lực gateway; không mặc định tự thu tiền nếu chưa có cơ chế hợp pháp. | B | CONDITIONAL |
| [G2-09-F007](G2-09-thue-bao-thanh-toan.md) | Lịch sử thanh toán và chứng từ | Tra cứu giao dịch, chứng từ do nhà cung cấp hoặc hệ thống được phép phát hành; không tự mặc định chức năng hóa đơn điện tử. | B | CONDITIONAL |
| [G2-09-F008](G2-09-thue-bao-thanh-toan.md) | Khuyến mại, dùng thử hoặc tặng quyền | Cấp ưu đãi, thời gian dùng thử hoặc mã giảm giá theo chính sách; có giới hạn sử dụng và ngày hết hạn. | B | OPTION |
| [G2-10-F001](G2-10-quyen-xem-drm.md) | Phân loại nội dung miễn phí và trả phí | Gắn trạng thái public/free/subscriber-only hoặc các quyền theo gói với video/chương trình/tập; kiểm tra rights DAM trước khi bán. | T | CORE |
| [G2-10-F002](G2-10-quyen-xem-drm.md) | Kiểm tra quyền xem theo tài khoản | Tại thời điểm truy cập video/live, đánh giá quyền tài khoản, gói đang hiệu lực, địa lý/thiết bị nếu hợp đồng yêu cầu. | T | CORE |
| [G2-10-F003](G2-10-quyen-xem-drm.md) | Giao diện paywall và nâng cấp quyền xem | Thông báo lý do hạn chế, gói phù hợp và đường dẫn đăng ký; không che nội dung premium chỉ bằng CSS. | T | CORE |
| [G2-10-F004](G2-10-quyen-xem-drm.md) | Bảo vệ URL và phiên phát nội dung có quyền | Cấp URL/token phát giới hạn thời gian và xác thực session, đồng bộ quyền với provider media. | B | CORE |
| [G2-10-F005](G2-10-quyen-xem-drm.md) | Tích hợp hệ thống DRM được cấp phép | Kết nối dịch vụ DRM/license để bảo vệ nội dung theo hợp đồng và thiết bị; không phát triển bộ mã hóa/cấp phép DRM từ đầu. | T | CONDITIONAL |
| [G2-10-F006](G2-10-quyen-xem-drm.md) | Quản lý số thiết bị/phiên xem đồng thời | Giới hạn thiết bị hoặc số luồng xem đồng thời theo gói/điều khoản nếu mô hình kinh doanh cần. | B | OPTION |
| [G2-10-F007](G2-10-quyen-xem-drm.md) | Thời hạn khả dụng theo giấy phép nội dung | Đối chiếu quyền phát lại, khung giờ/địa bàn hoặc thời hạn khai thác từ DAM để từ chối quyền xem khi không còn hiệu lực. | B | CORE |
| [G2-11-F001](G2-11-analytics-qoe.md) | Định nghĩa sự kiện hành vi và vòng đời phiên xem | Thống nhất event start/progress/pause/complete, click/follow/favorite, ID phiên và quan hệ account ẩn danh/có đăng nhập. | T | CORE |
| [G2-11-F002](G2-11-analytics-qoe.md) | Ghi nhận và tổng hợp hành vi xem video | Tính số lần bắt đầu xem, hoàn tất, thời lượng và mức bỏ xem, khác với pageview G1-09. | T | CORE |
| [G2-11-F003](G2-11-analytics-qoe.md) | Dashboard người xem và hoạt động nội dung | Xem tài khoản đang hoạt động, lượt phát, nội dung thu hút và biến động theo thời gian; phân quyền dữ liệu báo cáo. | T | CORE |
| [G2-11-F004](G2-11-analytics-qoe.md) | Thống kê hành trình tương tác nội dung | Theo dõi từ xem trang nội dung đến bắt đầu video, follow, xem tiếp hoặc đăng ký gói (nếu bật). | B | CORE |
| [G2-11-F005](G2-11-analytics-qoe.md) | Đo chất lượng phát từ player và nguồn streaming | Nhận startup time, buffering/error, bitrate switches theo SDK/provider được hỗ trợ, đối chiếu trạng thái nguồn. | B | CONDITIONAL |
| [G2-11-F006](G2-11-analytics-qoe.md) | Kiểm soát lưu giữ và xóa dữ liệu hành vi | Quy định retention và xử lý yêu cầu xóa dữ liệu, tách dữ liệu thống kê tổng khỏi dữ liệu nhận diện cá nhân. | B | CORE |
| [G2-11-F007](G2-11-analytics-qoe.md) | Phân tích nhóm người xem và tỷ lệ quay lại | Phân nhóm theo lần truy cập, nhóm chương trình quan tâm và tỷ lệ tiếp tục xem trong kỳ. | B | OPTION |
| [G2-11-F008](G2-11-analytics-qoe.md) | Xuất báo cáo và kiểm tra chất lượng dữ liệu | Xuất chỉ số tổng hợp, theo dõi số sự kiện lỗi/trùng và độ trễ, hỗ trợ đối soát định kỳ. | B | CORE |

## IV. Những trường hợp có điều kiện và không tính trùng

- **Tương tác G2-08:** toàn module **CONDITIONAL**; phải xác minh mô hình và giấy phép pháp lý, chính sách kiểm duyệt và dữ liệu cá nhân. Không suy từ nguồn rằng được phép triển khai bình luận ngay.
- **Thuê bao và thanh toán G2-09:** thuê bao và nội dung trả phí là yêu cầu nguồn, nhưng gateway, giá, hình thức gia hạn/hủy/hóa đơn, hoàn tiền là chi tiết **chưa được cung cấp**. G2-09-F003/F004 và các hành động liên quan cần vendor/thỏa thuận.
- **DRM G2-10:** quyền xem/premium là yêu cầu nguồn, nhưng DRM license integration phụ thuộc content protection provider; không tự lập trình DRM, license server hoặc bảo mật bất khả xâm phạm.
- **Nâng cấp media G2-06:** chỉ bổ sung chức năng playback mới (resume, track, chương trình), không làm lại VOD/live GĐ1 hoặc media ingest/CDN. Video bitrate/subtitle tracks phụ thuộc nguồn.
- **Tìm kiếm G2-04:** nếu G1-01-F007 được chọn tại GĐ1 thì chỉ tính chức năng nâng cấp như index đa thực thể, facet, autocomplete và sync; không tính lại search box/API cũ.
- **Phân tích G2-11:** khác thống kê G1-09. G2-11 theo dõi phiên/xu hướng/chất lượng, cần chính sách consent/retention. Không mặc định triển khai ClickHouse, data warehouse hoặc ML.

## V. Nhóm triển khai hỗ trợ (không phải tính năng app)

- [G2-H01 – Hạ tầng vận hành Media Platform](G2-H01-ha-tang-media-platform.md): định danh/consent, search index, event pipeline và dữ liệu, monitoring, bảo mật/payments/DRM integration, điều chỉnh CDN và QoE theo vendor. DevOps/cost riêng.
- [G2-H02 – Kiểm thử, pháp lý, UAT và chuyển giao](G2-H02-nghiem-thu-phap-ly.md): xác nhận điều kiện giấy phép, subscription/payment UAT, DRM/device compatibility, test analytics/privacy, hiệu năng và rollback. Tránh tính QA cơ bản lần hai.
- [G2-THANH-PHAN-DUNG-CHUNG.md](G2-THANH-PHAN-DUNG-CHUNG.md): ghi rõ chủ sở hữu chức năng dùng chung và điều kiện kế thừa GĐ1.

## VI. Các quyết định cần khóa trước khi chốt scope và ước tính

1. **Account & SSO:** người dùng đăng ký bằng gì, nhà cung cấp danh tính nào, xác minh tài khoản, bảo vệ dữ liệu và yêu cầu xử lý xóa dữ liệu.
2. **Monetization:** loại thuê bao/nội dung trả phí, chu kỳ, gateway, thuế/hóa đơn, refund và chủ thể giao dịch.
3. **DRM/viewing rights:** video live/VOD có nội dung nào trả phí, license provider, cơ chế entitlement/token và thiết bị hỗ trợ.
4. **Tương tác:** giấy phép, chính sách bình luận, trách nhiệm kiểm duyệt và báo cáo vi phạm.
5. **Tracking/notifications:** chính sách thu thập sự kiện, lưu giữ, kênh web push/email, đồng ý nhận thông báo, các bên cung cấp.
6. **Search/recommendation:** index tại GĐ1 đã có hay chưa, data volume và độ ưu tiên rule-based vs AI (AI chuyên sâu chưa mặc định GĐ2).
7. **Media capacity:** kiểm tra năng lực QoE và media provider từ GĐ1, không tự coi SLA ≥99,95% đề xuất là cam kết đã đo.

**Định hướng giai đoạn:** giữ GĐ2 tập trung 'làm chủ người xem và video'; AI chuyên sâu, native app, booking/commerce, partner portal thuộc các giai đoạn sau. Chưa tính giờ FE/BE ở bước thiết kế nghiệp vụ này.
