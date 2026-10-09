# GĐ2 – Media Platform: 66 tính năng đã chuẩn hóa

> **Bản thiết kế được chọn nội bộ ngày 09/10/2026; chưa được VTV8 phê duyệt.** Giữ 11 module + 2 nhóm hỗ trợ, 66 tính năng độc lập: 33 CORE, 9 OPTION, 24 CONDITIONAL. Chưa tính giờ FE/BE và chưa xác nhận mốc 3–6 tháng.
> Nguồn: [Đề xuất VTV8–IIEL](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md), [GĐ1](../01-gd1-vtv8online-v1/README.md) và [báo cáo QA 72 tính năng](G2-BAO-CAO-QA-72-TINH-NANG.md).

## Danh mục 11 module

| Mã | Module | Tổng | CORE | OPTION | CONDITIONAL |
|---|---|---:|---:|---:|---:|
| G2-01 | [Tài khoản và định danh người xem](G2-01-tai-khoan-nguoi-xem.md) | 6 | 5 | 0 | 1 |
| G2-02 | [Theo dõi và yêu thích](G2-02-theo-doi-yeu-thich.md) | 5 | 4 | 1 | 0 |
| G2-03 | [Lịch sử xem và playlist](G2-03-lich-su-playlist.md) | 6 | 6 | 0 | 0 |
| G2-04 | [Tìm kiếm và khám phá](G2-04-tim-kiem-kham-pha.md) | 6 | 4 | 2 | 0 |
| G2-05 | [Gợi ý và cá nhân hóa](G2-05-goi-y-ca-nhan-hoa.md) | 4 | 3 | 1 | 0 |
| G2-06 | [VOD và Livestream nâng cấp](G2-06-nang-cap-vod-livestream.md) | 4 | 2 | 0 | 2 |
| G2-07 | [Bản tin và thông báo](G2-07-ban-tin-thong-bao.md) | 7 | 4 | 1 | 2 |
| G2-08 | [Bình luận và tương tác](G2-08-binh-luan-tuong-tac.md) | 6 | 0 | 0 | 6 |
| G2-09 | [Thuê bao và thanh toán](G2-09-thue-bao-thanh-toan.md) | 8 | 0 | 1 | 7 |
| G2-10 | [Paywall và DRM](G2-10-quyen-xem-drm.md) | 6 | 0 | 1 | 5 |
| G2-11 | [Phân tích người xem](G2-11-analytics-qoe.md) | 8 | 5 | 2 | 1 |
| **Tổng** | | **66** | **33** | **9** | **24** |

## Danh sách 66 tính năng

