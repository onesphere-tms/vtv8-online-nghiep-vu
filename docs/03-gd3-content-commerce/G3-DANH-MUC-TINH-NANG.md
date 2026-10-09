# GĐ3 – Danh mục 64 tính năng Content Commerce sau chuẩn hóa

> **09/10/2026 – đã chuẩn hóa phạm vi nội bộ sau QA**, giữ **10 module + 2 nhóm hỗ trợ H01/H02**, **64 tính năng độc lập (15 CORE, 35 CONDITIONAL, 14 OPTION)**. Danh mục được chọn trong phiên phân tích, **chưa được VTV8 phê duyệt**. Chưa lập dự toán FE/BE hay chứng minh tiến độ 6–12 tháng.
>
> **Căn cứ:** [Đề xuất VTV8–IIEL](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md) GĐ3 trang 7 và lộ trình trang 3; B2B từ phần mô hình kinh doanh tổng thể trang 12–13. [Báo cáo QA 70 mã](G3-BAO-CAO-QA-70-TINH-NANG.md) là hồ sơ lịch sử; [bảng mapping 70→64](G3-MAPPING-70-64.md) giải thích từng mã.
>
> **Nguồn `T`** là chủ đề/hướng/ví dụ có trong đề xuất, **không có nghĩa chi tiết thao tác đã được VTV8 chốt**. `B` là phần suy luận nghiệp vụ. CORE là đề xuất bước Content + Lead; CONDITIONAL là phụ thuộc đối tác/pháp lý/đầu tư; OPTION là mở rộng chỉ khi được chọn.

## 1. Phân kỳ

| Bước | Khả năng được cung cấp | Ranh giới |
|---|---|---|
| **A – Content + Lead** | Nội dung giới thiệu offering → đăng ký tư vấn đúng mục đích → chuyển lead → cập nhật kết quả → báo cáo | **15 CORE**, có thể vận hành độc lập khi có đối tác được duyệt và chính sách dữ liệu |
| **B1 – Affiliate/referral** | Link giới thiệu, tracking click và conversion đối tác gửi, đối soát hoa hồng theo hợp đồng | Không xem redirect/click là booking hay giao dịch đã xác nhận |
| **B2 – Booking API** | Giá/chỗ theo API → gửi yêu cầu → vendor xác nhận → trạng thái/hủy | Chỉ thực hiện khi có quyền truy cập API, dữ liệu và trách nhiệm bên bán được chốt |
| **C – Sàn TMĐT có điều kiện** | Seller/SKU, giỏ/đơn, thanh toán, giao hàng, hoàn tiền, đối soát | Chỉ triển khai sau quyết định đầu tư, vai trò pháp lý và mô hình vận hành |
| **B2B tùy chọn** | Gói truyền thông, đề xuất tài trợ và theo dõi bàn giao | Nằm trong mô hình kinh doanh tổng thể, không tự coi là nghĩa vụ GĐ3 |

## 2. 10 module và phân loại

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

## 3. Danh mục 64 tính năng đang hoạt động

