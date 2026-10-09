# GĐ1 – Tiêu chí nghiệm thu dùng chung cho 82 tính năng V1

> **Ngày 09/10/2026 · Mức độ:** tiêu chuẩn kiểm tra nội bộ đề xuất, chưa được VTV8 phê duyệt. Áp dụng cùng tiêu chí riêng trong từng dòng feature. Không thêm một đầu việc FE/BE mới cho mọi tiêu chí chung; tính trong phần phát triển/QA feature hiện hữu.

## 1. Checklist nghiệm thu tối thiểu đối với mọi tính năng CORE

| Nhóm | Kiểm tra bắt buộc | Bằng chứng chấp nhận |
|---|---|---|
| Nghiệp vụ thành công | Người dùng đúng vai trò thực hiện luồng chính từ đầu vào hợp lệ đến đầu ra đã mô tả | Test case theo ID, dữ liệu mẫu, kết quả FE và API |
| Quyền truy cập | Người không có quyền không được đọc/sửa/duyệt/xuất bản, kể cả gọi trực tiếp API | Ít nhất 01 ca âm tính cho nghiệp vụ nhạy cảm |
| Validation và ngoại lệ | Dữ liệu thiếu/sai, đối tượng không tồn tại, trạng thái không hợp lệ được từ chối đúng và không làm hỏng dữ liệu | Test sai dữ liệu và thông báo UI/API |
| Dữ liệu và tham chiếu | Không tạo trùng bản ghi hoặc mất liên kết; màn hình và API phản ánh cùng trạng thái sau ghi | Đối chiếu DB/test log với thông tin UI |
| Hiển thị công khai | Nội dung nháp, đã gỡ hoặc thiếu quyền khai thác không tự xuất hiện ở website/video | Test public API và URL trực tiếp |
| Tái sử dụng thành phần | Tính năng sử dụng component/adapter chung theo [sơ đồ chủ sở hữu](G1-THANH-PHAN-DUNG-CHUNG.md) | Code review và test tích hợp, không dựng bản sao |
| Khả năng vận hành | Lỗi có ghi nhận và báo trạng thái có thể xử lý; thời gian phản hồi và trình duyệt mục tiêu theo tiêu chí thống nhất | Log/test UAT, không tự tuyên bố SLA chưa đo |
| Truy vết quyết định | Cảnh báo các điều kiện chưa xác nhận: nguồn media, quy chế nhuận bút, nguồn migration; không đưa vào nghiệm thu cứng khi chưa chốt | Decision log, điều kiện vendor và văn bản nghiệp vụ |

## 2. Các kịch bản xuyên module bắt buộc

| Mã kiểm tra | Kịch bản | Kết quả cần đạt | Các module |
|---|---|---|---|
| E2E-01 | Phóng viên tạo bài, biên tập duyệt, xuất bản lên website | Nội dung công khai đúng định dạng, quyền và metadata; bản nháp không xuất hiện | G1-02/03/04/05/01 |
| E2E-02 | Người duyệt trả bài, người viết sửa, gửi lại; người không quyền cố publish qua API | Có lịch sử trạng thái và lý do; thao tác trái quyền bị chặn | G1-02/03 |
| E2E-03 | Bài/video gắn asset hết hạn hoặc chưa được xác nhận quyền | Cảnh báo/chặn theo chính sách VTV8 đã chốt; không công khai sai | G1-05/03/06 |
| E2E-04 | Chương trình/series/tập xuất bản video VOD | Player phát đúng manifest; dữ liệu chương trình không trùng nhau | G1-04/05/06/08/01 |
| E2E-05 | Lập lịch và phát trực tiếp bản tin, kết thúc, chuyển recording sang VOD | Trạng thái live dựa trên nguồn thực, bản ghi nhập một lần, replay chờ duyệt | G1-07/08/06 |
| E2E-06 | Media bị ngắt giữa buổi live | Có tín hiệu lỗi hoặc tình trạng không khả dụng, UI không treo; có log và trách nhiệm xử lý | G1-06/07/08, vendor |
| E2E-07 | Xem báo cáo số bài và lượt xem theo bài/chuyên mục/thời gian | Báo cáo có định nghĩa chỉ số, dữ liệu/cơ sở tính có thể đối soát, không nhân đôi | G1-09/01/03 |
| E2E-08 | Tính nhuận bút theo kỳ sau khi có nhiều người tham gia sản xuất | Bảng kê theo quy chế VTV8 đã xác nhận, truy vết khoản tiền và kết quả kỳ tính | G1-04/09/10 |
| E2E-09 | Chuyển nội dung cũ, xử lý thiếu quyền và chạy lại batch | Không nhân đôi, nguồn/đích đối soát được, nội dung thiếu quyền không tự public | G1-11/05/03 và H02-W009 |
| E2E-10 | Go-live website và URL cũ | URL trọng điểm điều hướng đúng; rollback có phương án, không bỏ mất dữ liệu | G1-01/11, H01, H02-W003/W010 |

## 3. Điều kiện riêng với Streaming và khả năng chịu tải

- Cần xác định **120.000 CCU là người truy cập web hay số người đang xem video đồng thời**; đây là mục tiêu trong đề xuất, không phải kết quả kiểm thử.
- Công việc kiểm thử chuyên sâu tại **H02-W007**, dựa trên topology đã chọn, kịch bản bitrate và khả năng vendor; báo cáo ghi rõ throughput, tình trạng media, tỷ lệ lỗi, mẫu tải, thời gian và giới hạn kiểm tra.
- SLA V1 ≥99,9% trong nguồn là **mức đề xuất**; phải quy về trách nhiệm web/API, streaming và CDN và điều kiện đo/hợp đồng.
- Thiếu API recording hoặc player source thì không coi replay/live đã đáp ứng; có phương án thay thế và điều chỉnh chi phí.

## 4. Điều kiện trước khi chốt giờ FE/BE

Mỗi tính năng được ước tính chỉ khi xác định: CORE/OPTION, đầu vào hệ thống/actor, đầu ra, phác thảo màn/API, dữ liệu dùng chung, ngoại lệ, phụ thuộc, tiêu chí nghiệm thu, và ranh giới GĐ0/GĐ2/vendor. Những hạng mục chưa có quyết định phải ghi giả định/tùy chọn hoặc ước tính theo kịch bản, không tự kết luận scope đã chắc chắn.
