# GĐ4 – Ước tính FE/BE cho 78 tính năng Digital Ecosystem (DRAFT V0)

> **12/10/2026 – dự toán sơ bộ nội bộ, dựa trên bản phân tích GĐ4 lần đầu chưa qua QA từng mã, chưa được VTV8 chấp thuận.** Nguồn danh mục: [G4-DANH-MUC-TINH-NANG.md](../docs/04-gd4-digital-ecosystem/G4-DANH-MUC-TINH-NANG.md), [release gates](../docs/04-gd4-digital-ecosystem/G4-RELEASE-GATES.md), [nguyên tắc không tính trùng](../docs/04-gd4-digital-ecosystem/G4-THANH-PHAN-DUNG-CHUNG.md). Phương pháp: [PHUONG-PHAP-UOC-TINH.md](PHUONG-PHAP-UOC-TINH.md).
>
> **Mục đích:** quy đổi khả năng phát triển từng gói để lựa chọn ưu tiên. **Không phải báo giá, định mức đã khảo sát, timeline cam kết, hoặc dữ liệu thực nghiệm productivity.** Các con số FE/BE là **giả định chuyên môn**, không có trong đề xuất hợp tác gốc. GĐ4 không có hạn hoàn thành cụ thể trong nguồn.

## 1. Cơ sở bóc tách giờ

- Một **Middle Developer** cho FE và một Middle Developer cho BE, ước tính *giờ công coding* theo feature, chưa giảm nhờ AI coding. **FE ở G4-01/02 bao gồm code client Mobile/Smart TV**; FE ở các module AI/Data/Portal là giao diện quản trị và nội dung tương tác. **BE** gồm APIs/adapters/workers/logic ứng dụng và kiểm thử đơn vị mức phát triển thông thường.
- Coding = FE + BE; BA = Coding × 10/55; Design = Coding × 15/55; QA = Coding × 20/55; tổng effort = Coding/0,55; MD = tổng effort/8 giờ. BA/Design/QA chỉ là công thức khung dự toán, không thay thế các công việc đặc biệt ở H01/H02.
- **GĐ1–GĐ3:** giả định các service được tham chiếu **đã thực sự triển khai** và có API tái sử dụng. Không phát triển lại CMS, DAM, media storage/player platform, audience identity/consent, search cơ bản, recommendation, subscriptions/payment/DRM, media analytics, partner/offering/lead/booking/order/finance. Nếu tính năng nguồn là CONDITIONAL chưa được làm, phải bổ sung theo bảng dự toán giai đoạn đó.
- **Mobile** giả định **một codebase cross-platform** trên iOS/Android, bản phát hành kỹ thuật cơ sở, media SDK/vendor hoạt động. Native tách 2 codebase sẽ cần dự toán lại. Phiên bản OS, trải nghiệm offline, in-app payment và app review chưa chốt.
- **Smart TV** giả định **một TV OS được chọn làm pilot**, player, remote focus, pairing và quyền media. Không nhân giờ cho mọi TV OS hoặc thay thế bằng một responsive website. Voice OS là OPTION.
- **AI Media/Video** giả định một nhà cung cấp/model hoạt động cho từng nhóm tác vụ, human review từ CMS/DAM, có transcript/timecodes và metadata nguồn. Không tự huấn luyện mô hình nhận diện/embedding/LLM từ đầu. Nhận diện nhân vật/các đặc điểm sinh trắc học **không triển khai cho đến khi được thẩm định pháp lý riêng**.
- **Semantic Search** dựa transcript được duyệt từ G4-03, vector/hybrid index + access control kế thừa G1 DAM/G2 entitlement. Tính toán chỉ bổ sung retrieval service/index, không xây lại G2 keyword search.
- **Membership/Partner** dựa subscription/entitlement thực tế G2 và backoffice business G3. Không nhân đôi payment/subscription/order/commission. Tenant partner isolation và thanh toán theo channel vẫn phải kiểm chứng.
- **Data Platform** tối thiểu lấy source contracts/ingestion/DQ; warehouse phân tán, kiến trúc lakehouse, ML forecasting, tracking quảng cáo cá nhân **không được tự mặc định**. Feature `G4-08-F004` có phần code khi được bật, còn chi phí hạ tầng warehouse ở H01.
- **Content Licensing** mở rộng quyền DAM G1 và partner B2B, nhưng **quyền phát nội bộ khác quyền tái cấp phép thương mại**. Chưa tính phí pháp lý, xác minh giấy phép, sản xuất/scan tư liệu hoặc phí ký kết hợp đồng.
- Ước tính `L` có độ tin cậy thấp do SDK/provider/privacy/volume chưa chốt. Trước báo giá phải rà soát QA và quy chuẩn 78 mã; số liệu có thể tăng hoặc giảm đáng kể.

