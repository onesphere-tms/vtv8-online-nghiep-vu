# G2-03 – Lịch sử xem và danh sách phát cá nhân

> **GĐ2 Media Platform – thiết kế nghiệp vụ sơ bộ 09/10/2026.** Module/tính năng đều là **đề xuất DRAFT, chưa được người dùng chốt và chưa được VTV8 xác nhận**. Không tính giờ FE/BE hoặc thời gian triển khai.

## Mục tiêu
Người xem có thể tiếp tục chương trình đang xem, tra cứu lịch sử và tự tổ chức danh sách phát.

## Ranh giới nghiệp vụ
G2-03 sở hữu dữ liệu tiến độ xem và playlist cá nhân; player vẫn G1-06/G2-06, yêu thích chỉ G2-02, đo analytics cấp nền tảng thuộc G2-11.

## Phụ thuộc và điều kiện
G2-01 user, G1-06 video playback, G1-04 episode.

## Danh mục tính năng (6)

| ID | Tính năng | Người dùng/actor | Nghiệp vụ và đầu ra | Phần FE mới | Phần BE mới | Nghiệm thu sơ bộ | Nguồn | Đề xuất phạm vi |
|---|---|---|---|---|---|---|---|---|
| G2-03-F001 | **Ghi tiến độ xem theo tài khoản** | Người xem | Lưu video, vị trí xem cuối, thời điểm, trạng thái đã xem; đồng bộ khi sử dụng thiết bị khác. | Gọi progress API tại các mốc phù hợp trong player G1-06 | Resume state API, debounce, upsert theo user/video | Đăng nhập lại cùng account vẫn khôi phục tiến độ và không ghi trùng vô hạn | T | CORE |
| G2-03-F002 | **Danh sách xem tiếp** | Người xem | Hiển thị video/tập đang xem dở từ dữ liệu tiến độ, bỏ các nội dung đã xem xong hoặc hết quyền xem. | Khối xem tiếp trên website/thư viện cá nhân | Query unfinished progress và visibility/entitlement | Đúng video, thời điểm và vị trí xem gần nhất | B | CORE |
| G2-03-F003 | **Xem lịch sử video đã xem** | Người xem | Lọc lịch sử theo thời gian và truy cập lại nội dung có thể xem. | Trang lịch sử, thời gian, phân trang | History query API và giới hạn dữ liệu theo user | Không hiển thị lịch sử của người khác | T | CORE |
| G2-03-F004 | **Xóa lịch sử hoặc từng mục xem** | Người xem | Xóa mục lịch sử hay xóa toàn bộ thông tin xem theo chính sách dữ liệu của VTV8. | Nút xóa, xác nhận, trạng thái thành công | Delete history/progress theo scope account; audit tối thiểu | Dữ liệu không còn trong phần lịch sử sau xóa; đúng phạm vi riêng tư | B | CORE |
| G2-03-F005 | **Tạo và quản lý danh sách phát cá nhân** | Người xem | Tạo, đặt tên, sửa, xóa danh sách phát và thêm/bỏ video có quyền xem. | Danh sách playlist và form chỉnh sửa | Playlist CRUD, user ownership, item relationship | Playlist chỉ thuộc người tạo; video được liên kết đúng | T | CORE |
| G2-03-F006 | **Sắp xếp và phát tuần tự danh sách cá nhân** | Người xem | Kéo sắp thứ tự video, phát tiếp trong danh sách sau khi nội dung kết thúc. | Reorder UI, next item navigation | Playlist item order, query playable videos | Không nhảy vào video hết quyền; lưu thứ tự chính xác | B | CORE |

**Ký hiệu:** `T` = nhóm yêu cầu được tài liệu VTV8 nêu trực tiếp (thao tác chi tiết có thể do phân tích bổ sung); `B` = nghiệp vụ suy luận để triển khai; `C` = phụ thuộc giấy phép/vendor/quy chế. `CORE` = đề xuất V1 Media Platform cơ sở, `OPTION`/`CONDITIONAL` = chưa mặc định thuộc phạm vi cơ sở. Mức phân loại là **đề xuất**, chưa phải hợp đồng.

[Trở về tổng quan GĐ2](README.md).
