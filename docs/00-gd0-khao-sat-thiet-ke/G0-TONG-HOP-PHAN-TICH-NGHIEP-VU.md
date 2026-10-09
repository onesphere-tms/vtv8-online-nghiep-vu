# GĐ0 – PHÂN TÍCH NGHIỆP VỤ TỔNG THỂ VÀ DANH MỤC CÔNG VIỆC

> **Bản tổng hợp:** 09/10/2026 · **Mục đích:** xem toàn bộ GĐ0 một lượt, thay vì duyệt lần lượt từng module.  
> **Đã chốt nội bộ:** 8 module GĐ0 và danh sách 11 hạng mục G0-01.  
> **Đề xuất để rà soát đồng bộ:** hạng mục G0-02 đến G0-08. Việc tài liệu được đưa lên GitHub **không có nghĩa** các hạng mục này đã được VTV8 phê duyệt.  
> **Không thuộc bước này:** ước tính giờ code Middle Developer, chi phí, giá nhà cung cấp, triển khai phần mềm hay thu thập số liệu thực địa.

## 1. Bối cảnh và quy tắc sử dụng

Tài liệu đề xuất VTV8–IIEL (15 trang) là tài liệu định hướng, chưa phải đặc tả yêu cầu được phê duyệt. Mọi số liệu hiện trạng chỉ là số liệu nêu trong nguồn, cần đối chiếu bằng chứng thực tế. Mục tiêu giai đoạn 0 của nguồn là khảo sát hiện trạng, kiểm kê quyền và dữ liệu, taxonomy/UX-UI, kiến trúc, streaming/CDN và phương án migration, để làm căn cứ lập dự toán đầu tư.

**Cần phân biệt:** (a) nội dung đã viết trong tài liệu nguồn; (b) danh sách công việc nghiệp vụ/kiến trúc do nhóm phân tích đề xuất để chuẩn hóa WBS; (c) kết quả khảo sát/thông số còn chờ VTV8 hoặc vendor cung cấp. Các mục (b) và (c) không phải yêu cầu đã được duyệt.

## 2. Phân bổ 8 module và trạng thái

| Module | Hạng mục | Số công việc | Trạng thái danh mục |
|---|---|---:|---|
| G0-01 | [Khảo sát nghiệp vụ và phạm vi sản phẩm](G0-01-khao-sat-nghiep-vu-va-pham-vi-san-pham.md) | 11 | Đã chốt nội bộ |
| G0-02 | [Khảo sát hiện trạng hệ thống và tài sản số](G0-02-khao-sat-hien-trang-he-thong-va-tai-san-so.md) | 10 | Đề xuất – rà soát tổng thể |
| G0-03 | [Phân tích bản quyền, giấy phép và điều kiện khai thác](G0-03-ban-quyen-giay-phep-dieu-kien-khai-thac.md) | 9 | Đề xuất – rà soát tổng thể |
| G0-04 | [Thiết kế trải nghiệm và cấu trúc thông tin](G0-04-ux-ui-va-cau-truc-thong-tin.md) | 10 | Đề xuất – rà soát tổng thể |
| G0-05 | [Thiết kế kiến trúc nền tảng, dữ liệu và bảo mật](G0-05-kien-truc-nen-tang-du-lieu-va-bao-mat.md) | 10 | Đề xuất – rà soát tổng thể |
| G0-06 | [Đánh giá và thiết kế giải pháp Video/Livestream](G0-06-video-livestream.md) | 10 | Đề xuất – rà soát tổng thể |
| G0-07 | [Phân tích và thiết kế phương án chuyển đổi dữ liệu](G0-07-phuong-an-chuyen-doi-du-lieu.md) | 10 | Đề xuất – rà soát tổng thể |
| G0-08 | [Xây dựng hồ sơ triển khai, nghiệm thu và dự toán](G0-08-ho-so-trien-khai-nghiem-thu-va-du-toan.md) | 11 | Đề xuất – rà soát tổng thể |

**Tổng số công việc trong bản phân rã:** 81 mục, bao gồm cả công việc khảo sát, phân tích, thiết kế, rà soát/tổng hợp. Chúng **không tương đương** 81 tính năng phần mềm cần lập trình hay 81 tài liệu bàn giao độc lập.

## 3. Danh mục G0-01 đã chốt (11 công việc)

