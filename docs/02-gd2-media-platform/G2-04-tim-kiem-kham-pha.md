# G2-04 – Tìm kiếm và khám phá nội dung

> **GĐ2 Media Platform – phạm vi nội bộ đã chuẩn hóa 09/10/2026.** Chưa được VTV8 phê duyệt, chưa tính giờ FE/BE.

## Mục tiêu
Người xem tìm được bài, video, chương trình và đối tượng có cấu trúc trên dữ liệu VTV8, thay vì chỉ dùng menu/chuyên mục.

## Ranh giới nghiệp vụ
Tìm kiếm thông thường; semantic search theo AI không mặc định vì thuộc hướng AI giai đoạn sau. Nếu G1-01-F007 được chọn ở GĐ1, GĐ2 chỉ nâng cấp phần mới.

## Phụ thuộc và điều kiện
G1-03/04 CMS/taxonomy, G1-06 VOD, index thay đổi sau publish.

## Danh mục tính năng (6)

| ID | Tính năng | Actor | Nghiệp vụ | FE mới | BE mới | Nghiệm thu | Nguồn | Phạm vi | Ranh giới sau rà soát |
|---|---|---|---|---|---|---|---|---|---|
| G2-04-F001 | **Chỉ mục tìm kiếm nội dung có cấu trúc** | Kỹ thuật; hệ thống | Index bài, video, chương trình và thực thể có trang đích công khai; kiểm tra trạng thái published và rights. Nếu tìm kiếm GĐ1 đã bật chỉ phát triển delta. | Không UI trực tiếp | Public search index/sync phù hợp và kế thừa keyword search G1-01-F007 nếu đã triển khai | Nội dung gỡ không còn trong kết quả khi index cập nhật | T | CORE | Chỉ index thực thể có trang/đường xem hợp lệ và nội dung đủ quyền; nếu search GĐ1 OPTION đã làm thì chỉ tính phần nâng cấp. |
| G2-04-F002 | **Trang kết quả tìm kiếm thống nhất** | Người xem | Tìm và đọc kết quả đa loại nội dung với tiêu đề, mô tả, thumbnail và liên kết. | Search UI, kết quả dạng thẻ/danh sách, trạng thái rỗng | Unified search API, phân trang, visibility filtering | Không hiện nội dung chưa được xuất bản | T | CORE | Giữ yêu cầu theo nguồn/đề xuất, chỉ phát triển phần mới sau GĐ1. |
| G2-04-F003 | **Tự động gợi ý từ khóa khi nhập** | Người xem | Tùy chọn autocomplete khi gõ trên dữ liệu đã công khai; luồng tìm kiếm thống nhất vẫn hoạt động khi không bật. | Autocomplete dropdown, keyboard navigation | Suggestion prefix query, giới hạn tốc độ | Không cần bật autocomplete để tìm và lọc nội dung. | B | OPTION | Autocomplete có trong hướng kiến trúc nhưng không phải điều kiện bắt buộc để tìm kiếm; nên để OPTION nếu chưa ưu tiên trải nghiệm này. |
| G2-04-F004 | **Lọc kết quả theo loại và chủ đề** | Người xem | Lọc theo bài/video/chương trình, chuyên mục, chủ đề và khoảng thời gian được hỗ trợ. | Filter chips, tabs và phân trang | Facet/filter search API | Kết quả khớp bộ lọc và không nhân đôi | B | CORE | Giữ yêu cầu theo nguồn/đề xuất, chỉ phát triển phần mới sau GĐ1. |
| G2-04-F005 | **Đồng bộ chỉ mục và tái tạo khi cần** | Kỹ thuật vận hành | Đồng bộ index và rebuild theo worker/CLI khi publish/gỡ, không mặc định cụm OpenSearch hay dashboard admin riêng. | Chỉ trạng thái kỹ thuật nếu vận hành có nhu cầu | Index update/reindex worker, retry và kiểm tra số record | Gỡ bài không còn trong index; rebuild không cần UI mới. | B | CORE | Index sync/reindex là BE mới hợp lệ nhưng không mặc định UI dashboard hoặc cụm OpenSearch; CLI/worker và giám sát đủ cho cơ sở. |
| G2-04-F006 | **Điều chỉnh mức liên quan/khả năng chịu lỗi gõ** | Người xem; vận hành | Xử lý typo đơn giản, ưu tiên tiêu đề và sắp xếp độ phù hợp theo quy tắc đã duyệt. | Chọn sort liên quan/mới | Relevance config, fuzzy search có giới hạn | Kết quả không đánh đổi quyền truy cập lấy độ phủ tìm kiếm | B | OPTION | Giữ yêu cầu theo nguồn/đề xuất, chỉ phát triển phần mới sau GĐ1. |

**Quy ước:** T = chủ đề có trong nguồn VTV8, B = nghiệp vụ phân tích bổ sung, C = có điều kiện. CORE = đề xuất nền tảng GĐ2, OPTION = tính riêng nếu chọn, CONDITIONAL = phụ thuộc pháp lý/đối tác. Xem [Danh mục 66 tính năng](G2-DANH-MUC-TINH-NANG.md), [mapping 72→66](G2-MAPPING-72-66.md) và [nghiệm thu](G2-TIEU-CHI-NGHIEM-THU.md). Chưa có giờ FE/BE.

[Trở về tổng quan GĐ2](README.md).
