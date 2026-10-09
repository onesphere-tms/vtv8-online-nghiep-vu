# G2-05 – Gợi ý và cá nhân hóa nội dung

> **GĐ2 Media Platform – thiết kế nghiệp vụ sơ bộ 09/10/2026.** Module/tính năng đều là **đề xuất DRAFT, chưa được người dùng chốt và chưa được VTV8 xác nhận**. Không tính giờ FE/BE hoặc thời gian triển khai.

## Mục tiêu
Cung cấp gợi ý dựa trên dữ liệu người xem và metadata nội dung có sẵn, giảm phụ thuộc vào danh sách thủ công.

## Ranh giới nghiệp vụ
GĐ2 chỉ đề xuất rule-based/heuristic recommendations (theo dõi, yêu thích, lịch sử, chủ đề, liên quan); AI/ML recommendation engine, semantic embeddings và profile nâng cao không mặc định.

## Phụ thuộc và điều kiện
G2-01/02/03, G1-04 taxonomy, G2-11 events nếu đã có.

## Danh mục tính năng (6)

| ID | Tính năng | Người dùng/actor | Nghiệp vụ và đầu ra | Phần FE mới | Phần BE mới | Nghiệm thu sơ bộ | Nguồn | Đề xuất phạm vi |
|---|---|---|---|---|---|---|---|---|
| G2-05-F001 | **Gợi ý nội dung liên quan theo metadata** | Người xem | Gợi ý bài/video cùng chủ đề, chương trình, nhân vật, địa danh/di sản ở trang chi tiết. | Khối nội dung liên quan dùng lại component website | Related-content service dựa tag/relation, không lộ nháp | Trả danh sách hợp lệ, có tiêu chí liên quan giải thích được | T | CORE |
| G2-05-F002 | **Gợi ý theo chương trình đang theo dõi** | Người xem đăng nhập | Hiển thị chương trình/tập mới từ danh sách theo dõi, sắp xếp theo ngày công khai. | Feed theo dõi, empty state | Follow-feed query, ranking đơn giản | Người chưa theo dõi có trạng thái rỗng hợp lệ | B | CORE |
| G2-05-F003 | **Gợi ý theo chủ đề và lịch sử xem** | Người xem đăng nhập | Chọn nội dung phù hợp sở thích/hành vi cơ bản; bỏ nội dung đã hết quyền hoặc không phù hợp. | Feed đề xuất cá nhân, nhãn gợi ý | Rule-based ranker, filter rights, sử dụng signals G2-02/03 | Hai tài khoản có lịch sử/sở thích khác nhau có thể nhận gợi ý khác nhau | B | CORE |
| G2-05-F004 | **Gợi ý cho người mới chưa có lịch sử** | Người xem mới/khách | Hiển thị nội dung mới, chương trình nổi bật và lựa chọn biên tập theo cấu hình GĐ1. | Khối nổi bật/vừa cập nhật, trạng thái không cần đăng nhập | Fallback popular/editorial query, quyền public | Không cần tài khoản vẫn có danh sách gợi ý hữu ích | B | CORE |
| G2-05-F005 | **Quy tắc ưu tiên nội dung biên tập** | Biên tập; quản lý nội dung | Cho phép nội dung nổi bật do biên tập ưu tiên trong một số vị trí, kế thừa slot/editorial placement G1-03. | Chỉ UI cấu hình thêm nếu vượt khả năng G1-03 | Rules/weight config bổ sung, không nhân đôi CMS placement | Không bỏ qua trạng thái gỡ và quyền xem | B | OPTION |
| G2-05-F006 | **Theo dõi hiệu quả gợi ý** | Quản trị sản phẩm | Đo số lần hiển thị, click, bắt đầu xem từ khối gợi ý để điều chỉnh quy tắc. | Báo cáo cơ bản hoặc tab theo module G2-11 | Event tags/aggregation dùng analytics G2-11 | Đo được nguồn gợi ý mà không xây lại hệ analytics | B | OPTION |

**Ký hiệu:** `T` = nhóm yêu cầu được tài liệu VTV8 nêu trực tiếp (thao tác chi tiết có thể do phân tích bổ sung); `B` = nghiệp vụ suy luận để triển khai; `C` = phụ thuộc giấy phép/vendor/quy chế. `CORE` = đề xuất V1 Media Platform cơ sở, `OPTION`/`CONDITIONAL` = chưa mặc định thuộc phạm vi cơ sở. Mức phân loại là **đề xuất**, chưa phải hợp đồng.

[Trở về tổng quan GĐ2](README.md).
