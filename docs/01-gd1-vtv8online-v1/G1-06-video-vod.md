# G1-06 – Quản lý và phát video VOD cơ bản

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Cấu trúc module đã được người dùng chọn; tính năng chi tiết là **DRAFT chờ rà soát**, không phải xác nhận của VTV8. Chưa ước tính giờ FE/BE.

## Mục tiêu
Đưa video đã có quyền lên cổng VTV8Online và cung cấp trải nghiệm xem lại theo chương trình/tập.

## Ranh giới và phụ thuộc
Không xây hệ thống video thuê bao, DRM/premium, playlist cá nhân, lịch sử xem, recommendation; encoder/CDN do G1-08 hoặc đối tác xử lý.

## Danh sách tính năng (6)

| ID | Tính năng | Actor | Luồng xử lý/đầu ra | FE cần làm | BE cần làm | Nghiệm thu sơ bộ | Nguồn | Phạm vi |
|---|---|---|---|---|---|---|---|---|
| G1-06-F001 | **Quản lý bản phát VOD và trạng thái sẵn sàng** | Biên tập; media | Gắn asset từ DAM với playback manifest/đường dẫn do hạ tầng media cung cấp, kiểm tra ready/failed trước công khai. | Màn trạng thái và chọn bản phát | Playback record, asset association, status sync | Video chưa sẵn sàng không hiển thị player lỗi cho công chúng | B | CORE |
| G1-06-F002 | **Xuất bản và danh mục video công khai** | Biên tập; người xem | Xác định tiêu đề, thumbnail, mô tả, chương trình/tập liên quan, trạng thái xuất bản và danh sách video. | Form xuất bản, video list public | Publish/read APIs, relationship to editorial & program | Video công khai có thông tin chính xác, video ẩn không hiện | T | CORE |
| G1-06-F003 | **Trình phát VOD trên website** | Người xem | Player hỗ trợ play/pause/seek/fullscreen, âm lượng, poster và nguồn phát phù hợp từ Streaming Infrastructure. | Web player, responsive, keyboard basics | Endpoint cung cấp manifest theo tình trạng/đường dẫn hợp lệ | Xem được video đã công bố trên thiết bị trình duyệt mục tiêu | B | CORE |
| G1-06-F004 | **Trang video và điều hướng tập/chương trình** | Người xem | Trang chi tiết video, metadata, tập trước/sau và video cùng chương trình; sử dụng dữ liệu chương trình G1-04. | Video detail, episode navigation | Queries related published videos/programs | Không hiện tập chưa công khai; điều hướng không nhân bản trang | B | CORE |
| G1-06-F005 | **Trạng thái lỗi phát và dự phòng UI** | Người xem; vận hành | Xử lý manifest lỗi, media không khả dụng, quá hạn quyền, đường truyền gián đoạn; hiển thị lỗi có thể hiểu được. | Error/retry/player fallback states | Availability flags, retry controlled, error logging | Không còn player trắng/treo khi nguồn lỗi | B | CORE |
| G1-06-F006 | **Phát lại sau sự kiện Livestream** | Biên tập; người xem | Nhận bản ghi từ G1-08 và liên kết với sự kiện G1-07, phê duyệt trước khi xuất bản như một video. | UI xác nhận bản ghi, liên kết video | Replay association, publication gate | Không tự công khai bản ghi nếu chưa được phê duyệt | T | CORE |

**Nguồn:** `T` = có chủ đề/yêu cầu trực tiếp trong đề xuất VTV8 (luồng chi tiết có thể suy ra); `B` = bổ sung nghiệp vụ cần thiết; `C` = tùy chọn/điều kiện. **Phạm vi:** `CORE` = đề xuất tính trong baseline GĐ1; `OPTION` = chờ quyết định, chưa tính giờ baseline. Các cột FE/BE mô tả phần việc, **không phải số giờ**.

## Điều kiện xác nhận
- Quy trình thực tế, trường dữ liệu và mẫu giao diện do GĐ0 khảo sát và các bên thống nhất.
- Tài liệu VTV8 mới nêu nhóm đối tượng/ý tưởng; việc triển khai các hành động và tiêu chí nghiệm thu là phân tích đề xuất.
- Tích hợp media và dữ liệu bên ngoài chỉ chốt sau khi xác định nguồn cung cấp và quyền truy cập.

[Xem danh mục GĐ1](README.md).