| Mã | Tính năng | Nghiệp vụ chuẩn hóa | Nguồn | Phạm vi | Bước |
|---|---|---|---|---|---|
| [G3-01-F001](G3-01-content-to-offer.md) | Liên kết nội dung với sản phẩm/dịch vụ | Liên kết một bài/video/chương trình với offering G3-03 đã duyệt; CTA phân biệt LEAD, REFERRAL, BOOKING và COMMERCE theo năng lực đã mở. | T | CORE | A |
| [G3-01-F002](G3-01-content-to-offer.md) | Khối giới thiệu dịch vụ trong trang nội dung | Hiển thị thẻ tour/khách sạn/đặc sản hoặc liên hệ đối tác trong trang bài/video, có CTA theo hình thức giao dịch. | T | CORE | A |
| [G3-01-F003](G3-01-content-to-offer.md) | Trang giới thiệu sản phẩm hoặc dịch vụ liên quan | Trang chi tiết dùng offering và thông tin đối tác G3-03 đã duyệt, bao gồm điều khoản/CTA; tiếp nhận phần trang chi tiết giới thiệu từ G3-05-F002, chỉ quote/slot thời gian thực thuộc G3-05-F004. | B | CORE | A |
| [G3-01-F004](G3-01-content-to-offer.md) | Phân biệt nội dung biên tập và nội dung thương mại | Chính sách nhãn nội dung thương mại/tài trợ do VTV8 duyệt; phân biệt bài giới thiệu và tài trợ, không tự coi mọi liên kết dịch vụ là hợp đồng tài trợ. | B | CORE | A |
| [G3-01-F006](G3-01-content-to-offer.md) | Liên kết sâu và mã QR tới trang dịch vụ | Tạo link/QR dẫn về trang dịch vụ hoặc luồng lead/booking hợp lệ để sử dụng trong video, ấn phẩm/sự kiện. | T | OPTION | A |
| [G3-01-F007](G3-01-content-to-offer.md) | Đề xuất dịch vụ liên quan theo địa danh/chủ đề | Hiển thị offering theo metadata nội dung và địa phương, dựa trên luật đơn giản; không xây AI recommendation mới. | B | OPTION | A |
| [G3-02-F001](G3-02-lead-management.md) | Biểu mẫu đăng ký tư vấn/liên hệ sản phẩm | Tạo lead từ bài/video/offering đến một đối tác đích có nguồn, mục đích, mã lead, trạng thái. Tích hợp chống gửi trùng và spam từ mã cũ G3-02-F003; gửi lead không phải booking. | T | CORE | A |
| [G3-02-F002](G3-02-lead-management.md) | Thông báo và ghi nhận đồng ý chia sẻ thông tin | Thông tin và sự đồng ý chia sẻ dữ liệu cho đúng bên nhận và mục đích theo chính sách VTV8, kế thừa consent nền tảng G2-01 nhưng lưu snapshot riêng cho lead. | B | CORE | A |
| [G3-02-F004](G3-02-lead-management.md) | Hộp tiếp nhận lead của VTV8 | Hộp tiếp nhận có quyền truy cập PII, các trạng thái mới, đã phân công, đã gửi, đã nhận, đóng và nhật ký người thao tác. | B | CORE | A |
| [G3-02-F005](G3-02-lead-management.md) | Phân công và chuyển giao lead cho đối tác | Chuyển giao thủ công hoặc theo kênh được duyệt, có xác nhận nhận/không nhận, người chịu trách nhiệm và chặn đối tác không còn hiệu lực. | T | CORE | A |
| [G3-02-F006](G3-02-lead-management.md) | Cập nhật tiến độ tư vấn và kết quả lead | Ghi nhận liên hệ, qualified/unqualified và kết quả xử lý lead; không đồng nhất với booking confirmed/conversion được đối tác duyệt hoặc doanh thu. | B | CORE | A |
| [G3-02-F007](G3-02-lead-management.md) | Thống kê chuyển đổi từ nội dung sang lead | Theo dõi số lead theo video/bài/địa phương/offering/đối tác/kỳ và trạng thái, có nguồn truy vết. | B | CORE | A |
| [G3-03-F001](G3-03-partner-offer-directory.md) | Hồ sơ đơn vị đối tác | Một partner master duy nhất dùng cho giới thiệu, affiliate, booking, seller và B2B; seller là vai trò bổ sung theo G3-06, không tạo hồ sơ doanh nghiệp thứ hai. | T | CORE | A / mở rộng B,C |
| [G3-03-F002](G3-03-partner-offer-directory.md) | Danh mục offering sản phẩm/dịch vụ mức giới thiệu | Quản lý offering giới thiệu kèm mô tả, ảnh, đối tác, loại dịch vụ/địa phương theo taxonomy G1-04 (nhận G3-03-F005), phương thức CTA, nguồn giá và mốc cập nhật; không tự tạo SKU/stock/slot. | B | CORE | A / mở rộng B,C |
| [G3-03-F003](G3-03-partner-offer-directory.md) | Thẩm định và phê duyệt đối tác/offering | Duyệt partner và offering dựa tài liệu/chứng cứ được VTV8 xác nhận; không tự công nhận chứng chỉ, quyền bán hoặc nguồn gốc sản phẩm. | B | CORE | A / mở rộng B,C |
| [G3-03-F004](G3-03-partner-offer-directory.md) | Quản lý thông tin liên hệ và điều khoản hợp tác | Lưu liên hệ phụ trách, kênh hỗ trợ, tài liệu/thời hạn thỏa thuận, mô hình nhận lead/affiliate/booking. | B | CORE | A / mở rộng B,C |
| [G3-03-F006](G3-03-partner-offer-directory.md) | Quản lý chất lượng, tạm khóa và ngừng cung cấp | Chủ sở hữu một quy tắc trạng thái active/suspended/hết hiệu lực của partner/offering, nhận nghiệp vụ cũ G3-01-F005; chặn công khai CTA và tạo lead/booking mới, không tự hủy giao dịch đang chạy. | B | CORE | A / mở rộng B,C |
| [G3-03-F007](G3-03-partner-offer-directory.md) | Kết nối dữ liệu đối tác từ API tự động | Đồng bộ thông tin offering/giá/tình trạng sẵn có từ nguồn có API và hợp đồng phù hợp, tránh nhiều đầu nhập tay. | B | CONDITIONAL | A / mở rộng B,C |
| [G3-04-F001](G3-04-affiliate-tracking.md) | Chương trình affiliate và đường dẫn giới thiệu | Chương trình referral/link theo thỏa thuận đối tác, gắn campaign/đối tác/nội dung nguồn; không khẳng định có tracking conversion nếu đối tác không cung cấp dữ liệu. | T | CONDITIONAL | B1 |
| [G3-04-F002](G3-04-affiliate-tracking.md) | Ghi nhận nhấp và phiên giới thiệu | Theo dõi chuyển hướng/click theo quy tắc consent và phòng chống bot; click không phải đơn/booking/sale đã xác nhận. | B | CONDITIONAL | B1 |
| [G3-04-F003](G3-04-affiliate-tracking.md) | Quy tắc quy kết và thời hạn attribution | Attribution window và luật chọn nguồn dựa hợp đồng; không mặc định cookie hay định danh xuyên website không được phép. | B | CONDITIONAL | B1 |
| [G3-04-F004](G3-04-affiliate-tracking.md) | Nhận conversion/callback từ đối tác | Nhận sự kiện conversion thô có xác thực từ đối tác, xử lý idempotency; giao dịch/hoa hồng được đối soát tài chính tại G3-09. | B | CONDITIONAL | B1 |
| [G3-04-F005](G3-04-affiliate-tracking.md) | Theo dõi trạng thái chuyển đổi affiliate | Quản lý trạng thái pending/accepted/rejected/cancelled của conversion và liên kết chứng cứ; không coi pending là hoa hồng phải trả. | B | CONDITIONAL | B1 |
| [G3-04-F006](G3-04-affiliate-tracking.md) | Báo cáo hiệu quả affiliate theo nguồn nội dung | Báo cáo click và conversion theo nguồn nội dung, chiến dịch và đối tác; số tiền hoa hồng/doanh thu đã đối soát thuộc G3-09. | B | CONDITIONAL | B1 |
| [G3-05-F001](G3-05-travel-booking.md) | Danh sách dịch vụ du lịch có thể đặt | OPTION trong bước B: trang tổng hợp dịch vụ bookable riêng theo loại/địa phương khi đã có đủ dữ liệu đối tác; B1 có thể dùng offering detail G3-01-F003 để redirect. | T | OPTION | B1/B2 |
| [G3-05-F003](G3-05-travel-booking.md) | Chuyển hướng đặt dịch vụ tại hệ thống đối tác | Chuyển hướng an toàn đến trang đặt dịch vụ bên đối tác, mang referral id khi thỏa thuận cho phép; chỉ là giới thiệu, không xác nhận booking trên VTV8. | T | CONDITIONAL | B1/B2 |
| [G3-05-F004](G3-05-travel-booking.md) | Kiểm tra giá và tình trạng chỗ qua API đối tác | B2 có API: lấy báo giá/chỗ theo ngày/giờ/số khách, có TTL/timezone và kiểm tra thay đổi giá/slot; tích hợp bổ sung vào trang G3-01-F003 chứ không có trang detail thứ hai. | B | CONDITIONAL | B1/B2 |
| [G3-05-F005](G3-05-travel-booking.md) | Tạo yêu cầu đặt chỗ trực tiếp qua API | B2 khi được phép: gửi booking request idempotent theo provider, ghi external reference, trạng thái chờ và trách nhiệm bên nhận tiền/chăm sóc khách. | B | CONDITIONAL | B1/B2 |
| [G3-05-F006](G3-05-travel-booking.md) | Đồng bộ và hiển thị trạng thái đặt chỗ | Đồng bộ booking status từ webhook/polling theo quyền đối tác, hiển thị nguồn và thời điểm cập nhật; không sử dụng CommerceOrder G3-07. | B | CONDITIONAL | B1/B2 |
| [G3-05-F007](G3-05-travel-booking.md) | Hủy/đổi lịch theo chính sách bên cung cấp | Gửi yêu cầu hủy/đổi lịch và đồng bộ quyết định vendor theo chính sách; redirect-only thì hướng dẫn khách liên hệ đối tác, không tự hứa hoàn tiền. | B | CONDITIONAL | B1/B2 |
| [G3-05-F008](G3-05-travel-booking.md) | Theo dõi lỗi và đối soát booking với đối tác | Đối soát trạng thái kỹ thuật booking bị mồ côi, webhook/retry sai lệch; G3-09 quản lý đối soát giá trị giao dịch/hoa hồng. | B | CONDITIONAL | B1/B2 |
| [G3-06-F001](G3-06-marketplace-catalog.md) | Đánh giá và kích hoạt đối tác thành người bán | Merchant/seller activation là vai trò mở rộng của partner master G3-03; phải xác định merchant-of-record, trách nhiệm giao hàng/hoá đơn theo phê duyệt VTV8. | B | CONDITIONAL | C |
| [G3-06-F002](G3-06-marketplace-catalog.md) | Danh mục sản phẩm bán trực tiếp | SKU thực bán khác offering giới thiệu, cần owner seller, thuộc tính/biến thể tối thiểu, chứng cứ nguồn gốc và loại hàng được phép kinh doanh. | T | CONDITIONAL | C |
| [G3-06-F003](G3-06-marketplace-catalog.md) | Giá niêm yết và điều kiện bán hàng | Quản lý giá/điều kiện bán và mốc hiệu lực; khi xác nhận CommerceOrder G3-07 lưu snapshot giá/thuế/phí, không mặc định nhiều tiền tệ. | B | CONDITIONAL | C |
| [G3-06-F004](G3-06-marketplace-catalog.md) | Quản lý tồn kho cơ bản | Quản lý tồn, giữ/hoàn tồn chỉ nếu VTV8/seller có nguồn inventory đáng tin cậy; điều kiện khóa đồng thời và timeout phải được chốt. | B | CONDITIONAL | C |
| [G3-06-F005](G3-06-marketplace-catalog.md) | Tổ chức danh mục và lọc sản phẩm | Xem sản phẩm theo địa phương, chủ đề, OCOP/đặc sản, người bán và trạng thái bán; dùng taxonomy G1-04. | B | CONDITIONAL | C |
| [G3-06-F006](G3-06-marketplace-catalog.md) | Kiểm duyệt thông tin và quyền sử dụng hình ảnh sản phẩm | Kiểm duyệt nội dung hàng hóa/nguồn gốc/nhãn OCOP khi có chứng cứ; ảnh/media kế thừa DAM G1-05, không tự cấp chứng chỉ mới. | B | CONDITIONAL | C |
| [G3-06-F007](G3-06-marketplace-catalog.md) | Trang gian hàng người bán mức cơ bản | Xem thông tin người bán, các sản phẩm có thể mua và kênh hỗ trợ, không cung cấp cổng quản trị riêng cho seller. | B | OPTION | C |
| [G3-07-F001](G3-07-cart-order-payment.md) | Giỏ hàng và điều chỉnh số lượng | Giỏ mua SKU hợp lệ, cơ sở giả định một seller cho một đơn; nếu nhiều seller phải chốt split order, delivery, settlement và tăng phạm vi. | T | CONDITIONAL | C |
| [G3-07-F002](G3-07-cart-order-payment.md) | Thu thập địa chỉ và thông tin giao hàng | Thu thập tên/địa chỉ/thông tin liên hệ người nhận đúng mục đích giao hàng, phân quyền và thời hạn lưu theo chính sách đã duyệt. | B | CONDITIONAL | C |
| [G3-07-F003](G3-07-cart-order-payment.md) | Tính phí giao hàng và cách nhận hàng | Phí ship/pickup được báo rõ trước khi người mua xác nhận đơn; khi chưa có carrier API chỉ có bảng quy tắc/phương thức được duyệt. | B | CONDITIONAL | C |
| [G3-07-F004](G3-07-cart-order-payment.md) | Tạo đơn hàng với giá snapshot và kiểm tra tồn | CommerceOrder riêng với subscription order G2-09; snapshot giá/phí/tồn, idempotent create, giữ tồn có hạn và phát event trạng thái cho G2-07 (nhận G3-07-F008). | T | CONDITIONAL | C |
| [G3-07-F005](G3-07-cart-order-payment.md) | Tích hợp thanh toán đơn hàng TMĐT | Payment đơn TMĐT theo nhà cung cấp và pháp nhân VTV8 chốt; chỉ tái dùng payment adapter G2-09 nếu thực sự tương thích với loại đơn, không dùng order thuê bao. | T | CONDITIONAL | C |
| [G3-07-F006](G3-07-cart-order-payment.md) | Nhận kết quả và đối soát thanh toán đơn hàng | Đối soát trạng thái thanh toán với CommerceOrder, xử lý callback trễ/lặp và giao dịch pending; không tự coi chuyển hướng là đã thanh toán. | B | CONDITIONAL | C |
| [G3-07-F007](G3-07-cart-order-payment.md) | Tra cứu đơn hàng và trạng thái mua | Trang đơn của người mua với quyền sở hữu và trạng thái mới nhất; phát thay đổi để dùng inbox G2-07, không viết notification service mới. | B | CONDITIONAL | C |
| [G3-07-F009](G3-07-cart-order-payment.md) | Mã ưu đãi và điều chỉnh giá khi đặt hàng | OPTION voucher dành riêng cho SKU/giỏ, khác khuyến mại gói premium G2-09; chỉ làm khi có quy chế ưu đãi. | B | OPTION | C |
| [G3-08-F001](G3-08-fulfillment-returns-support.md) | Bảng điều hành tiếp nhận và xử lý đơn | Fulfillment console cho đơn marketplace, trạng thái chuẩn bị/bàn giao/xử lý, phân công và ghi nhận chuyển cho seller/đơn vị cung cấp (nhận G3-08-F002), xác nhận nhận và log chia sẻ PII tối thiểu. | B | CONDITIONAL | C |
| [G3-08-F003](G3-08-fulfillment-returns-support.md) | Tích hợp vận chuyển và mã theo dõi | OPTION: chỉ bổ sung carrier API và tracking tự động khi có hợp đồng/năng lực đối tác; nhập mã vận đơn và trạng thái thủ công tối thiểu thuộc G3-08-F001. | B | OPTION | C |
| [G3-08-F004](G3-08-fulfillment-returns-support.md) | Xử lý yêu cầu hủy đơn | Tiếp nhận và quyết định yêu cầu hủy theo điều kiện order/seller, tách yêu cầu khỏi chấp thuận; trả tồn và xử lý tiền chỉ khi đủ điều kiện. | B | CONDITIONAL | C |
| [G3-08-F005](G3-08-fulfillment-returns-support.md) | Đổi trả và hoàn tiền | Yêu cầu đổi/trả và hoàn tiền theo bên chịu trách nhiệm, ghi đủ lý do/chứng cứ; đặc biệt partial refund/chargeback cần chính sách trước khi chốt phạm vi. | B | CONDITIONAL | C |
| [G3-08-F006](G3-08-fulfillment-returns-support.md) | Tiếp nhận khiếu nại và tranh chấp | Khiếu nại gắn Order ID/seller/nhân viên và dòng thời gian xử lý; không tự tạo hệ CRM helpdesk riêng. | B | CONDITIONAL | C |
| [G3-08-F007](G3-08-fulfillment-returns-support.md) | Theo dõi thời hạn xử lý và chất lượng người bán | Đo đơn chậm xử lý, giao trễ, tỷ lệ hủy/hoàn theo seller để quyết định tạm khóa hoặc cải tiến; không xây BI enterprise. | B | OPTION | C |
| [G3-09-F001](G3-09-commerce-reconciliation.md) | Quy tắc hoa hồng theo đối tác và loại giao dịch | Hoa hồng theo đối tác/giao dịch khi đạt điều kiện hợp đồng (qualified lead/booking completed/sale settled), thời hạn đảo và kỳ áp dụng; có lịch sử mức phí. | T | CONDITIONAL | B/C |
| [G3-09-F002](G3-09-commerce-reconciliation.md) | Tiếp nhận dữ liệu đối soát đối tác | Đối soát tài chính dựa conversion G3-04, booking G3-05 và commerce order G3-07; nhập file đối tác khi được cung cấp, không viết receiver conversion thô lần hai. | B | CONDITIONAL | B/C |
| [G3-09-F003](G3-09-commerce-reconciliation.md) | Tính và lưu kết quả hoa hồng theo kỳ | Tính theo kỳ từ sự kiện đủ điều kiện, chốt ảnh chụp công thức/biểu phí và xử lý hoàn/hủy/đảo giao dịch đúng chính sách. | B | CONDITIONAL | B/C |
| [G3-09-F004](G3-09-commerce-reconciliation.md) | Bảng kê và xác nhận đối soát với đối tác | Bảng kê kỳ/đối tác, xác nhận và tranh chấp; không mặc định hệ thanh toán hoa hồng hoặc chuyển tiền seller. | B | CONDITIONAL | B/C |
| [G3-09-F005](G3-09-commerce-reconciliation.md) | Báo cáo thương mại theo nội dung/đối tác | Báo cáo tài chính thương mại chỉ từ giao dịch/hoa hồng đã xác minh; số lead và click lấy từ G3-02/G3-04, không xây event collector mới. | B | CONDITIONAL | B/C |
| [G3-09-F006](G3-09-commerce-reconciliation.md) | Điều chỉnh, truy thu và xử lý tranh chấp đối soát | Ghi nhận điều chỉnh đã có chứng cứ, lý do và người phê duyệt, tránh sửa thẳng giao dịch gốc. | B | OPTION | B/C |
| [G3-10-F001](G3-10-sponsored-b2b-packages.md) | Danh mục gói dịch vụ truyền thông B2B | OPTION theo mô hình B2B trong đề xuất kinh doanh tổng thể; gói tài trợ/truyền thông chỉ đưa vào GĐ3 nếu VTV8 chọn, không coi là bước thứ tư mặc định. | T | OPTION | B2B tùy chọn |
| [G3-10-F002](G3-10-sponsored-b2b-packages.md) | Tiếp nhận yêu cầu quảng bá hoặc tài trợ | Form yêu cầu truyền thông B2B dùng lead service G3-02, chỉ thêm trường ngành/đầu mối doanh nghiệp theo mục đích đã chốt. | B | OPTION | B2B tùy chọn |
| [G3-10-F003](G3-10-sponsored-b2b-packages.md) | Lập và phê duyệt đề xuất truyền thông | Nếu chọn B2B: tạo/phê duyệt đề xuất theo người phụ trách và phiên bản, không tự xây ERP, hợp đồng điện tử. | B | OPTION | B2B tùy chọn |
| [G3-10-F004](G3-10-sponsored-b2b-packages.md) | Liên kết nội dung tài trợ và nhãn hợp tác | Liên kết chiến dịch tài trợ và nội dung CMS G1, dùng lại nhãn disclosure G3-01-F004; chỉ bổ sung quan hệ campaign/contract. | T | OPTION | B2B tùy chọn |
| [G3-10-F005](G3-10-sponsored-b2b-packages.md) | Theo dõi bàn giao nội dung, chương trình và báo cáo | Bảng công việc/bàn giao theo hợp đồng B2B, lấy metrics từ G1-09/G2-11; không tự cam kết chỉ số quảng cáo không đo được. | B | OPTION | B2B tùy chọn |
| [G3-10-F006](G3-10-sponsored-b2b-packages.md) | Bảng quản lý khách hàng và hợp đồng B2B tối thiểu | Hồ sơ khách hàng B2B phải liên kết cùng pháp nhân partner G3-03 khi trùng tổ chức, không tạo master doanh nghiệp thứ hai. | B | OPTION | B2B tùy chọn |

