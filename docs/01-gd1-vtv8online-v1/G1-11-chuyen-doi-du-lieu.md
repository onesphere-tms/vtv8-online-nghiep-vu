# G1-11 – Chuyển đổi dữ liệu từ hệ thống cũ

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Cấu trúc module đã được người dùng chọn; chi tiết tính năng là **DRAFT để rà soát**, chưa được VTV8 xác nhận, chưa ước tính giờ FE/BE.

## Mục tiêu
Đưa nội dung và media thuộc quyền VTV8 từ website/CMS cũ và kho dữ liệu được cấp sang cấu trúc GĐ1, có khả năng đối soát.

## Ranh giới
Không xây kết nối Facebook, TikTok, YouTube hoặc hệ thống quản trị mạng xã hội. Tách công việc phát triển công cụ khỏi số giờ chạy migration/đối soát dữ liệu thực tế. Chất lượng/quyền truy cập đầu vào phải được GĐ0 xác minh.

## Danh sách tính năng (8)

| ID | Tính năng | Actor | Luồng xử lý/đầu ra | FE cần làm | BE cần làm | Nghiệm thu sơ bộ | Nguồn | Phạm vi |
|---|---|---|---|---|---|---|---|---|
| G1-11-F001 | **Khóa danh mục nguồn và phạm vi dữ liệu** | BA; kỹ thuật dữ liệu | Lập manifest nguồn: bài, ảnh, video, chuyên mục, tác giả, URL và thời kỳ chuyển đổi; chốt loại dữ liệu bị loại và quyền truy cập. | Màn danh mục nguồn nếu vận hành lặp lại; có thể là công cụ nội bộ | Inventory schema, source manifests, connection checks | Manifest thể hiện chính xác nguồn/khối lượng và tình trạng quyền truy cập | T | CORE |
| G1-11-F002 | **Trích xuất website/CMS/kho dữ liệu cũ** | Kỹ thuật dữ liệu | Viết hoặc cấu hình công cụ đọc export/API/database đã được VTV8 cho phép, không cào mạng xã hội. | Không bắt buộc FE; trang tiến trình nếu cần | Extractor, incremental batch, throttling, error logs | Chạy lại không mất/nhân đôi dữ liệu nguồn; có log lô | T | CORE |
| G1-11-F003 | **Mapping dữ liệu sang cấu trúc mới** | BA; kỹ thuật dữ liệu | Mapping trường bài viết, nội dung, taxonomy, contributor, chương trình, trạng thái và media links; ghi rõ trường không tương ứng. | Mapping review UI tùy thực tế; có thể dùng tài liệu | Transformation rules và validation | Mỗi trường quan trọng có quy tắc map hoặc được ghi nhận TBC | B | CORE |
| G1-11-F004 | **Làm sạch, chuẩn hóa và khử trùng** | Kỹ thuật dữ liệu | Chuẩn hóa mã ký tự, thời gian, tên, đường dẫn, trùng lặp bài/file theo ID/hash/quy tắc; không tự xóa tài sản nghi ngờ. | Báo cáo trùng/lỗi để quyết định thủ công | Dedupe pipeline, quarantine exceptions | Trùng nghi ngờ được ghi nhận, không ghi đè mất dữ liệu gốc | T | CORE |
| G1-11-F005 | **Nhập dữ liệu nội dung/media có kiểm soát quyền** | Kỹ thuật dữ liệu; người quản lý | Nhập bài và assets vào CMS/DAM; gắn metadata quyền đã được VTV8 xác minh, đưa thiếu quyền vào chờ duyệt. | Màn preview và xác nhận batch nếu cần | Idempotent import pipeline, object storage links, status mapping | Nội dung chưa đủ điều kiện không tự xuất bản | T | CORE |
| G1-11-F006 | **Chạy thử, báo cáo lỗi và chạy lại lô** | Kỹ thuật dữ liệu | Dry-run trên mẫu, log lỗi từng bản ghi, checkpoint, retry/skip theo trường hợp; cho phép khởi chạy lại an toàn. | Run status, error table hoặc CLI report | Job orchestration, idempotency, checkpoints | Một lỗi đơn lẻ không hỏng cả lô, chạy lại không tạo bản sao | B | CORE |
| G1-11-F007 | **Đối soát và nghiệm thu dữ liệu** | BA; quản lý nội dung | Đối chiếu số lượng/loại bản ghi, media links, metadata quan trọng, các mẫu bài/video và danh sách lỗi tồn. | Dashboard/checklist reconciliation, export | Reconciliation report, sampling, checksum/ref counts | Có bảng số liệu nguồn/đích, danh sách sai khác được chấp thuận | T | CORE |
| G1-11-F008 | **Chuyển URL cũ và cutover dữ liệu** | Kỹ thuật dữ liệu; DevOps | Lập mapping URL nguồn/đích, cung cấp cho G1-01 redirect, đồng bộ delta cuối và phương án rollback/cutover. | Trang thông báo/redirect do G1-01 xử lý | URL map export, final sync/cutover script; deployment ở H01 | URL đại diện chuyển đúng và có biên bản đối soát trước cutover | B | CORE |

**Nguồn:** `T` = nghiệp vụ/nhóm chức năng được nêu trực tiếp, quy trình chi tiết có thể là suy luận; `B` = bổ sung để hoàn thiện luồng; `C` = phụ thuộc quyết định. **Phạm vi:** `CORE` = đề xuất tính vào V1 cơ sở; `OPTION` = chưa đưa vào giờ cơ sở khi chưa duyệt. Không coi mô tả suy luận là quy chế VTV8.

## Thông tin bắt buộc phải xác nhận
- Đầu vào thực tế, quy tắc/chính sách có hiệu lực, khối lượng và danh sách ngoại lệ.
- Các quyền và trách nhiệm dữ liệu do VTV8 xác nhận bằng văn bản hoặc tại buổi nghiệm thu GĐ0.
- Nếu thay đổi công thức/quy trình hoặc khối lượng lớn hơn giả định, phải phân rã và ước tính lại.

[Xem danh mục GĐ1](README.md).