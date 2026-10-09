# GĐ2 – Ước tính FE/BE theo 66 tính năng Media Platform (DRAFT)

> **09/10/2026 · Bản dự toán nội bộ lần 1, chưa được VTV8 xác nhận và không phải báo giá cố định.** Dựa trên [66 tính năng GĐ2 chuẩn hóa](../docs/02-gd2-media-platform/G2-DANH-MUC-TINH-NANG.md) và [phương pháp ước tính đã thống nhất](PHUONG-PHAP-UOC-TINH.md): một Middle Developer, FE/BE lập trình trực tiếp; BA 10%, Design 15%, Coding 55%, QA 20%, 8 giờ/MD. Các khoản H01/H02, license và hạ tầng tính riêng.
>
> `H` = độ tin cậy cao, `M` = trung bình, `L` = thấp. Nhãn đánh giá là mức chắc chắn của estimate, **không phải ưu tiên**.

## 1. Giả định và giới hạn tính giờ

- Kế thừa **GĐ1**: website, CMS, taxonomy, DAM/rights, VOD/live player, playback provider adapter, analytics tổng cơ bản. Ở GĐ2 chỉ ước tính phần FE/BE **mới hoặc nâng cấp**, không xây lại thành phần dùng chung.
- **Middle Developer không có hệ số tăng năng suất bởi AI.** Giờ FE/BE là giờ công một người thực hiện phần việc tương ứng, không phải thời gian lịch hay năng suất nhân sự đã biết của nhà thầu.
- Dùng framework/frontend components, auth libraries, media player SDK, database/search và queue phù hợp; không tự xây OIDC provider, payment gateway, DRM server, transcoder/CDN, data warehouse enterprise hoặc ML recommendation engine. Một phần UI search/media đã có nếu GĐ1 thực hiện OPTION; giờ GĐ2 phải hiệu chỉnh theo thực tế đó.
- **Tài khoản:** định danh/xác minh bằng một phương thức/kênh được chốt, SSO với tối đa **một** identity provider trong phương án cơ sở conditional; chính sách dữ liệu/chấp thuận/xóa cần VTV8 xác nhận.
- **Tìm kiếm:** index và filter trên giải pháp phù hợp với dữ liệu VTV8; không mặc định triển khai cụm OpenSearch riêng. **Gợi ý** dùng rules/follow/favorite/history và fallback, không ML/AI chuyên sâu.
- **Thông báo:** inbox trong website là CORE, email/web push chỉ khi bật kênh tương ứng, không native/mobile push. **Bình luận** có điều kiện pháp lý, không mặc định chat live/social features; chi phí vận hành kiểm duyệt tính riêng.
- **Commercial:** G2-09/G2-10 áp dụng [COMMERCIAL_RELEASE_GATE](../docs/02-gd2-media-platform/G2-COMMERCIAL-RELEASE-GATE.md): chọn mô hình gói/giá, một gateway có API và môi trường kiểm thử, entitlement, private playback qua vendor; DRM chỉ một loại provider/SDK được xác nhận. Chưa định nghĩa hoàn tiền, gia hạn tự động hay đối soát phức tạp cụ thể, nên đây là ước tính **độ tin cậy thấp**; nếu có thêm cổng thanh toán/pháp nhân/DRM profile cần tính lại.
- **Analytics:** event schema/aggregation/retention cơ bản cho website/player; không giả định kho dữ liệu lớn hoặc nhiều nguồn dữ liệu ngoài. QoE chỉ tính tích hợp SDK/provider có API thật.
- **Không bao gồm:** BA/Design/QA bên trong giờ Coding, DevOps/infra/license, security/performance/load test chuyên sâu, đối soát nghiệp vụ nhà cung cấp, vận hành kiểm duyệt, pháp lý, PM, marketing, vận hành thương mại và dự phòng thay đổi. Các hoạt động BA/Design/QA tiêu chuẩn chỉ cộng bằng công thức ở phần 4.

## 2. Tổng hợp theo module (CORE, CONDITIONAL, OPTION độc lập)

