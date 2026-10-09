# G2-06 – Nâng cấp VOD và trải nghiệm Livestream

> **GĐ2 Media Platform – phạm vi nội bộ đã chuẩn hóa 09/10/2026.** Chưa được VTV8 phê duyệt, chưa tính giờ FE/BE.

## Mục tiêu
Nâng trải nghiệm media của V1 cho người xem đã có tài khoản và nội dung có nhiều phiên bản/track.

## Ranh giới nghiệp vụ
Không làm lại player/live CMS G1-06/G1-07, media adapter G1-08; chỉ tính phần nâng cấp mới. Nội dung premium gating do G2-10, trạng thái tiến độ xem do G2-03.

## Phụ thuộc và điều kiện
G1-06/07/08, khả năng media provider về nhiều audio/subtitle/bitrate, G2-03 và G2-10.

## Danh mục tính năng (4)

| ID | Tính năng | Actor | Nghiệp vụ | FE mới | BE mới | Nghiệm thu | Nguồn | Phạm vi | Ranh giới sau rà soát |
|---|---|---|---|---|---|---|---|---|---|
| G2-06-F001 | **Tiếp tục phát từ vị trí đang xem** | Người xem đăng nhập | Nâng cấp player G1-06 để gợi ý phát từ vị trí đã lưu ở G2-03-F001; không phát triển một API hoặc bảng watch-progress khác. | Resume dialog/seek trong player hiện có | Dùng API tiến độ G2-03-F001 | Video phát lại đúng vị trí được chọn, không ghi trùng lịch sử | B | CORE | Chỉ bổ sung resume modal/seek lên player G1-06; progress API và dữ liệu ở G2-03-F001, không tạo state service khác. |
| G2-06-F002 | **Chọn chất lượng video theo nguồn cung cấp** | Người xem | Cho phép lựa chọn Auto/chất lượng được provider xuất bản; không tự sinh độ phân giải nếu chưa có. | Nút chất lượng và trạng thái lựa chọn player | Chỉ metadata rendition/provider API khi cần | Không hiển thị độ phân giải không tồn tại; Auto thích ứng đúng mức | B | CONDITIONAL | Giữ nghiệp vụ theo nguồn/đề xuất, chỉ phát triển phần mới. |
| G2-06-F003 | **Phụ đề và bản âm thanh thay thế** | Người xem | Hiển thị và chọn track phụ đề/âm thanh nếu asset/provider cung cấp; GĐ2 không tự sản xuất transcript hoặc dịch bằng AI. | Menu subtitle/audio, accessibility player | Track metadata và URL hợp lệ theo quyền asset | Phụ đề khớp video và không hiển thị track không tồn tại | B | CONDITIONAL | Giữ nghiệp vụ theo nguồn/đề xuất, chỉ phát triển phần mới. |
| G2-06-F004 | **Điều hướng tập kế tiếp và tự phát** | Người xem | Thêm tự phát/đề xuất tập kế tiếp vào player theo series G1-04; điều hướng tập cơ bản đã có G1-06-F004, thứ tự playlist cá nhân thuộc G2-03-F006. | Next-episode overlay/auto-play chọn bật/tắt | Tận dụng episode order, entitlement check khi trả phí | Không chuyển nhầm sang mục playlist hoặc tập hết quyền; chỉ phần autoplay mới. | B | CORE | Autoplay tập kế là phần mới, điều hướng tập trước/sau cơ bản đã có ở G1-06-F004; tách với thứ tự playlist G2-03-F006. |

**Quy ước:** T = nhóm yêu cầu trong nguồn VTV8, B = bổ sung suy luận, C = phụ thuộc pháp lý/vendor. CORE = đề xuất triển khai GĐ2 cơ sở, OPTION = chỉ thực hiện khi chọn, CONDITIONAL = cần gate xác nhận. Xem [66 tính năng](G2-DANH-MUC-TINH-NANG.md), [mapping 72→66](G2-MAPPING-72-66.md) và [kịch bản nghiệm thu](G2-TIEU-CHI-NGHIEM-THU.md). Chưa có giờ FE/BE.

[Trở về tổng quan GĐ2](README.md).

## Mã gộp không còn độc lập

- **G2-06-F005 – Quản lý giới hạn thời gian xem nội dung:** chuyển vào G1-05-F004 và G2-10-F002 nếu bật gói trả phí; G1-06 dùng quyền/hiển thị hiện có; không bỏ nghiệp vụ.
- **G2-06-F006 – Tối ưu trải nghiệm chuyển Live sang VOD:** chuyển vào G1-07-F007 + G1-06-F006, chỉ bổ sung CTA giao diện khi cần; không bỏ nghiệp vụ.
