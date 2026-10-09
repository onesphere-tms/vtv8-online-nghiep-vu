# G0-05 – Đề xuất kiến trúc hệ thống tổng thể

> **Đã chốt nội bộ: 4 công việc khảo sát và thiết kế tổng thể (09/10/2026).** Chưa có phê duyệt từ VTV8 và chưa thực hiện khảo sát thực tế. Chưa tính giờ công, MD hay chi phí.

## Mục tiêu

Đề xuất kiến trúc VTV8Online V1 đáp ứng nhu cầu trước mắt, đồng thời có hướng mở rộng Media Platform, thương mại và AI trong tương lai mà không phải xây lại toàn bộ.

**Đối tượng phối hợp:** kỹ thuật VTV8, technical lead/architect, đơn vị vận hành hạ tầng và phụ trách sản phẩm.

## Danh sách công việc

| Mã | Công việc | Cần làm rõ | Đầu ra |
|---|---|---|---|
| G0-05-F001 | Đề xuất cấu trúc hệ thống VTV8Online | Website, CMS, backend, lưu trữ và tích hợp; phần kế thừa từ hiện trạng | Sơ đồ kiến trúc ứng dụng tổng thể |
| G0-05-F002 | Đề xuất cấu trúc dữ liệu tổng thể | Quan hệ giữa bài viết, chương trình, video, địa danh, di sản, tác giả và các nhóm dữ liệu liên quan | Sơ đồ dữ liệu cấp khái niệm |
| G0-05-F003 | Xác định yêu cầu bảo mật và vận hành | Phân quyền, bảo vệ nội dung, sao lưu, giám sát, nhật ký, khôi phục khi sự cố | Danh mục yêu cầu kỹ thuật và vận hành |
| G0-05-F004 | Định hướng khả năng mở rộng | Hướng lựa chọn công nghệ gọn cho GĐ1, có đường phát triển các chức năng ở GĐ2–GĐ4 | Roadmap kiến trúc và danh sách quyết định kỹ thuật |

## Checklist khảo sát

### G0-05-F001 – Đề xuất cấu trúc hệ thống VTV8Online
- Làm rõ thành phần ứng dụng cần có, cách liên kết Website/CMS/backend/kho media.
- Đối chiếu khả năng kế thừa với báo cáo G0-02, phân biệt hệ thống hiện hữu và hệ thống đề xuất.
- **Bàn giao:** sơ đồ thành phần và mô tả chức năng từng lớp.

### G0-05-F002 – Đề xuất cấu trúc dữ liệu tổng thể
- Xác định các thực thể nội dung và mối liên kết phục vụ bài, chương trình, địa danh, di sản, video.
- Đảm bảo định hướng dữ liệu có cấu trúc thay vì chỉ lưu HTML; chưa thiết kế từng bảng và trường.
- **Bàn giao:** mô hình dữ liệu khái quát.

### G0-05-F003 – Xác định yêu cầu bảo mật và vận hành
- Xác định quyền truy cập quản trị, nguyên tắc backup và theo dõi tình trạng dịch vụ.
- Ghi mục tiêu vận hành và yêu cầu phi chức năng còn phải được xác nhận.
- **Bàn giao:** danh mục yêu cầu bảo mật và vận hành.

### G0-05-F004 – Định hướng khả năng mở rộng
- Cân nhắc khả năng mở rộng tài khoản, tìm kiếm, commerce, AI khi có nhu cầu.
- Không mặc định triển khai tất cả DB/dịch vụ được nêu trong đề xuất ngay ở GĐ1.
- **Bàn giao:** hướng mở rộng công nghệ và các quyết định cần xác nhận.

## Ranh giới và nghiệm thu

G0-05 chỉ thiết kế tổng thể; **không** lập trình, thiết kế chi tiết API/database, triển khai production hoặc phân tích chuyên sâu CDN/streaming (thuộc G0-06). Kết quả chỉ nghiệm thu khi có hồ sơ và người có thẩm quyền của VTV8 rà soát.

Nguồn: [Tài liệu đề xuất VTV8–IIEL](../../tai-lieu-nguon/Đề%20xuất%20hợp%20tác%20VTV8%20-%20IIEL_VTV8%20note.docx). Bản 81 công việc cũ vẫn có trong lịch sử Git, commit `0c3e781`.