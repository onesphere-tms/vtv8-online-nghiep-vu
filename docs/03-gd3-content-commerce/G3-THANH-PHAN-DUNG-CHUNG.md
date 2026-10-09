# GĐ3 – Thành phần dùng chung và ranh giới trách nhiệm

> **Nguyên tắc:** giữ một chủ sở hữu dữ liệu chính cho mỗi nghiệp vụ; phần hiển thị và kết nối chỉ tính incremental, không nhân đôi GĐ1/GĐ2. Đây là thiết kế phân tích, không phải quyết định phải triển khai 10 microservice.

| Dữ liệu/logic | Chủ sở hữu | Nơi sử dụng | Không phát triển lần hai |
|---|---|---|---|
| Bài/video/chương trình và taxonomy | G1-03/04 | G3-01 nội dung thương mại, G3-03 offering, G3-06 category | CMS/rich editor, địa danh và tag |
| DAM và quyền sử dụng hình ảnh/footage | G1-05 | G3-01/03/06/10 | File/media editor và quyền khai thác gốc |
| Tài khoản người xem và consent nền tảng | G2-01 | G3-02/05/07 | Audience auth/session, consent cơ sở; chỉ bổ sung sự đồng ý chia sẻ lead theo mục đích |
| Partner master và offering giới thiệu | G3-03 | G3-01/02/04/05/06/10 | Không tạo nhiều hồ sơ HTX/khách sạn/công ty; merchant activation là quan hệ bổ sung G3-06 |
| Content–offering relationship và CTA | G3-01 | G3-02 lead, G3-04 affiliate, G3-05 booking, G3-06 SKU | Không tạo 3 widget giới thiệu sản phẩm trong trang bài/video |
| Lead record và bàn giao | G3-02 | G3-10 B2B, G3-04 attribution nếu hợp đồng | Không coi lead là booking; B2B tái dùng lead record |
| Affiliate referral id/click/conversion | G3-04 | G3-05 booking, G3-09 đối soát | Conversion khác tiền hoa hồng đã xác nhận |
| Booking state và vendor confirmation | G3-05 | G3-04 conversion và G3-09 commission | Redirect != booking, booking != order TMĐT; không ghi hai bản booking |
| Seller/SKU và tồn kho | G3-06 | G3-07 cart/orders, G3-08 fulfill | Offering giới thiệu khác SKU; seller kế thừa partner master |
| Đơn TMĐT và thanh toán đơn hàng | G3-07 | G3-08 hậu mãi, G3-09 đối soát | G2-09 subscription/payment có adapter provider dùng lại khi phù hợp, **không dùng subscription order làm commerce order** |
| Giao hàng, hủy, trả hàng, khiếu nại | G3-08 | G3-07 trạng thái/order, G3-09 điều chỉnh | Payment reversal/stock update tích hợp, không tạo order state machine thứ hai |
| Bảng tính hoa hồng/chứng cứ đối soát | G3-09 | G3-02/04/05/07, B2B khi chọn | Không nhân đôi finance payout của nhà cung cấp hoặc nhận tiền bằng phần mềm khi chưa chốt |
| Thông báo tài khoản và analytics | G2-07/G2-11 | G3-02/04/05/07/09 | Thêm notification events và metrics commerce, không xây inbox, event analytics engine từ đầu |

**Phân biệt 4 đối tượng:** `Lead` = yêu cầu tư vấn; `Conversion` = giao dịch/hoạt động được đối tác báo và chờ xác minh; `Booking` = yêu cầu/chỗ được xác nhận tại nhà cung cấp; `CommerceOrder` = đơn hàng được tạo và xử lý trên sàn VTV8. Các mã ID/ trạng thái và nơi chịu trách nhiệm **không tự đồng nhất**.

[Release gates](G3-RELEASE-GATES.md) · [Danh mục GĐ3](G3-DANH-MUC-TINH-NANG.md).