| Mã | Công việc | Đầu ra chính |
|---|---|---|
| G0-01-F001 | Khảo sát các bên liên quan | Stakeholder Matrix |
| G0-01-F002 | Nghiệp vụ sản xuất và biên tập tin bài | Editorial Workflow |
| G0-01-F003 | Nghiệp vụ quản lý chương trình và video | Media Business Workflow |
| G0-01-F004 | Nghiệp vụ livestream | Livestream Business Workflow |
| G0-01-F005 | Nghiệp vụ thống kê và nhuận bút | Reporting & Royalty Requirements |
| G0-01-F006 | Nghiệp vụ người xem và Media Platform | Audience Requirements |
| G0-01-F007 | Nghiệp vụ kinh doanh và Content Commerce | Commerce Requirements |
| G0-01-F008 | Phân tích vai trò và quyền nghiệp vụ | Role & Permission Matrix |
| G0-01-F009 | Phân tích quy trình hiện tại và tương lai | Business Process Specification |
| G0-01-F010 | Xây dựng danh mục yêu cầu chức năng | Functional Requirements Backlog |
| G0-01-F011 | Rà soát và xác nhận kết quả khảo sát | Requirement Review & Open Issues |

F001–F011 trên đây đã được chốt theo trao đổi trước đó. Phần **đặc tả cách thực hiện** và **kết quả khảo sát thực tế** vẫn phải bổ sung khi có đầu vào từ VTV8.

## G0-02 – Khảo sát hiện trạng hệ thống và tài sản số

**Mục tiêu:** Lập bức tranh AS-IS có bằng chứng về phần mềm, dữ liệu, kênh phân phối, hạ tầng và lưu lượng; phân loại thành phần có khả năng kế thừa.

| Mã | Hạng mục công việc | Nghiệp vụ/khảo sát cần thực hiện | Đầu ra dự kiến |
|---|---|---|---|
| G0-02-F001 | Khảo sát website hiện tại | Liệt kê loại trang, chuyên mục, URL, tìm kiếm, SEO, responsive, điểm bất thường và chức năng đang vận hành. | Danh sách URL mẫu, page types, chức năng đang có/còn thiếu, ảnh minh chứng. |
| G0-02-F002 | Khảo sát CMS hiện tại | Ghi nhận màn hình, quản lý bài viết/chương trình/media, tài khoản, workflow duyệt/xuất bản, báo cáo và khả năng xuất dữ liệu. | Danh sách menu/module CMS, quyền truy cập được cấp và chức năng thực tế. |
| G0-02-F003 | Khảo sát mã nguồn và công nghệ | Kiểm tra công nghệ, repository, dependency, môi trường build, tình trạng bảo trì và điểm chặn kế thừa (nếu được phép đọc mã). | Ma trận codebase/stack/version/dependency và rủi ro kỹ thuật. |
| G0-02-F004 | Khảo sát database, API và tích hợp | Kiểm kê loại database, schema cấp cao, nhóm dữ liệu, danh sách API, bên sở hữu, loại xác thực, tích hợp hiện hữu. | Sơ đồ nguồn dữ liệu và bảng inventory endpoint/integration cấp cao. |
| G0-02-F005 | Khảo sát hạ tầng và vận hành | Kiểm kê môi trường, hosting/cloud/server, domain/DNS, storage, backup, phân quyền hệ thống, quy trình release, monitoring và trách nhiệm vận hành. | Bảng tài nguyên/môi trường và trạng thái tài liệu backup/log/giám sát. |
| G0-02-F006 | Kiểm kê kho tài sản số | Đếm theo nguồn/loại nội dung: bài viết, hình ảnh, chương trình, series, tập, video/file gốc/bản phát; dung lượng, định dạng và thời gian. | Bảng số lượng, dung lượng, định dạng, nơi lưu, khoảng thời gian bao phủ và phương pháp lấy số liệu. |
| G0-02-F007 | Khảo sát các kênh nội dung bên ngoài | Ghi nhận các kênh Facebook/TikTok/YouTube, cấu trúc nội dung, mức quyền quản trị, dữ liệu có thể xuất, API và hạn chế quyền truy cập. | Inventory kênh, người quản lý, định dạng được hỗ trợ, dữ liệu truy cập được/không được. |
| G0-02-F008 | Đánh giá chất lượng dữ liệu hiện có | Chọn mẫu đại diện để kiểm tra metadata, nội dung thiếu, ID/URL bất nhất, trùng lặp, broken links và liên kết bài–video–chương trình. | Báo cáo tỷ lệ lỗi theo mẫu, tiêu chí chọn mẫu, vấn đề dữ liệu và độ tin cậy. |
| G0-02-F009 | Khảo sát lưu lượng và hiệu năng thực tế | Tổng hợp traffic, người dùng đồng thời, lượt xem video, peak, log lỗi, tình trạng dừng/giật và công cụ đo hiện hữu. | Baseline từ logs/analytics thực có, khoảng thời gian đo và ghi chú chưa kiểm chứng. |
| G0-02-F010 | Đánh giá khả năng kế thừa và báo cáo hiện trạng | Tổng hợp F001–F009 để phân loại các thành phần giữ nguyên/nâng cấp/thay thế/chưa đủ dữ liệu. | Reuse Matrix và báo cáo AS-IS có luận cứ/nguồn bằng chứng, phạm vi chưa khảo sát. |

