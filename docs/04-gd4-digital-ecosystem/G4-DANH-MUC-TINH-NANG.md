# GĐ4 – Digital Ecosystem: danh mục 78 tính năng đề xuất (DRAFT V1)

> **09/10/2026 – bản thiết kế nghiệp vụ lần đầu, CHƯA QUA QA từng mã, CHƯA được VTV8 hoặc người dùng chốt phạm vi, CHƯA tính giờ FE/BE.** GĐ4 trong đề xuất VTV8–IIEL là **dài hạn**, không có mốc hoàn thành cố định. Đề xuất phân rã thành **9 module + 2 nhóm hỗ trợ**, **78 tính năng: 34 CORE, 34 CONDITIONAL, 10 OPTION**. CORE chỉ mang nghĩa **phần cơ sở khi chọn gói module tương ứng**, không phải cam kết làm 34 tính năng trong một đợt.
>
> **Nguồn và phân biệt căn cứ:** [Bản trích xuất đề xuất hợp tác](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md): GĐ4 **App, AI, membership, partner platform, data** tại bảng lộ trình trang 3; Smart TV nằm ở kiến trúc tương lai trang 8, không phải bắt buộc GĐ4; xử lý **speech-to-text/transcript/subtitle/translation/person recognition/location tagging/topic tagging/semantic search/highlight/short video/recommendation** ở mục VII trang 11–12; **membership** và **Content/Archive Licensing** ở mô hình kinh doanh trang 12–13; lưu trữ Hot/Warm/Archive trang 10. Nội dung chi tiết UI/API/role/acceptance là **phân rã đề xuất**, chưa được nguồn xác nhận từng thao tác.
>
> **Chú giải căn cứ:** `T4` = định hướng giai đoạn 4/kinh doanh chung; `TAI` = mục AI; `AKT` = kiến trúc kênh TV/mobile; `TBIZ` = Content/Archive Licensing; `P` = chi tiết do phân tích bổ sung. **Cả khi có mã T4/TAI/AKT/TBIZ, mức xác nhận chỉ là chủ đề nghiệp vụ, không phải từng phương pháp hiện thực.**

## 1. Phân kỳ theo nhóm độc lập

| Nhóm | Cung cấp giá trị gì | Điều kiện/không tự mặc định |
|---|---|---|
| **A – Mobile** | Kênh ứng dụng xem VOD/live, tài khoản và khám phá nội dung | Quyết định iOS/Android, API/media provider; membership/commerce/offline tùy năng lực có trước |
| **A+ – Smart TV** | TV app điều khiển remote, sign-in, playback trên OS chọn | Chỉ từ định hướng kiến trúc tương lai, **không phải cam kết mặc định GĐ4** |
| **B1 – AI Media** | Chuyển video thành transcript/subtitle/tags đã được người biên tập kiểm tra | AI provider, quyền xử lý footage/nhân vật, biên tập có đủ nhân lực |
| **B2 – Semantic Search** | Tìm văn bản/tình huống trong video theo câu tự nhiên, mở đúng nguồn/timecode | Nguồn transcript đã duyệt, vector search và rights gate |
| **B3 – AI Recommendation/Repurposing** | Gợi ý nâng cao, highlight/clip ngắn nếu chọn | Kế thừa recommendation G2 và render provider; kiểm duyệt không tự publish |
| **C1 – Membership** | Cấp thành viên/quyền lợi/giải trí cao cấp | G2-09/10 subscription + entitlement phải có thật, provider hỗ trợ benefits |
| **C2 – Partner Platform** | Đối tác tự quản thông tin và quyền được cấp; API khi thật sự cần | G3-02/03/04/05/07/09 có domain tương ứng, tránh phát triển portal rỗng |
| **D1 – Data Platform** | Hợp nhất phân tích sự kiện nội dung–người xem–giao dịch có consent | Tối ưu từ dữ liệu đang có; không ép warehouse lớn nếu chưa có workload |
| **D2 – Archive/Licensing** | Kho tư liệu với quyền cấp phép, đề nghị sử dụng và giao file B2B có kiểm soát | Phải phân định quyền phát nội bộ với quyền tái cấp phép bên thứ ba |

## 2. Danh sách 9 module

