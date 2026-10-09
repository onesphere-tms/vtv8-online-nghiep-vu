# G2-06 – Nâng cấp VOD và trải nghiệm Livestream

> **GĐ2 Media Platform – thiết kế nghiệp vụ sơ bộ 09/10/2026.** Module/tính năng đều là **đề xuất DRAFT, chưa được người dùng chốt và chưa được VTV8 xác nhận**. Không tính giờ FE/BE hoặc thời gian triển khai.

## Mục tiêu
Nâng trải nghiệm media của V1 cho người xem đã có tài khoản và nội dung có nhiều phiên bản/track.

## Ranh giới nghiệp vụ
Không làm lại player/live CMS G1-06/G1-07, media adapter G1-08; chỉ tính phần nâng cấp mới. Nội dung premium gating do G2-10, trạng thái tiến độ xem do G2-03.

## Phụ thuộc và điều kiện
G1-06/07/08, khả năng media provider về nhiều audio/subtitle/bitrate, G2-03 và G2-10.

## Danh mục tính năng (6)

| ID | Tính năng | Người dùng/actor | Nghiệp vụ và đầu ra | Phần FE mới | Phần BE mới | Nghiệm thu sơ bộ | Nguồn | Đề xuất phạm vi |
|---|---|---|---|---|---|---|---|---|
| G2-06-F001 | **Tiếp tục phát từ vị trí đang xem** | Người xem đăng nhập | Khi mở video, lấy progress G2-03 và đề nghị tiếp tục hoặc phát từ đầu; cập nhật vị trí xem. | Nâng player UI bằng resume modal và seek | Dùng API progress G2-03, không tạo DB lần hai | Video phát lại đúng vị trí được chọn, không ghi trùng lịch sử | B | CORE |
| G2-06-F002 | **Chọn chất lượng video theo nguồn cung cấp** | Người xem | Cho phép lựa chọn Auto/chất lượng được provider xuất bản; không tự sinh độ phân giải nếu chưa có. | Nút chất lượng và trạng thái lựa chọn player | Chỉ metadata rendition/provider API khi cần | Không hiển thị độ phân giải không tồn tại; Auto thích ứng đúng mức | B | CONDITIONAL |
| G2-06-F003 | **Phụ đề và bản âm thanh thay thế** | Người xem | Hiển thị và chọn track phụ đề/âm thanh nếu asset/provider cung cấp; GĐ2 không tự sản xuất transcript hoặc dịch bằng AI. | Menu subtitle/audio, accessibility player | Track metadata và URL hợp lệ theo quyền asset | Phụ đề khớp video và không hiển thị track không tồn tại | B | CONDITIONAL |
| G2-06-F004 | **Điều hướng tập kế tiếp và tự phát** | Người xem | Chuyển tập tiếp theo trong series, tùy chọn auto-play sau khi tập kết thúc. | Next episode overlay/countdown và lựa chọn | Episode order/entitlement query từ G1-04/G2-10 | Không tự phát nội dung ngoài quyền xem; thứ tự tập đúng | B | CORE |
| G2-06-F005 | **Quản lý giới hạn thời gian xem nội dung** | Người xem; biên tập | Hiển thị thời hạn khả dụng của video/live replay theo quyền nội dung; tận dụng DAM rights và G2-10 entitlements. | Thông báo ngày hết hạn, trạng thái unavailable | Availability window API, rights checks không nhân đôi G1-05 | Video hết hạn không tiếp tục phát, UI giải thích được | B | CORE |
| G2-06-F006 | **Tối ưu trải nghiệm chuyển Live sang VOD** | Người xem | Hiển thị tình trạng đã kết thúc live, liên kết tới bản phát lại khi được xuất bản, không xử lý recording ingestion lại. | Live page/replay CTA và trạng thái chưa sẵn sàng | Query liên kết live-replay G1-07/G1-06 | Có bản replay đúng thì điều hướng; chưa có không hiển thị nút lỗi | B | CORE |

**Ký hiệu:** `T` = nhóm yêu cầu được tài liệu VTV8 nêu trực tiếp (thao tác chi tiết có thể do phân tích bổ sung); `B` = nghiệp vụ suy luận để triển khai; `C` = phụ thuộc giấy phép/vendor/quy chế. `CORE` = đề xuất V1 Media Platform cơ sở, `OPTION`/`CONDITIONAL` = chưa mặc định thuộc phạm vi cơ sở. Mức phân loại là **đề xuất**, chưa phải hợp đồng.

[Trở về tổng quan GĐ2](README.md).