**Ranh giới:** Chỉ khảo sát và lập đánh giá AS-IS. Nghiệp vụ người dùng là G0-01; quyền sở hữu/pháp lý là G0-03; kiến trúc mới là G0-05; streaming sâu là G0-06; mapping/công cụ migration là G0-07.

## G0-03 – Phân tích bản quyền, giấy phép và điều kiện khai thác

**Mục tiêu:** Xác định điều kiện sử dụng tài sản nội dung và yêu cầu kiểm soát quyền để tránh đưa tính năng hoặc khối lượng migration không đủ quyền vào phạm vi giá cố định.

| Mã | Hạng mục công việc | Nghiệp vụ/khảo sát cần thực hiện | Đầu ra dự kiến |
|---|---|---|---|
| G0-03-F001 | Phân nhóm tài sản và chủ thể quyền | Phân loại bài viết, ảnh, video, chương trình, footage, nhạc, live recording theo người/đơn vị sở hữu và nguồn gốc. | Bảng loại asset – chủ thể quyền – bằng chứng hợp đồng/tài liệu. |
| G0-03-F002 | Kiểm kê điều kiện sử dụng video/hình ảnh/âm nhạc | Làm rõ quyền phát lại, sửa dựng, cắt clip, tạo phụ đề, lưu trữ và phân phối theo kênh/thiết bị/địa lý. | Rights Matrix theo loại tác phẩm, phạm vi dùng và hạn chế. |
| G0-03-F003 | Kiểm tra nguồn nội dung từ nền tảng bên thứ ba | Phân biệt dữ liệu do VTV8 tạo sở hữu, nội dung được cấp phép và quyền theo điều khoản Facebook/TikTok/YouTube. | Danh sách nguồn/loại nội dung cần xác minh trước nhập kho và phát lại. |
| G0-03-F004 | Rà soát giấy phép hoạt động theo chức năng | Thu thập danh mục giấy phép/điều kiện hiện có liên quan phát nội dung, tương tác, thương mại và dịch vụ trả phí. | Ma trận loại nghiệp vụ → điều kiện pháp lý cần xác nhận → đơn vị chịu trách nhiệm. |
| G0-03-F005 | Đặc tả metadata quyền trong DAM/CMS | Xác định thông tin phải ghi cho mỗi asset: nguồn, chủ quyền, phạm vi/điều kiện sử dụng, hạn dùng, bằng chứng, trạng thái xác minh. | Danh mục trường nghiệp vụ quản lý quyền và business rules tham chiếu GĐ1. |
| G0-03-F006 | Quy trình xét duyệt quyền trước xuất bản/nhập kho | Xác định bước kiểm tra quyền, cấp phê duyệt, tình huống quyền hết hạn/không rõ/hạn chế. | Sơ đồ workflow quyền và quy tắc chặn/cảnh báo. |
| G0-03-F007 | Phân định trách nhiệm và phê duyệt | Xác định ai lập hồ sơ, ai cung cấp chứng cứ, ai xác nhận quyền và ai xử lý khiếu nại. | RACI kiểm soát quyền; danh sách cơ chế bàn giao yêu cầu kỹ thuật. |
| G0-03-F008 | Ràng buộc giai đoạn tương lai | Xem xét ràng buộc đối với comment/community, VOD trả phí/DRM, video 2K–8K, quảng cáo/affiliate và AI khai thác dữ liệu. | Danh mục điều kiện mở khóa tính năng theo GĐ2–GĐ4. |
| G0-03-F009 | Tổng hợp rủi ro và hồ sơ xin xác nhận | Nhận diện nội dung thiếu hợp đồng, hồ sơ quyền không đầy đủ, hạn khai thác hoặc xung đột phân phối. | Rights Risk Register, danh sách câu hỏi pháp lý và quyết định đang chờ. |

**Ranh giới:** Là phân tích ràng buộc nghiệp vụ và ma trận kiểm soát quyền, KHÔNG phải dịch vụ kết luận hoặc tư vấn pháp lý chính thức; việc xác nhận hiệu lực pháp lý do VTV8/bộ phận pháp lý có thẩm quyền thực hiện.

## G0-04 – Thiết kế trải nghiệm và cấu trúc thông tin

**Mục tiêu:** Chốt kiến trúc thông tin, các hành trình sử dụng trọng tâm và mức thiết kế UX/UI đầu vào GĐ1; giữ khả năng mở rộng nội dung/đối tượng sau này.

