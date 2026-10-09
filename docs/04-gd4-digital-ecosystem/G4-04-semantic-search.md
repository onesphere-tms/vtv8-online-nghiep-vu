# G4-04 – Tìm kiếm ngữ nghĩa trên kho nội dung

> **GĐ4 – DRAFT phân tích nghiệp vụ 09/10/2026; chưa được VTV8 phê duyệt hoặc dự toán FE/BE.** Đây là nhóm năng lực dài hạn, CORE là nền tảng **khi nhóm được chọn kích hoạt**, không có nghĩa cả GĐ4 phải đồng thời phát triển.

## Mục tiêu
Tìm video/bài/chương trình bằng câu hỏi ngôn ngữ tự nhiên và tìm đến đoạn transcript liên quan, kế thừa tìm kiếm từ khóa G2-04; không tự coi kết quả AI là thông tin đúng nếu thiếu nguồn.

## Phân kỳ và kế thừa
- **Nhóm:** B – AI Content Intelligence.
- **Tái sử dụng:** G1-04 taxonomy, G1-05 DAM rights, G2-04 full-text search, G4-03 transcript approved và G4-08 dữ liệu phân tích nếu đã bật; không lập CMS, rights hoặc keyword search thứ hai.
- Chỉ làm CONDITIONAL/OPTION sau khi xác định điều kiện liên quan ở [release gates](G4-RELEASE-GATES.md).

## Danh mục tính năng (8)

| Mã | Tính năng | Actor | Nghiệp vụ/đầu ra | FE mới | BE/Integration mới | Nghiệm thu sơ bộ | Phạm vi | Căn cứ | Gate/giả định |
|---|---|---|---|---|---|---|---|---|---|
| G4-04-F001 | **Chuẩn hóa đoạn transcript để lập chỉ mục** | Kỹ thuật nội dung | Chỉ lấy transcript/timecodes đã duyệt, chia đoạn phù hợp để tìm theo ngữ nghĩa, giữ liên kết bản media nguồn. | UI trạng thái indexing tối thiểu từ DAM | Chunking/normalization pipeline, metadata/content IDs, index eligibility | Mỗi đoạn có nguồn, thời gian và trạng thái quyền truy cập đúng. | CORE | TAI | AI_TRANSCRIPT |
| G4-04-F002 | **Tạo embeddings và chỉ mục vector** | Kỹ thuật | Biểu diễn đoạn transcript và metadata thành vector theo mô hình/provider được chọn, có version, retry và chi phí theo dữ liệu. | Không yêu cầu UI người dùng riêng | Embedding provider/worker, vector index, model version và quota | Có thể xây lại chỉ mục và không đưa content chưa được duyệt vào kho công khai. | CORE | TAI | VECTOR_PROVIDER |
| G4-04-F003 | **Tìm kiếm nội dung bằng câu tự nhiên** | Người xem; biên tập | Nhập câu hỏi như chương trình về kiến trúc Huế 2023–2026, trả danh sách nguồn phù hợp; không tự tổng hợp câu trả lời thành khẳng định nguồn. | Search query UX và kết quả theo nguồn | Semantic retrieval API, candidate ranking và query guards | Trả video/bài có thực; truy vấn không có kết quả được báo rõ, không bịa nguồn. | CORE | TAI | SEARCH_MODEL |
| G4-04-F004 | **Hiển thị đoạn trích có timecode và mở video tương ứng** | Người xem | Kết quả hiển thị trích đoạn/timestamp đã duyệt, nhấn sẽ chuyển đến phút/giây video thực nếu có quyền. | Transcript-snippet card, jump-to-time/player integration | Snippet+timecode API, kiểm tra quyền trước trả text/video | Click kết quả mở đúng đoạn; không rò nội dung ngoài quyền xem. | CORE | P | MEDIA_RIGHTS |
| G4-04-F005 | **Kết hợp tìm kiếm từ khóa với ngữ nghĩa** | Người xem | Hợp nhất kết quả keyword G2-04 và semantic G4-04, ưu tiên ngữ cảnh/địa danh/mốc thời gian và loại nội dung. | Unified results, filter và phần nguồn | Hybrid ranker/normalizer, query routing và dedupe | Không hiển thị hai bản trùng; có thể dùng keyword khi vector service lỗi. | CORE | P | SEARCH_COMPAT |
| G4-04-F006 | **Áp dụng phân quyền khi truy vấn và hiển thị transcript** | Người xem; quản trị | Dữ liệu public, thuê bao premium, nội bộ và nội dung hết hạn không bị lẫn; quyết định từ DAM/entitlement G2-10. | Thông báo quyền xem từ player/paywall hiện có | Rights filter trước indexing/query và trước trả snippet/token | Truy cập API trực tiếp không lấy được transcript/tài sản bị cấm. | CORE | P | RIGHTS_GATE |
| G4-04-F007 | **Đồng bộ chỉ mục và xử lý thay đổi quyền/media** | Kỹ thuật | Khi transcript được sửa, asset thay bản, gỡ nội dung hay quyền hết hạn, xóa hoặc cập nhật vector tương ứng. | Index status/repair tối thiểu | Incremental index updates, tombstone, reindex/retry/version | Media gỡ hoặc quyền hết hiệu lực không còn xuất hiện trong query công khai. | CORE | P | INDEX_RETENTION |
| G4-04-F008 | **Đánh giá độ liên quan và kiểm soát cải thiện tìm kiếm** | Biên tập; phân tích | Tập câu hỏi thử nghiệm, ghi đánh giá kết quả phù hợp, độ trễ, chất lượng search model theo kỳ; không bắt buộc LLM trả lời tự sinh. | Evaluation list, analyst filters | Search offline evaluation, metrics, A/B hooks nếu được chọn | Có thể đối chiếu cải thiện trên bộ truy vấn kiểm thử, không mất reference nguồn. | OPTION | P | EVALUATION |

**Căn cứ:** `T4` = nhóm định hướng trong GĐ4 hoặc Membership trong mô hình kinh doanh; `TAI` = AI và ví dụ trang 11–12; `P` = chi tiết bổ sung để vận hành/kiểm thử. Chủ đề có nguồn **không có nghĩa từng thao tác chi tiết đã được VTV8 xác nhận**.

[Danh mục GĐ4](G4-DANH-MUC-TINH-NANG.md) · [Gates](G4-RELEASE-GATES.md).
