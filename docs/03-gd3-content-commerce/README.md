# GĐ3 – VTV8Online Content Commerce (64 tính năng sau QA)

> **09/10/2026 – đã chuẩn hóa phạm vi nội bộ sau QA**, giữ **10 module + 2 nhóm hỗ trợ H01/H02**, **64 tính năng độc lập (15 CORE, 35 CONDITIONAL, 14 OPTION)**. Danh mục được chọn trong phiên phân tích, **chưa được VTV8 phê duyệt**. Chưa lập dự toán FE/BE hay chứng minh tiến độ 6–12 tháng.
>
> **Căn cứ:** [Đề xuất VTV8–IIEL](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md) GĐ3 trang 7 và lộ trình trang 3; B2B từ phần mô hình kinh doanh tổng thể trang 12–13. [Báo cáo QA 70 mã](G3-BAO-CAO-QA-70-TINH-NANG.md) là hồ sơ lịch sử; [bảng mapping 70→64](G3-MAPPING-70-64.md) giải thích từng mã.
>
> **Nguồn `T`** là chủ đề/hướng/ví dụ có trong đề xuất, **không có nghĩa chi tiết thao tác đã được VTV8 chốt**. `B` là phần suy luận nghiệp vụ. CORE là đề xuất bước Content + Lead; CONDITIONAL là phụ thuộc đối tác/pháp lý/đầu tư; OPTION là mở rộng chỉ khi được chọn.

## Cấu trúc 10 module

| Mã | Module | Bước | Tổng | CORE | CONDITIONAL | OPTION |
|---|---|---|---:|---:|---:|---:|
| G3-01 | [Liên kết nội dung với sản phẩm/dịch vụ](G3-01-content-to-offer.md) | A | 6 | 4 | 0 | 2 |
| G3-02 | [Lead và chuyển giao khách hàng](G3-02-lead-management.md) | A | 6 | 6 | 0 | 0 |
| G3-03 | [Hồ sơ đối tác/offering](G3-03-partner-offer-directory.md) | A / mở rộng B,C | 6 | 5 | 1 | 0 |
| G3-04 | [Affiliate tracking](G3-04-affiliate-tracking.md) | B1 | 6 | 0 | 6 | 0 |
| G3-05 | [Kết nối/đặt dịch vụ du lịch](G3-05-travel-booking.md) | B1/B2 | 7 | 0 | 6 | 1 |
| G3-06 | [Danh mục người bán/SKU](G3-06-marketplace-catalog.md) | C | 7 | 0 | 6 | 1 |
| G3-07 | [Giỏ hàng/đơn hàng/thanh toán TMĐT](G3-07-cart-order-payment.md) | C | 8 | 0 | 7 | 1 |
| G3-08 | [Giao hàng/hậu mãi](G3-08-fulfillment-returns-support.md) | C | 6 | 0 | 4 | 2 |
| G3-09 | [Đối soát hoa hồng/doanh thu](G3-09-commerce-reconciliation.md) | B/C | 6 | 0 | 5 | 1 |
| G3-10 | [Gói truyền thông/tài trợ B2B](G3-10-sponsored-b2b-packages.md) | B2B tùy chọn | 6 | 0 | 0 | 6 |
| **Tổng** | | | **64** | **15** | **35** | **14** |

**[Danh mục 64 tính năng GĐ3](G3-DANH-MUC-TINH-NANG.md)** là bản sử dụng hiện tại. Mỗi tài liệu module đã cập nhật actor, nghiệp vụ, FE/BE mới, nghiệm thu riêng và ranh giới sau QA.

## Tài liệu kèm theo

- [Truy vết 70 mã trước QA sang 64 mã hiện hành](G3-MAPPING-70-64.md).
- [Báo cáo chất lượng và 10 bảng QA của 70 mã ban đầu](G3-BAO-CAO-QA-70-TINH-NANG.md) là tài liệu lịch sử, không phải bảng phạm vi đang áp dụng.
- [Phân kỳ và điều kiện mở Affiliate/Booking/TMĐT](G3-RELEASE-GATES.md).
- [Không tính trùng với GĐ1/GĐ2, chủ sở hữu thành phần chung](G3-THANH-PHAN-DUNG-CHUNG.md).
- [11 kịch bản nghiệm thu xuyên module](G3-TIEU-CHI-NGHIEM-THU.md).
- [G3-H01 – hạ tầng & tích hợp](G3-H01-ha-tang-tich-hop.md) và [G3-H02 – pháp lý, UAT & bàn giao](G3-H02-phap-ly-nghiem-thu.md).

**Phạm vi cần hiểu đúng:** CORE chỉ bao phủ bước A (Content + Lead). B1 Affiliate, B2 Booking API và C Marketplace vẫn nằm trong định hướng đề xuất VTV8 nhưng phụ thuộc việc chốt đối tác và mô hình kinh doanh; không tự cộng 35 CONDITIONAL vào cam kết phát triển đợt đầu. B2B là tùy chọn, không được coi là bước nguồn bắt buộc. **Chưa ước tính giờ FE/BE**.

## Dự toán giờ công FE/BE GĐ3 (DRAFT V1)

- [Bảng dự toán đủ 64 mã, bao gồm FE/BE, BA/Design/QA, MD và ranh giới theo gói](../../bao-gia/DU-TOAN-EFFORT-GD3-FE-BE-DU-THAO.md).
- [CSV 64 feature](../../bao-gia/DU-TOAN-EFFORT-GD3-FE-BE.csv) và [CSV tổng hợp theo gói](../../bao-gia/TONG-HOP-DU-TOAN-GD3-THEO-GOI.csv).
- **15 CORE Content + Lead:** 1.320 giờ Coding, **300 MD** tổng effort. **35 CONDITIONAL:** 4.668 giờ Coding, **1.060,91 MD**. **14 OPTION:** 1.320 giờ Coding, **300 MD**.
- **Nếu làm đủ 64:** 7.308 giờ Coding, **1.660,91 MD** tổng effort theo tỷ trọng đã thống nhất. Finance affiliate/marketplace được đếm một lần, không tự cộng cả gói điều kiện vào bước A.
- Chưa được VTV8 xác nhận; chưa tính G3-H01/H02, phí đối tác/giấy phép, quản trị pháp lý, vận hành, PM hoặc thời gian chờ API; không coi số MD là cam kết tiến độ 6–12 tháng.