| Mã | Hạng mục công việc | Nghiệp vụ/khảo sát cần thực hiện | Đầu ra dự kiến |
|---|---|---|---|
| G0-04-F001 | Định nghĩa đối tượng và nhu cầu trải nghiệm | Phân biệt người xem không đăng nhập, quản trị viên, biên tập, người duyệt và định hướng người dùng/đối tác sau này. | Personas/roles phục vụ UX và danh mục nhu cầu ưu tiên. |
| G0-04-F002 | Thiết kế taxonomy nội dung | Quy ước loại nội dung, chuyên mục, tag/chủ đề, chương trình, series, nhân vật, địa danh, di sản, sự kiện và mối liên kết. | Cây taxonomy, glossary và quy tắc gắn nhãn/liên kết. |
| G0-04-F003 | Xây dựng sitemap website và CMS | Tổ chức cấu trúc trang, menu, cấp chuyên mục, trang chi tiết và chức năng quản trị theo nhóm. | Sitemap website + sơ đồ điều hướng CMS, xác định phần V1 và phần mở rộng. |
| G0-04-F004 | Phân tích hành trình người xem ưu tiên | Thiết kế luồng truy cập trang chủ → chuyên mục → bài/video; tìm chương trình; xem livestream và xem lại. | User journeys, trạng thái trang/case không có nội dung/lỗi. |
| G0-04-F005 | Phân tích hành trình sử dụng CMS | Luồng tạo nội dung, biên tập, duyệt, upload media, gắn taxonomy và xuất bản. | Task flow admin theo vai trò, trạng thái và quyền cơ bản. |
| G0-04-F006 | Wireframe nhóm trang website | Thiết kế khung các mẫu trang chính: trang chủ, chuyên mục, bài, chi tiết chương trình, trang video, lịch phát/live. | Wireframe có mã màn hình, mô tả cấu phần, trạng thái. |
| G0-04-F007 | Wireframe nhóm trang CMS | Thiết kế khung dashboard/danh sách/chỉnh sửa/nội dung chờ duyệt/thư viện media và nghiệp vụ quan trọng. | Wireframe CMS theo role/luồng, không bắt buộc pixel-perfect. |
| G0-04-F008 | Quy tắc responsive và accessibility | Xác định nguyên tắc điều hướng desktop/mobile, hiển thị player/media, typography, trạng thái lỗi và khả năng tiếp cận. | Danh mục yêu cầu UX phi chức năng, breakpoint định hướng. |
| G0-04-F009 | UI direction và thành phần giao diện dùng chung | Đề xuất định hướng nhận diện, mẫu thành phần card/video/list/editorial status và guideline sơ bộ. | Moodboard/design direction, danh sách component dùng chung. |
| G0-04-F010 | Prototype và vòng rà soát | Ghép luồng đại diện để review với VTV8; ghi nhận phản hồi và những quyết định còn mở. | Prototype theo mức fidelity thỏa thuận và log phản hồi/xác nhận. |

**Ranh giới:** Thiết kế cấu trúc thông tin, user flow và wireframe/prototype theo số lượng được thống nhất. Không mặc định thiết kế pixel-perfect mọi trang GĐ1–GĐ4, không lập trình giao diện.

## G0-05 – Thiết kế kiến trúc nền tảng, dữ liệu và bảo mật

**Mục tiêu:** Xây dựng phương án solution architecture đáp ứng GĐ1 và phát triển tăng dần qua GĐ2–GĐ4, có khung yêu cầu phi chức năng và trách nhiệm vận hành rõ ràng.

