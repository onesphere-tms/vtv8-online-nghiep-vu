# G1-07 – Livestream và lịch phát sóng

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Danh mục module đã được người dùng chọn; chi tiết tính năng **DRAFT chờ rà soát với VTV8**. Chưa ước tính giờ FE/BE.

## Mục tiêu
Bộ phận chương trình lập lịch và vận hành sự kiện trực tiếp, người xem theo dõi trên website; có vòng đời phát lại.

## Ranh giới và phụ thuộc
Điều hành lịch và nội dung live thuộc G1-07; kết nối luồng, Media Server, CDN thuộc G1-08; VOD replay được xuất bản tại G1-06. Không tích hợp mạng xã hội.

## Danh sách tính năng (8)

| ID | Tính năng | Actor | Luồng xử lý/đầu ra | FE cần làm | BE cần làm | Nghiệm thu sơ bộ | Nguồn | Phạm vi |
|---|---|---|---|---|---|---|---|---|
| G1-07-F001 | **Danh mục chương trình/sự kiện livestream** | Bộ phận chương trình | Tạo/sửa thông tin chương trình trực tiếp, loại bản tin trưa/tối/chương trình đặc biệt/sự kiện, ảnh đại diện và mô tả. | List/form lịch live, chọn chương trình G1-04 | Live event CRUD, program relation, status rules | Một sự kiện có loại, tên, thời gian và nội dung liên kết rõ | T | CORE |
| G1-07-F002 | **Lập và thay đổi lịch phát** | Bộ phận chương trình | Lên lịch ngày/giờ bắt đầu và thời lượng dự kiến, cập nhật/hủy buổi phát; cảnh báo lịch chồng nếu dùng cùng kênh. | Calendar/list schedule, conflict feedback | Schedule validation, timezone, channel collision guard | Lịch không bị sai timezone và xung đột kênh được cảnh báo | T | CORE |
| G1-07-F003 | **Gắn nguồn phát/kênh và kiểm tra sẵn sàng** | Kỹ thuật phát sóng | Chọn kênh/stream từ G1-08 cho sự kiện, kiểm tra đã có thông tin phát hợp lệ trước giờ lên sóng. | Source selector, health preview | Live event to stream-channel relation, readiness API | Không kích hoạt public live khi không có playback source hợp lệ | B | CORE |
| G1-07-F004 | **Trạng thái trước/đang/sau phát** | Kỹ thuật; biên tập | Quản lý dự kiến, chuẩn bị, đang live, kết thúc, hủy; ưu tiên trạng thái thật từ bên Streaming, cho phép thao tác tay có kiểm soát khi tích hợp hạn chế. | Control panel, status badge, operator action | State sync/overrides guarded, audit | Trạng thái không tự chuyển sai khi đối tác mất tín hiệu | B | CORE |
| G1-07-F005 | **Trang xem trực tiếp** | Người xem | Hiển thị chương trình đang phát, player, mô tả, lịch kế tiếp và thông báo khi chưa đến giờ; không cần tài khoản. | Trang live, responsive player shell | API danh sách current live, playback endpoint G1-08 | Truy cập lúc sắp/đang/kết thúc cho kết quả phù hợp | T | CORE |
| G1-07-F006 | **Lịch phát sóng công khai** | Người xem | Xem danh sách bản tin và sự kiện theo ngày, bộ lọc thời gian/loại, điều hướng tới trang chương trình. | Schedule list/calendar UI | Public schedule API, exclude unpublished | Lịch phản ánh đúng thay đổi từ CMS | T | CORE |
| G1-07-F007 | **Kết thúc live và chuyển sang phát lại** | Kỹ thuật; biên tập | Khi live kết thúc, lấy trạng thái recording, tạo nội dung bản ghi chờ biên tập, liên kết VOD G1-06; có thể không có recording. | Replay status, confirm/link editor | Recording webhook/status lookup, replay association | Không xuất hiện bản phát lại nếu không có file/không đủ quyền | T | CORE |
| G1-07-F008 | **Thông báo gián đoạn và trạng thái sự cố** | Người xem; kỹ thuật | Hiển thị cảnh báo khi luồng lỗi/mất nguồn, tự thử lại có giới hạn và trạng thái chuyển phương án dự phòng do VTV8 xác nhận. | Player overlay offline/retry/info | Vendor status mapping, incident reason flags | Người xem không gặp màn đen kéo dài không thông báo | B | CORE |

**Nguồn:** `T` = nêu trực tiếp trong tài liệu VTV8 về nghiệp vụ hoặc yêu cầu kỹ thuật (chi tiết triển khai vẫn có phần suy luận); `B` = suy luận cần thiết; `C` = phụ thuộc vendor/quyết định. **Phạm vi:** `CORE` = baseline đề xuất, `CONDITIONAL` = chỉ tính effort sau khi phương án được xác nhận. Không nhầm `CORE` với yêu cầu đã được VTV8 ký duyệt.

## Điểm xác nhận trước dự toán
- Cần bản phân công trách nhiệm VTV8/IIEL/VTVcab, tài khoản kỹ thuật, mẫu dữ liệu và trường hợp lỗi thực tế.
- Nếu nhà cung cấp không cung cấp API/kênh recording/cơ sở dữ liệu cần thiết, cập nhật phương án và ước tính lại.
- Mục tiêu 120.000 CCU/SLA trong tài liệu là **yêu cầu kiểm chứng** chứ không phải năng lực đã được đo đạt.

[Xem danh mục GĐ1](README.md).