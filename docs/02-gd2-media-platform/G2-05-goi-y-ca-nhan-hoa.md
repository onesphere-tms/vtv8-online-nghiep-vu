# G2-05 – Gợi ý và cá nhân hóa nội dung

> **GĐ2 Media Platform – phạm vi nội bộ đã chuẩn hóa 09/10/2026.** Chưa được VTV8 phê duyệt, chưa tính giờ FE/BE.

## Mục tiêu
Cung cấp gợi ý dựa trên dữ liệu người xem và metadata nội dung có sẵn, giảm phụ thuộc vào danh sách thủ công.

## Ranh giới nghiệp vụ
GĐ2 chỉ đề xuất rule-based/heuristic recommendations (theo dõi, yêu thích, lịch sử, chủ đề, liên quan); AI/ML recommendation engine, semantic embeddings và profile nâng cao không mặc định.

## Phụ thuộc và điều kiện
G2-01/02/03, G1-04 taxonomy, G2-11 events nếu đã có.

## Danh mục tính năng (4)

| ID | Tính năng | Actor | Nghiệp vụ | FE mới | BE mới | Nghiệm thu | Nguồn | Phạm vi | Ranh giới sau rà soát |
|---|---|---|---|---|---|---|---|---|---|
| G2-05-F001 | **Gợi ý nội dung liên quan theo metadata** | Người xem | Chỉ nâng cấp logic liên quan/xếp hạng từ metadata G1-04 và tái dùng khối related content đã có, không tạo trang/module recommender mới. | Tái dùng khối hiển thị related content GĐ1, chỉ sửa UI khi cần | Ranking/rights filtering theo taxonomy/relations đã có | Trả danh sách hợp lệ, có tiêu chí liên quan giải thích được | T | CORE | Related content đã có ở G1-01/G1-04; chỉ phát triển xếp hạng/liên kết mới nếu khác logic GĐ1, không tính lại widget/CRUD. |
| G2-05-F002 | **Gợi ý theo chương trình đang theo dõi** | Người xem đăng nhập | Feed nội dung mới từ chương trình đang theo dõi G2-02, không tạo quan hệ follow thứ hai và không nhân đôi inbox thông báo G2-07. | Feed theo dõi, empty state | Follow-feed query từ user-program relation đã có và published program items | Người chưa theo dõi có trạng thái rỗng hợp lệ | B | CORE | Feed tập mới từ chương trình theo dõi dùng dữ liệu G2-02 và trigger G2-07; giữ trang feed riêng khi xác nhận, không tạo follow relation thứ hai. |
| G2-05-F003 | **Gợi ý theo chủ đề và lịch sử xem** | Người xem đăng nhập | Gợi ý rule-based từ follow/favorite/watch-progress (G2-02/G2-03); nếu thiếu tín hiệu thì fallback nội dung nổi bật G1-03-F009, nhận nghiệp vụ G2-05-F004. Chủ đề sở thích chỉ OPTION. | Recommendation feed sử dụng component GĐ1; hiển thị cold-start | Ranker đơn giản, quyền xem/metadata và fallback, gắn source label cho events G2-11 | Người mới vẫn có nội dung hữu ích; account khác sở thích nhận gợi ý khác nhau; không cần bật topic OPTION. | B | CORE | Giới hạn rule-based dựa follow/favorite/history; topic G2-02-F005 chỉ là OPTION. Cần quyền từ chối cá nhân hóa phù hợp chính sách. |
| G2-05-F005 | **Quy tắc ưu tiên nội dung biên tập** | Biên tập; quản lý nội dung | Tùy chọn ưu tiên nội dung biên tập sâu hơn slot G1-03-F009; nếu slot GĐ1 đáp ứng thì không triển khai cấu hình thứ hai. | Chỉ UI cấu hình thêm nếu vượt khả năng G1-03 | Rules/weight config bổ sung, không nhân đôi CMS placement | Không bỏ qua trạng thái gỡ và quyền xem | B | OPTION | Giữ nghiệp vụ theo nguồn/đề xuất, chỉ phát triển phần mới. |

**Quy ước:** T = nhóm yêu cầu trong nguồn VTV8, B = bổ sung suy luận, C = phụ thuộc pháp lý/vendor. CORE = đề xuất triển khai GĐ2 cơ sở, OPTION = chỉ thực hiện khi chọn, CONDITIONAL = cần gate xác nhận. Xem [66 tính năng](G2-DANH-MUC-TINH-NANG.md), [mapping 72→66](G2-MAPPING-72-66.md) và [kịch bản nghiệm thu](G2-TIEU-CHI-NGHIEM-THU.md). Chưa có giờ FE/BE.

[Trở về tổng quan GĐ2](README.md).

## Mã gộp không còn độc lập

- **G2-05-F004 – Gợi ý cho người mới chưa có lịch sử:** chuyển vào G2-05-F003 và G1-03-F009 (fallback theo nội dung nổi bật); không bỏ nghiệp vụ.
- **G2-05-F006 – Theo dõi hiệu quả gợi ý:** chuyển vào G2-11-F001/F008 (event analytics chung, gắn nguồn gợi ý); G2-11-F004 là funnel tùy chọn; không bỏ nghiệp vụ.
