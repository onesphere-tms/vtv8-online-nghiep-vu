# GĐ3 – Dự toán FE/BE theo 64 tính năng Content Commerce (DRAFT V1)

> **09/10/2026 – dự toán nội bộ theo năng suất Middle Developer, chưa được VTV8 xác nhận hoặc dùng làm báo giá chính thức.** Căn cứ [64 tính năng sau QA](../docs/03-gd3-content-commerce/G3-DANH-MUC-TINH-NANG.md), [70→64](../docs/03-gd3-content-commerce/G3-MAPPING-70-64.md), [phương pháp tính giờ](PHUONG-PHAP-UOC-TINH.md) đã thống nhất. Chỉ bóc giờ lập trình FE/BE **phần mới**; không áp dụng hệ số tăng năng suất nhờ công cụ AI, không quy đổi giờ effort thành thời gian lịch bằng cách chia đơn giản.
>
> **Quy ước:** 1 MD = 8 giờ. Coding = FE + BE, BA = Coding × 10/55, Design = Coding × 15/55, QA = Coding × 20/55, tổng effort = Coding/0,55. `H/M/L` = độ tin cậy cao/trung bình/thấp của **ước tính**, không phải mức ưu tiên.

## 1. Giả định, sở hữu và loại trừ

- **Kế thừa GĐ1:** CMS/bài/video, taxonomy, DAM rights, player, thống kê cơ bản, trang nội dung; **GĐ2:** audience account/consent, notification inbox, payment gateway adapter (chỉ nếu module tương ứng đã thật sự triển khai và phù hợp). Không cộng giờ xây lại những thành phần đã có. Nếu module GĐ2 có điều kiện chưa được làm, phải cộng chi phí phụ thuộc tương ứng khi lập ngân sách.
- **A – Content + Lead:** form và back-office, chuyển giao lead **thủ công** là cơ sở. Một partner master và một offering catalog theo taxonomy có sẵn. Không xây CRM toàn diện, ký số, partner portal hay payment. Thẩm định/consent cần VTV8 duyệt nên một số giờ có độ tin cậy thấp.
- **A+ đồng bộ đối tác:** `G3-03-F007` là **CONDITIONAL** chỉ khi có API một nhà cung cấp cụ thể. Không tự cộng vào A.
- **B1:** một kiểu referral link và **một** đối tác có dữ liệu conversion/API hoặc batch tin cậy, gắn link/attribution; redirect không phải booking.
- **Finance dùng chung:** năm mã `G3-09-F001…F005` ước tính một lần cho B1/C khi có hợp đồng commission/reconciliation. Nếu đơn hàng C có seller settlement, payout, tax hay nhiều dòng tiền thì cần báo giá bổ sung, **không mặc định đã bao gồm**. B1 chỉ tracking nhưng chưa cần chia hoa hồng có thể tạm chưa làm nhóm Finance nếu hợp đồng cho phép.
- **B2:** một provider có API giá/slot, booking, trạng thái, hủy; chỉ là adapter tích hợp, không tự vận hành inventory phòng/vé hoặc đảm nhận thu tiền booking nếu chưa chốt. Quyền đổi/hủy và kiểu callback có thể thay đổi lớn giờ BE.
- **C:** thử khối lượng một seller/một đơn, một loại payment provider, hệ tồn kho có kiểm soát và phương thức giao hàng/đơn giản; trạng thái giao thủ công cơ sở thuộc G3-08-F001. Multi-seller order split, payout, tax/invoice engine, logistics network, fulfillment kho thực, fraud/RMA enterprise và Carrier API tự động nằm ngoài phạm vi cơ sở.
- **OPTION:** chỉ chọn khi bước cha được mở; B2B là gói mở rộng độc lập dựa nguồn mô hình kinh doanh chung, chưa được xác nhận là bắt buộc GĐ3.
- Dùng UI components/admin primitives, form/state management, auth/payment libraries hoặc SDK có sẵn khi phù hợp; không tự xây payment gateway/booking platform/ERP. Từng external API cần hợp đồng/sandbox, quota và data mapping thực tế.
- **Ngoài tính giờ lập trình:** [G3-H01](../docs/03-gd3-content-commerce/G3-H01-ha-tang-tich-hop.md), [G3-H02](../docs/03-gd3-content-commerce/G3-H02-phap-ly-nghiem-thu.md), legal/merchant registration, vendor onboarding, license, sandbox, transaction fee, SMS/email/carrier fee, DevOps, security/load test chuyên sâu, vận hành chuyển lead, merchant moderation, đối soát thủ công, PM, bảo trì và dự phòng. BA/Design/QA trong mục quy đổi là tỷ trọng chuẩn cho sản phẩm, **không thay** các công việc chuyên biệt này.