## 2. Tổng hợp theo module và loại phạm vi

| Module | CORE # | FE CORE | BE CORE | COND # | FE COND | BE COND | OPTION # | Coding OPTION | Coding cả module |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| [G4-01 – Ứng dụng Mobile iOS/Android](../docs/04-gd4-digital-ecosystem/G4-01-mobile-app.md) | 5 | 504 | 192 | 3 | 216 | 176 | 1 | 168 | 1256 |
| [G4-02 – Ứng dụng Smart TV](../docs/04-gd4-digital-ecosystem/G4-02-smart-tv.md) | 0 | 0 | 0 | 7 | 656 | 408 | 1 | 96 | 1160 |
| [G4-03 – AI Media Processing](../docs/04-gd4-digital-ecosystem/G4-03-ai-media-processing.md) | 5 | 368 | 680 | 3 | 184 | 472 | 1 | 184 | 1888 |
| [G4-04 – Semantic Search](../docs/04-gd4-digital-ecosystem/G4-04-semantic-search.md) | 7 | 232 | 888 | 0 | 0 | 0 | 1 | 152 | 1272 |
| [G4-05 – Recommendation / Video Automation](../docs/04-gd4-digital-ecosystem/G4-05-ai-recommendation-video-automation.md) | 4 | 112 | 456 | 4 | 376 | 608 | 1 | 240 | 1792 |
| [G4-06 – Membership nâng cao](../docs/04-gd4-digital-ecosystem/G4-06-membership.md) | 3 | 192 | 272 | 3 | 184 | 344 | 2 | 304 | 1296 |
| [G4-07 – Partner Platform](../docs/04-gd4-digital-ecosystem/G4-07-partner-platform.md) | 3 | 280 | 400 | 5 | 408 | 600 | 1 | 216 | 1904 |
| [G4-08 – Data Platform](../docs/04-gd4-digital-ecosystem/G4-08-data-platform.md) | 3 | 160 | 552 | 5 | 304 | 960 | 1 | 336 | 2312 |
| [G4-09 – Archive & Content Licensing](../docs/04-gd4-digital-ecosystem/G4-09-archive-content-licensing.md) | 4 | 344 | 528 | 4 | 320 | 672 | 1 | 160 | 2024 |
| **Tổng** | **34** | **2192** | **3968** | **34** | **2648** | **4240** | **10** | **1856** | **14904** |

| Module | Coding CORE | Coding CONDITIONAL | Coding OPTION | Coding toàn module | MD CORE | MD toàn module |
|---|---:|---:|---:|---:|---:|---:|
| [G4-01 – Ứng dụng Mobile iOS/Android](../docs/04-gd4-digital-ecosystem/G4-01-mobile-app.md) | 696 | 392 | 168 | 1256 | 158.18 | 285.45 |
| [G4-02 – Ứng dụng Smart TV](../docs/04-gd4-digital-ecosystem/G4-02-smart-tv.md) | 0 | 1064 | 96 | 1160 | 0.00 | 263.64 |
| [G4-03 – AI Media Processing](../docs/04-gd4-digital-ecosystem/G4-03-ai-media-processing.md) | 1048 | 656 | 184 | 1888 | 238.18 | 429.09 |
| [G4-04 – Semantic Search](../docs/04-gd4-digital-ecosystem/G4-04-semantic-search.md) | 1120 | 0 | 152 | 1272 | 254.55 | 289.09 |
| [G4-05 – Recommendation / Video Automation](../docs/04-gd4-digital-ecosystem/G4-05-ai-recommendation-video-automation.md) | 568 | 984 | 240 | 1792 | 129.09 | 407.27 |
| [G4-06 – Membership nâng cao](../docs/04-gd4-digital-ecosystem/G4-06-membership.md) | 464 | 528 | 304 | 1296 | 105.45 | 294.55 |
| [G4-07 – Partner Platform](../docs/04-gd4-digital-ecosystem/G4-07-partner-platform.md) | 680 | 1008 | 216 | 1904 | 154.55 | 432.73 |
| [G4-08 – Data Platform](../docs/04-gd4-digital-ecosystem/G4-08-data-platform.md) | 712 | 1264 | 336 | 2312 | 161.82 | 525.45 |
| [G4-09 – Archive & Content Licensing](../docs/04-gd4-digital-ecosystem/G4-09-archive-content-licensing.md) | 872 | 992 | 160 | 2024 | 198.18 | 460.00 |
| **Tổng** | **6160** | **6888** | **1856** | **14904** | **1400.00** | **3387.27** |

## 3. Ước tính từng tính năng

