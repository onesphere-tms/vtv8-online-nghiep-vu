# Quy chuẩn soạn thảo và quản lý tài liệu

## 1. Phạm vi
- Repository phục vụ **phân tích nghiệp vụ – phân tích kỹ thuật – xác định phạm vi – lập dự toán** dự án VTV8Online.
- Không coi thảo luận, phỏng đoán kỹ thuật hoặc ví dụ minh họa là yêu cầu đã được VTV8 duyệt.
- Bám sát tài liệu nguồn; phần tự bổ sung để thiết kế triển khai được phải ghi `PROPOSED`.

## 2. Quy ước định danh
- Giai đoạn: `G0`, `G1`, `G2`, `G3`, `G4`.
- Module: `G1-02`, `G2-07`; không đổi ID khi đổi tên.
- Tính năng/use case: `G1-02-F001`, `G1-02-F002`; API và trường dữ liệu là chi tiết bên dưới use case.
- Quyết định kiến trúc: `ADR-0001`, `ADR-0002`.

## 3. Nguồn gốc & trạng thái
- `SOURCE`: có căn cứ trong tài liệu **Đề xuất phương án hợp tác ... VTV8Online**, ghi phần/trang hoặc đoạn.
- `PROPOSED`: phân rã/phân tích do nhóm đề xuất để thực hiện yêu cầu.
- `TBC`: chưa xác minh/thiếu dữ kiện; **không mặc nhiên đưa vào giá cố định**.

Vòng đời: `DRAFT` → `IN_REVIEW` → `CONFIRMED` → `BASELINED`.
- Chỉ đánh dấu `CONFIRMED` khi có người/đơn vị xác nhận, ngày và chứng cứ.
- `BASELINED` nghĩa là bản phạm vi làm căn cứ báo giá/hợp đồng; thay đổi sau đó phải có change request.

## 4. Phân tích từng module
1. Mục đích, phạm vi và ngoài phạm vi.
2. Actor, quy trình AS-IS/TO-BE, luồng chính và ngoại lệ.
3. Danh sách tính năng ID + nguồn gốc.
4. UI/UX, Backend/API, data, tích hợp, hạ tầng liên quan.
5. Bảo mật, phân quyền, nhật ký, phi chức năng.
6. Quy tắc nghiệp vụ, điều kiện nghiệm thu, test cases.
7. Phụ thuộc, rủi ro, giả định và câu hỏi cần xác nhận.
8. Tách khoản phát triển một lần, license/dịch vụ, và vận hành định kỳ.

## 5. Quy trình cộng tác
- Mỗi lần phân tích 1 module hoặc một nhóm use case nhỏ, tránh gom tất cả vào một tài liệu khổng lồ.
- Đặt file theo mã, ví dụ `G1-02-cms-quan-tri.md`.
- PR ghi: thay đổi phạm vi, căn cứ tài liệu, phần đề xuất, vấn đề chưa rõ, ảnh hưởng báo giá.
- Khi có xác nhận từ VTV8, cập nhật trạng thái + lịch sử quyết định và liên kết bằng chứng.
- Không ghi thông tin cá nhân, khóa API, tài khoản mật hoặc nội dung có bản quyền chưa được phép công bố.

## 6. Điều kiện đủ để ước tính
Một chức năng có thể ước tính khi đã rõ tối thiểu: actor, luồng chính, điều kiện/ngoại lệ, đầu ra, tích hợp, tiêu chí nghiệm thu và giả định. Nếu chưa rõ, ước tính theo **kịch bản/khoảng** thay vì giá cố định.
