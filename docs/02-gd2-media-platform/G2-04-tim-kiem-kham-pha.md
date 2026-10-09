# G2-04 – Tìm kiếm và khám phá nội dung

> **GĐ2 Media Platform – thiết kế nghiệp vụ sơ bộ 09/10/2026.** Module/tính năng đều là **đề xuất DRAFT, chưa được người dùng chốt và chưa được VTV8 xác nhận**. Không tính giờ FE/BE hoặc thời gian triển khai.

## Mục tiêu
Người xem tìm được bài, video, chương trình và đối tượng có cấu trúc trên dữ liệu VTV8, thay vì chỉ dùng menu/chuyên mục.

## Ranh giới nghiệp vụ
Tìm kiếm thông thường; semantic search theo AI không mặc định vì thuộc hướng AI giai đoạn sau. Nếu G1-01-F007 được chọn ở GĐ1, GĐ2 chỉ nâng cấp phần mới.

## Phụ thuộc và điều kiện
G1-03/04 CMS/taxonomy, G1-06 VOD, index thay đổi sau publish.

## Danh mục tính năng (6)

| ID | Tính năng | Người dùng/actor | Nghiệp vụ và đầu ra | Phần FE mới | Phần BE mới | Nghiệm thu sơ bộ | Nguồn | Đề xuất phạm vi |
|---|---|---|---|---|---|---|---|---|
| G2-04-F001 | **Chỉ mục tìm kiếm nội dung có cấu trúc** | Kỹ thuật; hệ thống | Lập chỉ mục bài viết, video, chương trình, nhân vật, địa danh/di sản có thể công khai; không index bản nháp. | Không UI trực tiếp | Search index schema, sync khi publish/unpublish | Nội dung gỡ không còn trong kết quả khi index cập nhật | T | CORE |
| G2-04-F002 | **Trang kết quả tìm kiếm thống nhất** | Người xem | Tìm và đọc kết quả đa loại nội dung với tiêu đề, mô tả, thumbnail và liên kết. | Search UI, kết quả dạng thẻ/danh sách, trạng thái rỗng | Unified search API, phân trang, visibility filtering | Không hiện nội dung chưa được xuất bản | T | CORE |
| G2-04-F003 | **Tự động gợi ý từ khóa khi nhập** | Người xem | Autocomplete tên chương trình, địa danh, chủ đề và từ khóa khi gõ. | Autocomplete dropdown, keyboard navigation | Suggestion prefix query, giới hạn tốc độ | Có gợi ý hữu ích, không làm lộ dữ liệu nháp | B | CORE |
| G2-04-F004 | **Lọc kết quả theo loại và chủ đề** | Người xem | Lọc theo bài/video/chương trình, chuyên mục, chủ đề và khoảng thời gian được hỗ trợ. | Filter chips, tabs và phân trang | Facet/filter search API | Kết quả khớp bộ lọc và không nhân đôi | B | CORE |
| G2-04-F005 | **Đồng bộ chỉ mục và tái tạo khi cần** | Kỹ thuật vận hành | Cập nhật index từ CMS/DAM khi có thay đổi và cung cấp job xây dựng lại chỉ mục có kiểm soát. | Trạng thái tái tạo chỉ mục nếu cần | Indexing worker, retry/reindex scripts, monitoring | Sau rebuild số nội dung công khai và kết quả truy vấn nhất quán | B | CORE |
| G2-04-F006 | **Điều chỉnh mức liên quan/khả năng chịu lỗi gõ** | Người xem; vận hành | Xử lý typo đơn giản, ưu tiên tiêu đề và sắp xếp độ phù hợp theo quy tắc đã duyệt. | Chọn sort liên quan/mới | Relevance config, fuzzy search có giới hạn | Kết quả không đánh đổi quyền truy cập lấy độ phủ tìm kiếm | B | OPTION |

**Ký hiệu:** `T` = nhóm yêu cầu được tài liệu VTV8 nêu trực tiếp (thao tác chi tiết có thể do phân tích bổ sung); `B` = nghiệp vụ suy luận để triển khai; `C` = phụ thuộc giấy phép/vendor/quy chế. `CORE` = đề xuất V1 Media Platform cơ sở, `OPTION`/`CONDITIONAL` = chưa mặc định thuộc phạm vi cơ sở. Mức phân loại là **đề xuất**, chưa phải hợp đồng.

[Trở về tổng quan GĐ2](README.md).