| Mã | Tính năng | Scope | FE giờ | BE giờ | Coding giờ | Confidence | Căn cứ bóc giờ |
|---|---|---|---:|---:|---:|---|---|
| [G4-01-F001](../docs/04-gd4-digital-ecosystem/G4-01-mobile-app.md) | Nền tảng ứng dụng và điều hướng | CORE | 120 | 32 | 152 | M | Mobile app shell hai OS trên một codebase, navigation, lifecycle |
| [G4-01-F002](../docs/04-gd4-digital-ecosystem/G4-01-mobile-app.md) | Tài khoản và phiên người xem | CORE | 56 | 32 | 88 | M | Audience auth G2, token refresh, session error |
| [G4-01-F003](../docs/04-gd4-digital-ecosystem/G4-01-mobile-app.md) | Trang chủ, chuyên mục, tìm kiếm | CORE | 120 | 32 | 152 | M | Feed, browse, search/detail từ API web có sẵn |
| [G4-01-F004](../docs/04-gd4-digital-ecosystem/G4-01-mobile-app.md) | Phát VOD và livestream trên mobile | CORE | 128 | 64 | 192 | L | Mobile live/VOD player SDK, protected token và playback states |
| [G4-01-F005](../docs/04-gd4-digital-ecosystem/G4-01-mobile-app.md) | Thư viện cá nhân và tiếp tục xem | CORE | 80 | 32 | 112 | M | Follow/favorite/history/playlist qua G2 APIs |
| [G4-01-F006](../docs/04-gd4-digital-ecosystem/G4-01-mobile-app.md) | Thông báo đẩy trên điện thoại | CONDITIONAL | 64 | 80 | 144 | L | Push token, deep links, OS permissions, adapter G2-07 |
| [G4-01-F007](../docs/04-gd4-digital-ecosystem/G4-01-mobile-app.md) | Quyền xem premium và membership trên app | CONDITIONAL | 80 | 64 | 144 | L | Paywall/entitlement display, OS payment policy chưa chốt |
| [G4-01-F008](../docs/04-gd4-digital-ecosystem/G4-01-mobile-app.md) | Trải nghiệm nội dung tới dịch vụ thương mại | CONDITIONAL | 72 | 32 | 104 | M | Mobile offering/lead/referral UI dùng API G3 đã bật |
| [G4-01-F009](../docs/04-gd4-digital-ecosystem/G4-01-mobile-app.md) | Tải nội dung xem offline | OPTION | 112 | 56 | 168 | L | Offline download and license DRM nếu provider cho phép |
| [G4-02-F001](../docs/04-gd4-digital-ecosystem/G4-02-smart-tv.md) | Bộ ứng dụng TV và ma trận thiết bị | CONDITIONAL | 128 | 40 | 168 | L | TV app packaging/OS SDK cho một platform pilot |
| [G4-02-F002](../docs/04-gd4-digital-ecosystem/G4-02-smart-tv.md) | Điều hướng remote và focus/accessibility | CONDITIONAL | 112 | 16 | 128 | M | Remote focus, D-pad/back và accessibility |
| [G4-02-F003](../docs/04-gd4-digital-ecosystem/G4-02-smart-tv.md) | Trang khám phá chương trình và tìm kiếm trên TV | CONDITIONAL | 96 | 32 | 128 | M | Lean-back browse/search và TV keyboard |
| [G4-02-F004](../docs/04-gd4-digital-ecosystem/G4-02-smart-tv.md) | Phát VOD/live trên thiết bị TV | CONDITIONAL | 160 | 88 | 248 | L | TV VOD/live player SDK, DRM/provider compatibility |
| [G4-02-F005](../docs/04-gd4-digital-ecosystem/G4-02-smart-tv.md) | Đăng nhập bằng mã liên kết thiết bị | CONDITIONAL | 64 | 104 | 168 | L | TV pairing code/token exchange, device session |
| [G4-02-F006](../docs/04-gd4-digital-ecosystem/G4-02-smart-tv.md) | Kiểm tra gói và quyền xem trên TV | CONDITIONAL | 72 | 64 | 136 | L | TV entitlement and protected playback UX |
| [G4-02-F007](../docs/04-gd4-digital-ecosystem/G4-02-smart-tv.md) | Theo dõi phiên phát và chất lượng TV | CONDITIONAL | 24 | 64 | 88 | M | TV playback telemetry mapped G2-11 |
| [G4-02-F008](../docs/04-gd4-digital-ecosystem/G4-02-smart-tv.md) | Tìm kiếm giọng nói bằng tính năng TV OS | OPTION | 64 | 32 | 96 | L | Optional voice input qua TV OS, không tự STT |
| [G4-03-F001](../docs/04-gd4-digital-ecosystem/G4-03-ai-media-processing.md) | Pipeline yêu cầu và theo dõi job AI media | CORE | 64 | 152 | 216 | L | Media AI job queue/orchestration một provider, metering guards |
| [G4-03-F002](../docs/04-gd4-digital-ecosystem/G4-03-ai-media-processing.md) | Speech-to-text và transcript có mốc thời gian | CORE | 88 | 176 | 264 | L | Timed STT transcript, editor, provider integration |
| [G4-03-F003](../docs/04-gd4-digital-ecosystem/G4-03-ai-media-processing.md) | Tạo và đồng bộ phụ đề từ transcript | CORE | 80 | 120 | 200 | M | Subtitles VTT/SRT tracks and timestamps |
| [G4-03-F004](../docs/04-gd4-digital-ecosystem/G4-03-ai-media-processing.md) | Biên tập, thẩm định và xuất bản kết quả AI | CORE | 88 | 128 | 216 | M | Human-in-loop review, provenance, publish DAM/CMS |
| [G4-03-F005](../docs/04-gd4-digital-ecosystem/G4-03-ai-media-processing.md) | Dịch transcript và phụ đề đa ngôn ngữ | CONDITIONAL | 64 | 144 | 208 | L | Một translation service/language workflow và duyệt |
| [G4-03-F006](../docs/04-gd4-digital-ecosystem/G4-03-ai-media-processing.md) | Gợi ý nhân vật xuất hiện trong video | CONDITIONAL | 64 | 192 | 256 | L | Biometric/person identification only with legal clearance |
| [G4-03-F007](../docs/04-gd4-digital-ecosystem/G4-03-ai-media-processing.md) | Nhận diện/đề xuất địa điểm và địa danh | CONDITIONAL | 56 | 136 | 192 | L | NER/vision địa danh provider, CMS taxonomy match |
| [G4-03-F008](../docs/04-gd4-digital-ecosystem/G4-03-ai-media-processing.md) | Gắn nhãn chủ đề/di sản theo taxonomy | CORE | 48 | 104 | 152 | M | Topic suggestions, taxonomy mapping and review |
| [G4-03-F009](../docs/04-gd4-digital-ecosystem/G4-03-ai-media-processing.md) | Xử lý lại phiên bản và giám sát chất lượng AI | OPTION | 56 | 128 | 184 | L | Reprocessing/version compare, quality and cost metering |
| [G4-04-F001](../docs/04-gd4-digital-ecosystem/G4-04-semantic-search.md) | Chuẩn hóa đoạn transcript để lập chỉ mục | CORE | 16 | 120 | 136 | M | Chunk approved transcript, timed corpus schema |
| [G4-04-F002](../docs/04-gd4-digital-ecosystem/G4-04-semantic-search.md) | Tạo embeddings và chỉ mục vector | CORE | 8 | 176 | 184 | L | Embedding worker và một vector index adapter |
| [G4-04-F003](../docs/04-gd4-digital-ecosystem/G4-04-semantic-search.md) | Tìm kiếm nội dung bằng câu tự nhiên | CORE | 56 | 152 | 208 | L | Natural-language semantic retrieval/ranker API |
| [G4-04-F004](../docs/04-gd4-digital-ecosystem/G4-04-semantic-search.md) | Hiển thị đoạn trích có timecode và mở video tương ứng | CORE | 56 | 80 | 136 | M | Time-coded snippets và video seek with rights |
| [G4-04-F005](../docs/04-gd4-digital-ecosystem/G4-04-semantic-search.md) | Kết hợp tìm kiếm từ khóa với ngữ nghĩa | CORE | 56 | 120 | 176 | L | Hybrid keyword/vector search, dedupe và fallback |
| [G4-04-F006](../docs/04-gd4-digital-ecosystem/G4-04-semantic-search.md) | Áp dụng phân quyền khi truy vấn và hiển thị transcript | CORE | 16 | 96 | 112 | M | Snippet/index ACL enforcement from DAM/entitlement |
| [G4-04-F007](../docs/04-gd4-digital-ecosystem/G4-04-semantic-search.md) | Đồng bộ chỉ mục và xử lý thay đổi quyền/media | CORE | 24 | 144 | 168 | L | Incremental updates, rights tombstone, reindex retries |
| [G4-04-F008](../docs/04-gd4-digital-ecosystem/G4-04-semantic-search.md) | Đánh giá độ liên quan và kiểm soát cải thiện tìm kiếm | OPTION | 48 | 104 | 152 | L | Optional relevance evaluation/test suite |
| [G4-05-F001](../docs/04-gd4-digital-ecosystem/G4-05-ai-recommendation-video-automation.md) | Hồ sơ tín hiệu cho gợi ý nâng cao | CORE | 16 | 144 | 160 | L | Allowed user event feature pipeline, consent enforcement |
| [G4-05-F002](../docs/04-gd4-digital-ecosystem/G4-05-ai-recommendation-video-automation.md) | Xếp hạng gợi ý nâng cao theo nội dung/người xem | CORE | 48 | 176 | 224 | L | User/content ranking service; baseline managed/rules |
| [G4-05-F003](../docs/04-gd4-digital-ecosystem/G4-05-ai-recommendation-video-automation.md) | Fallback và kiểm soát đề xuất cho người mới | CORE | 16 | 48 | 64 | M | Extend G2 cold start/fallback, no duplicate component |
| [G4-05-F004](../docs/04-gd4-digital-ecosystem/G4-05-ai-recommendation-video-automation.md) | Đo chất lượng recommendation trong analytics chung | CORE | 32 | 88 | 120 | M | G2 analytics recommendation source/coverage events |
| [G4-05-F005](../docs/04-gd4-digital-ecosystem/G4-05-ai-recommendation-video-automation.md) | Đề xuất phân đoạn highlight từ transcript/video | CONDITIONAL | 96 | 168 | 264 | L | Highlight candidates/timecode editor, provider support |
| [G4-05-F006](../docs/04-gd4-digital-ecosystem/G4-05-ai-recommendation-video-automation.md) | Tạo video ngắn từ đoạn đã chọn | CONDITIONAL | 104 | 184 | 288 | L | Media trim/crop job/preview và output tracking |
| [G4-05-F007](../docs/04-gd4-digital-ecosystem/G4-05-ai-recommendation-video-automation.md) | Tạo phụ đề/bố cục cho clip ngắn | CONDITIONAL | 112 | 144 | 256 | L | Captions/templates/overlay rendering for shorts |
| [G4-05-F008](../docs/04-gd4-digital-ecosystem/G4-05-ai-recommendation-video-automation.md) | Kiểm duyệt, lưu nguồn và phát hành video tái sử dụng | CONDITIONAL | 64 | 112 | 176 | M | DAM derivative rights/provenance approval reused CMS |
| [G4-05-F009](../docs/04-gd4-digital-ecosystem/G4-05-ai-recommendation-video-automation.md) | Thử nghiệm mô hình recommendation nâng cao/A-B | OPTION | 64 | 176 | 240 | L | Optional AB evaluation/model version and rollback |
| [G4-06-F001](../docs/04-gd4-digital-ecosystem/G4-06-membership.md) | Danh mục hạng thành viên và tập quyền lợi | CORE | 80 | 112 | 192 | L | Tier/benefit configuration over G2 subscription |
| [G4-06-F002](../docs/04-gd4-digital-ecosystem/G4-06-membership.md) | Hồ sơ/thẻ trạng thái thành viên | CORE | 64 | 48 | 112 | M | Member status card projection from entitlements |
| [G4-06-F003](../docs/04-gd4-digital-ecosystem/G4-06-membership.md) | Kiểm tra quyền lợi thành viên qua entitlement chung | CORE | 48 | 112 | 160 | L | Membership benefit decision matrix across surfaces |
| [G4-06-F004](../docs/04-gd4-digital-ecosystem/G4-06-membership.md) | Đổi hạng/gia hạn/hủy Membership | CONDITIONAL | 88 | 128 | 216 | L | Change/cancel/proration policy from subscription provider |
| [G4-06-F005](../docs/04-gd4-digital-ecosystem/G4-06-membership.md) | Chế độ xem không quảng cáo cho hội viên | CONDITIONAL | 40 | 104 | 144 | L | Ad-free toggle with actual ad platform dependency |
| [G4-06-F006](../docs/04-gd4-digital-ecosystem/G4-06-membership.md) | Chất lượng video cao cấp theo gói | CONDITIONAL | 56 | 112 | 168 | L | 2K/4K/8K quality rights only if renditions exist |
| [G4-06-F007](../docs/04-gd4-digital-ecosystem/G4-06-membership.md) | Sự kiện/chương trình dành riêng cho thành viên | OPTION | 80 | 80 | 160 | L | Optional members events booking-lite and capacity |
| [G4-06-F008](../docs/04-gd4-digital-ecosystem/G4-06-membership.md) | Báo cáo duy trì, chuyển hạng và giá trị membership | OPTION | 48 | 96 | 144 | M | Membership KPI analytics reuse G2/G4-08 |
| [G4-07-F001](../docs/04-gd4-digital-ecosystem/G4-07-partner-platform.md) | Cổng đăng nhập tổ chức đối tác và phân quyền | CORE | 96 | 160 | 256 | L | Tenant-scoped partner IAM, organization RBAC |
| [G4-07-F002](../docs/04-gd4-digital-ecosystem/G4-07-partner-platform.md) | Đăng ký/thẩm định quyền tham gia portal | CORE | 80 | 112 | 192 | M | Partner invitation/approval lifecycle |
| [G4-07-F003](../docs/04-gd4-digital-ecosystem/G4-07-partner-platform.md) | Đối tác tự quản hồ sơ và offering được cho phép | CORE | 104 | 128 | 232 | M | Self-service profile/offer edit into G3 review |
| [G4-07-F004](../docs/04-gd4-digital-ecosystem/G4-07-partner-platform.md) | Nhận và cập nhật lead trên portal | CONDITIONAL | 72 | 88 | 160 | M | Partner lead queue/ack with privacy/consent guards |
| [G4-07-F005](../docs/04-gd4-digital-ecosystem/G4-07-partner-platform.md) | Báo cáo referral và conversion cho đối tác | CONDITIONAL | 56 | 64 | 120 | M | Partner affiliate scoped metrics |
| [G4-07-F006](../docs/04-gd4-digital-ecosystem/G4-07-partner-platform.md) | Quản lý booking/đơn hàng phía đối tác | CONDITIONAL | 104 | 120 | 224 | L | Partner booking/order actions to G3 states |
| [G4-07-F007](../docs/04-gd4-digital-ecosystem/G4-07-partner-platform.md) | Bảng kê hoa hồng/đối soát cho đối tác | CONDITIONAL | 64 | 96 | 160 | L | Partner scoped commission statements/disputes |
| [G4-07-F008](../docs/04-gd4-digital-ecosystem/G4-07-partner-platform.md) | Partner API và webhooks có xác thực | CONDITIONAL | 112 | 232 | 344 | L | Partner API authentication, quotas, webhook delivery |
| [G4-07-F009](../docs/04-gd4-digital-ecosystem/G4-07-partner-platform.md) | Sandbox, tài liệu tích hợp và thử nghiệm đối tác | OPTION | 72 | 144 | 216 | L | Optional API sandbox/test datasets/developer docs |
| [G4-08-F001](../docs/04-gd4-digital-ecosystem/G4-08-data-platform.md) | Danh mục nguồn và định nghĩa chỉ số kinh doanh | CORE | 64 | 136 | 200 | M | Cross-stage data contracts/KPI catalog and ownership |
| [G4-08-F002](../docs/04-gd4-digital-ecosystem/G4-08-data-platform.md) | Pipeline thu thập dữ liệu tăng thêm xuyên giai đoạn | CORE | 32 | 240 | 272 | L | Ingest G1/G2/G3 via CDC/batch/events, replay quality |
| [G4-08-F003](../docs/04-gd4-digital-ecosystem/G4-08-data-platform.md) | Kiểm soát chất lượng, đối chiếu và lịch sử dữ liệu | CORE | 64 | 176 | 240 | L | Data quality, lineage/reconciliation and alerts |
| [G4-08-F004](../docs/04-gd4-digital-ecosystem/G4-08-data-platform.md) | Lớp lưu trữ phân tích theo quy mô thực tế | CONDITIONAL | 16 | 240 | 256 | L | Optional scaled warehouse/partitions/load - infra separately |
| [G4-08-F005](../docs/04-gd4-digital-ecosystem/G4-08-data-platform.md) | Liên kết dữ liệu nội dung, người xem và giao dịch | CONDITIONAL | 24 | 216 | 240 | L | Privacy-safe identity joins and delete/retention |
| [G4-08-F006](../docs/04-gd4-digital-ecosystem/G4-08-data-platform.md) | Dashboard liên thông Content-to-Commerce | CONDITIONAL | 104 | 176 | 280 | M | Cross-stage content-to-commerce dashboards |
| [G4-08-F007](../docs/04-gd4-digital-ecosystem/G4-08-data-platform.md) | Phân khúc khách hàng phục vụ nội dung/membership | CONDITIONAL | 88 | 176 | 264 | L | Segment building under consent policy |
| [G4-08-F008](../docs/04-gd4-digital-ecosystem/G4-08-data-platform.md) | Xuất dữ liệu và chia sẻ chỉ số cho đối tác được cấp quyền | CONDITIONAL | 72 | 152 | 224 | L | Scoped data exports/approval/expiry |
| [G4-08-F009](../docs/04-gd4-digital-ecosystem/G4-08-data-platform.md) | Tự động hóa phân tích dự báo theo dữ liệu | OPTION | 96 | 240 | 336 | L | Optional forecasting pipeline/evaluation |
| [G4-09-F001](../docs/04-gd4-digital-ecosystem/G4-09-archive-content-licensing.md) | Tra cứu bộ sưu tập di sản/tư liệu phục vụ cấp phép | CORE | 88 | 112 | 200 | M | Archive collection/search over G1 DAM not new storage |
| [G4-09-F002](../docs/04-gd4-digital-ecosystem/G4-09-archive-content-licensing.md) | Ma trận quyền khai thác và hạn sử dụng theo mục đích | CORE | 96 | 176 | 272 | L | Rights evidence and sublicensing eligibility matrix |
| [G4-09-F003](../docs/04-gd4-digital-ecosystem/G4-09-archive-content-licensing.md) | Danh mục gói khai thác tư liệu | CORE | 88 | 144 | 232 | L | Licensable offer catalog, restricted previews |
| [G4-09-F004](../docs/04-gd4-digital-ecosystem/G4-09-archive-content-licensing.md) | Tiếp nhận yêu cầu cấp phép sử dụng nội dung | CORE | 72 | 96 | 168 | M | B2B license request intake, DAM asset refs |
| [G4-09-F005](../docs/04-gd4-digital-ecosystem/G4-09-archive-content-licensing.md) | Báo giá, kiểm tra và duyệt yêu cầu license | CONDITIONAL | 96 | 144 | 240 | L | Rights-checked license quote and approval |
| [G4-09-F006](../docs/04-gd4-digital-ecosystem/G4-09-archive-content-licensing.md) | Theo dõi hợp đồng/giấy phép và hiệu lực sử dụng | CONDITIONAL | 88 | 176 | 264 | L | License grants/expiry/revocation registry |
| [G4-09-F007](../docs/04-gd4-digital-ecosystem/G4-09-archive-content-licensing.md) | Bàn giao file chất lượng gốc có kiểm soát | CONDITIONAL | 72 | 192 | 264 | L | Secure media derivative/original delivery with expiry |
| [G4-09-F008](../docs/04-gd4-digital-ecosystem/G4-09-archive-content-licensing.md) | Ghi nhận phí khai thác và đối soát cấp phép | CONDITIONAL | 64 | 160 | 224 | L | License payment evidence/financial reconciliation refs |
| [G4-09-F009](../docs/04-gd4-digital-ecosystem/G4-09-archive-content-licensing.md) | Gia hạn, thu hồi và báo cáo khai thác bản quyền | OPTION | 56 | 104 | 160 | L | Optional license renewal/reminder and reports |