## 2. Tổng giờ phát triển theo module

| Module | FE CORE | BE CORE | FE CONDITIONAL | BE CONDITIONAL | FE OPTION | BE OPTION | Coding toàn module |
|---|---:|---:|---:|---:|---:|---:|---:|
| [G3-01 – Content → dịch vụ](../docs/03-gd3-content-commerce/G3-01-content-to-offer.md) | 116 | 128 | 0 | 0 | 36 | 56 | 336 |
| [G3-02 – Lead và bàn giao](../docs/03-gd3-content-commerce/G3-02-lead-management.md) | 204 | 352 | 0 | 0 | 0 | 0 | 556 |
| [G3-03 – Đối tác và offering](../docs/03-gd3-content-commerce/G3-03-partner-offer-directory.md) | 188 | 332 | 20 | 88 | 0 | 0 | 628 |
| [G3-04 – Affiliate & tracking](../docs/03-gd3-content-commerce/G3-04-affiliate-tracking.md) | 0 | 0 | 168 | 416 | 0 | 0 | 584 |
| [G3-05 – Booking dịch vụ](../docs/03-gd3-content-commerce/G3-05-travel-booking.md) | 0 | 0 | 220 | 584 | 40 | 32 | 876 |
| [G3-06 – Seller, SKU & inventory](../docs/03-gd3-content-commerce/G3-06-marketplace-catalog.md) | 0 | 0 | 252 | 504 | 48 | 48 | 852 |
| [G3-07 – Đơn hàng và thanh toán](../docs/03-gd3-content-commerce/G3-07-cart-order-payment.md) | 0 | 0 | 296 | 680 | 32 | 80 | 1088 |
| [G3-08 – Fulfillment & hậu mãi](../docs/03-gd3-content-commerce/G3-08-fulfillment-returns-support.md) | 0 | 0 | 200 | 456 | 72 | 176 | 904 |
| [G3-09 – Đối soát hoa hồng](../docs/03-gd3-content-commerce/G3-09-commerce-reconciliation.md) | 0 | 0 | 224 | 560 | 40 | 104 | 928 |
| [G3-10 – Dịch vụ B2B/tài trợ](../docs/03-gd3-content-commerce/G3-10-sponsored-b2b-packages.md) | 0 | 0 | 0 | 0 | 208 | 348 | 556 |
| **Tổng** | **508** | **812** | **1380** | **3288** | **476** | **844** | **7308** |

## 3. Theo gói triển khai để không cộng trùng

| Gói phát triển | Số tính năng | FE (h) | BE (h) | Coding (h) | Tổng effort (MD) |
|---|---:|---:|---:|---:|---:|
| A – Content + Lead | 15 | 508 | 812 | 1320 | 300.00 |
| A+ – Đồng bộ đối tác (gate) | 1 | 20 | 88 | 108 | 24.55 |
| B1 – Referral/Affiliate và redirect | 7 | 184 | 440 | 624 | 141.82 |
| Finance – Đối soát/hoa hồng (dùng chung B1/C) | 5 | 224 | 560 | 784 | 178.18 |
| B2 – Booking API trực tiếp | 5 | 204 | 560 | 764 | 173.64 |
| C – Marketplace/Order/Fulfillment | 17 | 748 | 1640 | 2388 | 542.73 |
| A – Mở rộng tùy chọn | 2 | 36 | 56 | 92 | 20.91 |
| B1 – Trang booking tùy chọn | 1 | 40 | 32 | 72 | 16.36 |
| C – Marketplace tùy chọn | 4 | 152 | 304 | 456 | 103.64 |
| Finance – Đối soát nâng cao tùy chọn | 1 | 40 | 104 | 144 | 32.73 |
| B2B – Gói tài trợ tùy chọn | 6 | 208 | 348 | 556 | 126.36 |

