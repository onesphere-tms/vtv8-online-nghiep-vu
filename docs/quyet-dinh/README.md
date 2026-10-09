# Sổ quyết định và vấn đề cần làm rõ

## Cách ghi quyết định
Tạo file `ADR-0001-ten-quyet-dinh.md` theo cấu trúc:
- Mã, ngày, trạng thái `PROPOSED | ACCEPTED | SUPERSEDED`, người xác nhận.
- Bối cảnh và các phương án.
- Tiêu chí lựa chọn: kỹ thuật, tài chính, pháp lý, rủi ro, vận hành.
- Quyết định, điều kiện áp dụng, tác động lên module và báo giá.
- Liên kết chứng cứ/phê duyệt.

## Backlog quyết định ban đầu
| ID | Quyết định | Ưu tiên | Trạng thái |
|---|---|---|---|
| ADR-0001 | Website/CMS kế thừa hay xây mới | Cao | OPEN |
| ADR-0002 | Streaming VTVcab hay tự vận hành | Cao | OPEN |
| ADR-0003 | Định nghĩa và tải kiểm thử 120k CCU | Cao | OPEN |
| ADR-0004 | Migration, quyền nội dung, bản quyền | Cao | OPEN |
| ADR-0005 | Paywall, gói cước, payment, DRM | Trung bình | OPEN |
| ADR-0006 | Booking referral/API/full checkout | Trung bình | OPEN |
| ADR-0007 | AI provider và cơ chế chi phí | Trung bình | OPEN |

Chưa có ADR nào được `ACCEPTED` khi khởi tạo.