## 4. Quy đổi BA/Design/QA và man-day

| Scope | # | FE (h) | BE (h) | Coding (h) | BA (h) | Design (h) | QA (h) | Tổng effort (h) | MD |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| CORE | 34 | 2192 | 3968 | 6160 | 1120.00 | 1680.00 | 2240.00 | 11200.00 | 1400.00 |
| CONDITIONAL | 34 | 2648 | 4240 | 6888 | 1252.36 | 1878.55 | 2504.73 | 12523.64 | 1565.45 |
| OPTION | 10 | 696 | 1160 | 1856 | 337.45 | 506.18 | 674.91 | 3374.55 | 421.82 |
| **Tổng** | **78** | **5536** | **9368** | **14904** | **2709.82** | **4064.73** | **5419.64** | **27098.18** | **3387.27** |

## 5. Kịch bản phát triển theo gói – không tự cộng cả GĐ4

| Phương án | Coding (giờ) | Tổng effort (MD) | Phạm vi áp dụng |
|---|---:|---:|---|
| Mobile App – CORE | 696 | 158.18 | G4-01 CORE |
| Mobile App – đầy đủ | 1256 | 285.45 | G4-01 CORE + CONDITIONAL + OPTION |
| Smart TV – 1 OS | 1064 | 241.82 | G4-02 CONDITIONAL (không voice search) |
| AI Media – CORE | 1048 | 238.18 | G4-03 CORE |
| AI Media + Semantic Search – CORE | 2168 | 492.73 | G4-03 CORE + G4-04 CORE |
| AI Media + Search + Recommendation – CORE | 2736 | 621.82 | G4-03/04/05 CORE |
| AI Media + Search + Shorts có điều kiện | 3720 | 845.45 | G4-03 CORE + G4-04 CORE + G4-05 CORE/CONDITIONAL |
| Membership – CORE | 464 | 105.45 | G4-06 CORE |
| Partner Platform – CORE | 680 | 154.55 | G4-07 CORE |
| Data Platform – CORE | 712 | 161.82 | G4-08 CORE |
| Licensing – CORE | 872 | 198.18 | G4-09 CORE |
| Tất cả 34 CORE (so sánh, không phải lộ trình) | 6160 | 1400.00 | Tất cả module CORE, kể cả phụ thuộc |
| Toàn bộ 78 (trần theo danh mục hiện tại) | 14904 | 3387.27 | Cả CORE + CONDITIONAL + OPTION |