## 4. Tính năng gộp và tiêu chí nghiệm thu

- **Sáu mã đã gộp:** G3-01-F005, G3-02-F003, G3-03-F005, G3-05-F002, G3-07-F008, G3-08-F002. Logic vẫn nằm trong owner tiếp nhận, không được tính phát triển một lần nữa.
- **Hai mã chuyển CONDITIONAL → OPTION:** G3-05-F001 (trang listing booking riêng) và G3-08-F003 (kết nối hãng vận chuyển tự động). Điều kiện thực hiện OPTION vẫn phụ thuộc kích hoạt bước B/C tương ứng.
- Giữ mã của **64 tính năng còn độc lập**, không đánh số lại. Xem [mapping 70→64](G3-MAPPING-70-64.md).
- [Thành phần dùng chung](G3-THANH-PHAN-DUNG-CHUNG.md) xác định các owner của partner, offering, lead, booking, order, payment và hoa hồng để không đếm lại GĐ1/GĐ2.
- [Điều kiện phân kỳ A/B/C](G3-RELEASE-GATES.md) và [kịch bản nghiệm thu E2E](G3-TIEU-CHI-NGHIEM-THU.md) phải sử dụng cùng trạng thái nghiệp vụ được chốt.
- [G3-H01](G3-H01-ha-tang-tich-hop.md) và [G3-H02](G3-H02-phap-ly-nghiem-thu.md) là 2 nhóm hỗ trợ, không tự tính thêm như 2 module sản phẩm.

**Chưa chốt với VTV8:** đơn vị sở hữu giao dịch/nhận tiền, consent chia sẻ lead, hợp đồng affiliate, năng lực API booking, giấy phép và trách nhiệm marketplace, nghĩa vụ hậu mãi; không mặc định GĐ2 đã triển khai các tích hợp CONDITIONAL. Chưa tính FE/BE ở bước này.