| Mã | Hạng mục công việc | Nghiệp vụ/khảo sát cần thực hiện | Đầu ra dự kiến |
|---|---|---|---|
| G0-05-F001 | Xác định NFR và giả định quy mô | Làm rõ SLA dự kiến, đối tượng sử dụng, số bài/video, peak traffic, phân loại CCU đọc trang vs CCU xem video, lưu trữ và retention. | NFR Register có mục tiêu/cách đo/nguồn số liệu/chưa xác nhận. |
| G0-05-F002 | Phân rã ứng dụng và service boundaries | Xác định các phân hệ Web/CMS/Content/DAM/User/Search/Live/Analytics/Commerce theo giai đoạn. | Component diagram và responsibility boundaries/API ownership cấp tổng thể. |
| G0-05-F003 | Kiến trúc dữ liệu và entity tổng thể | Định nghĩa nhóm entity chính: content, media asset, program/series, location, heritage, author, role, rights, audience (sau này). | Conceptual ERD/data flow và ownership dữ liệu. |
| G0-05-F004 | Chiến lược lưu trữ, tìm kiếm và cache | So sánh hướng sử dụng PostgreSQL, Redis, object storage, search, analytics theo nhu cầu và lộ trình triển khai. | Technology options cùng điều kiện bật thêm thành phần. |
| G0-05-F005 | Danh mục tích hợp và hợp đồng dữ liệu cấp cao | Đặt ranh giới API giữa website/CMS/media/partner và bên thứ ba, mô hình xác thực, lỗi/truyền lại. | System Context + Integration Register cấp cao. |
| G0-05-F006 | Kiến trúc identity, phân quyền và bảo vệ dữ liệu | Định hướng IAM CMS, RBAC, secret management, bảo vệ dữ liệu người dùng, audit và quyền truy cập asset. | Security baseline và quyền kỹ thuật cấp kiến trúc. |
| G0-05-F007 | Hạ tầng triển khai và khả năng mở rộng | Lớp web/app, DB, cache, storage, CDN edge, load balancing, WAF, môi trường stage/production và đường mở rộng. | Deployment topology sơ bộ, sizing assumptions và điểm bottleneck. |
| G0-05-F008 | Sao lưu, khôi phục và observability | Xác định backup/restore, retention log, metrics/alerting, phân loại sự cố, đề xuất RPO/RTO/SLA cần xác nhận. | Operation/NFR checklist, mục tiêu phục hồi chưa chốt. |
| G0-05-F009 | Đánh giá phương án công nghệ và chi phí | So sánh kế thừa/xây mới, monolith/modular vs chia dịch vụ, managed services vs self-hosted và các rủi ro. | Decision matrix về trade-off: effort, vận hành, mở rộng, vendor lock-in. |
| G0-05-F010 | Lộ trình kiến trúc và rà soát giải pháp | Xác định kiến trúc V1 tối thiểu và các điểm mở rộng cho GĐ2–GĐ4; ghi các quyết định cần phê duyệt. | Architecture Decision List, roadmap kỹ thuật và checklist review. |

**Ranh giới:** Solution architecture cấp tổng thể, nguyên tắc data/security/NFR, không đi sâu mọi endpoint hoặc triển khai hạ tầng production; media pipeline chuyên sâu thuộc G0-06.

## G0-06 – Đánh giá và thiết kế giải pháp Video/Livestream

**Mục tiêu:** Có phương án xử lý và phân phối VOD/livestream thực tế, phụ thuộc đối tác rõ ràng, đặc biệt với mục tiêu tải cao và vấn đề gián đoạn đã được mô tả.

| Mã | Hạng mục công việc | Nghiệp vụ/khảo sát cần thực hiện | Đầu ra dự kiến |
|---|---|---|---|
| G0-06-F001 | Đối chiếu quy trình phát sóng và sự cố hiện hữu | Thu thập lịch live, số nguồn đồng thời, chất lượng nguồn, lịch sử dừng luồng/giật-lag, cách chuyển qua YouTube embed. | Incident baseline và tình huống vận hành cần hỗ trợ. |
| G0-06-F002 | Khảo sát năng lực và trách nhiệm VTVcab/VTVprime | Làm rõ streaming ingest, encode/transcode, recording, HLS/DASH, DRM (nếu có), CDN, API, SLA và người đầu mối. | Vendor Capability Matrix có trạng thái đã xác minh/chưa có dữ liệu. |
| G0-06-F003 | Phương án tiếp nhận luồng và vận hành sự kiện | Xác định đầu vào từ studio/camera, phương thức ingest RTMP/SRT dự kiến, luồng backup và cách chủ động xử lý nguồn. | Sơ đồ ingest/failover dự kiến và yêu cầu đối tác cung cấp. |
| G0-06-F004 | Transcoding, bitrate và chất lượng đầu ra | Đề xuất profiles, ABR, encode/transcode, định dạng/độ phân giải theo thiết bị; phân biệt V1 với 2K/4K/8K dài hạn. | Profile ladder dự kiến và bảng lựa chọn có giả định. |
| G0-06-F005 | Packaging, player và thiết bị xem | Xác định HLS/DASH, nhúng player hay SDK, mobile/browser hỗ trợ, controls, fallback và quyền xem. | Player Integration Requirements và compatibility matrix. |
| G0-06-F006 | Lịch phát, ghi hình, phát lại và thư viện VOD | Phân tích kết nối lịch phát với video asset, trạng thái live, recording, cắt/chuyển phát lại và lưu tài liệu. | Business-to-media handoff và flow live → archive/VOD. |
| G0-06-F007 | Kiến trúc origin, shield và CDN | Xác định nguồn phát, origin/storage, origin shielding, edge cache, phương án chống hot-link và traffic split. | Streaming Distribution Diagram và boundaries giữa vendor và hệ thống. |
| G0-06-F008 | Phân tích 120.000 CCU và kịch bản băng thông | Tách viewer CCU/website CCU; tính bitrate, giờ peak, traffic, vùng phân phối, cache hit, retention; kịch bản 3 Mbps và 6 Mbps là ví dụ trong nguồn. | Traffic Model với giả định và công thức rõ ràng, vùng có thể kiểm thử. |
| G0-06-F009 | SLA, QoE, bảo vệ hệ thống và phương án sự cố | Xác định stall/rebuffering, start-up time, packet loss (nếu đo), monitoring, RTO/incident contacts, DDoS/WAF. | Media QoE/SLA requirement register và workflow escalation. |
| G0-06-F010 | So sánh giải pháp, dự toán và kế hoạch kiểm chứng | So sánh phương án kế thừa VTVcab, thuê dịch vụ media/CDN và tự vận hành; điều kiện PoC/benchmark. | Option Assessment + chi phí theo kịch bản + checklist kiểm chứng thực tế. |