- Các dòng scenario **không phải các bước cộng dồn nhau**. Chỉ khi được ghi rõ `+` thì mới là gói kết hợp.
- `Smart TV – 1 OS` chỉ tính 7 CONDITIONAL vì G4-02 không có CORE; voice search là OPTION. Smart TV chưa được nguồn xác nhận phát hành cùng Mobile.
- `AI Media + Semantic Search` cần transcript/timecode được duyệt. Nếu chỉ muốn semantic metadata search từ nội dung text CMS không cần pipeline video STT, phải định nghĩa lại một scope nhỏ hơn (không lấy nguyên G4-04 core tự do).
- `Mobile App – CORE` gồm 5 chức năng, không tự có push, membership/paywall, commerce hoặc offline. `Mobile App – đầy đủ` chỉ tương đương 9 tính năng trong module, chưa bao gồm các gói backend G2/G3/G4-06.
- `Tất cả 34 CORE` chỉ là tổng so sánh. **CORE là tối thiểu cho từng module được kích hoạt, không có một CORE package bắt buộc của cả GĐ4.**

## 6. Khoản cần tính riêng, không gộp vào FE/BE

| Nhóm | Căn cứ chi phí thiếu hoặc chưa xác nhận | Cách tính riêng đề xuất |
|---|---|---|
| [G4-H01 – Hạ tầng/tích hợp](../docs/04-gd4-digital-ecosystem/G4-H01-ha-tang-tich-hop.md) | Store signing/release, thiết bị TV, AI workers, vector/warehouse, monitoring, security, archive downloads | Bóc WBS theo OS, provider, triển khai mới hay kế thừa, số giờ DevOps/UAT |
| [G4-H02 – Pháp lý/UAT](../docs/04-gd4-digital-ecosystem/G4-H02-phap-ly-uat-chuyen-giao.md) | Review video rights, AI dữ liệu nhạy cảm, kiểm thử nhiều OS/TV, giấy phép bản quyền/royalties, chuyển giao | Bóc từng hoạt động riêng theo gói có hiệu lực, không nhân công thức chung hai lần |
| AI STT/Translation/NER/Vision | Tổng phút video/audio, ngôn ngữ, số lần tái chạy, nhà cung cấp, giá dịch vụ | Phút xử lý × đơn giá theo provider × tác vụ; tách dịch, diarization nếu có |
| AI Render Video Clips | Số clip, phút đầu ra, preset, lưu/caching và lượt transcode | Jobs × thời lượng/preset/đơn giá GPU hoặc provider |
| Search/Embedding | Số chunk, model, queries, storage, index rebuild | Chunk processing × provider price + index storage + queries |
| Mobile/TV release & DRM | OS/store accounts, testing devices, SDK license, protected playback, CDN | Phí kỳ hạn/giấy phép/thiết bị, và media egress theo usage |
| Data Platform | Daily events, số bảng/source, retention, queries, compute, backfills | Compute/storage/egress và vận hành theo workload; không mặc định database engine |
| Archive Licensing | Dung lượng gốc, số lượt giao file, chứng từ quyền, phí pháp lý và thương mại | Storage + retrieval/egress/download + pháp lý/vendor + vận hành phê duyệt |

