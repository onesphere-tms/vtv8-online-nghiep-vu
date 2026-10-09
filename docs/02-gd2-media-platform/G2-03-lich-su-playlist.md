# G2-03 – Lịch sử xem và danh sách phát cá nhân

> **GĐ2 Media Platform – phạm vi nội bộ đã chuẩn hóa 09/10/2026.** Chưa được VTV8 phê duyệt, chưa tính giờ FE/BE.

## Mục tiêu
Người xem có thể tiếp tục chương trình đang xem, tra cứu lịch sử và tự tổ chức danh sách phát.

## Ranh giới nghiệp vụ
G2-03 sở hữu dữ liệu tiến độ xem và playlist cá nhân; player vẫn G1-06/G2-06, yêu thích chỉ G2-02, đo analytics cấp nền tảng thuộc G2-11.

## Phụ thuộc và điều kiện
G2-01 user, G1-06 video playback, G1-04 episode.

## Danh mục tính năng (6)

| ID | Tính năng | Actor | Nghiệp vụ | FE mới | BE mới | Nghiệm thu | Nguồn | Phạm vi | Ranh giới sau rà soát |
|---|---|---|---|---|---|---|---|---|---|
| G2-03-F001 | **Ghi tiến độ xem theo tài khoản** | Người xem | Một nguồn lưu watch-progress theo user/video để resume; G2-11 chỉ thu sự kiện analytics, không lưu tiếp một progress DB. | Gọi progress API tại các mốc phù hợp trong player G1-06 | Upsert progress/debounce và quy tắc đồng bộ nhiều thiết bị | Tiến độ chính xác sau đăng nhập lại, không ghi trùng và không lộ giữa tài khoản. | T | CORE | Chỉ một nguồn watch-progress và debounced API; player G2-06 đọc lại, G2-11 chỉ nhận analytics event, không có hai bộ lưu tiến độ. |
| G2-03-F002 | **Danh sách xem tiếp** | Người xem | Hiển thị video/tập đang xem dở từ dữ liệu tiến độ, bỏ các nội dung đã xem xong hoặc hết quyền xem. | Khối xem tiếp trên website/thư viện cá nhân | Query unfinished progress và visibility/entitlement | Đúng video, thời điểm và vị trí xem gần nhất | B | CORE | Continue-watching tính từ progress F001, lọc nội dung còn quyền, không tự duy trì kho 'xem tiếp' thứ hai. |
| G2-03-F003 | **Xem lịch sử video đã xem** | Người xem | Lọc lịch sử theo thời gian và truy cập lại nội dung có thể xem. | Trang lịch sử, thời gian, phân trang | History query API và giới hạn dữ liệu theo user | Không hiển thị lịch sử của người khác | T | CORE | Giữ yêu cầu theo nguồn/đề xuất, chỉ phát triển phần mới sau GĐ1. |
| G2-03-F004 | **Xóa lịch sử hoặc từng mục xem** | Người xem | Xóa mục/toàn bộ lịch sử xem cá nhân, phối hợp request từ G2-01 và retention/ẩn danh G2-11, không tự coi việc xóa là xóa aggregate. | Nút xóa, xác nhận, trạng thái thành công | Delete history/progress theo scope account; audit tối thiểu | Dữ liệu không còn trong phần lịch sử sau xóa; đúng phạm vi riêng tư | B | CORE | Xóa lịch sử liên kết quy trình xóa/ẩn danh G2-01-F005 và G2-11-F006; cần nói rõ aggregate analytics nào vẫn được giữ. |
| G2-03-F005 | **Tạo và quản lý danh sách phát cá nhân** | Người xem | Tạo, đặt tên, sửa, xóa danh sách phát và thêm/bỏ video có quyền xem. | Danh sách playlist và form chỉnh sửa | Playlist CRUD, user ownership, item relationship | Playlist chỉ thuộc người tạo; video được liên kết đúng | T | CORE | Giữ yêu cầu theo nguồn/đề xuất, chỉ phát triển phần mới sau GĐ1. |
| G2-03-F006 | **Sắp xếp và phát tuần tự danh sách cá nhân** | Người xem | Kéo sắp thứ tự video, phát tiếp trong danh sách sau khi nội dung kết thúc. | Reorder UI, next item navigation | Playlist item order, query playable videos | Không nhảy vào video hết quyền; lưu thứ tự chính xác | B | CORE | Playlist next theo thứ tự người dùng khác autoplay tập kế của G2-06-F004, dùng chung player nhưng không làm hai lần chuyển tiếp. |

**Quy ước:** T = chủ đề có trong nguồn VTV8, B = nghiệp vụ phân tích bổ sung, C = có điều kiện. CORE = đề xuất nền tảng GĐ2, OPTION = tính riêng nếu chọn, CONDITIONAL = phụ thuộc pháp lý/đối tác. Xem [Danh mục 66 tính năng](G2-DANH-MUC-TINH-NANG.md), [mapping 72→66](G2-MAPPING-72-66.md) và [nghiệm thu](G2-TIEU-CHI-NGHIEM-THU.md). Chưa có giờ FE/BE.

[Trở về tổng quan GĐ2](README.md).