**Ranh giới:** Khảo sát/so sánh/thiết kế phương án VOD/live. Không mặc định làm PoC/load-test thực tế, trả phí CDN hoặc cấu hình/triển khai production trong GĐ0.

## G0-07 – Phân tích và thiết kế phương án chuyển đổi dữ liệu

**Mục tiêu:** Thiết kế hướng chuyển nội dung lịch sử và media sang nền tảng mới có kiểm soát nguồn gốc/quyền, chất lượng và khả năng đối soát; làm rõ khối lượng để báo giá GĐ1.

| Mã | Hạng mục công việc | Nghiệp vụ/khảo sát cần thực hiện | Đầu ra dự kiến |
|---|---|---|---|
| G0-07-F001 | Chốt phạm vi nguồn và đích | Liệt kê hệ thống/loại nội dung, giai đoạn dữ liệu, khối lượng, phạm vi bao gồm/ngoài phạm vi. | Source-to-Target Scope Matrix với nguồn/chủ sở hữu/quyền truy cập. |
| G0-07-F002 | Khảo sát khả năng trích xuất | Đánh giá API/export/database dump/manual files, phân trang, rate limit, định dạng và môi trường thao tác. | Extraction Feasibility Matrix cùng hạn chế/tần suất. |
| G0-07-F003 | Data mapping nội dung có cấu trúc | Ánh xạ bài viết/chuyên mục/tác giả/chương trình/series/tập/nhân vật/địa danh/di sản/sự kiện/tag. | Bảng mapping entity/field, khóa/ID liên kết và mapping chưa rõ. |
| G0-07-F004 | Mapping media và metadata | Ánh xạ file gốc, rendition, thumbnail, codec/định dạng, mô tả, ngày sản xuất và nguồn nội dung. | Media Metadata Mapping và danh sách trường thiếu cần bổ sung. |
| G0-07-F005 | Cổng kiểm tra quyền trước nhập/xuất bản | Xác định rule xét quyền sở hữu/khai thác, quyền người xuất hiện/nhạc/hạn dùng theo G0-03. | Rights Gate Rules: pass/review/block và hồ sơ chứng cứ. |
| G0-07-F006 | Chiến lược chuẩn hóa và khử trùng | Xác định quy tắc URL/ID, normalized text, media checksum/hash nếu khả thi, xử lý item thiếu/trùng. | Data Quality Rules và mức xử lý thủ công/ tự động. |
| G0-07-F007 | Thiết kế pipeline batch, retry và nhật ký | Xác định luồng extract→transform→validate→import, idempotency, retry, resume, logs và báo cáo lỗi. | Migration Pipeline Diagram và yêu cầu nonfunctional. |
| G0-07-F008 | Kịch bản dry-run, kiểm thử và đối soát | Đề xuất lấy mẫu, đối soát số lượng/bản ghi/media URL/metadata/quyền, tiêu chí đạt và cách báo cáo. | Dry-run checklist và Reconciliation Plan. |
| G0-07-F009 | Chiến lược cutover, rollback và SEO | Đề xuất từng đợt chuyển, thời gian đóng băng cập nhật, redirect URL cũ, backup, fallback, trách nhiệm chốt go-live. | Cutover/Rollback Plan và bảng rủi ro. |
| G0-07-F010 | Tổng hợp khối lượng và công việc triển khai | Đếm nguồn, connector, mapping, chất lượng dữ liệu, định dạng media, khối lượng kiểm thử và xử lý thủ công. | Migration WBS Inputs để GĐ1 ước tính code/tích hợp/nhân sự. |

**Ranh giới:** Xây migration strategy, không chạy migration thật, không tự thu thập nội dung trái quyền; việc xây connector, import/rollback ở GĐ1.

## G0-08 – Xây dựng hồ sơ triển khai, nghiệm thu và dự toán

**Mục tiêu:** Đóng gói đầu ra GĐ0 thành bộ hồ sơ quyết định phạm vi và căn cứ báo giá từng giai đoạn, tách phần chắc chắn/phương án/giả định và chi phí vendor.

