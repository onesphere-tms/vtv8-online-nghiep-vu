# G2-11 – Phân tích hành vi người xem và chất lượng phát

> **GĐ2 Media Platform – phạm vi nội bộ đã chuẩn hóa 09/10/2026.** Chưa được VTV8 phê duyệt, chưa tính giờ FE/BE.

## Mục tiêu
VTV8 sở hữu dữ liệu tương tác người xem với nội dung và có chỉ số thực tế để tối ưu Media Platform.

## Ranh giới
Nâng từ thống kê tổng lượt xem G1-09 lên event xem theo phiên/tài khoản có kiểm soát quyền riêng tư. QoE analytics chỉ thu dữ liệu từ player/provider được phép; không tự đưa ClickHouse, big-data stack vào baseline khi chưa có tải thực.

## Phụ thuộc
G2-01 consent/privacy, G1-06/07/08 player/media, G2-02/03/05 personalization, G1-09 aggregates.

## Danh mục tính năng (8)

| ID | Tính năng | Actor | Nghiệp vụ | FE mới | BE mới | Nghiệm thu | Nguồn | Phạm vi | Ranh giới sau rà soát |
|---|---|---|---|---|---|---|---|---|---|
| G2-11-F001 | **Định nghĩa sự kiện hành vi và vòng đời phiên xem** | Product; kỹ thuật dữ liệu | Một event taxonomy/schema cho phiên xem và tương tác có consent, có nguồn gợi ý G2-05. Tiến độ xem nghiệp vụ do G2-03 lưu, không tạo kho watch-progress thứ hai. | Instrumentation trên UI/player tại sự kiện được duyệt | Event ingestion, validation/dedupe, session/anonymous pseudonym theo consent, source tags | Event có định nghĩa/đơn vị rõ, không thu dữ liệu bị cấm | T | CORE | Chốt event taxonomy/schema một lần: G2-03 ghi progress nghiệp vụ, G2-11 chỉ nhận events phục vụ analytics. Không thu định danh cá nhân khi chưa có cơ sở/phạm vi cho phép. |
| G2-11-F002 | **Ghi nhận và tổng hợp hành vi xem video** | Quản trị sản phẩm | Tổng hợp starts/completions/watch time từ event pipeline, khác pageviews G1-09 và progress G2-03. | Không bắt buộc màn riêng; instrumentation gắn player | Viewing events aggregation và public content refs | Số liệu được định nghĩa và đối soát với event mẫu; trùng event không đếm đôi. | T | CORE | Đếm starts/completions/watch time từ event schema F001; khác pageview G1-09, cần dedupe, sampling và định nghĩa session. |
| G2-11-F003 | **Dashboard người xem và hoạt động nội dung** | Quản lý nội dung; quản trị sản phẩm | Xem tài khoản đang hoạt động, lượt phát, nội dung thu hút và biến động theo thời gian; phân quyền dữ liệu báo cáo. | Dashboard chỉ số, filter period/content | Metrics API, indexes/aggregates, access guards | Chỉ số có mô tả, mốc cập nhật, không lộ lịch sử cá nhân thô | T | CORE | Giữ tính năng trong phạm vi đã phân tích; kiểm tra phụ thuộc pháp lý/vendor trước nghiệm thu. |
| G2-11-F004 | **Thống kê hành trình tương tác nội dung** | Quản trị sản phẩm | OPTION funnel người xem từ khám phá/xem đến follow hoặc mua gói khi commercial gate bật; không mặc định trong dashboard GĐ2 cơ sở. | Bảng/charts funnel đơn giản | Event correlation/aggregations, chỉ dùng events có consent | Không bật funnel vẫn có event và thống kê cơ bản; khi bật funnel số liệu các bước nhất quán. | B | OPTION | Funnel hành trình tương tác nhiều bước là BI nâng cao; yêu cầu nguồn chỉ xác nhận phân tích tương tác, không bắt buộc checkout funnel GĐ2 cơ sở (thanh toán còn CONDITIONAL). |
| G2-11-F005 | **Đo chất lượng phát từ player và nguồn streaming** | Kỹ thuật media | Nhận startup time, buffering/error, bitrate switches theo SDK/provider được hỗ trợ, đối chiếu trạng thái nguồn. | Client player instrumentation tối thiểu; màn theo dõi | QoE event API, provider metrics mapping G1-08 | Chỉ số không có API/SDK hiển thị là chưa khả dụng, không suy diễn | B | CONDITIONAL | Giữ tính năng trong phạm vi đã phân tích; kiểm tra phụ thuộc pháp lý/vendor trước nghiệm thu. |
| G2-11-F006 | **Kiểm soát lưu giữ và xóa dữ liệu hành vi** | Nhân sự vận hành; người xem | Quản lý retention/delete/anonymize trên kho sự kiện theo yêu cầu từ G2-01-F005 và chính sách quyền riêng tư, không tạo một màn quản lý riêng. | Dùng form quyền riêng tư G2-01, không tạo trang thứ hai | Retention/delete worker và anonymization theo một policy chung | Khi xóa lịch sử theo chính sách, dữ liệu analytics cá nhân được xử lý, dữ liệu tổng hợp không lộ thông tin nhận diện. | B | CORE | Retention/xóa/ẩn danh là một chính sách cùng G2-01-F005 và G2-H01-W003; ở đây chỉ BE data lifecycle, không tự tạo một trang privacy thứ hai. |
| G2-11-F007 | **Phân tích nhóm người xem và tỷ lệ quay lại** | Quản trị sản phẩm | Phân nhóm theo lần truy cập, nhóm chương trình quan tâm và tỷ lệ tiếp tục xem trong kỳ. | Dashboard cohorts đơn giản | Cohort retention queries, privacy threshold | Không cho phép nhận diện từng cá nhân qua nhóm quá nhỏ | B | OPTION | Giữ tính năng trong phạm vi đã phân tích; kiểm tra phụ thuộc pháp lý/vendor trước nghiệm thu. |
| G2-11-F008 | **Xuất báo cáo và kiểm tra chất lượng dữ liệu** | Quản trị sản phẩm; kỹ thuật dữ liệu | Export/tình trạng chất lượng dữ liệu hành vi và events nguồn gợi ý G2-05-F006, không làm riêng recommendation analytics; funnel vẫn là OPTION. | Filter/export và trạng thái dữ liệu | Shared aggregate/export, data-quality check và source-tag events | Gắn được nguồn đề xuất trong events được phép, không phụ thuộc bật funnel. | B | CORE | Xuất tổng hợp/quality checks dùng chung analytics pipeline và có định nghĩa chỉ số; không làm riêng hạ tầng data warehouse hoặc QA dashboard enterprise. |

**Quy ước:** T = nhóm yêu cầu trong tài liệu VTV8, B = bổ sung suy luận, C = có điều kiện. CORE = phạm vi cơ sở đề xuất, OPTION = tùy chọn, CONDITIONAL = phụ thuộc gate để chốt. Tất cả các chức năng trả phí G2-09/G2-10 phải vận hành thành một lát cắt xuyên module nếu được đưa vào đợt nghiệm thu. Xem [gói thương mại](G2-COMMERCIAL-RELEASE-GATE.md), [66 tính năng](G2-DANH-MUC-TINH-NANG.md), [mapping 72→66](G2-MAPPING-72-66.md). Chưa có giờ FE/BE.

[Trở về tổng quan GĐ2](README.md).
