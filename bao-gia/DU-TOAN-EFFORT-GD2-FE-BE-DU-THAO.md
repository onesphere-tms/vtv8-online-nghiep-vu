# GĐ2 – Ước tính FE/BE theo 66 tính năng Media Platform (DRAFT)

**Cập nhật giờ V2 – 12/10/2026:** dùng FE/BE đã rà với hỗ trợ AI trong [báo cáo, mục 10 và 13](RA-SOAT-ESTIMATE-FE-BE-VOI-AI.md). Giữ nguyên mã, tính năng, phạm vi và nghiệm thu. Đây là dự toán nội bộ có điều kiện, chưa được VTV8 phê duyệt và chưa đo thực tế. Giả định đặc tả/thiết kế rõ, component và nền dùng chung đã chạy, provider có API/sandbox phù hợp; giờ gồm review, ghép chạy và developer checks, không chỉ thời gian AI sinh code.

> **09/10/2026 · Bản dự toán nội bộ V2, cập nhật 12/10/2026, chưa được VTV8 xác nhận và không phải báo giá cố định.** Dựa trên [66 tính năng GĐ2 chuẩn hóa](../docs/02-gd2-media-platform/G2-DANH-MUC-TINH-NANG.md) và [phương pháp ước tính đã thống nhất](PHUONG-PHAP-UOC-TINH.md): một Middle Developer, FE/BE lập trình trực tiếp; BA 10%, Design 15%, Coding 55%, QA 20%, 8 giờ/MD. Các khoản H01/H02, license và hạ tầng tính riêng.
>
> `H` = độ tin cậy cao, `M` = trung bình, `L` = thấp. Nhãn đánh giá là mức chắc chắn của estimate, **không phải ưu tiên**.

## 1. Giả định và giới hạn tính giờ