| Mã | Hạng mục công việc | Nghiệp vụ/khảo sát cần thực hiện | Đầu ra dự kiến |
|---|---|---|---|
| G0-08-F001 | Tổng hợp và phân loại yêu cầu/phạm vi | Hợp nhất các yêu cầu theo GĐ0–GĐ4, đánh dấu SOURCE/PROPOSED/TBC, Included/Optional/Excluded và trạng thái xác nhận. | Scope Register có ID, ranh giới và nguồn căn cứ. |
| G0-08-F002 | Phân rã WBS theo giai đoạn/module/feature | Tạo WBS cho GĐ1 ở mức có thể ước tính khi đủ dữ kiện; GĐ2–GĐ4 theo kịch bản và mức chi tiết phù hợp. | WBS theo phase/module/feature, ghi rõ làm mới hay nâng cấp/tái sử dụng. |
| G0-08-F003 | Danh mục sản phẩm bàn giao và nghiệm thu | Định nghĩa deliverable theo module/giai đoạn, thành phần bàn giao và acceptance criteria kiểm chứng được. | Deliverable & Acceptance Matrix có người xác nhận. |
| G0-08-F004 | Ma trận phụ thuộc, tích hợp và trách nhiệm | Gắn phụ thuộc codebase, dữ liệu, quyền, giấy phép, streaming vendor, payment/partner và người chịu trách nhiệm. | Dependency/RACI Matrix, điều kiện tiên quyết và các blocker. |
| G0-08-F005 | Mô hình nhân sự và tổ chức thực hiện | Xác định các vai trò BA, UX, architecture, FE, BE, QA, DevOps, media và cách huy động theo công đoạn. | Staffing/Role plan sơ bộ và phạm vi trách nhiệm. |
| G0-08-F006 | Roadmap, milestone và tiến độ | Xếp thứ tự các giai đoạn, hạng mục có thể song song, mốc khảo sát/thiết kế/kiểm thử/nghiệm thu và đường găng. | Timeline/Roadmap cấp pha cùng các giả định tiến độ. |
| G0-08-F007 | Quy tắc effort và hạch toán BA/Design | Lập nguyên tắc: code feature theo giờ 1 Middle FE/BE, Excel tính BA/Design/QA từ coding; GĐ0 tư vấn riêng và loại chi phí đã bàn giao khỏi phần tính trùng. | Estimation Rules & Overlap Register. |
| G0-08-F008 | Tách chi phí phát triển và chi phí vận hành | Phân loại development, DevOps/QA đặc biệt, media CDN/egress/storage, DRM, AI API, license, duy trì/bảo trì, dự phòng. | Cost Category Matrix: one-time, recurring, usage và bên thanh toán. |
| G0-08-F009 | Phương án đầu tư, rủi ro và giả định | Tạo lựa chọn theo phương án streaming VTVcab/tự vận hành, commerce A/B/C và công nghệ tương ứng; rủi ro nguồn dữ liệu/pháp lý. | Option & Risk Register, Assumption/Exclusion List. |
| G0-08-F010 | Quản trị thay đổi và hồ sơ quyết định | Xác định owner, quy trình xử lý yêu cầu mới, cách chốt baseline và ảnh hưởng effort/timeline. | Decision Log, Change Control Protocol và danh sách approval cần có. |
| G0-08-F011 | Ánh xạ vào workbook báo giá và rà soát | Ánh xạ WBS sang Overview/DetailEstimation/Team Estimation/Timeline/Assumption/Config, rà soát công thức và các nhóm chi phí. | Quotation Input Checklist và mapping WBS→Excel. |

**Ranh giới:** Không khảo sát lại các module G0-01 đến G0-07; không tạo giả định đơn giá vendor chưa có; không định giá cố định GĐ2–GĐ4 khi scope chưa đủ chốt.

## 4. Ranh giới trách nhiệm giữa các module

| Nội dung | Chủ sở hữu phân tích | Ghi chú tránh trùng |
|---|---|---|
| Vai trò, quy trình hiện tại/tương lai, backlog chức năng | G0-01 | G0-02 chỉ kiểm kê cái đang có |
| Website/CMS hiện hữu, source/API, asset, traffic AS-IS | G0-02 | G0-06 phân tích streaming chuyên sâu |
| Quyền sở hữu, điều kiện khai thác, giấy phép | G0-03 | G0-07 chỉ đưa quyền thành migration gate |
| Sitemap, taxonomy, luồng trải nghiệm, wireframe | G0-04 | G0-05 dùng taxonomy để lên data architecture |
| Kiến trúc ứng dụng/dữ liệu/bảo mật và NFR tổng thể | G0-05 | G0-06 thiết kế sâu phân phối video/live |
| Media ingest/transcode/origin/CDN/player/SLA/QoE | G0-06 | G0-02 thu thập baseline hiện trạng |
| Data mapping, pipeline plan, cutover/rollback | G0-07 | G0-02 kiểm kê dữ liệu, G0-03 xác minh quyền |
| WBS, deliverables, roadmap, effort rules, dự toán | G0-08 | Chỉ tổng hợp đầu ra, không khảo sát lại |

