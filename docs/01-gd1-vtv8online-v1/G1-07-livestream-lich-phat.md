# G1-07 – Livestream và lịch phát sóng

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Danh mục module đã được người dùng chọn; chi tiết tính năng **DRAFT chờ rà soát với VTV8**. Chưa ước tính giờ FE/BE.

## Mục tiêu
Bộ phận chương trình lập lịch và vận hành sự kiện trực tiếp, người xem theo dõi trên website; có vòng đời phát lại.

## Ranh giới và phụ thuộc
Điều hành lịch và nội dung live thuộc G1-07; kết nối luồng, Media Server, CDN thuộc G1-08; VOD replay được xuất bản tại G1-06. Không tích hợp mạng xã hội.

## Danh sách tính năng (8)

| ID | Tính năng | Người sử dụng | Nghiệp vụ và đầu ra | FE cần làm | BE cần làm | Nghiệm thu riêng | Nguồn | Phạm vi | Ranh giới sau QA |
|---|---|---|---|---|---|---|---|---|---|
| G1-07-F001 | **Danh mục chương trình/sự kiện livestream** | Bộ phận chương trình | Tạo phiên phát sóng thuộc chương trình/sự kiện sẵn có G1-04; chỉ lưu nội dung riêng của buổi live, không tạo danh mục sự kiện thứ hai. | List/form lịch live, chọn chương trình G1-04 | Live event CRUD, program relation, status rules | Một sự kiện có loại, tên, thời gian và nội dung liên kết rõ | T | CORE | Giữ danh mục event live, dùng lại hồ sơ chương trình/sự kiện G1-04; chỉ lưu thuộc tính đặc thù phiên phát trực tiếp. |
| G1-07-F002 | **Lập và thay đổi lịch phát** | Bộ phận chương trình | Lên lịch ngày/giờ bắt đầu và thời lượng dự kiến, cập nhật/hủy buổi phát; cảnh báo lịch chồng nếu dùng cùng kênh. | Calendar/list schedule, conflict feedback | Schedule validation, timezone, channel collision guard | Lịch không bị sai timezone và xung đột kênh được cảnh báo | T | CORE | Giữ lịch phát; cảnh báo xung đột dựa vào kênh đã biết, không xây bộ tối ưu lịch sản xuất. |
| G1-07-F003 | **Gắn nguồn phát/kênh và kiểm tra sẵn sàng** | Kỹ thuật phát sóng | Gắn nguồn/kênh đã được G1-08 cấu hình, kiểm tra trạng thái sẵn sàng nếu provider cung cấp API; không tự xây thiết bị/ingest. | Source selector, health preview | Relation live-event/stream channel, provider status từ G1-08 | Không hiển thị ready khi không có bằng chứng đủ điều kiện phát. | B | CORE | Giữ gán kênh, nhưng lấy dữ liệu sức khỏe luồng từ adapter G1-08; nếu vendor không cung cấp health API, dùng trạng thái cấu hình. |
| G1-07-F004 | **Trạng thái trước/đang/sau phát** | Kỹ thuật; biên tập | Quản lý dự kiến/chuẩn bị/đang phát/kết thúc/hủy dựa trên tín hiệu provider hoặc thao tác vận hành có kiểm soát; không suy ra live chỉ từ lịch. | Control panel, status badge, operator action | State sync từ G1-08, audit override | Không hiển thị đang LIVE chỉ do đến giờ trên lịch. | B | CORE | Giữ vòng đời live, chỉ tự chuyển theo tín hiệu có thật; không được giả định 'đang live' từ đồng hồ lịch. |
| G1-07-F005 | **Trang xem trực tiếp** | Người xem | Hiển thị chương trình đang phát, player, mô tả, lịch kế tiếp và thông báo khi chưa đến giờ; không cần tài khoản. | Trang live tái sử dụng player G1-06-F003, chỉ thêm thời gian/trạng thái/mô tả | Live event API, playback source từ G1-08 | Xem live hợp lệ; khi chưa có nguồn, hiển thị trạng thái thay vì player lỗi. | T | CORE | Giữ trang xem live; sử dụng player chung G1-06-F003 với adapter G1-08-F004; không tính lại player. |
| G1-07-F006 | **Lịch phát sóng công khai** | Người xem | Xem danh sách bản tin và sự kiện theo ngày, bộ lọc thời gian/loại, điều hướng tới trang chương trình. | Schedule list/calendar UI | Public schedule API, exclude unpublished | Lịch phản ánh đúng thay đổi từ CMS | T | CORE | Giữ phạm vi và nghiệm thu đã mô tả. |
| G1-07-F007 | **Kết thúc live và chuyển sang phát lại** | Kỹ thuật; biên tập | Đóng phiên live và liên kết recording đã do G1-08 nhận, gửi sang G1-06 chờ duyệt phát lại; không xử lý ingestion hoặc tạo VOD trùng. | Replay status, confirm/link editor | Live session to recording ID link, trigger trạng thái chờ VOD | Kết thúc live không tự công khai bản ghi và không tạo bản ghi trùng. | T | CORE | Giữ nghiệp vụ kết thúc live; G1-08 sở hữu nhận bản ghi, G1-06 xuất bản/phát lại, ở đây chỉ liên kết phiên phát. |
| G1-07-F008 | **Thông báo gián đoạn và trạng thái sự cố** | Người xem; kỹ thuật | Hiển thị cảnh báo khi luồng lỗi/mất nguồn, tự thử lại có giới hạn và trạng thái chuyển phương án dự phòng do VTV8 xác nhận. | Trạng thái offline/error dùng chung G1-06-F005, không phát triển player thứ hai | Event status từ G1-08 health adapter | Lỗi nguồn phát có cảnh báo; không tự chuyển nguồn dự phòng chưa hỗ trợ. | B | CORE | Giữ thông báo offline tối thiểu, dùng chung player error state G1-06-F005; fallback nhiều nguồn chỉ khi provider hỗ trợ. |

**Quy ước:** T = chủ đề trong tài liệu VTV8 (chi tiết suy luận phải xác nhận); B = bổ sung; C = phụ thuộc vendor/quyết định. CORE = đề xuất V1; CONDITIONAL/OPTION = chưa tính giờ cơ sở. Xem [nghiệm thu chung](G1-TIEU-CHI-NGHIEM-THU.md) và [thành phần dùng chung](G1-THANH-PHAN-DUNG-CHUNG.md). Chưa có giờ FE/BE.

## Điểm xác nhận trước dự toán
- Cần bản phân công trách nhiệm VTV8/IIEL/VTVcab, tài khoản kỹ thuật, mẫu dữ liệu và trường hợp lỗi thực tế.
- Nếu nhà cung cấp không cung cấp API/kênh recording/cơ sở dữ liệu cần thiết, cập nhật phương án và ước tính lại.
- Mục tiêu 120.000 CCU/SLA trong tài liệu là **yêu cầu kiểm chứng** chứ không phải năng lực đã được đo đạt.

[Xem danh mục GĐ1](README.md).