| Module | Nhóm | Tổng | CORE | CONDITIONAL | OPTION |
|---|---|---:|---:|---:|---:|
| [G4-01 – Mobile App iOS/Android](G4-01-mobile-app.md) | A – Mobile | 9 | 5 | 3 | 1 |
| [G4-02 – Smart TV](G4-02-smart-tv.md) | A+ – Smart TV | 8 | 0 | 7 | 1 |
| [G4-03 – AI Media Processing](G4-03-ai-media-processing.md) | B1 – AI Media | 9 | 5 | 3 | 1 |
| [G4-04 – Semantic Search](G4-04-semantic-search.md) | B2 – Semantic | 8 | 7 | 0 | 1 |
| [G4-05 – Recommendation & Video Automation](G4-05-ai-recommendation-video-automation.md) | B3 – AI Repurposing | 9 | 4 | 4 | 1 |
| [G4-06 – Membership](G4-06-membership.md) | C1 – Membership | 8 | 3 | 3 | 2 |
| [G4-07 – Partner Platform & API](G4-07-partner-platform.md) | C2 – Partner | 9 | 3 | 5 | 1 |
| [G4-08 – Data Platform](G4-08-data-platform.md) | D1 – Data | 9 | 3 | 5 | 1 |
| [G4-09 – Archive & Content Licensing](G4-09-archive-content-licensing.md) | D2 – Licensing | 9 | 4 | 4 | 1 |
| **Tổng** | | **78** | **34** | **34** | **10** |

**Lý do điều chỉnh từ khung 8 module cũ:** Tách **Data Platform** và **Archive & Content Licensing** thành **G4-08** và **G4-09** để có chủ sở hữu nghiệp vụ/dữ liệu rõ và không tính chồng kho dữ liệu phân tích với khai thác bản quyền media. G4-01…G4-07 giữ mã module định hướng ban đầu.

## 3. Danh mục đầy đủ 78 tính năng đề xuất