| Mã | Tính năng | Nghiệp vụ sau QA | Nguồn | Phân loại |
|---|---|---|---|---|
| [G2-01-F001](G2-01-tai-khoan-nguoi-xem.md) | Đăng ký tài khoản người xem | Tạo tài khoản người xem bằng kênh định danh/xác minh được VTV8 chốt; xử lý trùng tài khoản, chưa xác minh và ghi nhận phiên bản điều khoản. | T | CORE |
| [G2-01-F002](G2-01-tai-khoan-nguoi-xem.md) | Đăng nhập, đăng xuất và khôi phục tài khoản | Đăng nhập/đăng xuất/khôi phục kèm bảo mật và thu hồi phiên, rate limit, audit tối thiểu; nhận nghiệp vụ G2-01-F006, không xây quản lý thiết bị riêng. | T | CORE |
| [G2-01-F003](G2-01-tai-khoan-nguoi-xem.md) | Đăng nhập một lần SSO | Kết nối nhà cung cấp định danh được VTV8 phê duyệt; tránh tạo tài khoản trùng khi liên kết. | T | CONDITIONAL |
| [G2-01-F004](G2-01-tai-khoan-nguoi-xem.md) | Hồ sơ và thiết lập cá nhân | Hồ sơ người xem với trường cá nhân tối thiểu; không hình thành hồ sơ công khai kiểu mạng xã hội. | B | CORE |
| [G2-01-F005](G2-01-tai-khoan-nguoi-xem.md) | Chấp thuận dữ liệu và yêu cầu quyền riêng tư | Consent theo mục đích và phiên bản, quyền yêu cầu xử lý/xóa dữ liệu theo chính sách VTV8, dùng chung cho lịch sử G2-03 và events G2-11. | B | CORE |
| [G2-01-F007](G2-01-tai-khoan-nguoi-xem.md) | Quản trị tài khoản người xem | Quản trị tài khoản người xem tách hoàn toàn user quản trị CMS; khóa/mở có lý do, log, giới hạn truy cập lịch sử cá nhân. | B | CORE |
| [G2-02-F001](G2-02-theo-doi-yeu-thich.md) | Theo dõi và bỏ theo dõi chương trình | Theo dõi hoặc bỏ theo dõi chương trình/series đã công khai từ trang nội dung. | T | CORE |
| [G2-02-F002](G2-02-theo-doi-yeu-thich.md) | Lưu và bỏ yêu thích nội dung | Yêu thích bài viết/video công khai; trạng thái nhất quán trên các trang. | T | CORE |
| [G2-02-F003](G2-02-theo-doi-yeu-thich.md) | Danh sách chương trình đang theo dõi | Xem, tìm/lọc và bỏ theo dõi trong thư viện cá nhân. | B | CORE |
| [G2-02-F004](G2-02-theo-doi-yeu-thich.md) | Danh sách nội dung yêu thích | Xem bài/video đã lưu, phân loại cơ bản và loại khỏi danh sách; xử lý nội dung bị gỡ. | B | CORE |
| [G2-02-F005](G2-02-theo-doi-yeu-thich.md) | Chủ đề nội dung quan tâm | Lựa chọn hoặc thay đổi chủ đề sở thích từ taxonomy G1-04 làm tín hiệu gợi ý. | B | OPTION |
| [G2-03-F001](G2-03-lich-su-playlist.md) | Ghi tiến độ xem theo tài khoản | Một nguồn lưu watch-progress theo user/video để resume; G2-11 chỉ thu sự kiện analytics, không lưu tiếp một progress DB. | T | CORE |
| [G2-03-F002](G2-03-lich-su-playlist.md) | Danh sách xem tiếp | Hiển thị video/tập đang xem dở từ dữ liệu tiến độ, bỏ các nội dung đã xem xong hoặc hết quyền xem. | B | CORE |
| [G2-03-F003](G2-03-lich-su-playlist.md) | Xem lịch sử video đã xem | Lọc lịch sử theo thời gian và truy cập lại nội dung có thể xem. | T | CORE |
| [G2-03-F004](G2-03-lich-su-playlist.md) | Xóa lịch sử hoặc từng mục xem | Xóa mục/toàn bộ lịch sử xem cá nhân, phối hợp request từ G2-01 và retention/ẩn danh G2-11, không tự coi việc xóa là xóa aggregate. | B | CORE |
| [G2-03-F005](G2-03-lich-su-playlist.md) | Tạo và quản lý danh sách phát cá nhân | Tạo, đặt tên, sửa, xóa danh sách phát và thêm/bỏ video có quyền xem. | T | CORE |
| [G2-03-F006](G2-03-lich-su-playlist.md) | Sắp xếp và phát tuần tự danh sách cá nhân | Kéo sắp thứ tự video, phát tiếp trong danh sách sau khi nội dung kết thúc. | B | CORE |
| [G2-04-F001](G2-04-tim-kiem-kham-pha.md) | Chỉ mục tìm kiếm nội dung có cấu trúc | Index bài, video, chương trình và thực thể có trang đích công khai; kiểm tra trạng thái published và rights. Nếu tìm kiếm GĐ1 đã bật chỉ phát triển delta. | T | CORE |
| [G2-04-F002](G2-04-tim-kiem-kham-pha.md) | Trang kết quả tìm kiếm thống nhất | Tìm và đọc kết quả đa loại nội dung với tiêu đề, mô tả, thumbnail và liên kết. | T | CORE |
| [G2-04-F003](G2-04-tim-kiem-kham-pha.md) | Tự động gợi ý từ khóa khi nhập | Tùy chọn autocomplete khi gõ trên dữ liệu đã công khai; luồng tìm kiếm thống nhất vẫn hoạt động khi không bật. | B | OPTION |
| [G2-04-F004](G2-04-tim-kiem-kham-pha.md) | Lọc kết quả theo loại và chủ đề | Lọc theo bài/video/chương trình, chuyên mục, chủ đề và khoảng thời gian được hỗ trợ. | B | CORE |
| [G2-04-F005](G2-04-tim-kiem-kham-pha.md) | Đồng bộ chỉ mục và tái tạo khi cần | Đồng bộ index và rebuild theo worker/CLI khi publish/gỡ, không mặc định cụm OpenSearch hay dashboard admin riêng. | B | CORE |
| [G2-04-F006](G2-04-tim-kiem-kham-pha.md) | Điều chỉnh mức liên quan/khả năng chịu lỗi gõ | Xử lý typo đơn giản, ưu tiên tiêu đề và sắp xếp độ phù hợp theo quy tắc đã duyệt. | B | OPTION |
| [G2-05-F001](G2-05-goi-y-ca-nhan-hoa.md) | Gợi ý nội dung liên quan theo metadata | Chỉ nâng cấp logic liên quan/xếp hạng từ metadata G1-04 và tái dùng khối related content đã có, không tạo trang/module recommender mới. | T | CORE |
| [G2-05-F002](G2-05-goi-y-ca-nhan-hoa.md) | Gợi ý theo chương trình đang theo dõi | Feed nội dung mới từ chương trình đang theo dõi G2-02, không tạo quan hệ follow thứ hai và không nhân đôi inbox thông báo G2-07. | B | CORE |
| [G2-05-F003](G2-05-goi-y-ca-nhan-hoa.md) | Gợi ý theo chủ đề và lịch sử xem | Gợi ý rule-based từ follow/favorite/watch-progress (G2-02/G2-03); nếu thiếu tín hiệu thì fallback nội dung nổi bật G1-03-F009, nhận nghiệp vụ G2-05-F004. Chủ đề sở thích chỉ OPTION. | B | CORE |
| [G2-05-F005](G2-05-goi-y-ca-nhan-hoa.md) | Quy tắc ưu tiên nội dung biên tập | Tùy chọn ưu tiên nội dung biên tập sâu hơn slot G1-03-F009; nếu slot GĐ1 đáp ứng thì không triển khai cấu hình thứ hai. | B | OPTION |
| [G2-06-F001](G2-06-nang-cap-vod-livestream.md) | Tiếp tục phát từ vị trí đang xem | Nâng cấp player G1-06 để gợi ý phát từ vị trí đã lưu ở G2-03-F001; không phát triển một API hoặc bảng watch-progress khác. | B | CORE |
| [G2-06-F002](G2-06-nang-cap-vod-livestream.md) | Chọn chất lượng video theo nguồn cung cấp | Cho phép lựa chọn Auto/chất lượng được provider xuất bản; không tự sinh độ phân giải nếu chưa có. | B | CONDITIONAL |
| [G2-06-F003](G2-06-nang-cap-vod-livestream.md) | Phụ đề và bản âm thanh thay thế | Hiển thị và chọn track phụ đề/âm thanh nếu asset/provider cung cấp; GĐ2 không tự sản xuất transcript hoặc dịch bằng AI. | B | CONDITIONAL |
| [G2-06-F004](G2-06-nang-cap-vod-livestream.md) | Điều hướng tập kế tiếp và tự phát | Thêm tự phát/đề xuất tập kế tiếp vào player theo series G1-04; điều hướng tập cơ bản đã có G1-06-F004, thứ tự playlist cá nhân thuộc G2-03-F006. | B | CORE |
| [G2-07-F001](G2-07-ban-tin-thong-bao.md) | Quản lý nội dung bản tin cập nhật | Bản tin cập nhật có thể là danh sách nội dung/notification/digest, chưa được VTV8 xác nhận loại kênh; sử dụng CMS GĐ1 để chọn nội dung công khai, không làm CMS thứ hai. | T | CORE |
| [G2-07-F002](G2-07-ban-tin-thong-bao.md) | Sinh thông báo theo chương trình đang theo dõi | Thông báo trong tài khoản khi chương trình theo dõi xuất bản tập mới/lịch phát, lọc preference/consent, idempotent và không gửi lặp. | B | CORE |
| [G2-07-F003](G2-07-ban-tin-thong-bao.md) | Hộp thư thông báo trong tài khoản | Inbox trên website quản lý thông báo mới/đã đọc và link nội dung; trạng thái tạo/đọc và log cơ bản là CORE không phụ thuộc email/web push. | B | CORE |
| [G2-07-F004](G2-07-ban-tin-thong-bao.md) | Thông báo đẩy trên trình duyệt | Xin quyền nhận web push, đăng ký/bỏ đăng ký thiết bị và nhận thông báo ngay cả khi không ở trang. | T | CONDITIONAL |
| [G2-07-F005](G2-07-ban-tin-thong-bao.md) | Bản tin cập nhật qua email | Đăng ký/huỷ email nhận bản tin với danh mục nội dung được chọn; dùng nhà cung cấp email được VTV8 cho phép. | B | OPTION |
| [G2-07-F006](G2-07-ban-tin-thong-bao.md) | Thiết lập sở thích và tần suất thông báo | Một bộ tùy chọn thông báo sử dụng consent G2-01 và danh sách follow G2-02; lựa chọn kênh chỉ hiện nếu kênh được triển khai. | B | CORE |
| [G2-07-F007](G2-07-ban-tin-thong-bao.md) | Theo dõi trạng thái gửi và lỗi | CONDITIONAL: chỉ triển khai dashboard delivery/retry chuyên sâu khi kích hoạt push/email từ F004/F005; inbox CORE chỉ cần log tạo/đọc cơ bản. | B | CONDITIONAL |
| [G2-08-F001](G2-08-binh-luan-tuong-tac.md) | Bật/tắt tương tác theo loại nội dung | Thiết lập cho phép bình luận theo nội dung chỉ sau khi VTV8 xác minh điều kiện pháp lý, trách nhiệm kiểm duyệt và quy định vận hành. | C | CONDITIONAL |
| [G2-08-F002](G2-08-binh-luan-tuong-tac.md) | Gửi và hiển thị bình luận | Chỉ mở bình luận theo chính sách VTV8 và cơ chế tiền kiểm/hậu kiểm được xác nhận; không mặc định cho phép hiển thị ngay. | T | CONDITIONAL |
| [G2-08-F003](G2-08-binh-luan-tuong-tac.md) | Phản hồi bình luận có kiểm soát | Bổ sung phản hồi bình luận theo luồng tối đa một cấp nếu được duyệt bên trong gói tương tác có điều kiện; không mặc định cần thiết để phát hành comment V1 GĐ2. | B | CONDITIONAL |
| [G2-08-F004](G2-08-binh-luan-tuong-tac.md) | Kiểm duyệt, ẩn và xóa bình luận | Điều phối kiểm duyệt, ẩn/xóa có log và nhân sự được phân công; không đồng nhất workflow bình luận với workflow bài viết G1-03. | B | CONDITIONAL |
| [G2-08-F005](G2-08-binh-luan-tuong-tac.md) | Báo cáo bình luận vi phạm | Tiếp nhận báo cáo vi phạm với lý do, số lần báo cáo, trạng thái xử lý và trách nhiệm kiểm duyệt theo chính sách VTV8. | B | CONDITIONAL |
| [G2-08-F006](G2-08-binh-luan-tuong-tac.md) | Chống spam và kiểm soát lạm dụng | Giới hạn tốc độ/chống spam, khóa tương tác, dấu vết kiểm duyệt là điều kiện vận hành tối thiểu khi bật bình luận. | B | CONDITIONAL |
| [G2-09-F001](G2-09-thue-bao-thanh-toan.md) | Danh mục gói thuê bao và quyền lợi | Quản lý gói và quyền lợi trỏ đến entitlement G2-10, chỉ đưa vào sản xuất nếu đạt COMMERCIAL_RELEASE_GATE từ chọn gói đến xem trả phí. | T | CONDITIONAL |
| [G2-09-F002](G2-09-thue-bao-thanh-toan.md) | Giá, chu kỳ và điều kiện đăng ký | Giá, chu kỳ và điều khoản theo mô hình VTV8 chốt; tham chiếu COMMERCIAL_RELEASE_GATE, xử lý sửa bảng giá có hiệu lực. | B | CONDITIONAL |
| [G2-09-F003](G2-09-thue-bao-thanh-toan.md) | Đăng ký gói và khởi tạo thanh toán | Checkout qua payment provider được VTV8 chọn, trạng thái chờ/thành công/thất bại, không lưu thông tin thẻ trên hệ thống. Phụ thuộc COMMERCIAL_RELEASE_GATE. | B | CONDITIONAL |
| [G2-09-F004](G2-09-thue-bao-thanh-toan.md) | Nhận trạng thái giao dịch và đối soát đơn | Nhận webhook giao dịch, xác minh chữ ký, chống xử lý trùng/trễ, đối soát order; quy định hoàn tiền/chargeback/tranh chấp và thu hồi entitlement phải được xác nhận với VTV8. | B | CONDITIONAL |
| [G2-09-F005](G2-09-thue-bao-thanh-toan.md) | Vòng đời thuê bao và ngày hết hạn | Vòng đời thuê bao chờ thanh toán/kích hoạt/hết hạn/hủy, sự kiện cấp/thu hồi quyền ở G2-10; phải hoàn thành cả luồng thương mại. | T | CONDITIONAL |
| [G2-09-F006](G2-09-thue-bao-thanh-toan.md) | Gia hạn, hủy và xử lý thanh toán thất bại | Gia hạn/hủy và xử lý failed payment theo loại thuê bao VTV8 chốt. Tự động gia hạn/thu tiền định kỳ không mặc định có nếu chỉ bán theo kỳ trả trước. | B | CONDITIONAL |
| [G2-09-F007](G2-09-thue-bao-thanh-toan.md) | Lịch sử thanh toán và chứng từ | Lịch sử giao dịch và chứng từ từ provider/chủ thể có thẩm quyền, không xây hệ hóa đơn điện tử mới nếu chưa được yêu cầu. | B | CONDITIONAL |
| [G2-09-F008](G2-09-thue-bao-thanh-toan.md) | Khuyến mại, dùng thử hoặc tặng quyền | Ưu đãi/voucher/dùng thử là OPTION **chỉ sau khi** đã mở luồng gói/entitlement thực, không tách chức năng phát coupon miễn phí khỏi security quyền xem. | B | OPTION |
| [G2-10-F001](G2-10-quyen-xem-drm.md) | Phân loại nội dung miễn phí và trả phí | Gắn nội dung free/subscriber-only dựa gói thật được VTV8 phê duyệt và quyền DAM. Chỉ bật premium khi COMMERCIAL_RELEASE_GATE đã đạt. | T | CONDITIONAL |
| [G2-10-F002](G2-10-quyen-xem-drm.md) | Kiểm tra quyền xem theo tài khoản | Một entitlement service đánh giá subscription, gói, thời hạn và rights DAM G1-05; tích hợp nghiệp vụ thời hạn gốc G2-10-F007, không có policy thứ hai. | T | CONDITIONAL |
| [G2-10-F003](G2-10-quyen-xem-drm.md) | Giao diện paywall và nâng cấp quyền xem | Paywall/CTA gói có thật và phương án mua được; bảo vệ thực tế ở BE/provider, không coi CSS/modal là chặn nội dung. | T | CONDITIONAL |
| [G2-10-F004](G2-10-quyen-xem-drm.md) | Bảo vệ URL và phiên phát nội dung có quyền | Cấp signed playback URL/session giới hạn thời gian sau entitlement check theo năng lực media provider G1-08; nhận kiểm tra rights/expiry từ G2-10-F007. | B | CONDITIONAL |
| [G2-10-F005](G2-10-quyen-xem-drm.md) | Tích hợp hệ thống DRM được cấp phép | DRM vendor/license integration **nếu** nội dung/thiết bị/hợp đồng yêu cầu; là lớp bảo vệ khác token URL, không tự phát triển DRM hoặc license server. | T | CONDITIONAL |
| [G2-10-F006](G2-10-quyen-xem-drm.md) | Quản lý số thiết bị/phiên xem đồng thời | OPTION giới hạn số thiết bị/phiên theo gói thương mại đã kích hoạt; nếu DRM/media provider không hỗ trợ cần có phương án kỹ thuật riêng. | B | OPTION |
| [G2-11-F001](G2-11-analytics-qoe.md) | Định nghĩa sự kiện hành vi và vòng đời phiên xem | Một event taxonomy/schema cho phiên xem và tương tác có consent, có nguồn gợi ý G2-05. Tiến độ xem nghiệp vụ do G2-03 lưu, không tạo kho watch-progress thứ hai. | T | CORE |
| [G2-11-F002](G2-11-analytics-qoe.md) | Ghi nhận và tổng hợp hành vi xem video | Tổng hợp starts/completions/watch time từ event pipeline, khác pageviews G1-09 và progress G2-03. | T | CORE |
| [G2-11-F003](G2-11-analytics-qoe.md) | Dashboard người xem và hoạt động nội dung | Xem tài khoản đang hoạt động, lượt phát, nội dung thu hút và biến động theo thời gian; phân quyền dữ liệu báo cáo. | T | CORE |
| [G2-11-F004](G2-11-analytics-qoe.md) | Thống kê hành trình tương tác nội dung | OPTION funnel người xem từ khám phá/xem đến follow hoặc mua gói khi commercial gate bật; không mặc định trong dashboard GĐ2 cơ sở. | B | OPTION |
| [G2-11-F005](G2-11-analytics-qoe.md) | Đo chất lượng phát từ player và nguồn streaming | Nhận startup time, buffering/error, bitrate switches theo SDK/provider được hỗ trợ, đối chiếu trạng thái nguồn. | B | CONDITIONAL |
| [G2-11-F006](G2-11-analytics-qoe.md) | Kiểm soát lưu giữ và xóa dữ liệu hành vi | Quản lý retention/delete/anonymize trên kho sự kiện theo yêu cầu từ G2-01-F005 và chính sách quyền riêng tư, không tạo một màn quản lý riêng. | B | CORE |
| [G2-11-F007](G2-11-analytics-qoe.md) | Phân tích nhóm người xem và tỷ lệ quay lại | Phân nhóm theo lần truy cập, nhóm chương trình quan tâm và tỷ lệ tiếp tục xem trong kỳ. | B | OPTION |
| [G2-11-F008](G2-11-analytics-qoe.md) | Xuất báo cáo và kiểm tra chất lượng dữ liệu | Export/tình trạng chất lượng dữ liệu hành vi và events nguồn gợi ý G2-05-F006, không làm riêng recommendation analytics; funnel vẫn là OPTION. | B | CORE |