- Kế thừa **GĐ1**: website, CMS, taxonomy, DAM/rights, VOD/live player, playback provider adapter, analytics tổng cơ bản. Ở GĐ2 chỉ ước tính phần FE/BE **mới hoặc nâng cấp**, không xây lại thành phần dùng chung.
- **Middle Developer có hỗ trợ AI phân tích/phát triển; dùng giờ V2 đã rà từng tính năng, không áp một hệ số giảm đồng đều.** Giờ FE/BE là giờ công một người thực hiện phần việc tương ứng, không phải thời gian lịch hay năng suất nhân sự đã biết của nhà thầu.
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
| [G2-01 – Tài khoản và định danh người xem](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | 5 | 16 | 45 | 61 | 14 | 0 |
| [G2-02 – Theo dõi và yêu thích](../docs/02-gd2-media-platform/G2-02-theo-doi-yeu-thich.md) | 4 | 5 | 8 | 13 | 0 | 4 |
| [G2-03 – Lịch sử xem và playlist](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | 6 | 16 | 32 | 48 | 0 | 0 |
| [G2-04 – Tìm kiếm và khám phá](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | 4 | 7 | 34 | 41 | 0 | 13 |
| [G2-05 – Gợi ý và cá nhân hóa](../docs/02-gd2-media-platform/G2-05-goi-y-ca-nhan-hoa.md) | 3 | 8 | 20 | 28 | 0 | 6 |
| [G2-06 – Nâng cấp VOD/livestream](../docs/02-gd2-media-platform/G2-06-nang-cap-vod-livestream.md) | 2 | 5 | 2 | 7 | 14 | 0 |
| [G2-07 – Bản tin và thông báo](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | 4 | 12 | 26 | 38 | 26 | 13 |
| [G2-08 – Bình luận và tương tác](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | 0 | 0 | 0 | 0 | 71 | 0 |
| [G2-09 – Thuê bao và thanh toán](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | 0 | 0 | 0 | 0 | 130 | 14 |
| [G2-10 – Quyền xem và DRM](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | 0 | 0 | 0 | 0 | 97 | 24 |
| [G2-11 – Phân tích hành vi, QoE](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | 5 | 16 | 56 | 72 | 16 | 25 |
| **Tổng** | **33** | **85** | **223** | **308** | **368** | **99** |

**Phân loại:** G2-08, G2-09 và G2-10 hiện không có CORE do phụ thuộc điều kiện pháp lý/thương mại. **Không coi CORE-only là Media Platform GĐ2 đã hoàn thành các yêu cầu thương mại hóa của VTV8**; phí, thời gian vendor/đối tác và hợp đồng còn tách riêng.

## 3. Ước tính từng tính năng

| Feature ID | Tính năng | Scope | FE (giờ) | BE (giờ) | Coding | Tin cậy | Căn cứ bóc tách |
|---|---|---|---:|---:|---:|---|---|
| [G2-01-F001](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | Đăng ký tài khoản người xem | CORE | 3 | 8 | 11 | M | Đăng ký/xác minh một kênh, kiểm tra trùng; V2: Dùng auth/consent/admin nền; API audience có policy riêng, kiểm tra session/account/data scope. |
| [G2-01-F002](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | Đăng nhập, đăng xuất và khôi phục tài khoản | CORE | 4 | 12 | 16 | M | Login/reset/session revoke/rate limit; đã gộp F006; V2: Dùng auth/consent/admin nền; API audience có policy riêng, kiểm tra session/account/data scope. |
| [G2-01-F003](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | Đăng nhập một lần SSO | CONDITIONAL | 2 | 12 | 14 | L | SSO với một nhà cung cấp OIDC, account link; V2: Dùng auth/consent/admin nền; API audience có policy riêng, kiểm tra session/account/data scope. |
| [G2-01-F004](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | Hồ sơ và thiết lập cá nhân | CORE | 2 | 3 | 5 | H | Hồ sơ tài khoản tối thiểu, ownership; V2: Dùng auth/consent/admin nền; API audience có policy riêng, kiểm tra session/account/data scope. |
| [G2-01-F005](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | Chấp thuận dữ liệu và yêu cầu quyền riêng tư | CORE | 4 | 16 | 20 | L | Consent theo phiên bản, yêu cầu dữ liệu và điều phối xử lý; V2: Dùng auth/consent/admin nền; API audience có policy riêng, kiểm tra session/account/data scope. |
| [G2-01-F007](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) | Quản trị tài khoản người xem | CORE | 3 | 6 | 9 | M | Admin audience user, khóa/mở, audit và role; V2: Dùng auth/consent/admin nền; API audience có policy riêng, kiểm tra session/account/data scope. |
| [G2-02-F001](../docs/02-gd2-media-platform/G2-02-theo-doi-yeu-thich.md) | Theo dõi và bỏ theo dõi chương trình | CORE | 1 | 2 | 3 | H | Quan hệ follow/unfollow chương trình; V2: Một typed relation/toggle/library primitive, endpoint mỏng + unique keys/user scope. |
| [G2-02-F002](../docs/02-gd2-media-platform/G2-02-theo-doi-yeu-thich.md) | Lưu và bỏ yêu thích nội dung | CORE | 1 | 2 | 3 | H | Favorite bài/video và xác thực quyền; V2: Một typed relation/toggle/library primitive, endpoint mỏng + unique keys/user scope. |
| [G2-02-F003](../docs/02-gd2-media-platform/G2-02-theo-doi-yeu-thich.md) | Danh sách chương trình đang theo dõi | CORE | 2 | 2 | 4 | H | My Library tab follow, pagination; V2: Một typed relation/toggle/library primitive, endpoint mỏng + unique keys/user scope. |
| [G2-02-F004](../docs/02-gd2-media-platform/G2-02-theo-doi-yeu-thich.md) | Danh sách nội dung yêu thích | CORE | 1 | 2 | 3 | H | My Library tab favorite, visibility; V2: Một typed relation/toggle/library primitive, endpoint mỏng + unique keys/user scope. |
| [G2-02-F005](../docs/02-gd2-media-platform/G2-02-theo-doi-yeu-thich.md) | Chủ đề nội dung quan tâm | OPTION | 2 | 2 | 4 | M | OPTION: chọn chủ đề từ taxonomy; V2: Một typed relation/toggle/library primitive, endpoint mỏng + unique keys/user scope. |
| [G2-03-F001](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | Ghi tiến độ xem theo tài khoản | CORE | 3 | 10 | 13 | M | Lưu watch-progress/multi-device, không analytics trùng; V2: Shared progress/history/playlist primitives; chỉ API query/update/delete/order và UI delta. |
| [G2-03-F002](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | Danh sách xem tiếp | CORE | 2 | 3 | 5 | H | Danh sách tiếp tục xem, rights filtering; V2: Shared progress/history/playlist primitives; chỉ API query/update/delete/order và UI delta. |
| [G2-03-F003](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | Xem lịch sử video đã xem | CORE | 2 | 3 | 5 | H | Trang lịch sử, phân trang và quyền; V2: Shared progress/history/playlist primitives; chỉ API query/update/delete/order và UI delta. |
| [G2-03-F004](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | Xóa lịch sử hoặc từng mục xem | CORE | 1 | 4 | 5 | M | Xóa lịch sử theo data policy chung; V2: Shared progress/history/playlist primitives; chỉ API query/update/delete/order và UI delta. |
| [G2-03-F005](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | Tạo và quản lý danh sách phát cá nhân | CORE | 4 | 6 | 10 | M | Playlist CRUD, owner và content relationship; V2: Shared progress/history/playlist primitives; chỉ API query/update/delete/order và UI delta. |
| [G2-03-F006](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) | Sắp xếp và phát tuần tự danh sách cá nhân | CORE | 4 | 6 | 10 | M | Sắp xếp playlist, next video và kiểm tra quyền; V2: Shared progress/history/playlist primitives; chỉ API query/update/delete/order và UI delta. |
| [G2-04-F001](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | Chỉ mục tìm kiếm nội dung có cấu trúc | CORE | 0 | 12 | 12 | L | Search index đa loại public, delta so với GĐ1; V2: Một engine/index contract và worker chung; configure mapping/query/facets/sync, không viết search engine. |
| [G2-04-F002](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | Trang kết quả tìm kiếm thống nhất | CORE | 4 | 6 | 10 | M | Trang kết quả search và API phân trang; V2: Một engine/index contract và worker chung; configure mapping/query/facets/sync, không viết search engine. |
| [G2-04-F003](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | Tự động gợi ý từ khóa khi nhập | OPTION | 2 | 4 | 6 | M | OPTION: autocomplete prefix và UX; V2: Một engine/index contract và worker chung; configure mapping/query/facets/sync, không viết search engine. |
| [G2-04-F004](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | Lọc kết quả theo loại và chủ đề | CORE | 3 | 6 | 9 | M | Filter/facet theo loại nội dung và taxonomy; V2: Một engine/index contract và worker chung; configure mapping/query/facets/sync, không viết search engine. |
| [G2-04-F005](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | Đồng bộ chỉ mục và tái tạo khi cần | CORE | 0 | 10 | 10 | M | Worker reindex/sync publish/unpublish; không UI mới; V2: Một engine/index contract và worker chung; configure mapping/query/facets/sync, không viết search engine. |
| [G2-04-F006](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) | Điều chỉnh mức liên quan/khả năng chịu lỗi gõ | OPTION | 1 | 6 | 7 | L | OPTION: relevance/fuzzy search, phụ thuộc engine; V2: Một engine/index contract và worker chung; configure mapping/query/facets/sync, không viết search engine. |
| [G2-05-F001](../docs/02-gd2-media-platform/G2-05-goi-y-ca-nhan-hoa.md) | Gợi ý nội dung liên quan theo metadata | CORE | 1 | 4 | 5 | M | Ranking metadata; tái dùng widget related GĐ1; V2: Query/rule ranker nhỏ trên metadata và user signals có sẵn; dùng shared feed/fallback. |
| [G2-05-F002](../docs/02-gd2-media-platform/G2-05-goi-y-ca-nhan-hoa.md) | Gợi ý theo chương trình đang theo dõi | CORE | 3 | 4 | 7 | M | Feed nội dung từ chương trình đã follow; V2: Query/rule ranker nhỏ trên metadata và user signals có sẵn; dùng shared feed/fallback. |
| [G2-05-F003](../docs/02-gd2-media-platform/G2-05-goi-y-ca-nhan-hoa.md) | Gợi ý theo chủ đề và lịch sử xem | CORE | 4 | 12 | 16 | L | Rule-based recommendation và cold-start F004 gộp; V2: Query/rule ranker nhỏ trên metadata và user signals có sẵn; dùng shared feed/fallback. |
| [G2-05-F005](../docs/02-gd2-media-platform/G2-05-goi-y-ca-nhan-hoa.md) | Quy tắc ưu tiên nội dung biên tập | OPTION | 2 | 4 | 6 | L | OPTION: editorial weighting ngoài CMS GĐ1; V2: Query/rule ranker nhỏ trên metadata và user signals có sẵn; dùng shared feed/fallback. |
| [G2-06-F001](../docs/02-gd2-media-platform/G2-06-nang-cap-vod-livestream.md) | Tiếp tục phát từ vị trí đang xem | CORE | 2 | 0 | 2 | H | Resume modal/seek dùng progress API G2-03; V2: Bật/ghép controls của SDK player; progress/track/rendition/order APIs đã đủ, không code lại stores. |
| [G2-06-F002](../docs/02-gd2-media-platform/G2-06-nang-cap-vod-livestream.md) | Chọn chất lượng video theo nguồn cung cấp | CONDITIONAL | 4 | 2 | 6 | L | CONDITIONAL: quality switch dựa rendition provider; V2: Bật/ghép controls của SDK player; progress/track/rendition/order APIs đã đủ, không code lại stores. |
| [G2-06-F003](../docs/02-gd2-media-platform/G2-06-nang-cap-vod-livestream.md) | Phụ đề và bản âm thanh thay thế | CONDITIONAL | 4 | 4 | 8 | L | CONDITIONAL: subtitle/audio track metadata và UX; V2: Bật/ghép controls của SDK player; progress/track/rendition/order APIs đã đủ, không code lại stores. |
| [G2-06-F004](../docs/02-gd2-media-platform/G2-06-nang-cap-vod-livestream.md) | Điều hướng tập kế tiếp và tự phát | CORE | 3 | 2 | 5 | M | Auto-next tập, điều hướng tập cơ bản đã có GĐ1; V2: Bật/ghép controls của SDK player; progress/track/rendition/order APIs đã đủ, không code lại stores. |
| [G2-07-F001](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Quản lý nội dung bản tin cập nhật | CORE | 3 | 4 | 7 | M | CMS nguồn thông báo, không làm editor thứ hai; V2: Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |
| [G2-07-F002](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Sinh thông báo theo chương trình đang theo dõi | CORE | 2 | 10 | 12 | M | Trigger theo follow, recipient filter và chống trùng; V2: Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |
| [G2-07-F003](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Hộp thư thông báo trong tài khoản | CORE | 5 | 8 | 13 | M | Inbox thông báo và trạng thái chưa đọc; V2: Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |
| [G2-07-F004](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Thông báo đẩy trên trình duyệt | CONDITIONAL | 3 | 12 | 15 | L | CONDITIONAL: Web Push và subscription/queue; V2: Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |
| [G2-07-F005](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Bản tin cập nhật qua email | OPTION | 3 | 10 | 13 | L | OPTION: email opt-in/opt-out và provider; V2: Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |
| [G2-07-F006](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Thiết lập sở thích và tần suất thông báo | CORE | 2 | 4 | 6 | M | Sở thích thông báo tái dùng consent; V2: Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |
| [G2-07-F007](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) | Theo dõi trạng thái gửi và lỗi | CONDITIONAL | 3 | 8 | 11 | L | CONDITIONAL: delivery status/retry khi có push/email; V2: Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |
| [G2-08-F001](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | Bật/tắt tương tác theo loại nội dung | CONDITIONAL | 2 | 3 | 5 | L | Gate pháp lý và policy bật/tắt bình luận; V2: Shared CRUD/queue/state/rate-limit primitives; thêm comment domain và kiểm tra moderation/owner. |
| [G2-08-F002](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | Gửi và hiển thị bình luận | CONDITIONAL | 6 | 12 | 18 | L | Comment input/list, sanitize và moderation status; V2: Shared CRUD/queue/state/rate-limit primitives; thêm comment domain và kiểm tra moderation/owner. |
| [G2-08-F003](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | Phản hồi bình luận có kiểm soát | CONDITIONAL | 3 | 4 | 7 | L | Reply một cấp bên trong gói conditional; V2: Shared CRUD/queue/state/rate-limit primitives; thêm comment domain và kiểm tra moderation/owner. |
| [G2-08-F004](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | Kiểm duyệt, ẩn và xóa bình luận | CONDITIONAL | 6 | 12 | 18 | L | Màn moderation, log ẩn/xóa và phân quyền; V2: Shared CRUD/queue/state/rate-limit primitives; thêm comment domain và kiểm tra moderation/owner. |
| [G2-08-F005](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | Báo cáo bình luận vi phạm | CONDITIONAL | 3 | 6 | 9 | L | Report comment vi phạm và trạng thái xử lý; V2: Shared CRUD/queue/state/rate-limit primitives; thêm comment domain và kiểm tra moderation/owner. |
| [G2-08-F006](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) | Chống spam và kiểm soát lạm dụng | CONDITIONAL | 2 | 12 | 14 | L | Abuse prevention, rate limit, restrictions; V2: Shared CRUD/queue/state/rate-limit primitives; thêm comment domain và kiểm tra moderation/owner. |
| [G2-09-F001](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Danh mục gói thuê bao và quyền lợi | CONDITIONAL | 4 | 8 | 12 | L | Gói/quyền lợi, plan CRUD và versioning; V2: Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| [G2-09-F002](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Giá, chu kỳ và điều kiện đăng ký | CONDITIONAL | 3 | 6 | 9 | L | Giá/chu kỳ và ngày hiệu lực; V2: Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| [G2-09-F003](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Đăng ký gói và khởi tạo thanh toán | CONDITIONAL | 6 | 16 | 22 | L | Checkout một payment gateway, order/intent; V2: Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| [G2-09-F004](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Nhận trạng thái giao dịch và đối soát đơn | CONDITIONAL | 4 | 28 | 32 | L | Idempotent webhook/reconciliation/refund policy; V2: Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| [G2-09-F005](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Vòng đời thuê bao và ngày hết hạn | CONDITIONAL | 4 | 16 | 20 | L | Vòng đời subscription, cấp/thu hồi quyền qua event; V2: Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| [G2-09-F006](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Gia hạn, hủy và xử lý thanh toán thất bại | CONDITIONAL | 4 | 24 | 28 | L | Gia hạn, hủy và payment failure theo chính sách; V2: Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| [G2-09-F007](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Lịch sử thanh toán và chứng từ | CONDITIONAL | 3 | 4 | 7 | L | Lịch sử giao dịch và chứng từ provider; V2: Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| [G2-09-F008](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) | Khuyến mại, dùng thử hoặc tặng quyền | OPTION | 4 | 10 | 14 | L | OPTION: voucher/trial chỉ khi thương mại đã bật; V2: Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| [G2-10-F001](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | Phân loại nội dung miễn phí và trả phí | CONDITIONAL | 3 | 8 | 11 | L | Free/premium policy theo nội dung và quyền DAM; V2: Một entitlement service + media SDK đã có; thêm decision/token/DRM/session policies, test server guard. |
| [G2-10-F002](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | Kiểm tra quyền xem theo tài khoản | CONDITIONAL | 3 | 24 | 27 | L | Entitlement tập trung, expiry DAM và revoke; gộp F007; V2: Một entitlement service + media SDK đã có; thêm decision/token/DRM/session policies, test server guard. |
| [G2-10-F003](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | Giao diện paywall và nâng cấp quyền xem | CONDITIONAL | 4 | 3 | 7 | M | Paywall/offer UI dựa gói thật; V2: Một entitlement service + media SDK đã có; thêm decision/token/DRM/session policies, test server guard. |
| [G2-10-F004](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | Bảo vệ URL và phiên phát nội dung có quyền | CONDITIONAL | 2 | 20 | 22 | L | Protected playback token/URL và provider adapter; V2: Một entitlement service + media SDK đã có; thêm decision/token/DRM/session policies, test server guard. |
| [G2-10-F005](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | Tích hợp hệ thống DRM được cấp phép | CONDITIONAL | 6 | 24 | 30 | L | DRM license provider/player SDK cho môi trường hỗ trợ; V2: Một entitlement service + media SDK đã có; thêm decision/token/DRM/session policies, test server guard. |
| [G2-10-F006](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) | Quản lý số thiết bị/phiên xem đồng thời | OPTION | 4 | 20 | 24 | L | OPTION: concurrent session/device limit; V2: Một entitlement service + media SDK đã có; thêm decision/token/DRM/session policies, test server guard. |
| [G2-11-F001](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Định nghĩa sự kiện hành vi và vòng đời phiên xem | CORE | 4 | 16 | 20 | L | Event schema/ingestion, consent/session/dedupe; V2: Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| [G2-11-F002](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Ghi nhận và tổng hợp hành vi xem video | CORE | 2 | 12 | 14 | M | Video aggregation starts/complete/watch time; V2: Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| [G2-11-F003](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Dashboard người xem và hoạt động nội dung | CORE | 6 | 10 | 16 | M | Dashboard metrics theo content/period; V2: Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| [G2-11-F004](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Thống kê hành trình tương tác nội dung | OPTION | 4 | 10 | 14 | L | OPTION: multi-step funnel/journey; V2: Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| [G2-11-F005](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Đo chất lượng phát từ player và nguồn streaming | CONDITIONAL | 4 | 12 | 16 | L | CONDITIONAL: QoE SDK/provider metrics; V2: Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| [G2-11-F006](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Kiểm soát lưu giữ và xóa dữ liệu hành vi | CORE | 1 | 12 | 13 | L | Retention/delete/anonymize theo consent G2-01; V2: Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| [G2-11-F007](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Phân tích nhóm người xem và tỷ lệ quay lại | OPTION | 3 | 8 | 11 | L | OPTION: cohorts/retention privacy; V2: Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| [G2-11-F008](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) | Xuất báo cáo và kiểm tra chất lượng dữ liệu | CORE | 3 | 6 | 9 | M | Metrics export/data quality và tracking recommendation F006 gộp; V2: Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |

## 4. Quy đổi theo tỷ trọng của template

| Hạng mục | CORE (33) | CONDITIONAL (24) | OPTION (9) | Tất cả 66 |
|---|---:|---:|---:|---:|
| FE Coding (giờ) | 85 | 88 | 25 | 198 |
| BE Coding (giờ) | 223 | 280 | 74 | 577 |
| **Coding (giờ)** | **308** | **368** | **99** | **775** |
| BA (giờ) | 56.00 | 66.91 | 18.00 | 140.91 |
| Design (giờ) | 84.00 | 100.36 | 27.00 | 211.36 |
| QA tiêu chuẩn (giờ) | 112.00 | 133.82 | 36.00 | 281.82 |
| **Tổng effort (giờ)** | **560.00** | **669.09** | **180.00** | **1409.09** |
| **Man-day (8 giờ)** | **70.00** | **83.64** | **22.50** | **176.14** |

### Ba kịch bản dùng để lập kế hoạch

| Kịch bản | Thành phần | Coding (giờ) | Tổng effort (giờ) | MD |
|---|---|---:|---:|---:|
| A – CORE nền tảng | 33 CORE | 308 | 560.00 | 70.00 |
| B – CORE + toàn bộ CONDITIONAL | 33 CORE + 24 có điều kiện | 676 | 1229.09 | 153.64 |
| C – Làm đủ 66 feature | CORE + CONDITIONAL + OPTION | 775 | 1409.09 | 176.14 |

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
- Dự kiến nguồn GĐ2 **3–6 tháng** chỉ là mục tiêu thời gian lịch. Theo cách quy đổi đơn giản **20 ngày làm việc/tháng**, với kịch bản B cần tương đương khoảng **2.56 FTE trong 3 tháng** hoặc **1.28 FTE trong 6 tháng** nếu lý tưởng song song và 100% thời gian hữu ích. Thực tế cần xét phụ thuộc, team split FE/BE, triển khai vendor, QA/UAT, DevOps và rủi ro.
- **Không coi tổng effort có công thức là dự toán đầy đủ mọi chi phí hay cam kết hoàn tất trong thời gian lịch nêu trên.**

**Trạng thái: DRAFT ESTIMATE V2. Không nhập cứng số giờ vào hồ sơ nghiệp vụ chuẩn hay báo giá chính thức trước khi xác nhận phạm vi phát hành.**