| Mã | Tính năng | Nghiệp vụ/đầu ra | Phạm vi | Căn cứ | Gate |
|---|---|---|---|---|---|
| [G4-01-F001](G4-01-mobile-app.md) | Nền tảng ứng dụng và điều hướng | Khởi tạo ứng dụng iOS/Android với điều hướng, trạng thái mạng, cấu hình môi trường, cập nhật và đồng bộ thiết kế thương hiệu. | CORE | T4 | APP_OS |
| [G4-01-F002](G4-01-mobile-app.md) | Tài khoản và phiên người xem | Đăng nhập/đăng xuất, hồ sơ cá nhân qua audience identity G2-01, không dùng tài khoản CMS. | CORE | P | IDENTITY |
| [G4-01-F003](G4-01-mobile-app.md) | Trang chủ, chuyên mục, tìm kiếm | Khám phá bài viết, chương trình, địa danh, video và tìm kiếm nội dung đã published, tái dùng search G2-04. | CORE | T4 | CONTENT_API |
| [G4-01-F004](G4-01-mobile-app.md) | Phát VOD và livestream trên mobile | Phát video/livestream bằng player SDK phù hợp HLS/DASH/provider, có lỗi mạng, resume nếu G2-03 có dữ liệu. | CORE | P | MEDIA_PROVIDER |
| [G4-01-F005](G4-01-mobile-app.md) | Thư viện cá nhân và tiếp tục xem | Theo dõi, yêu thích, lịch sử và playlist qua dữ liệu G2-02/03, chỉ hiển thị năng lực đã triển khai. | CORE | P | G2_FEATURES |
| [G4-01-F006](G4-01-mobile-app.md) | Thông báo đẩy trên điện thoại | Thông báo từ chương trình theo dõi/nội dung cập nhật theo consent, bao gồm đăng ký token thiết bị, opt-in và link sâu. | CONDITIONAL | P | PUSH_PROVIDER |
| [G4-01-F007](G4-01-mobile-app.md) | Quyền xem premium và membership trên app | Hiển thị gói/quyền xem, thực thi entitlement G2-10; phương án mua trong app phụ thuộc kênh phân phối và quy định thanh toán. | CONDITIONAL | T4 | MEMBERSHIP_BILLING |
| [G4-01-F008](G4-01-mobile-app.md) | Trải nghiệm nội dung tới dịch vụ thương mại | Từ video/bài viết mở offering, gửi lead, referral hoặc booking theo đúng các bước GĐ3 đã mở; không tự giả định có checkout. | CONDITIONAL | P | G3_COMMERCIAL |
| [G4-01-F009](G4-01-mobile-app.md) | Tải nội dung xem offline | Lưu VOD để xem ngoại tuyến nếu nhà cung cấp, giấy phép khai thác và DRM cho phép; có hạn dùng/xóa tệp. | OPTION | P | OFFLINE_LICENSE |
| [G4-02-F001](G4-02-smart-tv.md) | Bộ ứng dụng TV và ma trận thiết bị | Khởi tạo app trên một dòng TV OS được chọn và xác nhận cấu hình phân phối, bộ nhớ, độ phân giải, remote. | CONDITIONAL | AKT | TV_OS |
| [G4-02-F002](G4-02-smart-tv.md) | Điều hướng remote và focus/accessibility | Duyệt danh mục bằng D-pad, nút back, focus rõ, trạng thái idle và màn hình lớn. | CONDITIONAL | P | TV_OS |
| [G4-02-F003](G4-02-smart-tv.md) | Trang khám phá chương trình và tìm kiếm trên TV | Xem các kệ nội dung, chương trình, video/series, tìm kiếm bằng bàn phím TV hoặc phương thức hệ điều hành cho phép. | CONDITIONAL | P | SEARCH_API |
| [G4-02-F004](G4-02-smart-tv.md) | Phát VOD/live trên thiết bị TV | Phát live và VOD dùng HLS/DASH/device player, xử lý audio/subtitle và chất lượng theo khả năng provider. | CONDITIONAL | AKT | TV_MEDIA |
| [G4-02-F005](G4-02-smart-tv.md) | Đăng nhập bằng mã liên kết thiết bị | Đăng nhập với mã/QR và phiên hết hạn trên thiết bị TV; quản lý liên kết với tài khoản G2-01. | CONDITIONAL | P | IDENTITY |
| [G4-02-F006](G4-02-smart-tv.md) | Kiểm tra gói và quyền xem trên TV | Chỉ phát nội dung premium khi gói/DRM trên thiết bị đáp ứng entitlement; mua gói ngoài TV nếu chính sách yêu cầu. | CONDITIONAL | T4 | TV_DRM |
| [G4-02-F007](G4-02-smart-tv.md) | Theo dõi phiên phát và chất lượng TV | Gửi event xem và lỗi/QoE tương thích G2-11; không lập kho analytics thứ hai. | CONDITIONAL | P | TELEMETRY |
| [G4-02-F008](G4-02-smart-tv.md) | Tìm kiếm giọng nói bằng tính năng TV OS | Tùy chọn dùng nhận giọng nói hệ điều hành nếu có API/phê duyệt; không tự vận hành STT riêng trên TV. | OPTION | P | TV_VOICE |
| [G4-03-F001](G4-03-ai-media-processing.md) | Pipeline yêu cầu và theo dõi job AI media | Chọn video/đoạn media có quyền xử lý, chọn loại tác vụ, đưa vào queue, xem trạng thái, lỗi và quota. | CORE | TAI | AI_VENDOR |
| [G4-03-F002](G4-03-ai-media-processing.md) | Speech-to-text và transcript có mốc thời gian | Chuyển lời nói video thành transcript có timestamp và ngôn ngữ, hỗ trợ chỉnh sửa trước sử dụng. | CORE | TAI | STT_PROVIDER |
| [G4-03-F003](G4-03-ai-media-processing.md) | Tạo và đồng bộ phụ đề từ transcript | Tạo subtitle timed tracks và cập nhật sau khi chỉnh bản chép lời, kế thừa player G1/G2. | CORE | TAI | SUBTITLE_RIGHTS |
| [G4-03-F004](G4-03-ai-media-processing.md) | Biên tập, thẩm định và xuất bản kết quả AI | Review transcript/subtitle/tags có nguồn AI, so sánh phiên bản, duyệt/không duyệt và xuất bản metadata vào DAM/CMS. | CORE | P | EDITORIAL_POLICY |
| [G4-03-F005](G4-03-ai-media-processing.md) | Dịch transcript và phụ đề đa ngôn ngữ | Tạo bản dịch theo ngôn ngữ đã chọn, ghi nguồn và người duyệt; không mặc định dịch mọi nội dung hoặc đảm bảo chất lượng tự động. | CONDITIONAL | TAI | TRANSLATION_RIGHTS |
| [G4-03-F006](G4-03-ai-media-processing.md) | Gợi ý nhân vật xuất hiện trong video | Đề xuất person tags theo thông tin/metadata được VTV8 cho phép; đối sánh danh tính khuôn mặt hoặc nhận diện sinh trắc học chỉ khi qua đánh giá pháp lý và dữ liệu. | CONDITIONAL | TAI | BIOMETRIC_LEGAL |
| [G4-03-F007](G4-03-ai-media-processing.md) | Nhận diện/đề xuất địa điểm và địa danh | AI gợi ý địa danh dựa lời nói/hình ảnh khi provider hỗ trợ, map về taxonomy/địa danh G1-04, người biên tập xác nhận. | CONDITIONAL | TAI | VISION_MODEL |
| [G4-03-F008](G4-03-ai-media-processing.md) | Gắn nhãn chủ đề/di sản theo taxonomy | Đề xuất tag chủ đề/di sản từ transcript/metadata và map về taxonomy G1-04; áp quy trình duyệt chung. | CORE | TAI | MODEL_QUALITY |
| [G4-03-F009](G4-03-ai-media-processing.md) | Xử lý lại phiên bản và giám sát chất lượng AI | Tái chạy khi video được thay thế/mô hình đổi, so sánh độ chính xác mẫu và chi phí theo phút; giữ trace phiên bản cũ. | OPTION | P | AI_METERING |
| [G4-04-F001](G4-04-semantic-search.md) | Chuẩn hóa đoạn transcript để lập chỉ mục | Chỉ lấy transcript/timecodes đã duyệt, chia đoạn phù hợp để tìm theo ngữ nghĩa, giữ liên kết bản media nguồn. | CORE | TAI | AI_TRANSCRIPT |
| [G4-04-F002](G4-04-semantic-search.md) | Tạo embeddings và chỉ mục vector | Biểu diễn đoạn transcript và metadata thành vector theo mô hình/provider được chọn, có version, retry và chi phí theo dữ liệu. | CORE | TAI | VECTOR_PROVIDER |
| [G4-04-F003](G4-04-semantic-search.md) | Tìm kiếm nội dung bằng câu tự nhiên | Nhập câu hỏi như chương trình về kiến trúc Huế 2023–2026, trả danh sách nguồn phù hợp; không tự tổng hợp câu trả lời thành khẳng định nguồn. | CORE | TAI | SEARCH_MODEL |
| [G4-04-F004](G4-04-semantic-search.md) | Hiển thị đoạn trích có timecode và mở video tương ứng | Kết quả hiển thị trích đoạn/timestamp đã duyệt, nhấn sẽ chuyển đến phút/giây video thực nếu có quyền. | CORE | P | MEDIA_RIGHTS |
| [G4-04-F005](G4-04-semantic-search.md) | Kết hợp tìm kiếm từ khóa với ngữ nghĩa | Hợp nhất kết quả keyword G2-04 và semantic G4-04, ưu tiên ngữ cảnh/địa danh/mốc thời gian và loại nội dung. | CORE | P | SEARCH_COMPAT |
| [G4-04-F006](G4-04-semantic-search.md) | Áp dụng phân quyền khi truy vấn và hiển thị transcript | Dữ liệu public, thuê bao premium, nội bộ và nội dung hết hạn không bị lẫn; quyết định từ DAM/entitlement G2-10. | CORE | P | RIGHTS_GATE |
| [G4-04-F007](G4-04-semantic-search.md) | Đồng bộ chỉ mục và xử lý thay đổi quyền/media | Khi transcript được sửa, asset thay bản, gỡ nội dung hay quyền hết hạn, xóa hoặc cập nhật vector tương ứng. | CORE | P | INDEX_RETENTION |
| [G4-04-F008](G4-04-semantic-search.md) | Đánh giá độ liên quan và kiểm soát cải thiện tìm kiếm | Tập câu hỏi thử nghiệm, ghi đánh giá kết quả phù hợp, độ trễ, chất lượng search model theo kỳ; không bắt buộc LLM trả lời tự sinh. | OPTION | P | EVALUATION |
| [G4-05-F001](G4-05-ai-recommendation-video-automation.md) | Hồ sơ tín hiệu cho gợi ý nâng cao | Tổng hợp tín hiệu follow/yêu thích/xem từ G2, áp dụng consent/mục đích xử lý, không lập audience ID riêng. | CORE | TAI | PRIVACY_POLICY |
| [G4-05-F002](G4-05-ai-recommendation-video-automation.md) | Xếp hạng gợi ý nâng cao theo nội dung/người xem | Xếp hạng candidate kết hợp metadata và sở thích; không bắt buộc phải triển khai mô hình huấn luyện riêng khi rule-based đủ. | CORE | TAI | RANKER_MODEL |
| [G4-05-F003](G4-05-ai-recommendation-video-automation.md) | Fallback và kiểm soát đề xuất cho người mới | Tiếp tục sử dụng nội dung nổi bật, gợi ý editor và điều kiện quyền khi thiếu tín hiệu; không tính thành dịch vụ độc lập đã có G2. | CORE | P | G2_REUSE |
| [G4-05-F004](G4-05-ai-recommendation-video-automation.md) | Đo chất lượng recommendation trong analytics chung | Gắn source/rank và kiểm tra engagement/coverage qua G2-11, không tạo dashboard analytics hoàn toàn mới. | CORE | P | ANALYTICS |
| [G4-05-F005](G4-05-ai-recommendation-video-automation.md) | Đề xuất phân đoạn highlight từ transcript/video | Gợi ý đoạn nổi bật kèm timecode và confidence; chỉ làm khi media và AI provider hỗ trợ, không tự xuất bản. | CONDITIONAL | TAI | HIGHLIGHT_VENDOR |
| [G4-05-F006](G4-05-ai-recommendation-video-automation.md) | Tạo video ngắn từ đoạn đã chọn | Cắt đoạn được duyệt thành short video theo tỷ lệ/kích thước đã chọn, bảo toàn quyền footage/âm nhạc và watermark nếu quy định. | CONDITIONAL | TAI | RENDER_INFRA |
| [G4-05-F007](G4-05-ai-recommendation-video-automation.md) | Tạo phụ đề/bố cục cho clip ngắn | Dùng bản phụ đề đã duyệt G4-03, áp template tỷ lệ dọc/ngang, kiểm tra text overflow; không tự tạo giọng người thật. | CONDITIONAL | P | MEDIA_RIGHTS |
| [G4-05-F008](G4-05-ai-recommendation-video-automation.md) | Kiểm duyệt, lưu nguồn và phát hành video tái sử dụng | Phê duyệt clip ngắn, kiểm tra hạn quyền media, gắn phiên bản nguồn, đưa vào DAM/CMS GĐ1; phát sang mạng xã hội chỉ khi có tích hợp riêng. | CONDITIONAL | P | EDITORIAL_RIGHTS |
| [G4-05-F009](G4-05-ai-recommendation-video-automation.md) | Thử nghiệm mô hình recommendation nâng cao/A-B | So sánh các phiên bản mô hình, kiểm soát guardrails và rollback, phục vụ dữ liệu lớn khi thật sự cần. | OPTION | P | MODEL_EVAL |
| [G4-06-F001](G4-06-membership.md) | Danh mục hạng thành viên và tập quyền lợi | Cấu hình tier/benefit, giá hoặc điều kiện đạt, ngày hiệu lực dựa subscription G2 nếu có; không phát hành gói trùng cấu trúc. | CORE | T4 | SUBSCRIPTION_MODEL |
| [G4-06-F002](G4-06-membership.md) | Hồ sơ/thẻ trạng thái thành viên | Trang xem hạng, ngày hiệu lực, quyền lợi có thể dùng trên web/mobile/TV và lý do không được dùng. | CORE | T4 | G2_IDENTITY |
| [G4-06-F003](G4-06-membership.md) | Kiểm tra quyền lợi thành viên qua entitlement chung | Xác định quyền xem chương trình trả phí, tính năng không quảng cáo, chất lượng đặc biệt theo gói; dùng G2-10 là nguồn quyết định. | CORE | T4 | ENTITLEMENT |
| [G4-06-F004](G4-06-membership.md) | Đổi hạng/gia hạn/hủy Membership | Nâng/hạ hạng, gia hạn/hủy và hiệu lực phí theo hợp đồng, dùng subscription G2-09 và chính sách payment hiện có. | CONDITIONAL | P | BILLING_POLICY |
| [G4-06-F005](G4-06-membership.md) | Chế độ xem không quảng cáo cho hội viên | Tắt vị trí quảng cáo trên kênh/app áp dụng khi ad inventory thật được triển khai; không gỡ nội dung tài trợ đã tích hợp vào chương trình. | CONDITIONAL | T4 | AD_PLATFORM |
| [G4-06-F006](G4-06-membership.md) | Chất lượng video cao cấp theo gói | Quyền phát video 2K/4K/8K chỉ khi nhà cung cấp có rendition, CDN, DRM và thiết bị thật hỗ trợ; không coi cấp quyền là đã có nguồn 8K. | CONDITIONAL | T4 | PREMIUM_MEDIA |
| [G4-06-F007](G4-06-membership.md) | Sự kiện/chương trình dành riêng cho thành viên | Giữ chỗ/đăng ký hoạt động đặc biệt theo chương trình thành viên khi VTV8 thực sự vận hành sự kiện; không mặc định booking ticketing riêng. | OPTION | P | EVENT_PROGRAM |
| [G4-06-F008](G4-06-membership.md) | Báo cáo duy trì, chuyển hạng và giá trị membership | Phân tích số hội viên, chuyển gói, tỉ lệ duy trì dựa G2-09/11, phân biệt active/subscription revenue và quyền lợi thật. | OPTION | P | DATA_POLICY |
| [G4-07-F001](G4-07-partner-platform.md) | Cổng đăng nhập tổ chức đối tác và phân quyền | Khu vực truy cập cho tổ chức được VTV8 phê duyệt, có owner/staff và giới hạn dữ liệu theo tổ chức. | CORE | T4 | PARTNER_TENANCY |
| [G4-07-F002](G4-07-partner-platform.md) | Đăng ký/thẩm định quyền tham gia portal | Yêu cầu kích hoạt truy cập, xác minh đầu mối và cơ chế phê duyệt; dùng hồ sơ partner G3-03, không tạo một master pháp nhân thứ hai. | CORE | P | PARTNER_LEGAL |
| [G4-07-F003](G4-07-partner-platform.md) | Đối tác tự quản hồ sơ và offering được cho phép | Đề xuất chỉnh thông tin liên hệ/offering, trạng thái cung cấp, gửi duyệt về G3-03; không cho tự duyệt nội dung công khai. | CORE | T4 | G3_OFFERING |
| [G4-07-F004](G4-07-partner-platform.md) | Nhận và cập nhật lead trên portal | Được xem lead đã chuyển đến, xác nhận tiếp nhận và cập nhật kết quả theo phạm vi dữ liệu được đồng ý chia sẻ. | CONDITIONAL | P | G3_LEAD |
| [G4-07-F005](G4-07-partner-platform.md) | Báo cáo referral và conversion cho đối tác | Xem campaign, click, conversion đã được ghi nhận theo chương trình affiliate thực tế; không hiển thị hoa hồng pending như đã trả. | CONDITIONAL | P | G3_AFFILIATE |
| [G4-07-F006](G4-07-partner-platform.md) | Quản lý booking/đơn hàng phía đối tác | Theo dõi yêu cầu booking hoặc đơn TMĐT được giao và cập nhật trạng thái theo quyền G3-05/G3-08; không tạo booking/order mới trong portal. | CONDITIONAL | P | G3_BOOKING_COMMERCE |
| [G4-07-F007](G4-07-partner-platform.md) | Bảng kê hoa hồng/đối soát cho đối tác | Đối tác xem kỳ và chứng từ thuộc quyền, xác nhận/tranh chấp bảng kê; G3-09 sở hữu sổ hoa hồng chung. | CONDITIONAL | P | G3_FINANCE |
| [G4-07-F008](G4-07-partner-platform.md) | Partner API và webhooks có xác thực | Nếu có nhu cầu tích hợp máy-máy: API key/OAuth client, scope theo đối tác, event webhook có chữ ký và quota. | CONDITIONAL | T4 | PARTNER_API |
| [G4-07-F009](G4-07-partner-platform.md) | Sandbox, tài liệu tích hợp và thử nghiệm đối tác | Môi trường thử API/schema/events, tài liệu chức năng được hỗ trợ; chỉ sau khi Partner API được chọn. | OPTION | P | PARTNER_API |
| [G4-08-F001](G4-08-data-platform.md) | Danh mục nguồn và định nghĩa chỉ số kinh doanh | Định nghĩa Content/Audience/Transaction assets, chủ sở hữu dataset, chuẩn event và KPI, phân biệt view/click/lead/booking/order/doanh thu. | CORE | T4 | DATA_GOV |
| [G4-08-F002](G4-08-data-platform.md) | Pipeline thu thập dữ liệu tăng thêm xuyên giai đoạn | Lấy dữ liệu được phép từ G1/G2/G3 theo event/CDC/batch phù hợp, chịu được event trùng, trễ và thay schema. | CORE | P | DATA_SOURCES |
| [G4-08-F003](G4-08-data-platform.md) | Kiểm soát chất lượng, đối chiếu và lịch sử dữ liệu | Theo dõi độ đầy đủ, freshness, reconcile và source lineage, cảnh báo sai lệch dữ liệu vận hành. | CORE | P | DATA_QUALITY |
| [G4-08-F004](G4-08-data-platform.md) | Lớp lưu trữ phân tích theo quy mô thực tế | Chọn kho phân tích/warehouse khi khối lượng truy vấn đã chứng minh; chưa mặc định ClickHouse hoặc lakehouse nếu Postgres/analytics G2 đủ. | CONDITIONAL | T4 | WAREHOUSE_SCALE |
| [G4-08-F005](G4-08-data-platform.md) | Liên kết dữ liệu nội dung, người xem và giao dịch | Mô hình kết nối entity/media/interaction/commercial events được phép, có pseudonymization và chính sách mục đích dữ liệu. | CONDITIONAL | P | IDENTITY_PRIVACY |
| [G4-08-F006](G4-08-data-platform.md) | Dashboard liên thông Content-to-Commerce | Phễu bài/video→nhu cầu→lead→conversion→booking/order→tiền đã xác nhận, không thay báo cáo nghiệp vụ G3 tại nguồn. | CONDITIONAL | P | G3_FINANCE |
| [G4-08-F007](G4-08-data-platform.md) | Phân khúc khách hàng phục vụ nội dung/membership | Đề xuất segment từ hành vi được phép, gói thành viên và mối quan tâm; không tự mở targeting quảng cáo cá nhân nếu chưa được duyệt. | CONDITIONAL | T4 | SEGMENT_PRIVACY |
| [G4-08-F008](G4-08-data-platform.md) | Xuất dữ liệu và chia sẻ chỉ số cho đối tác được cấp quyền | Xuất dữ liệu tổng hợp/báo cáo giới hạn theo vai trò/hợp đồng, không tự xuất PII người xem hay thông tin đối tác khác. | CONDITIONAL | P | DATA_SHARING |
| [G4-08-F009](G4-08-data-platform.md) | Tự động hóa phân tích dự báo theo dữ liệu | Dự báo nhu cầu nội dung/lead hoặc churn khi đủ dữ liệu, có kiểm thử độ lệch và kiểm soát quyết định con người; không mặc định dùng ML. | OPTION | P | MODEL_BENCH |
| [G4-09-F001](G4-09-archive-content-licensing.md) | Tra cứu bộ sưu tập di sản/tư liệu phục vụ cấp phép | Lập bộ sưu tập thematic/archive từ các asset DAM có hồ sơ quyền, người xuất hiện và mốc lịch sử, tìm theo nguồn/chủ đề/thời gian. | CORE | T4 | DAM_ARCHIVE |
| [G4-09-F002](G4-09-archive-content-licensing.md) | Ma trận quyền khai thác và hạn sử dụng theo mục đích | Phân biệt quyền phát VTV8, cấp phép bên thứ ba, quyền hình ảnh/âm nhạc/footage, lãnh thổ, thời hạn và mục đích; bổ sung vào DAM rights G1-05. | CORE | T4 | RIGHTS_LEGAL |
| [G4-09-F003](G4-09-archive-content-licensing.md) | Danh mục gói khai thác tư liệu | Giới thiệu tư liệu/đoạn trích có thể xin cấp phép với các loại mục đích, thời hạn, phương thức nhận báo giá; không công khai file gốc chất lượng cao. | CORE | TBIZ | LICENSING_MODEL |
| [G4-09-F004](G4-09-archive-content-licensing.md) | Tiếp nhận yêu cầu cấp phép sử dụng nội dung | Gửi nội dung mong muốn, mục đích sử dụng, phạm vi, thời hạn, liên hệ; có tình trạng tiếp nhận, khác lead tour G3 nhưng có thể tái dùng inbox/workflow. | CORE | TBIZ | B2B_POLICY |
| [G4-09-F005](G4-09-archive-content-licensing.md) | Báo giá, kiểm tra và duyệt yêu cầu license | Tạo báo giá/điều khoản hạn dùng, xác minh quyền sở hữu và người duyệt, lưu revision trước khi bên mua chấp thuận. | CONDITIONAL | P | LICENSING_LEGAL |
| [G4-09-F006](G4-09-archive-content-licensing.md) | Theo dõi hợp đồng/giấy phép và hiệu lực sử dụng | Lưu phạm vi giấy phép, đối tác, thời gian, lãnh thổ, sản phẩm sử dụng và trạng thái; có thể liên kết hợp đồng ngoài hệ, không mặc định ký điện tử. | CONDITIONAL | TBIZ | CONTRACT_SCOPE |
| [G4-09-F007](G4-09-archive-content-licensing.md) | Bàn giao file chất lượng gốc có kiểm soát | Chỉ sau duyệt/hợp đồng đủ điều kiện, tạo gói xuất và link an toàn giới hạn tải, watermark khi cần; không mặc định có DRM download. | CONDITIONAL | P | SECURE_DELIVERY |
| [G4-09-F008](G4-09-archive-content-licensing.md) | Ghi nhận phí khai thác và đối soát cấp phép | Liên kết tình trạng báo giá/hợp đồng với chứng cứ thanh toán và doanh thu bản quyền; chỉ tích hợp payment khi được VTV8 quyết định. | CONDITIONAL | TBIZ | LICENSING_PAYMENT |
| [G4-09-F009](G4-09-archive-content-licensing.md) | Gia hạn, thu hồi và báo cáo khai thác bản quyền | Nhắc hạn sử dụng, ghi yêu cầu gia hạn/thu hồi, báo cáo số cấp phép/tài sản theo kỳ và log phân phối khi có nguồn dữ liệu. | OPTION | P | LICENSE_LIFECYCLE |