**Lưu ý:** `B1/C FINANCE` chỉ tính **một lần**, bất kể triển khai B1 và C cùng lúc. `A+ SYNC` không cần cho Content + Lead thủ công. `B1+ OPTION` là trang listing booking riêng không cần để redirect. Các nhóm `OPTION` không mặc định nằm trong nền tảng.

## 4. Bóc tách giờ FE và BE của từng feature

| Mã | Tính năng | Nhãn | Gói | FE giờ | BE giờ | Coding giờ | Độ tin cậy | Căn cứ tính giờ |
|---|---|---|---|---:|---:|---:|---|---|
| [G3-01-F001](../docs/03-gd3-content-commerce/G3-01-content-to-offer.md) | Liên kết nội dung với sản phẩm/dịch vụ | CORE | A | 28 | 40 | 68 | M | Content–offering relation, CTA có kiểm soát |
| [G3-01-F002](../docs/03-gd3-content-commerce/G3-01-content-to-offer.md) | Khối giới thiệu dịch vụ trong trang nội dung | CORE | A | 32 | 24 | 56 | M | Reusable content commerce cards, availability guard từ G3-03 |
| [G3-01-F003](../docs/03-gd3-content-commerce/G3-01-content-to-offer.md) | Trang giới thiệu sản phẩm hoặc dịch vụ liên quan | CORE | A | 36 | 40 | 76 | M | Offering detail và CTA chung, đã nhận booking detail F002 |
| [G3-01-F004](../docs/03-gd3-content-commerce/G3-01-content-to-offer.md) | Phân biệt nội dung biên tập và nội dung thương mại | CORE | A | 20 | 24 | 44 | M | Disclosure thương mại và metadata CMS |
| [G3-01-F006](../docs/03-gd3-content-commerce/G3-01-content-to-offer.md) | Liên kết sâu và mã QR tới trang dịch vụ | OPTION | A+ OPTION | 16 | 24 | 40 | M | Stable link/QR, safe redirect; không tự làm link shortener |
| [G3-01-F007](../docs/03-gd3-content-commerce/G3-01-content-to-offer.md) | Đề xuất dịch vụ liên quan theo địa danh/chủ đề | OPTION | A+ OPTION | 20 | 32 | 52 | M | Related offering rule-based qua taxonomy sẵn có |
| [G3-02-F001](../docs/03-gd3-content-commerce/G3-02-lead-management.md) | Biểu mẫu đăng ký tư vấn/liên hệ sản phẩm | CORE | A | 32 | 64 | 96 | M | Lead form, idempotency, rate limit/dedupe đã gộp F003 |
| [G3-02-F002](../docs/03-gd3-content-commerce/G3-02-lead-management.md) | Thông báo và ghi nhận đồng ý chia sẻ thông tin | CORE | A | 20 | 44 | 64 | L | Consent snapshot theo đối tác, mục đích và privacy policy |
| [G3-02-F004](../docs/03-gd3-content-commerce/G3-02-lead-management.md) | Hộp tiếp nhận lead của VTV8 | CORE | A | 48 | 64 | 112 | M | Lead back-office, quyền PII và timeline |
| [G3-02-F005](../docs/03-gd3-content-commerce/G3-02-lead-management.md) | Phân công và chuyển giao lead cho đối tác | CORE | A | 40 | 76 | 116 | M | Chuyển giao thủ công, ack/failed, audit và quyền đối tác |
| [G3-02-F006](../docs/03-gd3-content-commerce/G3-02-lead-management.md) | Cập nhật tiến độ tư vấn và kết quả lead | CORE | A | 28 | 48 | 76 | M | Lead statuses, contact log và validation |
| [G3-02-F007](../docs/03-gd3-content-commerce/G3-02-lead-management.md) | Thống kê chuyển đổi từ nội dung sang lead | CORE | A | 36 | 56 | 92 | M | Lead metrics, nguồn nội dung/offer và export tối thiểu |
| [G3-03-F001](../docs/03-gd3-content-commerce/G3-03-partner-offer-directory.md) | Hồ sơ đơn vị đối tác | CORE | A | 40 | 72 | 112 | M | Partner master, roles và dedupe doanh nghiệp |
| [G3-03-F002](../docs/03-gd3-content-commerce/G3-03-partner-offer-directory.md) | Danh mục offering sản phẩm/dịch vụ mức giới thiệu | CORE | A | 52 | 88 | 140 | M | Offering CRUD, media picker, taxonomy G1-04, đã gộp F005 |
| [G3-03-F003](../docs/03-gd3-content-commerce/G3-03-partner-offer-directory.md) | Thẩm định và phê duyệt đối tác/offering | CORE | A | 44 | 72 | 116 | L | Quy trình duyệt và chứng cứ partner/offering |
| [G3-03-F004](../docs/03-gd3-content-commerce/G3-03-partner-offer-directory.md) | Quản lý thông tin liên hệ và điều khoản hợp tác | CORE | A | 28 | 40 | 68 | M | Contract/điều khoản metadata, quyền truy cập |
| [G3-03-F006](../docs/03-gd3-content-commerce/G3-03-partner-offer-directory.md) | Quản lý chất lượng, tạm khóa và ngừng cung cấp | CORE | A | 24 | 60 | 84 | M | Eligibility/suspension guard dùng chung, nhận G3-01-F005 |
| [G3-03-F007](../docs/03-gd3-content-commerce/G3-03-partner-offer-directory.md) | Kết nối dữ liệu đối tác từ API tự động | CONDITIONAL | A+ SYNC | 20 | 88 | 108 | L | Một vendor API sync được chốt, mapping/retry; không xây integration hub |
| [G3-04-F001](../docs/03-gd3-content-commerce/G3-04-affiliate-tracking.md) | Chương trình affiliate và đường dẫn giới thiệu | CONDITIONAL | B1 | 32 | 64 | 96 | L | Affiliate campaign/link, mã ref và hợp đồng |
| [G3-04-F002](../docs/03-gd3-content-commerce/G3-04-affiliate-tracking.md) | Ghi nhận nhấp và phiên giới thiệu | CONDITIONAL | B1 | 12 | 56 | 68 | M | Referral click, source attribution, anti-bot và consent |
| [G3-04-F003](../docs/03-gd3-content-commerce/G3-04-affiliate-tracking.md) | Quy tắc quy kết và thời hạn attribution | CONDITIONAL | B1 | 24 | 64 | 88 | L | Attribution window/rules dựa chính sách hợp đồng |
| [G3-04-F004](../docs/03-gd3-content-commerce/G3-04-affiliate-tracking.md) | Nhận conversion/callback từ đối tác | CONDITIONAL | B1 | 28 | 104 | 132 | L | Webhook/batch raw conversion từ một đối tác, idempotent |
| [G3-04-F005](../docs/03-gd3-content-commerce/G3-04-affiliate-tracking.md) | Theo dõi trạng thái chuyển đổi affiliate | CONDITIONAL | B1 | 32 | 64 | 96 | L | Conversion state/voucher chứng cứ, không tạo ledger tiền |
| [G3-04-F006](../docs/03-gd3-content-commerce/G3-04-affiliate-tracking.md) | Báo cáo hiệu quả affiliate theo nguồn nội dung | CONDITIONAL | B1 | 40 | 64 | 104 | M | Dashboard click/conversion theo content/partner |
| [G3-05-F001](../docs/03-gd3-content-commerce/G3-05-travel-booking.md) | Danh sách dịch vụ du lịch có thể đặt | OPTION | B1+ OPTION | 40 | 32 | 72 | M | Listing bookable riêng; đã có offering detail G3-01 |
| [G3-05-F003](../docs/03-gd3-content-commerce/G3-05-travel-booking.md) | Chuyển hướng đặt dịch vụ tại hệ thống đối tác | CONDITIONAL | B1 | 16 | 24 | 40 | M | Vendor outbound CTA và safe URL, không đánh dấu booked |
| [G3-05-F004](../docs/03-gd3-content-commerce/G3-05-travel-booking.md) | Kiểm tra giá và tình trạng chỗ qua API đối tác | CONDITIONAL | B2 | 40 | 112 | 152 | L | Một API báo giá/slot, TTL/timezone/stale quotes |
| [G3-05-F005](../docs/03-gd3-content-commerce/G3-05-travel-booking.md) | Tạo yêu cầu đặt chỗ trực tiếp qua API | CONDITIONAL | B2 | 52 | 144 | 196 | L | Booking request idempotent, external booking reference |
| [G3-05-F006](../docs/03-gd3-content-commerce/G3-05-travel-booking.md) | Đồng bộ và hiển thị trạng thái đặt chỗ | CONDITIONAL | B2 | 40 | 104 | 144 | L | Status webhook/polling, retry/timestamp/vendor authority |
| [G3-05-F007](../docs/03-gd3-content-commerce/G3-05-travel-booking.md) | Hủy/đổi lịch theo chính sách bên cung cấp | CONDITIONAL | B2 | 40 | 112 | 152 | L | Hủy/đổi theo vendor API hay manual policy |
| [G3-05-F008](../docs/03-gd3-content-commerce/G3-05-travel-booking.md) | Theo dõi lỗi và đối soát booking với đối tác | CONDITIONAL | B2 | 32 | 88 | 120 | L | Booking orphan/error reconciliation, vận hành retry |
| [G3-06-F001](../docs/03-gd3-content-commerce/G3-06-marketplace-catalog.md) | Đánh giá và kích hoạt đối tác thành người bán | CONDITIONAL | C | 32 | 64 | 96 | L | Merchant activation kế thừa partner master, role/evidence |
| [G3-06-F002](../docs/03-gd3-content-commerce/G3-06-marketplace-catalog.md) | Danh mục sản phẩm bán trực tiếp | CONDITIONAL | C | 48 | 104 | 152 | L | SKU/variant mức cơ sở và catalog có kiểm duyệt |
| [G3-06-F003](../docs/03-gd3-content-commerce/G3-06-marketplace-catalog.md) | Giá niêm yết và điều kiện bán hàng | CONDITIONAL | C | 40 | 72 | 112 | L | Giá và ngày hiệu lực, snapshot thuộc order G3-07 |
| [G3-06-F004](../docs/03-gd3-content-commerce/G3-06-marketplace-catalog.md) | Quản lý tồn kho cơ bản | CONDITIONAL | C | 48 | 128 | 176 | L | Stock reservation/concurrency/timeout, một nguồn tồn |
| [G3-06-F005](../docs/03-gd3-content-commerce/G3-06-marketplace-catalog.md) | Tổ chức danh mục và lọc sản phẩm | CONDITIONAL | C | 44 | 64 | 108 | M | SKU list/filter dựa taxonomy G1-04 và card chung |
| [G3-06-F006](../docs/03-gd3-content-commerce/G3-06-marketplace-catalog.md) | Kiểm duyệt thông tin và quyền sử dụng hình ảnh sản phẩm | CONDITIONAL | C | 40 | 72 | 112 | L | Product compliance/evidence và DAM media rights |
| [G3-06-F007](../docs/03-gd3-content-commerce/G3-06-marketplace-catalog.md) | Trang gian hàng người bán mức cơ bản | OPTION | C+ OPTION | 48 | 48 | 96 | M | Trang gian hàng public; không tự xây seller portal |
| [G3-07-F001](../docs/03-gd3-content-commerce/G3-07-cart-order-payment.md) | Giỏ hàng và điều chỉnh số lượng | CONDITIONAL | C | 48 | 80 | 128 | M | Giỏ một seller/đơn, phiên, SKU/stock eligibility |
| [G3-07-F002](../docs/03-gd3-content-commerce/G3-07-cart-order-payment.md) | Thu thập địa chỉ và thông tin giao hàng | CONDITIONAL | C | 32 | 48 | 80 | M | Shipping contact/location form & PII policy |
| [G3-07-F003](../docs/03-gd3-content-commerce/G3-07-cart-order-payment.md) | Tính phí giao hàng và cách nhận hàng | CONDITIONAL | C | 32 | 80 | 112 | L | Bảng phí shipping/pickup cơ bản, không carrier API |
| [G3-07-F004](../docs/03-gd3-content-commerce/G3-07-cart-order-payment.md) | Tạo đơn hàng với giá snapshot và kiểm tra tồn | CONDITIONAL | C | 56 | 144 | 200 | L | CommerceOrder snapshot/reserve/idempotency, event G2-07 |
| [G3-07-F005](../docs/03-gd3-content-commerce/G3-07-cart-order-payment.md) | Tích hợp thanh toán đơn hàng TMĐT | CONDITIONAL | C | 44 | 120 | 164 | L | Thanh toán một gateway; adapter G2-09 chỉ khi phù hợp |
| [G3-07-F006](../docs/03-gd3-content-commerce/G3-07-cart-order-payment.md) | Nhận kết quả và đối soát thanh toán đơn hàng | CONDITIONAL | C | 36 | 136 | 172 | L | Verified webhook/order payment status/reconciliation |
| [G3-07-F007](../docs/03-gd3-content-commerce/G3-07-cart-order-payment.md) | Tra cứu đơn hàng và trạng thái mua | CONDITIONAL | C | 48 | 72 | 120 | M | Order history/ownership, tái dùng inbox G2-07 |
| [G3-07-F009](../docs/03-gd3-content-commerce/G3-07-cart-order-payment.md) | Mã ưu đãi và điều chỉnh giá khi đặt hàng | OPTION | C+ OPTION | 32 | 80 | 112 | L | Voucher theo giỏ/SKU, pricing validation |
| [G3-08-F001](../docs/03-gd3-content-commerce/G3-08-fulfillment-returns-support.md) | Bảng điều hành tiếp nhận và xử lý đơn | CONDITIONAL | C | 56 | 120 | 176 | L | Fulfillment queue + seller dispatch/ack đã gộp F002, tracking thủ công |
| [G3-08-F003](../docs/03-gd3-content-commerce/G3-08-fulfillment-returns-support.md) | Tích hợp vận chuyển và mã theo dõi | OPTION | C+ OPTION | 32 | 112 | 144 | L | Carrier API/tracking tự động, không tự xây logistics |
| [G3-08-F004](../docs/03-gd3-content-commerce/G3-08-fulfillment-returns-support.md) | Xử lý yêu cầu hủy đơn | CONDITIONAL | C | 40 | 96 | 136 | L | Hủy đơn theo trạng thái, hoàn tồn và payment reversal |
| [G3-08-F005](../docs/03-gd3-content-commerce/G3-08-fulfillment-returns-support.md) | Đổi trả và hoàn tiền | CONDITIONAL | C | 56 | 144 | 200 | L | RMA/return/refund có approval, ngoại lệ và audit |
| [G3-08-F006](../docs/03-gd3-content-commerce/G3-08-fulfillment-returns-support.md) | Tiếp nhận khiếu nại và tranh chấp | CONDITIONAL | C | 48 | 96 | 144 | L | Khiếu nại gắn order/seller, ticket workflow |
| [G3-08-F007](../docs/03-gd3-content-commerce/G3-08-fulfillment-returns-support.md) | Theo dõi thời hạn xử lý và chất lượng người bán | OPTION | C+ OPTION | 40 | 64 | 104 | M | Dashboard SLA/chất lượng seller từ order data |
| [G3-09-F001](../docs/03-gd3-content-commerce/G3-09-commerce-reconciliation.md) | Quy tắc hoa hồng theo đối tác và loại giao dịch | CONDITIONAL | B1/C FINANCE | 40 | 88 | 128 | L | Commission rates/conditions hợp đồng theo phiên bản |
| [G3-09-F002](../docs/03-gd3-content-commerce/G3-09-commerce-reconciliation.md) | Tiếp nhận dữ liệu đối soát đối tác | CONDITIONAL | B1/C FINANCE | 48 | 128 | 176 | L | File/API đối soát tài chính, conversion raw thuộc G3-04 |
| [G3-09-F003](../docs/03-gd3-content-commerce/G3-09-commerce-reconciliation.md) | Tính và lưu kết quả hoa hồng theo kỳ | CONDITIONAL | B1/C FINANCE | 48 | 160 | 208 | L | Commission engine theo kỳ, reversal/snapshot |
| [G3-09-F004](../docs/03-gd3-content-commerce/G3-09-commerce-reconciliation.md) | Bảng kê và xác nhận đối soát với đối tác | CONDITIONAL | B1/C FINANCE | 40 | 96 | 136 | L | Statement/partner acknowledgement, không chi tiền tự động |
| [G3-09-F005](../docs/03-gd3-content-commerce/G3-09-commerce-reconciliation.md) | Báo cáo thương mại theo nội dung/đối tác | CONDITIONAL | B1/C FINANCE | 48 | 88 | 136 | L | Dashboard doanh thu/commission đã xác minh, không đếm click là tiền |
| [G3-09-F006](../docs/03-gd3-content-commerce/G3-09-commerce-reconciliation.md) | Điều chỉnh, truy thu và xử lý tranh chấp đối soát | OPTION | B1/C+ OPTION | 40 | 104 | 144 | L | Điều chỉnh ledger/dispute nâng cao |
| [G3-10-F001](../docs/03-gd3-content-commerce/G3-10-sponsored-b2b-packages.md) | Danh mục gói dịch vụ truyền thông B2B | OPTION | B2B OPTION | 40 | 56 | 96 | L | Danh mục gói tài trợ theo hợp đồng B2B |
| [G3-10-F002](../docs/03-gd3-content-commerce/G3-10-sponsored-b2b-packages.md) | Tiếp nhận yêu cầu quảng bá hoặc tài trợ | OPTION | B2B OPTION | 16 | 28 | 44 | M | Inquiry form tái dùng lead G3-02, category B2B |
| [G3-10-F003](../docs/03-gd3-content-commerce/G3-10-sponsored-b2b-packages.md) | Lập và phê duyệt đề xuất truyền thông | OPTION | B2B OPTION | 48 | 88 | 136 | L | Proposal workflow/versioning, không ký số/e-contract |
| [G3-10-F004](../docs/03-gd3-content-commerce/G3-10-sponsored-b2b-packages.md) | Liên kết nội dung tài trợ và nhãn hợp tác | OPTION | B2B OPTION | 20 | 40 | 60 | M | Campaign–content relation và label G3-01 |
| [G3-10-F005](../docs/03-gd3-content-commerce/G3-10-sponsored-b2b-packages.md) | Theo dõi bàn giao nội dung, chương trình và báo cáo | OPTION | B2B OPTION | 40 | 64 | 104 | M | Delivery checklist/metrics G1/G2 dùng chung |
| [G3-10-F006](../docs/03-gd3-content-commerce/G3-10-sponsored-b2b-packages.md) | Bảng quản lý khách hàng và hợp đồng B2B tối thiểu | OPTION | B2B OPTION | 44 | 72 | 116 | M | Hồ sơ khách pháp nhân/contract refs dùng partner G3-03 |

