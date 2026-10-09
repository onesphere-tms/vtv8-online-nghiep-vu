# G1-11 – Chuyển đổi dữ liệu từ hệ thống cũ

> **GĐ1 V1 / phân rã ngày 09/10/2026** · Cấu trúc module đã được người dùng chọn; chi tiết tính năng là **DRAFT để rà soát**, chưa được VTV8 xác nhận, chưa ước tính giờ FE/BE.

## Mục tiêu
Đưa nội dung và media thuộc quyền VTV8 từ website/CMS cũ và kho dữ liệu được cấp sang cấu trúc GĐ1, có khả năng đối soát.

## Ranh giới
Không xây kết nối Facebook, TikTok, YouTube hoặc hệ thống quản trị mạng xã hội. Tách công việc phát triển công cụ khỏi số giờ chạy migration/đối soát dữ liệu thực tế. Chất lượng/quyền truy cập đầu vào phải được GĐ0 xác minh.

## Danh sách tính năng (5)

| ID | Tính năng | Người sử dụng | Nghiệp vụ và đầu ra | FE cần làm | BE cần làm | Nghiệm thu riêng | Nguồn | Phạm vi | Ranh giới sau QA |
|---|---|---|---|---|---|---|---|---|---|
| G1-11-F002 | **Trích xuất website/CMS/kho dữ liệu cũ** | Kỹ thuật dữ liệu | Trích xuất từ website/CMS/kho dữ liệu do VTV8 cung cấp, baseline giả định một nguồn hệ thống chính; nguồn phát sinh định giá bổ sung, không có mạng xã hội. | Ưu tiên script/CLI, không xây UI vận hành cho migration một lần | Batch extractor theo API/export/database được phép, log lỗi và checkpoint | Chạy lại an toàn, số lượng bản ghi/nguồn có log rõ ràng. | T | CORE | Giữ trích xuất bằng API/export/database được cấp; xác định 1 hệ thống/định dạng nguồn cơ sở, thêm nguồn thì tính thay đổi, không cào xã hội. |
| G1-11-F003 | **Mapping dữ liệu sang cấu trúc mới** | BA; kỹ thuật dữ liệu | Mapping bài viết, chương trình, tác giả, nội dung rich-text và liên kết ảnh/video từ hệ thống cũ sang schema V1; quy tắc không có trường tương ứng cần ghi rõ. | Không có mapping UI mặc định; mapping review bằng bảng tài liệu | Mapping/transformation scripts, referential integrity checks | Mỗi trường đầu vào quan trọng có quy tắc map/ngoại lệ được ghi nhận. | B | CORE | Giữ mapping sang schema mới, cần xác nhận quy tắc media/ảnh trong rich-text và quan hệ dữ liệu; chủ yếu công sức ETL/BE. |
| G1-11-F004 | **Làm sạch, chuẩn hóa và khử trùng** | Kỹ thuật dữ liệu | Chuẩn hóa tên, mã ký tự, thời gian, đường dẫn và xử lý trùng theo ID/hash/quy tắc đã duyệt; dữ liệu không chắc chắn vào hàng đợi kiểm tra, không xóa tự động. | Báo cáo trùng/lỗi để quyết định thủ công | Dedupe pipeline, quarantine exceptions | Trùng nghi ngờ được ghi nhận, không ghi đè mất dữ liệu gốc | T | CORE | Giữ làm sạch/khử trùng cơ bản; quy tắc thiếu/trùng phải có log và cơ chế người duyệt chọn với dữ liệu rủi ro. |
| G1-11-F005 | **Nhập dữ liệu nội dung/media có kiểm soát quyền** | Kỹ thuật dữ liệu; người quản lý | Nhập dữ liệu đã xử lý vào CMS/DAM; quyền khai thác chưa xác minh đặt pending và không công khai, đảm bảo việc nhập lặp lại không nhân đôi. | Màn preview và xác nhận batch nếu cần | Idempotent import pipeline, object storage links, status mapping | Nguồn thiếu quyền hoặc không đối chiếu được bị giữ chờ xử lý, không tự public. | T | CORE | Giữ import, gắn nhãn quyền chưa rõ là pending, tuyệt đối không mặc định tất cả dữ liệu cũ được phép public. |
| G1-11-F006 | **Chạy thử, báo cáo lỗi và chạy lại lô** | Kỹ thuật dữ liệu | Dry-run, checkpoint, chạy lại lô và báo cáo lỗi; ưu tiên công cụ CLI/BE thay vì dashboard mới cho một lần chuyển dữ liệu. | Không mặc định UI, chỉ có màn nếu scope lâu dài được chốt | Dry-run, idempotent batch job, error logs và retry | Lô lỗi có thể chạy lại không tạo bản sao/ghi đè sai. | B | CORE | Giữ chạy thử và retry có checkpoint; tool CLI/BE trước, không mặc định thêm dashboard nhiều màn hình cho công cụ chạy một lần. |

**Quy ước:** T = nhóm nghiệp vụ đã được VTV8 nêu nhưng không mặc định từng thao tác; B = suy luận phát triển; C = điều kiện/quy chế/vendor chưa chốt. CORE = phạm vi cơ sở nội bộ; OPTION/CONDITIONAL = chưa tính trong baseline. Xem [tiêu chí nghiệm thu](G1-TIEU-CHI-NGHIEM-THU.md), [phạm vi dùng chung](G1-THANH-PHAN-DUNG-CHUNG.md). Chưa có giờ FE/BE.

## Thông tin bắt buộc phải xác nhận
- Đầu vào thực tế, quy tắc/chính sách có hiệu lực, khối lượng và danh sách ngoại lệ.
- Các quyền và trách nhiệm dữ liệu do VTV8 xác nhận bằng văn bản hoặc tại buổi nghiệm thu GĐ0.
- Nếu thay đổi công thức/quy trình hoặc khối lượng lớn hơn giả định, phải phân rã và ước tính lại.

[Xem danh mục GĐ1](README.md).
## Các mã gốc chuyển khỏi bảng tính năng

| Mã cũ | Công việc | Điểm đến |
|---|---|---|
| G1-11-F001 | Khóa danh mục nguồn và phạm vi dữ liệu | G1-H02-W008 / kế thừa G0-07 |
| G1-11-F007 | Đối soát và nghiệm thu dữ liệu | G1-H02-W009 / data operations UAT |
| G1-11-F008 | Chuyển URL cũ và cutover dữ liệu | G1-H02-W010 và G1-H01-W007 / cutover, rollback; URL mapping ở G1-11 |

**Vẫn thực hiện, nhưng tính theo WBS khảo sát/QA/migration/cutover, không áp dụng coding 55% cho cả đầu việc.**
