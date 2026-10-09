# G1-05 – Quản lý tài sản số – DAM cơ bản

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Cấu trúc module đã được người dùng chọn; tính năng chi tiết là **DRAFT chờ rà soát**, không phải xác nhận của VTV8. Chưa ước tính giờ FE/BE.

## Mục tiêu
Kho media riêng có nguồn gốc, quyền khai thác và metadata rõ ràng để dùng chung cho CMS/VOD/live replay.

## Ranh giới và phụ thuộc
DAM sở hữu asset/file và metadata. Phát luồng/transcoding thuộc G1-08; nội dung VOD đã công khai thuộc G1-06; nhập dữ liệu cũ hàng loạt thuộc G1-11.

## Danh sách tính năng (8)

| ID | Tính năng | Actor | Luồng xử lý/đầu ra | FE cần làm | BE cần làm | Nghiệm thu sơ bộ | Nguồn | Phạm vi |
|---|---|---|---|---|---|---|---|---|
| G1-05-F001 | **Tải lên và tiếp nhận file media** | Biên tập; media | Upload hình ảnh/video, kiểm tra định dạng, kích thước, dung lượng; có tiến trình upload và báo lỗi. | Uploader progress, validation, cancel/retry | Upload API/object storage, MIME/size checks, checksum | File tải lên hoàn chỉnh và không bị công khai khi chưa được duyệt | T | CORE |
| G1-05-F002 | **Thư viện media và tìm lọc** | Biên tập; media | Danh sách lưới/bảng, preview, tìm theo tên, loại, chủ đề, ngày tạo, quyền sử dụng. | Library grid/list, filters, pagination | Media query/search indexes cơ bản, permissions | Tìm lại được file đã upload và phân trang đúng | B | CORE |
| G1-05-F003 | **Metadata gốc và thông tin sản xuất** | Media; biên tập | Lưu nguồn gốc, ngày sản xuất, người xuất hiện, âm nhạc, địa phương, chủ đề, định dạng gốc và chú thích. | Metadata editor, field validation | Asset metadata schema, API, storage references | Có thể sửa và truy xuất metadata, không mất dấu nguồn gốc | T | CORE |
| G1-05-F004 | **Quản lý quyền và thời hạn khai thác** | Media; người duyệt | Ghi quyền sở hữu, phát lại, thời hạn, chứng cứ/tài liệu tham chiếu và trạng thái xác nhận quyền; cảnh báo khi không đủ điều kiện. | Rights form, trạng thái/cảnh báo | Rights metadata, expiry check, policy hook | Nội dung không đủ quyền bị cảnh báo/chặn theo chính sách được duyệt | T | CORE |
| G1-05-F005 | **Quản lý bản gốc và phiên bản xuất bản** | Media | Liên kết file gốc với thumbnail, poster, phiên bản phát hành hoặc phiên bản kỹ thuật nhận từ nền tảng media; không tự lập trình transcoder. | Variant selector, metadata version | Asset relations, version identifiers, checksum | Một asset gốc có thể gắn nhiều biến thể không bị lẫn phiên bản | T | CORE |
| G1-05-F006 | **Ảnh đại diện, thumbnail và chọn file dùng trong bài** | Biên tập | Chọn/cắt hoặc dùng ảnh đại diện có sẵn, gắn vào bài, chương trình hoặc poster video theo thông tin asset. | Asset picker, preview/crop đơn giản | Thumbnail refs, linking, optional image resize job | Cùng asset sử dụng nhiều nơi không phải upload lại | B | CORE |
| G1-05-F007 | **Gắn tag, nhóm và liên kết đối tượng media** | Media; biên tập | Gắn media vào chương trình, chủ đề, địa danh và các nhóm phục vụ tìm kiếm/tái sử dụng. | Tag/relation picker | Typed relationship API đến G1-04 | Asset tìm lại được bằng tag và có đầy đủ nơi sử dụng | B | CORE |
| G1-05-F008 | **Thao tác xóa, lưu trữ và kiểm tra nơi sử dụng** | Media; quản trị | Ẩn/lưu trữ asset, hạn chế xóa vật lý file đang được bài/video sử dụng, ghi lại lý do. | Delete/archive confirm, usage view | Soft-delete, reference checks, audit | Không thể xóa làm gãy bài/video đã xuất bản | B | CORE |

**Nguồn:** `T` = có chủ đề/yêu cầu trực tiếp trong đề xuất VTV8 (luồng chi tiết có thể suy ra); `B` = bổ sung nghiệp vụ cần thiết; `C` = tùy chọn/điều kiện. **Phạm vi:** `CORE` = đề xuất tính trong baseline GĐ1; `OPTION` = chờ quyết định, chưa tính giờ baseline. Các cột FE/BE mô tả phần việc, **không phải số giờ**.

## Điều kiện xác nhận
- Quy trình thực tế, trường dữ liệu và mẫu giao diện do GĐ0 khảo sát và các bên thống nhất.
- Tài liệu VTV8 mới nêu nhóm đối tượng/ý tưởng; việc triển khai các hành động và tiêu chí nghiệm thu là phân tích đề xuất.
- Tích hợp media và dữ liệu bên ngoài chỉ chốt sau khi xác định nguồn cung cấp và quyền truy cập.

[Xem danh mục GĐ1](README.md).