## 5. Quy đổi BA, Design, QA và man-day

| Nhóm phạm vi | FE (h) | BE (h) | Coding (h) | BA (h) | Design (h) | QA (h) | Tổng effort (h) | MD |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| CORE (15) | 508 | 812 | 1320 | 240.00 | 360.00 | 480.00 | 2400.00 | 300.00 |
| CONDITIONAL (35) | 1380 | 3288 | 4668 | 848.73 | 1273.09 | 1697.45 | 8487.27 | 1060.91 |
| OPTION (14) | 476 | 844 | 1320 | 240.00 | 360.00 | 480.00 | 2400.00 | 300.00 |
| **Cả 64** | **2364** | **4944** | **7308** | **1328.73** | **1993.09** | **2657.45** | **13287.27** | **1660.91** |

Số giờ và MD hiển thị đã làm tròn hai chữ số. Cộng các dòng làm tròn có thể lệch 0,01 so với tính trực tiếp từ Coding chính xác.

## 6. Kịch bản đầu tư (không phải lịch hoàn thành)

| Kịch bản | Coding (giờ) | Tổng effort (MD) | Điều kiện |
|---|---:|---:|---|
| A – Lead platform | 1320 | 300.00 | Chỉ 15 CORE, không affiliate/booking/marketplace |
| A + B1 referral (chưa đối soát tiền) | 1944 | 441.82 | A + 7 feature B1; có tracking/callback nhưng chưa có engine đối soát commission |
| A + B1 + Finance | 2728 | 620.00 | Có xác nhận/đối soát hoa hồng B1; G3-09 chỉ tính một lần |
| A + B1 + Finance + B2 | 3492 | 793.64 | Booking API trực tiếp với một nhà cung cấp; chưa marketplace |
| A + B1 + Finance + C | 5116 | 1162.73 | Marketplace theo gate; chưa trực tiếp booking B2 |
| A + B1 + Finance + B2 + C | 5880 | 1336.36 | Cả ba bước; không gồm đồng bộ đối tác A+ và OPTION |
| Tất cả 64 | 7308 | 1660.91 | Cộng cả 14 OPTION và adapter đồng bộ A+, chỉ để thấy trần phạm vi |

