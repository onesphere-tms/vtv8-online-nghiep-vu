# G1-06 – Quản lý và phát video VOD cơ bản

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Cấu trúc module đã được người dùng chọn; tính năng chi tiết là **DRAFT chờ rà soát**, không phải xác nhận của VTV8. Chưa ước tính giờ FE/BE.

## Mục tiêu
Đưa video đã có quyền lên cổng VTV8Online và cung cấp trải nghiệm xem lại theo chương trình/tập.

## Ranh giới và phụ thuộc
Không xây hệ thống video thuê bao, DRM/premium, playlist cá nhân, lịch sử xem, recommendation; encoder/CDN do G1-08 hoặc đối tác xử lý.

## Danh sách tính năng (6)

| ID | Tính năng | Người sử dụng | Nghiệp vụ và đầu ra | FE cần làm | BE cần làm | Nghiệm thu riêng | Nguồn | Phạm vi | Ranh giới sau QA |
|---|---|---|---|---|---|---|---|---|---|
| G1-06-F001 | **Quản lý bản phát VOD và trạng thái sẵn sàng** | Biên tập; media | Gắn asset từ DAM với playback manifest/đường dẫn do hạ tầng media cung cấp, kiểm tra ready/failed trước công khai. | Màn trạng thái và chọn bản phát | Playback record, asset association, status sync | Video chưa sẵn sàng không hiển thị player lỗi cho công chúng | B | CORE | undefined | Giữ trạng thái video ready/pending/fail; nếu provider chỉ cung cấp URL cố định thì không tính quản lý job transcoding riêng. |
| G1-06-F002 | **Xuất bản và danh mục video công khai** | Biên tập; người xem | Danh mục video công khai và metadata phát; trạng thái nội dung sử dụng workflow duyệt chung G1-03 và rights gate G1-05, không phát triển quy trình duyệt thứ hai. | Thông tin video, danh mục public | Video publish API tái dùng rights/workflow shared service | Video thiếu quyền hoặc chưa duyệt không xuất hiện công khai. | CORE | undefined | Giữ xuất bản video, tái dùng bộ kiểm duyệt/quyền G1-03 và G1-05; tránh viết workflow video thứ hai hoàn chỉnh. |
| G1-06-F003 | **Trình phát VOD trên website** | Người xem | Một player dùng chung cho VOD và livestream, hiển thị điều khiển tương thích nguồn; nhận playback URL/manifest từ G1-08-F004. | Shared player VOD/live, điều khiển VOD khi nguồn hỗ trợ | Sử dụng adapter từ G1-08, không tái lập API cấp nguồn | Xem VOD trên trình duyệt mục tiêu và dùng lại player cho live. | CORE | undefined | Giữ một web player dùng chung cho VOD/live; playback source/config provider chỉ một adapter tại G1-08-F004. |
| G1-06-F004 | **Trang video và điều hướng tập/chương trình** | Người xem | Trang chi tiết video và điều hướng tập trước/sau; dữ liệu chương trình/series do G1-04 và template giới thiệu chương trình ở G1-01 cung cấp. | Video detail và điều hướng tập, tái dùng template hiện có | Truy vấn video/tập đã công khai qua G1-04, không thêm CRUD chương trình | Không phát sinh trang chương trình/series trùng với G1-01-F005. | CORE | undefined | Giữ phạm vi và nghiệm thu đã mô tả. |
| G1-06-F005 | **Trạng thái lỗi phát và dự phòng UI** | Người xem; vận hành | Một bộ xử lý lỗi player cho VOD/live: nguồn lỗi, quyền hết hạn, gián đoạn, trạng thái unavailable; dùng chung với G1-07-F008. | Shared error/retry UI cho VOD/live | Lỗi/availability từ G1-08 adapter, không tạo module health khác | VOD/live báo lỗi có ý nghĩa và không treo/màn đen kéo dài. | CORE | undefined | Giữ lỗi player tối thiểu nhưng dùng chung cả VOD và live với G1-07-F008; không tính hai error-handler độc lập. |
| G1-06-F006 | **Phát lại sau sự kiện Livestream** | Biên tập; người xem | Xuất bản bản ghi live đã được G1-08 nhận và G1-07 liên kết theo quy trình VOD; không tạo webhook recording tại đây. | Xác nhận/duyệt phát lại và player VOD dùng chung | Recording-to-VOD association, public status và eligibility | Không tạo VOD trùng từ recording, không public bản ghi thiếu quyền. | CORE | undefined | Giữ tính năng phát lại cho người xem; trách nhiệm: G1-08 nhận recording, G1-07 đóng phiên, G1-06 xuất bản và phát lại; tránh nhân ba effort. |

**Quy ước:** T = chủ đề trực tiếp trong tài liệu VTV8 (luồng chi tiết có thể suy ra); B = bổ sung để vận hành; C = điều kiện/vendor. CORE = đề xuất V1 cơ sở; OPTION/CONDITIONAL = chưa tính giờ cơ sở. Xem [tiêu chí nghiệm thu dùng chung](G1-TIEU-CHI-NGHIEM-THU.md) và [thành phần dùng chung](G1-THANH-PHAN-DUNG-CHUNG.md). Chưa có giờ FE/BE.

## Điều kiện xác nhận
- Quy trình thực tế, trường dữ liệu và mẫu giao diện do GĐ0 khảo sát và các bên thống nhất.
- Tài liệu VTV8 mới nêu nhóm đối tượng/ý tưởng; việc triển khai các hành động và tiêu chí nghiệm thu là phân tích đề xuất.
- Tích hợp media và dữ liệu bên ngoài chỉ chốt sau khi xác định nguồn cung cấp và quyền truy cập.

[Xem danh mục GĐ1](README.md).