## Quy tắc phạm vi

- `T` là nhóm yêu cầu nêu trong đề xuất VTV8, nhưng chi tiết luồng có thể do phân tích suy ra; `B` là bổ sung; `C` là điều kiện vendor/pháp lý. Các nhãn phân loại là đề xuất nội bộ.
- [Mapping 72 mã sang 66 tính năng](G2-MAPPING-72-66.md): sáu mã đã gộp, không mất nghiệp vụ; giữ ID của 66 mã còn độc lập.
- [Điều kiện phát hành trả phí](G2-COMMERCIAL-RELEASE-GATE.md): G2-09/G2-10 phải được nghiệm thu trọn luồng mua gói, thanh toán, entitlement, bảo vệ playback, DRM khi yêu cầu. **CONDITIONAL không đồng nghĩa tự ý bỏ yêu cầu thương mại của VTV8 khỏi GĐ2.**
- G2-08 chỉ mở khi xác minh đủ điều kiện pháp lý. G2-01/G2-03/G2-11 dùng một chính sách dữ liệu cá nhân. G2-04 search, G2-05 recommendation và G2-11 analytics có chủ sở hữu khác nhau.
- Kế thừa website/CMS/DAM/player/live/Streaming và báo cáo từ GĐ1, không tính trùng tính năng cũ.
- [Tiêu chí nghiệm thu E2E](G2-TIEU-CHI-NGHIEM-THU.md), [chủ sở hữu thành phần dùng chung](G2-THANH-PHAN-DUNG-CHUNG.md), [H01](G2-H01-ha-tang-media-platform.md), [H02](G2-H02-nghiem-thu-phap-ly.md).

**Chưa xác nhận từ VTV8:** provider SSO và DRM, gateway, giá và chu kỳ gói, consent/retention, giấy phép bình luận, bản tin cập nhật và media telemetry.
