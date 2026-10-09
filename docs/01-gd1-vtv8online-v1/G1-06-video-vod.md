# G1-06 – Quản lý và phát video VOD cơ bản

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Cấu trúc module đã được người dùng chọn; tính năng chi tiết là **DRAFT chờ rà soát**, không phải xác nhận của VTV8. Chưa ước tính giờ FE/BE.

## Mục tiêu
Đưa video đã có quyền lên cổng VTV8Online và cung cấp trải nghiệm xem lại theo chương trình/tập.

## Ranh giới và phụ thuộc
Không xây hệ thống video thuê bao, DRM/premium, playlist cá nhân, lịch sử xem, recommendation; encoder/CDN do G1-08 hoặc đối tác xử lý.

## Danh sách tính năng (6)

| ID | Tính năng | Người sử dụng | Nghiệp vụ và đầu ra | FE cần làm | BE cần làm | Nghiệm thu riêng | Nguồn | Phạm vi | Ranh giới sau QA |
|---|---|---|---|---|---|---|---|---|---|
| G1-06-F001 | **Quản lý bản phát VOD và trạng thái sẵn sàng** | Biên tập; media | Gắn asset từ DAM với playback manifest/đường dẫn do hạ tầng media cung cấp, kiểm tra ready/failed trước công khai. | Màn trạng thái và chọn bản phát | Playback record, asset association, status sync | Video chưa sẵn sàng không hiển thị player lỗi cho công chúng | B | CORE | Giữ trạng thái video ready/pending/fail; nếu provider chỉ cung cấp URL cố định thì không tính quản lý job transcoding riêng. |
| G1-06-F002 | **Xuất bản và danh mục video công khai** | Biên tập; người xem | Xuất bản video sử dụng quy trình duyệt G1-03 và rights gate G1-05; chỉ bổ sung dữ liệu video, không tạo workflow thứ hai. | Form xuất bản, video list public | Video publish dùng shared workflow và rights gate | Video thiếu quyền/chưa duyệt không xuất hiện public. | T | CORE | Giữ xuất bản video, tái dùng bộ kiểm duyệt/quyền G1-03 và G1-05; tránh viết workflow video thứ hai hoàn chỉnh. |
| G1-06-F003 | **Trình phát VOD trên website** | Người xem | Một video player FE dùng chung cho VOD/live, nhận playback manifest/config từ G1-08-F004. | Shared player, điều khiển VOD khi nguồn hỗ trợ | Sử dụng playback adapter G1-08, không viết lại | Phát VOD trên trình duyệt mục tiêu, player dùng lại cho live. | B | CORE | Giữ một web player dùng chung cho VOD/live; playback source/config provider chỉ một adapter tại G1-08-F004. |
| G1-06-F004 | **Trang video và điều hướng tập/chương trình** | Người xem | Trang chi tiết video, metadata, tập trước/sau và video cùng chương trình; sử dụng dữ liệu chương trình G1-04. | Video detail và điều hướng tập; dùng dữ liệu/template chương trình G1-01/G1-04 | API truy vấn video/tập đã công khai, không tạo CRUD chương trình | Không phát sinh trang chương trình trùng G1-01-F005. | B | CORE | Giữ phạm vi và nghiệm thu đã mô tả. |
| G1-06-F005 | **Trạng thái lỗi phát và dự phòng UI** | Người xem; vận hành | Một bộ trạng thái lỗi player cho VOD/live với fallback UI và thử lại giới hạn; dùng chung G1-07-F008. | Shared player error/retry UI | Availability từ adapter G1-08, không làm hệ health thứ hai | Nguồn lỗi hiển thị rõ và không treo player. | B | CORE | Giữ lỗi player tối thiểu nhưng dùng chung cả VOD và live với G1-07-F008; không tính hai error-handler độc lập. |
| G1-06-F006 | **Phát lại sau sự kiện Livestream** | Biên tập; người xem | Duyệt và phát lại bản ghi G1-08 nhận/G1-07 liên kết; không xử lý webhook recording ở đây. | UI xác nhận bản ghi, liên kết video | Link recording-to-VOD và publication guard | Không nhân đôi bản ghi, không public khi chưa đủ quyền. | T | CORE | Giữ tính năng phát lại cho người xem; trách nhiệm: G1-08 nhận recording, G1-07 đóng phiên, G1-06 xuất bản và phát lại; tránh nhân ba effort. |

**Quy ước:** T = chủ đề trực tiếp trong nguồn VTV8 (luồng chi tiết có thể suy ra); B = bổ sung triển khai; C = quyết định/vendor. CORE = đề xuất V1 cơ sở; OPTION/CONDITIONAL = chưa cộng giờ cơ sở. Xem [nghiệm thu dùng chung](G1-TIEU-CHI-NGHIEM-THU.md) và [thành phần dùng chung](G1-THANH-PHAN-DUNG-CHUNG.md). Chưa có giờ FE/BE.

## Điều kiện xác nhận
- Quy trình thực tế, trường dữ liệu và mẫu giao diện do GĐ0 khảo sát và các bên thống nhất.
- Tài liệu VTV8 mới nêu nhóm đối tượng/ý tưởng; việc triển khai các hành động và tiêu chí nghiệm thu là phân tích đề xuất.
- Tích hợp media và dữ liệu bên ngoài chỉ chốt sau khi xác định nguồn cung cấp và quyền truy cập.

[Xem danh mục GĐ1](README.md).