### Khung tính chi phí vận hành AI (chưa điền giá vì thiếu input)

```text
AI_STT_cost = audio_minutes × STT_rate_per_min × avg_processing_retries
AI_translation_cost = translated_minutes_or_characters × rate
AI_vision_cost = analyzed_video_minutes_or_frames × provider_rate
AI_embedding_cost = embedding_tokens_or_chunks × rate + vector_storage + query_cost
AI_render_cost = generated_clips × render_cost_per_clip (+ storage + egress)
Total_AI_run_rate = sum(above) + monitoring/backup + provider minimums
```

Không chuyển dữ liệu `20 GB/video ngày` trong tài liệu nguồn thành **phút video AI** vì bitrate/codec và tỷ lệ video được chọn xử lý chưa xác minh. Không nhân chi phí nhận diện người theo mặc định vì vướng gate pháp lý.

## 7. Chất lượng dự toán, rủi ro và bước cần quyết định

- **P0:** chọn các gói/OS cần ra mắt; danh sách module G2/G3 đã thực hiện; media provider/rights, premium/app store payment; AI provider/model/ngôn ngữ/phút xử lý, privacy; định nghĩa membership/partner/licensing.
- **P1:** nghiệm thu từng feature/QA gộp mã trùng; thử nghiệm throughput/stability/model quality; quyền chia sẻ dữ liệu với vendor; sandbox và hạ tầng search/warehouse; ngân sách vận hành và yêu cầu capacity.
- **P2:** lập timeline trên dependency DAG theo từng gói và nhân sự; đánh giá hiệu quả thương mại trước khi duyệt triển khai.
- **Không tính phí/giờ cho H01/H02 bằng cách gộp vào 78 feature.** Những phần này phải dự toán độc lập ở bước chốt gói; không khẳng định GĐ4 hoàn thành trong số tháng bất kỳ.
- **Không áp dụng biên độ sai số cố định** khi provider, quality thresholds, đầu ra/video minutes còn chưa chốt. Ước tính chủ yếu là mức chuẩn bị để đối chiếu, đặc biệt các mã độ tin cậy L.

**Trạng thái:** DRAFT V0 – CHƯA QA 78 FEATURE, CHƯA CHỐT PHẠM VI/PROVIDER/HẠ TẦNG, CHƯA BÁO GIÁ.