| Module | Số CORE | FE CORE | BE CORE | Coding CORE | Coding CONDITIONAL | Coding OPTION |
|---|---:|---:|---:|---:|---:|---:|
| [G2-01 – Tài khoản và định danh người xem](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | 5 | 160 | 280 | 440 | 84 | 0 |
| [G2-02 – Theo dõi và yêu thích](../docs/02-gd2-media-platform/G2-02-theo-doi-yeu-thich.md) | 4 | 56 | 88 | 144 | 0 | 44 |
| [G2-03 – Lịch sử xem và playlist](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | 6 | 148 | 224 | 372 | 0 | 0 |
| [G2-04 – Tìm kiếm và khám phá](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | 4 | 60 | 232 | 292 | 0 | 88 |
| [G2-05 – Gợi ý và cá nhân hóa](../docs/02-gd2-media-platform/G2-05-goi-y-ca-nhan-hoa.md) | 3 | 64 | 144 | 208 | 0 | 48 |
| [G2-06 – Nâng cấp VOD/livestream](../docs/02-gd2-media-platform/G2-06-nang-cap-vod-livestream.md) | 2 | 56 | 24 | 80 | 112 | 0 |
| [G2-07 – Bản tin và thông báo](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | 4 | 96 | 164 | 260 | 152 | 88 |
| [G2-08 – Bình luận và tương tác](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | 0 | 0 | 0 | 0 | 468 | 0 |
| [G2-09 – Thuê bao và thanh toán](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | 0 | 0 | 0 | 0 | 764 | 80 |
| [G2-10 – Quyền xem và DRM](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | 0 | 0 | 0 | 0 | 520 | 112 |
| [G2-11 – Phân tích hành vi, QoE](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | 5 | 108 | 316 | 424 | 88 | 160 |
| **Tổng** | **33** | **748** | **1472** | **2220** | **2188** | **620** |

**Phân loại:** G2-08, G2-09 và G2-10 hiện không có CORE do phụ thuộc điều kiện pháp lý/thương mại. **Không coi CORE-only là Media Platform GĐ2 đã hoàn thành các yêu cầu thương mại hóa của VTV8**; phí, thời gian vendor/đối tác và hợp đồng còn tách riêng.

## 3. Ước tính từng tính năng

| Feature ID | Tính năng | Scope | FE (giờ) | BE (giờ) | Coding | Tin cậy | Căn cứ bóc tách |
|---|---|---|---:|---:|---:|---|---|
| [G2-01-F001](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | Đăng ký tài khoản người xem | CORE | 32 | 56 | 88 | M | Đăng ký/xác minh một kênh, kiểm tra trùng |
| [G2-01-F002](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | Đăng nhập, đăng xuất và khôi phục tài khoản | CORE | 44 | 80 | 124 | M | Login/reset/session revoke/rate limit; đã gộp F006 |
| [G2-01-F003](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | Đăng nhập một lần SSO | CONDITIONAL | 20 | 64 | 84 | L | SSO với một nhà cung cấp OIDC, account link |
| [G2-01-F004](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | Hồ sơ và thiết lập cá nhân | CORE | 24 | 28 | 52 | H | Hồ sơ tài khoản tối thiểu, ownership |
| [G2-01-F005](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | Chấp thuận dữ liệu và yêu cầu quyền riêng tư | CORE | 32 | 72 | 104 | L | Consent theo phiên bản, yêu cầu dữ liệu và điều phối xử lý |
| [G2-01-F007](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | Quản trị tài khoản người xem | CORE | 28 | 44 | 72 | M | Admin audience user, khóa/mở, audit và role |
| [G2-02-F001](../docs/02-gd2-media-platform/G2-02-theo-doi-yeu-thich.md) | Theo dõi và bỏ theo dõi chương trình | CORE | 12 | 20 | 32 | H | Quan hệ follow/unfollow chương trình |
| [G2-02-F002](../docs/02-gd2-media-platform/G2-02-theo-doi-yeu-thich.md) | Lưu và bỏ yêu thích nội dung | CORE | 12 | 20 | 32 | H | Favorite bài/video và xác thực quyền |
| [G2-02-F003](../docs/02-gd2-media-platform/G2-02-theo-doi-yeu-thich.md) | Danh sách chương trình đang theo dõi | CORE | 20 | 24 | 44 | H | My Library tab follow, pagination |
| [G2-02-F004](../docs/02-gd2-media-platform/G2-02-theo-doi-yeu-thich.md) | Danh sách nội dung yêu thích | CORE | 12 | 24 | 36 | H | My Library tab favorite, visibility |
| [G2-02-F005](../docs/02-gd2-media-platform/G2-02-theo-doi-yeu-thich.md) | Chủ đề nội dung quan tâm | OPTION | 20 | 24 | 44 | M | OPTION: chọn chủ đề từ taxonomy |
| [G2-03-F001](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | Ghi tiến độ xem theo tài khoản | CORE | 16 | 48 | 64 | M | Lưu watch-progress/multi-device, không analytics trùng |
| [G2-03-F002](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | Danh sách xem tiếp | CORE | 20 | 24 | 44 | H | Danh sách tiếp tục xem, rights filtering |
| [G2-03-F003](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | Xem lịch sử video đã xem | CORE | 24 | 28 | 52 | H | Trang lịch sử, phân trang và quyền |
| [G2-03-F004](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | Xóa lịch sử hoặc từng mục xem | CORE | 12 | 32 | 44 | M | Xóa lịch sử theo data policy chung |
| [G2-03-F005](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | Tạo và quản lý danh sách phát cá nhân | CORE | 44 | 56 | 100 | M | Playlist CRUD, owner và content relationship |
| [G2-03-F006](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | Sắp xếp và phát tuần tự danh sách cá nhân | CORE | 32 | 36 | 68 | M | Sắp xếp playlist, next video và kiểm tra quyền |
| [G2-04-F001](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | Chỉ mục tìm kiếm nội dung có cấu trúc | CORE | 0 | 80 | 80 | L | Search index đa loại public, delta so với GĐ1 |
| [G2-04-F002](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | Trang kết quả tìm kiếm thống nhất | CORE | 36 | 48 | 84 | M | Trang kết quả search và API phân trang |
| [G2-04-F003](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | Tự động gợi ý từ khóa khi nhập | OPTION | 24 | 24 | 48 | M | OPTION: autocomplete prefix và UX |
| [G2-04-F004](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | Lọc kết quả theo loại và chủ đề | CORE | 24 | 40 | 64 | M | Filter/facet theo loại nội dung và taxonomy |
| [G2-04-F005](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | Đồng bộ chỉ mục và tái tạo khi cần | CORE | 0 | 64 | 64 | M | Worker reindex/sync publish/unpublish; không UI mới |
| [G2-04-F006](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | Điều chỉnh mức liên quan/khả năng chịu lỗi gõ | OPTION | 8 | 32 | 40 | L | OPTION: relevance/fuzzy search, phụ thuộc engine |
| [G2-05-F001](../docs/02-gd2-media-platform/G2-05-goi-y-ca-nhan-hoa.md) | Gợi ý nội dung liên quan theo metadata | CORE | 8 | 32 | 40 | M | Ranking metadata; tái dùng widget related GĐ1 |
| [G2-05-F002](../docs/02-gd2-media-platform/G2-05-goi-y-ca-nhan-hoa.md) | Gợi ý theo chương trình đang theo dõi | CORE | 24 | 40 | 64 | M | Feed nội dung từ chương trình đã follow |
| [G2-05-F003](../docs/02-gd2-media-platform/G2-05-goi-y-ca-nhan-hoa.md) | Gợi ý theo chủ đề và lịch sử xem | CORE | 32 | 72 | 104 | L | Rule-based recommendation và cold-start F004 gộp |
| [G2-05-F005](../docs/02-gd2-media-platform/G2-05-goi-y-ca-nhan-hoa.md) | Quy tắc ưu tiên nội dung biên tập | OPTION | 16 | 32 | 48 | L | OPTION: editorial weighting ngoài CMS GĐ1 |
| [G2-06-F001](../docs/02-gd2-media-platform/G2-06-nang-cap-vod-livestream.md) | Tiếp tục phát từ vị trí đang xem | CORE | 24 | 8 | 32 | H | Resume modal/seek dùng progress API G2-03 |
| [G2-06-F002](../docs/02-gd2-media-platform/G2-06-nang-cap-vod-livestream.md) | Chọn chất lượng video theo nguồn cung cấp | CONDITIONAL | 28 | 20 | 48 | L | CONDITIONAL: quality switch dựa rendition provider |
| [G2-06-F003](../docs/02-gd2-media-platform/G2-06-nang-cap-vod-livestream.md) | Phụ đề và bản âm thanh thay thế | CONDITIONAL | 32 | 32 | 64 | L | CONDITIONAL: subtitle/audio track metadata và UX |
| [G2-06-F004](../docs/02-gd2-media-platform/G2-06-nang-cap-vod-livestream.md) | Điều hướng tập kế tiếp và tự phát | CORE | 32 | 16 | 48 | M | Auto-next tập, điều hướng tập cơ bản đã có GĐ1 |
| [G2-07-F001](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Quản lý nội dung bản tin cập nhật | CORE | 24 | 32 | 56 | M | CMS nguồn thông báo, không làm editor thứ hai |
| [G2-07-F002](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Sinh thông báo theo chương trình đang theo dõi | CORE | 12 | 52 | 64 | M | Trigger theo follow, recipient filter và chống trùng |
| [G2-07-F003](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Hộp thư thông báo trong tài khoản | CORE | 36 | 48 | 84 | M | Inbox thông báo và trạng thái chưa đọc |
| [G2-07-F004](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Thông báo đẩy trên trình duyệt | CONDITIONAL | 24 | 64 | 88 | L | CONDITIONAL: Web Push và subscription/queue |
| [G2-07-F005](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Bản tin cập nhật qua email | OPTION | 24 | 64 | 88 | L | OPTION: email opt-in/opt-out và provider |
| [G2-07-F006](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Thiết lập sở thích và tần suất thông báo | CORE | 24 | 32 | 56 | M | Sở thích thông báo tái dùng consent |
| [G2-07-F007](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Theo dõi trạng thái gửi và lỗi | CONDITIONAL | 24 | 40 | 64 | L | CONDITIONAL: delivery status/retry khi có push/email |
| [G2-08-F001](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | Bật/tắt tương tác theo loại nội dung | CONDITIONAL | 16 | 24 | 40 | L | Gate pháp lý và policy bật/tắt bình luận |
| [G2-08-F002](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | Gửi và hiển thị bình luận | CONDITIONAL | 40 | 72 | 112 | L | Comment input/list, sanitize và moderation status |
| [G2-08-F003](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | Phản hồi bình luận có kiểm soát | CONDITIONAL | 24 | 32 | 56 | L | Reply một cấp bên trong gói conditional |
| [G2-08-F004](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | Kiểm duyệt, ẩn và xóa bình luận | CONDITIONAL | 48 | 72 | 120 | L | Màn moderation, log ẩn/xóa và phân quyền |
| [G2-08-F005](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | Báo cáo bình luận vi phạm | CONDITIONAL | 24 | 40 | 64 | L | Report comment vi phạm và trạng thái xử lý |
| [G2-08-F006](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | Chống spam và kiểm soát lạm dụng | CONDITIONAL | 12 | 64 | 76 | L | Abuse prevention, rate limit, restrictions |
| [G2-09-F001](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Danh mục gói thuê bao và quyền lợi | CONDITIONAL | 36 | 56 | 92 | L | Gói/quyền lợi, plan CRUD và versioning |
| [G2-09-F002](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Giá, chu kỳ và điều kiện đăng ký | CONDITIONAL | 24 | 40 | 64 | L | Giá/chu kỳ và ngày hiệu lực |
| [G2-09-F003](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Đăng ký gói và khởi tạo thanh toán | CONDITIONAL | 52 | 96 | 148 | L | Checkout một payment gateway, order/intent |
| [G2-09-F004](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Nhận trạng thái giao dịch và đối soát đơn | CONDITIONAL | 28 | 112 | 140 | L | Idempotent webhook/reconciliation/refund policy |
| [G2-09-F005](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Vòng đời thuê bao và ngày hết hạn | CONDITIONAL | 32 | 80 | 112 | L | Vòng đời subscription, cấp/thu hồi quyền qua event |
| [G2-09-F006](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Gia hạn, hủy và xử lý thanh toán thất bại | CONDITIONAL | 36 | 96 | 132 | L | Gia hạn, hủy và payment failure theo chính sách |
| [G2-09-F007](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Lịch sử thanh toán và chứng từ | CONDITIONAL | 28 | 48 | 76 | L | Lịch sử giao dịch và chứng từ provider |
| [G2-09-F008](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Khuyến mại, dùng thử hoặc tặng quyền | OPTION | 32 | 48 | 80 | L | OPTION: voucher/trial chỉ khi thương mại đã bật |
| [G2-10-F001](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | Phân loại nội dung miễn phí và trả phí | CONDITIONAL | 24 | 56 | 80 | L | Free/premium policy theo nội dung và quyền DAM |
| [G2-10-F002](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | Kiểm tra quyền xem theo tài khoản | CONDITIONAL | 20 | 112 | 132 | L | Entitlement tập trung, expiry DAM và revoke; gộp F007 |
| [G2-10-F003](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | Giao diện paywall và nâng cấp quyền xem | CONDITIONAL | 40 | 24 | 64 | M | Paywall/offer UI dựa gói thật |
| [G2-10-F004](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | Bảo vệ URL và phiên phát nội dung có quyền | CONDITIONAL | 16 | 96 | 112 | L | Protected playback token/URL và provider adapter |
| [G2-10-F005](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | Tích hợp hệ thống DRM được cấp phép | CONDITIONAL | 36 | 96 | 132 | L | DRM license provider/player SDK cho môi trường hỗ trợ |
| [G2-10-F006](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | Quản lý số thiết bị/phiên xem đồng thời | OPTION | 32 | 80 | 112 | L | OPTION: concurrent session/device limit |
| [G2-11-F001](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Định nghĩa sự kiện hành vi và vòng đời phiên xem | CORE | 24 | 80 | 104 | L | Event schema/ingestion, consent/session/dedupe |
| [G2-11-F002](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Ghi nhận và tổng hợp hành vi xem video | CORE | 8 | 72 | 80 | M | Video aggregation starts/complete/watch time |
| [G2-11-F003](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Dashboard người xem và hoạt động nội dung | CORE | 48 | 64 | 112 | M | Dashboard metrics theo content/period |
| [G2-11-F004](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Thống kê hành trình tương tác nội dung | OPTION | 32 | 56 | 88 | L | OPTION: multi-step funnel/journey |
| [G2-11-F005](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Đo chất lượng phát từ player và nguồn streaming | CONDITIONAL | 24 | 64 | 88 | L | CONDITIONAL: QoE SDK/provider metrics |
| [G2-11-F006](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Kiểm soát lưu giữ và xóa dữ liệu hành vi | CORE | 8 | 56 | 64 | L | Retention/delete/anonymize theo consent G2-01 |
| [G2-11-F007](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Phân tích nhóm người xem và tỷ lệ quay lại | OPTION | 24 | 48 | 72 | L | OPTION: cohorts/retention privacy |
| [G2-11-F008](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Xuất báo cáo và kiểm tra chất lượng dữ liệu | CORE | 20 | 44 | 64 | M | Metrics export/data quality và tracking recommendation F006 gộp |

## 4. Quy đổi theo tỷ trọng của template

| Hạng mục | CORE (33) | CONDITIONAL (24) | OPTION (9) | Tất cả 66 |
|---|---:|---:|---:|---:|
| FE Coding (giờ) | 748 | 688 | 212 | 1648 |
| BE Coding (giờ) | 1472 | 1500 | 408 | 3380 |
| **Coding (giờ)** | **2220** | **2188** | **620** | **5028** |
| BA (giờ) | 403.64 | 397.82 | 112.73 | 914.18 |
| Design (giờ) | 605.45 | 596.73 | 169.09 | 1371.27 |
| QA tiêu chuẩn (giờ) | 807.27 | 795.64 | 225.45 | 1828.36 |
| **Tổng effort (giờ)** | **4036.36** | **3978.18** | **1127.27** | **9141.82** |
| **Man-day (8 giờ)** | **504.55** | **497.27** | **140.91** | **1142.73** |

### Ba kịch bản dùng để lập kế hoạch

| Kịch bản | Thành phần | Coding (giờ) | Tổng effort (giờ) | MD |
|---|---|---:|---:|---:|
| A – CORE nền tảng | 33 CORE | 2220 | 4036.36 | 504.55 |
| B – CORE + toàn bộ CONDITIONAL | 33 CORE + 24 có điều kiện | 4408 | 8014.55 | 1001.82 |
| C – Làm đủ 66 feature | CORE + CONDITIONAL + OPTION | 5028 | 9141.82 | 1142.73 |

**Kịch bản B chỉ là giả định cộng đủ 24 hạng mục có điều kiện**, không có nghĩa tất cả đều phải bật trong một đợt. Tối thiểu nên tách thêm `Commercial` G2-09/G2-10 khỏi `Moderation` G2-08 và điều kiện SSO/DRM/Web Push/QoE. Kịch bản B/C không bao gồm chi phí license/provider và công việc H01/H02.

## 5. Công việc và chi phí ngoài công thức

| Nhóm | Phần phát triển đã tính | Bên ngoài FE/BE |
|---|---|---|
| [G2-H01](../docs/02-gd2-media-platform/G2-H01-ha-tang-media-platform.md) | API/logic trong 66 feature | Setup/vận hành hạ tầng auth, index/queue/events, security, monitoring, provider secrets/đơn giá |
| [G2-H02](../docs/02-gd2-media-platform/G2-H02-nghiem-thu-phap-ly.md) | QA tiêu chuẩn theo tỷ trọng | UAT pháp lý, payment/vendor E2E, DRM compatibility, privacy, performance và cutover |
| Account / SSO | UI auth và adapter một provider | SMS/Email OTP, license/vận hành IdP, phê duyệt chính sách dữ liệu |
| Notification | Inbox, Web Push/Email adapters nếu chọn | Dịch vụ gửi, email domain/deliverability, consent policy |
| Moderation | Chức năng bình luận nếu được duyệt | Thủ tục pháp lý, nhân sự kiểm duyệt liên tục, xử lý tố cáo |
| Payment + premium | Gateway integration và entitlement/token/DRM SDK | Payment fee, merchant account, DRM license, license content, CDN/media protected |
| Search + analytics | Search schema/worker và pipeline event cơ bản | Hạ tầng search lớn/data platform, bảo mật/performance chuyên sâu |

## 6. Độ tin cậy và tiến độ lịch

- **L (thấp):** thanh toán, DRM, SSO, consent/analytics, bình luận và media provider. Phải xác nhận đối tác, quy trình đặc thù và dữ liệu trước khi báo giá cố định.
- **M (trung bình):** search, recommendation, notification inbox và một số player upgrades; tùy năng lực đã có ở GĐ1.
- **H (cao):** quan hệ follow/favorite, một số trang/profile và tích hợp UI đơn giản.
- Kiểm tra nhạy cảm nội bộ có thể khảo sát **±25% Coding** cho các mục chưa chốt, nhưng đây không phải hệ số dự phòng chính thức. Phần vendor/legal có thể làm biến động hơn mức này.
- Dự kiến nguồn GĐ2 **3–6 tháng** chỉ là mục tiêu thời gian lịch. Theo cách quy đổi đơn giản **20 ngày làm việc/tháng**, với kịch bản B cần tương đương khoảng **16.70 FTE trong 3 tháng** hoặc **8.35 FTE trong 6 tháng** nếu lý tưởng song song và 100% thời gian hữu ích. Thực tế cần xét phụ thuộc, team split FE/BE, triển khai vendor, QA/UAT, DevOps và rủi ro.
- **Không coi tổng effort có công thức là dự toán đầy đủ mọi chi phí hay cam kết hoàn tất trong thời gian lịch nêu trên.**

**Trạng thái: DRAFT ESTIMATE V1. Không nhập cứng số giờ vào hồ sơ nghiệp vụ chuẩn hay báo giá chính thức trước khi xác nhận phạm vi phát hành.**