## 5. Các đầu ra gộp bắt buộc để đủ điều kiện đi tới báo giá

| Nhóm tài liệu bàn giao | Nguồn |
|---|---|
| BRD, stakeholder, workflows AS-IS/TO-BE, backlog có source/status | G0-01 |
| Inventory website, CMS, codebase, API, infra, tài sản, traffic và khả năng kế thừa | G0-02 |
| Rights Matrix, license/compliance conditions, open issues | G0-03 |
| Sitemap/taxonomy, user journeys, wireframe/prototype theo phạm vi | G0-04 |
| Architecture, conceptual data model, NFR, integration/deployment register | G0-05 |
| Media options, video pipeline, traffic/CDN/capacity scenarios và test plan | G0-06 |
| Migration Strategy, mapping, rules và cutover/verification plan | G0-07 |
| Scope/WBS, RACI, milestones, acceptance, risk/assumption, cost categories, mapping báo giá | G0-08 |

## 6. Giả định và thông số cần VTV8 xác minh

1. **Số liệu nguồn:** khoảng 70 bài/ngày, 20 GB video/ngày, traffic thường 2.000–3.000 CCU, từng nêu 80.000 CCU, mục tiêu 120.000 CCU; cần kiểm chứng thời gian đo và cách tính.
2. **Quyền tiếp cận:** source code, CMS, database, kho media, analytics/logs, các tài khoản/kênh bên thứ ba.
3. **VTVcab/VTVprime:** năng lực media, API, SLA, kịch bản tải, giá và ranh giới trách nhiệm chưa được đối tác xác nhận.
4. **Quyền nội dung:** tài sản đăng trên kênh bên ngoài có thể cần xác minh riêng quyền lưu trữ/phát lại.
5. **GĐ2–GĐ4:** account, paywall/DRM, bình luận nếu pháp lý cho phép, affiliate/booking/TMĐT và AI là định hướng, không tự động đã chốt mua/xây.
6. **UX/UI:** số màn hình, mẫu trang, mức fidelity và số vòng phản hồi phải được xác định khi ước tính.
7. **GĐ0:** số buổi khảo sát và mức độ tiếp cận dữ liệu ảnh hưởng effort; 2–4 tuần là thời gian dự kiến nguồn, chưa phải cam kết.

## 7. Nguyên tắc ước tính và tránh tính hai lần

- **Hiện chưa báo giá:** tất cả Fxxx trong bản này đều chưa có giờ công, ngày công và số tiền.
- Fxxx của **GĐ0 là công việc phân tích/khảo sát**, không phải feature code. GĐ0 cần dự toán tư vấn/thiết kế theo đầu ra và khối lượng thực tế.
- **GĐ1–GĐ4:** sau khi tính năng được chốt, chỉ nhập giờ code của **một Middle FE Developer và một Middle BE Developer**; BA/Design/QA tính theo Config của template. Không có Contract/Blockchain.
- Khi tính BA/Design giai đoạn code sau này phải **loại trừ hoặc điều chỉnh phần tài liệu/thiết kế đã trả phí và bàn giao ở GĐ0**, tránh tính trùng.
- Hạ tầng/CDN/license/egress/streaming chuyên sâu, vận hành, DevOps và tích hợp bên ngoài cần tách theo cách tính tương ứng.

## 8. Trạng thái phê duyệt

- **Chốt nội bộ:** cấu trúc 8 module GĐ0 và danh mục F001–F011 của G0-01.
- **Hoàn thành bản phân tích để rà soát:** danh mục Fxxx đầy đủ của G0-02 đến G0-08.
- **Chưa hoàn thành khảo sát thực tế:** mọi thông số và kết luận đòi hỏi quyền truy cập/biên bản.
- **Chưa chốt:** danh sách Fxxx của G0-02–G0-08 bởi người dùng, khối lượng từng đầu việc, nỗ lực, giá và nghiệm thu với VTV8.

**Tài liệu tham chiếu:** [Đề xuất hợp tác VTV8 – IIEL (.docx)](../../tai-lieu-nguon/Đề%20xuất%20hợp%20tác%20VTV8%20-%20IIEL_VTV8%20note.docx), [phương pháp ước tính giờ công](../../bao-gia/PHUONG-PHAP-UOC-TINH.md).