## 4. Nguyên tắc triển khai không tính trùng

- **GĐ1/GĐ2:** CMS/DAM/video/live, account, follow/favorite/watch-progress, basic search/recommendation, subscription/payment, rights/DRM, analytics cơ sở. GĐ4 chỉ là kênh mới hoặc nâng cấp có ranh giới; không lập lại các service nền.
- **GĐ3:** Partner master/lead/booking/order/finance là nguồn chính. Portal G4-07 là cổng **đối tác tự phục vụ** với role và API phù hợp, không tái phát triển toàn bộ quy trình G3.
- **AI:** G4-03 sở hữu transcript/subtitle/tags đã duyệt; G4-04 sở hữu semantic index/search; G4-05 sở hữu ranker/highlight/short derivatives; nhân vật chỉ nhận diện khi pháp lý và chất lượng mô hình được chốt.
- **Membership:** gói/quyền lợi mở rộng G2 subscription và entitlement chung; không tạo một payment engine mới. 2K/4K/8K chỉ là quyền nếu media pipeline/provider thực sự có rendition.
- **Dữ liệu:** G4-08 tổng hợp dữ liệu nguồn theo policy, không tạo kho audience/transaction thứ hai. G4-09 dựa DAM rights và bằng chứng hợp đồng B2B; quyền xem VTV8 không đồng nghĩa quyền phân phối lại file.
- **Không định sẵn công nghệ:** mobile native/cross-platform, TV OS, AI API/self-host, vector index, data warehouse và secure license delivery đều cần quyết định sau khảo sát.

[Thành phần dùng chung](G4-THANH-PHAN-DUNG-CHUNG.md) · [Gates](G4-RELEASE-GATES.md) · [Hạ tầng H01](G4-H01-ha-tang-tich-hop.md) · [Pháp lý/UAT H02](G4-H02-phap-ly-uat-chuyen-giao.md) · [13 kịch bản E2E](G4-TIEU-CHI-NGHIEM-THU.md).

## 5. Thông tin còn thiếu để có thể chốt phạm vi hoặc tính giờ FE/BE

Thiết bị/OS mục tiêu, kênh phân phối; hiện trạng GĐ1–GĐ3 đã triển khai gì; ước lượng thời lượng video cần xử lý AI, ngôn ngữ, chính sách chia sẻ dữ liệu, vendor/model/GPU; yêu cầu chính xác của semantic search và recognition; membership pricing/benefit/DRM/ad policy; đối tác được dùng portal và phạm vi API; data volume/retention/consent; quyền tái cấp phép tư liệu và chủ thể nhận tiền.

**Dự kiến nguồn GĐ4 dài hạn, không có thời lượng cụ thể.** Không lập báo giá cố định hay ước tính tổng MD cho 78 tính năng trước khi chốt các gói phát hành.