Công thức tính MD của mỗi kịch bản là `Coding/0,55/8`. **GĐ3 6–12 tháng** trong tài liệu nguồn chưa được xác minh là khả thi; MD là tổng công sức của nhiều vai trò, không tương đương số tháng cần một developer hoàn thành. Muốn tính timeline phải xác nhận trình tự A/B1/B2/C, các gate, nhân sự song song, UAT và vendor deadlines.

## 7. Các yếu tố ảnh hưởng mạnh đến tính đúng của giờ

| Mức rủi ro | Yếu tố | Cách hiệu chỉnh dự toán |
|---|---|---|
| P0 | VTV8 là referrer, booking agent hay merchant-of-record? | Chốt mô hình trước; đổi bản chất payment/return/refund/settlement phải bóc lại G3-05/07/08/09 |
| P0 | Đối tác affiliate/booking có API? Số lượng vendor? | Bảng giờ chỉ giả định **một** adapter tiêu biểu; cộng thêm adapter theo đặc thù khi có tài liệu API |
| P0 | Quy tắc commission, hoàn/hủy, chia doanh thu và đối soát | Đối chiếu mẫu giao dịch và contract; G3-09 hiện độ tin cậy L |
| P0 | GĐ2 có thực sự triển khai payment/consent/inbox? | Đối soát GĐ2 trước; thiếu phải cộng scope phụ thuộc, không mặc định miễn phí |
| P1 | SKU inventory, VAT/invoice, order 1 seller hay nhiều seller | Cơ sở C giả định **một seller/đơn**, không bao gồm split/settlement phức tạp |
| P1 | Carrier, nghĩa vụ hậu mãi, partial refund và dispute | Có cơ chế manual tối thiểu; Carrier API G3-08-F003 là OPTION |
| P1 | Khối lượng dữ liệu, traffic, privacy và audit | Thêm load test, security test, data retention và hạ tầng theo H01/H02 |

**Kết luận:** đây là **DRAFT V1** có thể dùng để thảo luận cách phân kỳ và lập kế hoạch nhân lực. Chưa áp đơn giá/chi phí và chưa khuyến nghị phát triển toàn bộ 64 tính năng đồng thời.
