# GĐ3 – Content Commerce: đề xuất 10 module, 70 tính năng

> **09/10/2026 – DRAFT phân tích nghiệp vụ lần đầu, chưa qua vòng QA và chưa chốt với VTV8.** Thời lượng dự kiến trong tài liệu nguồn **6–12 tháng**, chưa có giờ FE/BE. Nguồn chia **ba bước**: Content + Lead → Affiliate/Booking → sàn TMĐT khi quy mô người dùng đủ lớn. Không có cơ sở bắt buộc tự xây sàn ngay trong đợt đầu.

## Đề xuất module và phạm vi

| Mã | Module | Bước | Tổng | CORE | CONDITIONAL | OPTION |
|---|---|---|---:|---:|---:|---:|
| G3-01 | [Liên kết nội dung với sản phẩm và dịch vụ](G3-01-content-to-offer.md) | A | 7 | 5 | 0 | 2 |
| G3-02 | [Tiếp nhận và quản lý lead](G3-02-lead-management.md) | A | 7 | 7 | 0 | 0 |
| G3-03 | [Đối tác và danh mục offering](G3-03-partner-offer-directory.md) | A → B/C | 7 | 6 | 1 | 0 |
| G3-04 | [Affiliate tracking](G3-04-affiliate-tracking.md) | B1 | 6 | 0 | 6 | 0 |
| G3-05 | [Booking dịch vụ du lịch](G3-05-travel-booking.md) | B1/B2 | 8 | 0 | 8 | 0 |
| G3-06 | [Marketplace catalog và seller](G3-06-marketplace-catalog.md) | C | 7 | 0 | 6 | 1 |
| G3-07 | [Giỏ hàng, đơn hàng, thanh toán](G3-07-cart-order-payment.md) | C | 9 | 0 | 8 | 1 |
| G3-08 | [Fulfillment và hậu mãi](G3-08-fulfillment-returns-support.md) | C | 7 | 0 | 6 | 1 |
| G3-09 | [Đối soát và hoa hồng](G3-09-commerce-reconciliation.md) | B/C | 6 | 0 | 5 | 1 |
| G3-10 | [Gói truyền thông tài trợ B2B](G3-10-sponsored-b2b-packages.md) | B2B OPTION | 6 | 0 | 0 | 6 |
| **Tổng** | | | **70** | **18** | **40** | **12** |

**[Xem danh mục 70 tính năng](G3-DANH-MUC-TINH-NANG.md)**. Mỗi module có actor, luồng nghiệp vụ, FE/BE cần phát triển mới, tiêu chí nghiệm thu, nguồn và phạm vi điều kiện.

## Kết quả QA 70 tính năng (09/10/2026)

- **[Báo cáo QA toàn bộ 70 mã](G3-BAO-CAO-QA-70-TINH-NANG.md)** và 10 bảng QA theo module G3-QA-G3-01 đến G3-QA-G3-10.
- **Đề xuất sau rà soát:** gộp 6 mã, chuyển 2 tính năng sang OPTION, còn **64 tính năng độc lập** gồm **15 CORE, 35 CONDITIONAL, 14 OPTION**.
- **Chưa áp dụng** thay đổi này vào danh mục 70 tính năng và 10 tài liệu module bên dưới. 70 mã (18 CORE, 40 CONDITIONAL, 12 OPTION) vẫn là bản thiết kế gốc để bảo đảm truy vết. Chưa có phê duyệt từ VTV8.

## Nguyên tắc phân kỳ

- **A – Content + Lead:** làm trước để nội dung dẫn đến nhu cầu tư vấn, có chuyển giao lead/đối tác và thống kê. Không nhận là booking hay mua hàng.
- **B – Affiliate/Booking:** phụ thuộc hợp đồng hoa hồng, tracking và dữ liệu conversion; chỉ làm booking tại chỗ nếu API/vai trò được chốt, còn lại redirect/link-out.
- **C – Sàn TMĐT:** phụ thuộc ngưỡng phát triển thực tế, doanh nghiệp bán, thanh toán, giao vận, hoàn tiền, hậu mãi, trách nhiệm pháp lý. Không mặc định làm tất cả trong GĐ3 đầu tiên.
- **G3-10 – B2B tài trợ:** nguồn nêu mô hình kinh doanh truyền thông rộng hơn, **OPTION** cho GĐ3; không tự đặt B2B là bước thứ tư bắt buộc.

## Tài liệu quản trị phạm vi

- [Điều kiện phát hành theo ba bước](G3-RELEASE-GATES.md).
- [Thành phần dùng chung và nguyên tắc không trùng GĐ1–GĐ2](G3-THANH-PHAN-DUNG-CHUNG.md).
- [G3-H01 – DevOps và tích hợp vận hành](G3-H01-ha-tang-tich-hop.md).
- [G3-H02 – Pháp lý, UAT và chuyển giao](G3-H02-phap-ly-nghiem-thu.md).
- [11 kịch bản nghiệm thu xuyên module](G3-TIEU-CHI-NGHIEM-THU.md).

## Cần xác nhận

Mô hình VTV8 đứng vai trò bên giới thiệu hay người bán; cơ chế chia sẻ dữ liệu lead, hợp đồng đối tác; API booking và điều kiện giá/chỗ; cách xác nhận hoa hồng; ai nhận tiền/thuế/hóa đơn và hỗ trợ hoàn/hủy; điều kiện pháp lý/phạm vi vận hành sàn TMĐT; B2B có thuộc GĐ3 hay nằm riêng. **Không lập giờ FE/BE trong bản này.**

**Căn cứ:** [Đề xuất hợp tác VTV8–IIEL, mục GĐ3 trang 7 và mô hình kinh doanh trang 12–13](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md). Bản phân rã không thay cho yêu cầu nghiệp vụ hay hợp đồng VTV8 phê duyệt.
