# G1-05 – Quản lý tài sản số – DAM cơ bản

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Cấu trúc module đã được người dùng chọn; tính năng chi tiết là **DRAFT chờ rà soát**, không phải xác nhận của VTV8. Chưa ước tính giờ FE/BE.

## Mục tiêu
Kho media riêng có nguồn gốc, quyền khai thác và metadata rõ ràng để dùng chung cho CMS/VOD/live replay.

## Ranh giới và phụ thuộc
DAM sở hữu asset/file và metadata. Phát luồng/transcoding thuộc G1-08; nội dung VOD đã công khai thuộc G1-06; nhập dữ liệu cũ hàng loạt thuộc G1-11.

## Danh sách tính năng (8)

| ID | Tính năng | Người sử dụng | Nghiệp vụ và đầu ra | FE cần làm | BE cần làm | Nghiệm thu riêng | Nguồn | Phạm vi | Ranh giới sau QA |
|---|---|---|---|---|---|---|---|---|---|
| G1-05-F001 | **Tải lên và tiếp nhận file media** | Biên tập; media | Upload ảnh/video có giới hạn file được xác định sau GĐ0, tiến trình và lỗi; chunk/resume chỉ thuộc cơ sở nếu kích thước thực tế yêu cầu. | File uploader, progress/retry; resumable có điều kiện | Object-storage upload, MIME/size/checksum, phương án file lớn theo điều kiện nguồn | Upload thành công/lỗi được báo, không lộ file chưa duyệt; reject file không hợp lệ. | CORE | undefined | Giữ upload nhưng phải làm rõ file video lớn, chunk/resumable, giới hạn storage, virus scanning, định dạng và xử lý lỗi; chốt theo GĐ0. |
| G1-05-F002 | **Thư viện media và tìm lọc** | Biên tập; media | Danh sách lưới/bảng, preview, tìm theo tên, loại, chủ đề, ngày tạo, quyền sử dụng. | Library grid/list, filters, pagination | Media query/search indexes cơ bản, permissions | Tìm lại được file đã upload và phân trang đúng | B | CORE | undefined | Giữ phạm vi và nghiệm thu đã mô tả. |
| G1-05-F003 | **Metadata gốc và thông tin sản xuất** | Media; biên tập | Lưu nguồn gốc, ngày sản xuất, người xuất hiện, âm nhạc, địa phương, chủ đề, định dạng gốc và chú thích. | Metadata editor, field validation | Asset metadata schema, API, storage references | Có thể sửa và truy xuất metadata, không mất dấu nguồn gốc | T | CORE | undefined | Giữ tất cả metadata nguồn VTV8 đã nêu; phân nhóm trường bắt buộc/tùy chọn để tránh nghẽn xuất bản. |
| G1-05-F004 | **Quản lý quyền và thời hạn khai thác** | Media; người duyệt | Ghi chủ sở hữu, quyền phát lại, thời hạn, chứng cứ và trạng thái quyền. Quy tắc cảnh báo hoặc chặn phải được VTV8 xác nhận; dùng một rights gate cho cả bài và video. | Rights form và cảnh báo quyền/hết hạn | Rights model và publish-eligibility dùng chung G1-03/G1-06 | Không công khai media bị BLOCK theo quy tắc đã duyệt; ghi rõ lý do. | CORE | undefined | Giữ thông tin quyền; phân biệt ghi metadata với pháp lý xác nhận, chốt quy tắc WARN/BLOCK theo trạng thái quyền và thời điểm. |
| G1-05-F005 | **Quản lý bản gốc và phiên bản xuất bản** | Media | Liên kết file gốc với thumbnail, poster, phiên bản phát hành hoặc phiên bản kỹ thuật nhận từ nền tảng media; không tự lập trình transcoder. | Variant selector, metadata version | Asset relations, version identifiers, checksum | Một asset gốc có thể gắn nhiều biến thể không bị lẫn phiên bản | T | CORE | undefined | Giữ tham chiếu file gốc và bản phát; quản lý version lịch sử đầy đủ và pipeline tạo bản phát thuộc điều kiện/media provider. |
| G1-05-F006 | **Ảnh đại diện, thumbnail và chọn file dùng trong bài** | Biên tập | Chọn/cắt hoặc dùng ảnh đại diện có sẵn, gắn vào bài, chương trình hoặc poster video theo thông tin asset. | Asset picker, preview/crop đơn giản | Thumbnail refs, linking, optional image resize job | Cùng asset sử dụng nhiều nơi không phải upload lại | B | CORE | undefined | Giữ chọn ảnh từ DAM, chỉ crop/resize thông thường nếu được chốt; không tích hợp công cụ chỉnh ảnh chuyên nghiệp. |
| G1-05-F007 | **Gắn tag, nhóm và liên kết đối tượng media** | Media; biên tập | Gắn media vào chương trình, chủ đề, địa danh và các nhóm phục vụ tìm kiếm/tái sử dụng. | Dùng tag/relation selector của G1-04-F009, không tự xây danh mục mới | Liên kết media vào taxonomy service G1-04-F009 | Media liên kết đúng tag/chủ đề và tra cứu được không nhân đôi taxonomy. | CORE | undefined | Giữ gắn tag/nhóm nhưng tái dùng dịch vụ G1-04-F009, không làm hệ phân loại media thứ hai. |
| G1-05-F008 | **Thao tác xóa, lưu trữ và kiểm tra nơi sử dụng** | Media; quản trị | Ẩn/lưu trữ asset, hạn chế xóa vật lý file đang được bài/video sử dụng, ghi lại lý do. | Delete/archive confirm, usage view | Soft-delete, reference checks, audit | Không thể xóa làm gãy bài/video đã xuất bản | B | CORE | undefined | Giữ phạm vi và nghiệm thu đã mô tả. |

**Quy ước:** T = chủ đề trực tiếp trong tài liệu VTV8 (luồng chi tiết có thể suy ra); B = bổ sung để vận hành; C = điều kiện/vendor. CORE = đề xuất V1 cơ sở; OPTION/CONDITIONAL = chưa tính giờ cơ sở. Xem [tiêu chí nghiệm thu dùng chung](G1-TIEU-CHI-NGHIEM-THU.md) và [thành phần dùng chung](G1-THANH-PHAN-DUNG-CHUNG.md). Chưa có giờ FE/BE.

## Điều kiện xác nhận
- Quy trình thực tế, trường dữ liệu và mẫu giao diện do GĐ0 khảo sát và các bên thống nhất.
- Tài liệu VTV8 mới nêu nhóm đối tượng/ý tưởng; việc triển khai các hành động và tiêu chí nghiệm thu là phân tích đề xuất.
- Tích hợp media và dữ liệu bên ngoài chỉ chốt sau khi xác định nguồn cung cấp và quyền truy cập.

[Xem danh mục GĐ1](README.md).