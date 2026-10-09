# G1-H02 – Kiểm thử tích hợp, UAT, triển khai và chuyển giao

> **Nhóm công việc hỗ trợ GĐ1.** QA đơn vị/chức năng/regression phổ thông đã được tính theo công thức BA/Design/QA trong template dự toán; không tính lại các giờ này ở H02.

| Mã | Hạng mục | Đầu ra kiểm tra được | Phân loại dự toán |
|---|---|---|---|
| G1-H02-W001 | Xây checklist nghiệm thu xuyên module | Ma trận luồng bài từ nháp đến xuất bản; media/VOD/live; báo cáo/nhuận bút; migration | QA dùng trong tỷ trọng hoặc chỉ tính phần nghiệm thu ngoài scope chuẩn |
| G1-H02-W002 | Kiểm thử tích hợp và UAT với VTV8 | Kịch bản người dùng, dữ liệu UAT, danh sách lỗi, biên bản kết quả | Chỉ effort hỗ trợ UAT vượt QA tiêu chuẩn mới tính riêng |
| G1-H02-W003 | Diễn tập go-live website/ứng dụng | Checklist web/API, DNS, CDN ứng dụng, tài khoản, fallback và rollback deployment; phối hợp W010 để dữ liệu sẵn sàng | PM/DevOps triển khai ngoài code; không tính lại data cutover |
| G1-H02-W004 | Đào tạo vận hành CMS và nhuận bút | Tài liệu hướng dẫn, buổi hướng dẫn biên tập/quản trị/nhuận bút theo phạm vi duyệt | Training effort riêng |
| G1-H02-W005 | Bàn giao kỹ thuật và vận hành | Hướng dẫn cài đặt, cấu hình, quản trị, tài liệu API/tích hợp, tài khoản/secret theo quy trình an toàn | Handover effort riêng |
| G1-H02-W006 | Hỗ trợ sau go-live theo thỏa thuận | Trực xử lý sự cố ban đầu, chính sách bảo hành/bảo trì/SLA phân nhiệm | Vận hành/bảo trì theo điều khoản |

| G1-H02-W007 | Kiểm thử tải, QoE và SLA Streaming (mã gốc G1-08-F009) | Kịch bản tách CCU website với đồng thời xem video/live; bằng chứng kiểm thử có điều kiện, tài nguyên, giới hạn, kết quả đạt/chưa đạt; trách nhiệm provider | Performance/QA chuyên sâu + phí vendor; **không** FE/BE feature hoặc QA thông thường |
| G1-H02-W008 | Xác nhận đầu vào nguồn migration (mã gốc G1-11-F001) | Manifest đã chốt, quyền đọc nguồn, loại nội dung, khối lượng; kế thừa kết quả G0-07, chỉ cập nhật sai khác sau GĐ0 | Đầu vào GĐ0; effort bổ sung có điều kiện, không mặc định tính lần hai |
| G1-H02-W009 | Đối soát dữ liệu sau migration (mã gốc G1-11-F007) | Kết quả đếm nguồn/đích, kiểm tra mẫu bài/media/quyền, danh sách lỗi và biên bản xử lý | Data operation/UAT; công cụ đối soát code nếu có tách BE ở G1-11 |
| G1-H02-W010 | Data cutover và rollback (mã gốc G1-11-F008) | Chạy delta cuối, xác nhận dữ liệu sẵn sàng, điểm phục hồi, phối hợp redirect mapping với G1-11 và go-live G1-H02-W003 | Data operation/PM/DevOps thực hiện; mapping URL thuộc migration, API redirect thuộc G1-01-F008 |
| G1-H02-W011 | Tiếp nhận ma trận tích hợp Streaming (mã gốc G1-08-F001) | Ma trận API/credential kỹ thuật, ingest, playback, recording, CDN, SLA, chủ sở hữu và rủi ro có bằng chứng; kế thừa đầu ra G0-06 | Hạng mục xác nhận gate; chỉ ước tính phần chênh lệch mới ngoài GĐ0, không tính lặp khảo sát |

**Không trùng:** Stress/load test và bằng chứng CCU streaming được quản lý ở **G1-H02-W007 (mã cũ G1-08-F009)**; deploy app, backup, monitor ở **G1-H01**; tiến trình chuyển dữ liệu ở **G1-11**. **Chưa có giờ hoặc giá.**
