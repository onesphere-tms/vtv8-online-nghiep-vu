# GĐ2 – Điều kiện phát hành nghiệp vụ thuê bao, thanh toán, quyền xem và DRM

> **COMMERCIAL_RELEASE_GATE – bản phân tích nội bộ, chưa có xác nhận VTV8 hoặc nhà cung cấp.** Đây là điều kiện bao trùm các feature đã có, không phải tính năng thứ 67. Dù nhãn CONDITIONAL, mục tiêu thương mại hóa trong tài liệu VTV8 không bị tự động loại bỏ khỏi GĐ2.

## Điều kiện đầu vào cần được xác nhận

| Mã gate | Điều kiện cần chốt | Chủ thể tham gia |
|---|---|---|
| CG-01 | Danh mục gói, giá, chu kỳ, loại nội dung và quyền lợi | VTV8 / kinh doanh / nội dung |
| CG-02 | Chủ thể nhận tiền, cổng thanh toán, hợp đồng API/sandbox, chính sách hóa đơn/hoàn tiền | VTV8 / tài chính / đối tác thanh toán |
| CG-03 | Được phép thương mại và phát nội dung theo thời hạn/khu vực/thiết bị | VTV8 / bộ phận bản quyền; G1-05 |
| CG-04 | Kỹ thuật bảo vệ stream, signed URL/token, DRM/license provider nếu hợp đồng yêu cầu | Streaming provider / kỹ thuật G1-08 |
| CG-05 | Trạng thái order/thuê bao khi webhook trễ, trùng, hoàn tiền hoặc chargeback | VTV8 / gateway / đội phát triển |
| CG-06 | Điều khoản người xem, consent/dữ liệu thanh toán và trách nhiệm hỗ trợ | VTV8 / bộ phận pháp lý |

## Luồng tối thiểu phải nghiệm thu chung

1. **Chọn gói, định giá và quyền lợi** từ G2-09-F001/F002, chỉ hiển thị gói được phép bán.
2. **Đăng nhập và tạo đơn** qua G2-01/G2-09-F003. Gateway xử lý tiền, hệ thống không lưu thông tin thẻ nhạy cảm.
3. **Xác minh giao dịch** G2-09-F004 với webhook có chữ ký, idempotent, đủ trạng thái pending/success/fail, có đối soát ngoại lệ.
4. **Kích hoạt/hết hạn/hủy thuê bao** G2-09-F005/F006; hoàn tiền hoặc đảo giao dịch xử lý theo chính sách được xác nhận.
5. **Phân loại nội dung và kiểm tra quyền thật** G2-10-F001/F002, kết hợp hạn khai thác/bản quyền DAM G1-05 (nghiệp vụ mã gộp G2-10-F007).
6. **Paywall và cấp playback private** G2-10-F003/F004 qua Streaming adapter G1-08; không cho bypass bằng cách đoán URL hoặc ẩn CSS.
7. **DRM G2-10-F005** phải được tích hợp và kiểm thử với provider/thiết bị nếu nội dung yêu cầu DRM; signed URL không tự động thay thế DRM.
8. **UAT vòng đời trả phí:** mua → xem → hết hạn/hủy/hoàn tiền → kiểm tra thu hồi quyền; đối soát số liệu/thất bại.

**Không nghiệm thu riêng form tạo gói hoặc modal paywall như bằng chứng toàn bộ hệ thống thuê bao đã vận hành.** Nếu chưa có gateway/đối tác, ghi rõ blocker, không báo hoàn thành năng lực trả phí.

## Ranh giới mở rộng

Voucher/dùng thử G2-09-F008, giới hạn thiết bị G2-10-F006 là OPTION. Không mặc định tự động trừ tiền định kỳ, hoàn tiền tự động, xuất hóa đơn điện tử, tự xây cổng thanh toán, DRM server, media CDN hoặc hệ thống kế toán. Các đặc thù này cần quyết định VTV8 và hợp đồng vendor riêng.
