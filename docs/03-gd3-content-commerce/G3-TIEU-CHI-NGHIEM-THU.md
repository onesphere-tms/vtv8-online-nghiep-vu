# GĐ3 – Tiêu chí nghiệm thu tổng thể theo ba bước

> **Đề xuất nghiệp vụ ngày 09/10/2026; chưa được VTV8 xác nhận.** Áp dụng cùng dòng nghiệm thu riêng của mỗi module, không coi đây là chức năng thứ 71.

## Kiểm tra dùng chung
1. Dữ liệu trong CMS/G1/G2 chỉ được tham chiếu khi còn công khai, có quyền và đúng đối tượng; không tự đăng bán dịch vụ/sản phẩm chưa phê duyệt.
2. Trách nhiệm VTV8/đối tác phải hiển thị phù hợp tại thời điểm người dùng gửi lead, chuyển qua link affiliate, booking hay checkout.
3. Dữ liệu cá nhân chỉ chia sẻ với đúng đối tác, đúng mục đích và chính sách được xác nhận; quyền truy cập audit được.
4. Retry webhook, callback, create booking/order và đổi trạng thái phải idempotent khi có transaction; log lỗi và đường khôi phục.
5. Phân biệt lead / conversion / booking / commerce order / payment / commission, không dùng một số đếm thay cho số còn lại.
6. Các cổng API/đối tác bị lỗi phải thể hiện trạng thái thật; không khẳng định booking/sale/đã nhận tiền khi chưa có xác nhận.
7. Bước B/C chỉ nghiệm thu khi các [gate](G3-RELEASE-GATES.md) phù hợp được chốt. `OPTION` không mặc nhiên là bắt buộc.

## Kịch bản E2E

| ID | Luồng kiểm tra | Kết quả tối thiểu | Bước |
|---|---|---|---|
| G3-E2E-01 | Video điểm đến → offering tour liên quan → CTA tư vấn | Offering đúng, đã được duyệt, hiển thị nguồn VTV8 và đối tác | A |
| G3-E2E-02 | Xem phóng sự sản phẩm → gửi lead có consent → đối tác nhận → cập nhật kết quả | PII được ghi/chuyển hợp lệ, lead có source và bằng chứng | A |
| G3-E2E-03 | Tạm khóa offering/đối tác | CTA public và lead routing bị chặn theo chính sách, không có liên kết sai | A |
| G3-E2E-04 | Link affiliate → click source → conversion callback trùng/trễ → hoa hồng theo hợp đồng | Không đếm đôi conversion; phân biệt pending và accepted | B1 |
| G3-E2E-05 | Chọn ngày/người → giá/slot provider → booking API → kết quả pending/confirmed | Không hiển thị confirmed trước khi vendor xác nhận; idempotent | B2 |
| G3-E2E-06 | Đặt dịch vụ qua redirect đối tác | Không biến redirect thành 'đã đặt chỗ'; tracking đúng khi có bằng chứng | B1 |
| G3-E2E-07 | Seller hợp lệ → SKU/giá/tồn → giỏ → thanh toán → paid order | Giá snapshot, không oversell, webhook không tạo đơn kép | C |
| G3-E2E-08 | Seller xử lý đơn → vận chuyển → cập nhật trạng thái | Người mua biết trạng thái có nguồn và timestamp; quyền dữ liệu đúng | C |
| G3-E2E-09 | Hủy/trả hàng/hoàn tiền/chargeback → stock/ledger/commission | Không hoàn hai lần, trace được điều chỉnh, seller và VTV8 có trách nhiệm rõ | C |
| G3-E2E-10 | Báo cáo content→lead→conversion→booking/order→commission | Số liệu giải thích được với nguồn, trạng thái và kỳ; không gọi lead là sale | A/B/C |
| G3-E2E-11 | Gói truyền thông tài trợ → phê duyệt → công khai nhãn → ghi nhận bàn giao | Không bỏ qua quy trình biên tập và quyền tài sản; đúng gói/hợp đồng | B2B OPTION |

## Điều kiện trước khi chốt giờ FE/BE
Chỉ ước tính chính thức sau khi xác nhận có triển khai bước A, B1, B2 hay C; đối tác và API; trách nhiệm giao dịch/cung cấp dịch vụ; điều kiện pháp lý; mô hình pricing/commission/tax/payment, và luồng hoàn tiền/đối soát. Không cộng toàn bộ `CONDITIONAL` như phạm vi nền tảng ban đầu.
