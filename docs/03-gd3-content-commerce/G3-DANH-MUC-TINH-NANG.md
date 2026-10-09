# GĐ3 – Content Commerce: danh mục 70 tính năng đề xuất

> **09/10/2026 – BẢN PHÂN TÍCH LẦN ĐẦU / DRAFT, CHƯA RÀ SOÁT QA ĐỘC LẬP, CHƯA ĐƯỢC VTV8 HAY NGƯỜI DÙNG CHỐT PHẠM VI.** Cấu trúc dự kiến **10 module + 2 nhóm hỗ trợ**, **70 tính năng (18 CORE, 40 CONDITIONAL, 12 OPTION)**. Không phải 70 chức năng buộc phải làm trong cùng một đợt; thời lượng **6–12 tháng** từ nguồn chỉ là định hướng.
> **Căn cứ chính:** [Bản trích xuất đề xuất hợp tác VTV8–IIEL](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md), phần **GĐ3 Content Commerce** trang 7 và lộ trình trang 3. [B2B, tài trợ và quảng cáo](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md) nêu trong phần **Mô hình kinh doanh** trang 12–13, không có chỉ đạo rõ phải làm G3-10 trong GĐ3. Phân rã UI/API, dữ liệu, trạng thái và nghiệm thu là **đề xuất nghiệp vụ bổ sung**, không được coi là trích nguyên văn nguồn.
> **Chú giải:** `T` = nhóm mục tiêu/ví dụ có nguồn, không có nghĩa từng thao tác chi tiết đã được yêu cầu; `B` = chi tiết phân tích bổ sung; `CORE` = đề xuất bước Content + Lead; `CONDITIONAL` = gate nhà cung cấp/vận hành/pháp lý/đầu tư; `OPTION` = tùy chọn thương mại/UX.

## I. Triển khai theo ba bước trong tài liệu VTV8

| Bước | Kết quả người dùng/kinh doanh | Ranh giới khả thi |
|---|---|---|
| **A – Content + Lead** | Video/bài viết → offering/tour/đặc sản/doanh nghiệp → liên hệ/đăng ký tư vấn → chuyển lead tới đơn vị phù hợp, thống kê | Có thể làm trước mà không xây checkout hay hệ đặt phòng |
| **B1 – Affiliate/referral** | Video/nội dung → click-out có mã giới thiệu → đối tác thông báo conversion → VTV8 đối soát hoa hồng hợp lệ | Chỉ ghi được hoa hồng khi có hợp đồng/chứng cứ chuyển đổi; click không phải đơn |
| **B2 – Đặt chỗ qua API** | Kiểm tra lịch/slot/giá thật → booking request → vendor xác nhận → theo dõi trạng thái/hủy theo chính sách | Có điều kiện API, quyền dữ liệu, hợp đồng và phân định ai chịu tiền/hậu mãi |
| **C – Sàn TMĐT khi đủ quy mô** | Seller/SKU → giỏ/đơn/thanh toán → giao hàng, hoàn tiền, tranh chấp và đối soát | **Không mặc định bắt buộc trong giai đoạn đầu**, phải có quyết định kinh doanh/pháp lý và vận hành |
| **B2B tùy chọn** | Gói truyền thông điểm đến/tài trợ/OCOP và theo dõi đề xuất, bàn giao | Có trong mô hình kinh doanh chung, không được nguồn xác nhận là deliverable GĐ3 |

## II. Danh mục module và phân loại

| Module | Chức năng | Bước | Tổng | CORE | CONDITIONAL | OPTION |
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

## III. Danh sách 70 tính năng chi tiết

| Mã | Tính năng | Nghiệp vụ và đầu ra | Phạm vi | Nguồn |
|---|---|---|---|---|
| [G3-01-F001](G3-01-content-to-offer.md) | Liên kết nội dung với sản phẩm/dịch vụ | Chọn bài/video/chương trình, gắn một hoặc nhiều offering đã được duyệt ở G3-03; nêu ngữ cảnh liên quan. | CORE | T |
| [G3-01-F002](G3-01-content-to-offer.md) | Khối giới thiệu dịch vụ trong trang nội dung | Hiển thị thẻ tour/khách sạn/đặc sản hoặc liên hệ đối tác trong trang bài/video, có CTA theo hình thức giao dịch. | CORE | T |
| [G3-01-F003](G3-01-content-to-offer.md) | Trang giới thiệu sản phẩm hoặc dịch vụ liên quan | Hiển thị mô tả, ảnh được phép sử dụng, đối tác, địa phương và đường dẫn tư vấn/đặt dịch vụ; giao dịch chuyên sâu thuộc module khác. | CORE | B |
| [G3-01-F004](G3-01-content-to-offer.md) | Phân biệt nội dung biên tập và nội dung thương mại | Đánh dấu vị trí có hợp tác thương mại/tài trợ theo chính sách VTV8; không tự biến nội dung báo chí thành quảng cáo không kiểm soát. | CORE | B |
| [G3-01-F005](G3-01-content-to-offer.md) | Kiểm tra trạng thái offering khi công khai | Chặn liên kết đến đối tác bị khóa, sản phẩm/dịch vụ ngừng cung cấp, media thiếu quyền hoặc CTA không còn hợp lệ. | CORE | B |
| [G3-01-F006](G3-01-content-to-offer.md) | Liên kết sâu và mã QR tới trang dịch vụ | Tạo link/QR dẫn về trang dịch vụ hoặc luồng lead/booking hợp lệ để sử dụng trong video, ấn phẩm/sự kiện. | OPTION | T |
| [G3-01-F007](G3-01-content-to-offer.md) | Đề xuất dịch vụ liên quan theo địa danh/chủ đề | Hiển thị offering theo metadata nội dung và địa phương, dựa trên luật đơn giản; không xây AI recommendation mới. | OPTION | B |
| [G3-02-F001](G3-02-lead-management.md) | Biểu mẫu đăng ký tư vấn/liên hệ sản phẩm | Gửi nhu cầu từ bài, video, tour hoặc đặc sản; nhận xác nhận đã tiếp nhận. | CORE | T |
| [G3-02-F002](G3-02-lead-management.md) | Thông báo và ghi nhận đồng ý chia sẻ thông tin | Hiển thị mục đích liên hệ và đối tác nhận dữ liệu; ghi thời điểm/nội dung chấp thuận trước khi chuyển lead. | CORE | B |
| [G3-02-F003](G3-02-lead-management.md) | Chống gửi trùng và spam lead | Validation số liên hệ, giới hạn tần suất, dedupe hợp lý; không cản người cần tư vấn lại trong dịp khác. | CORE | B |
| [G3-02-F004](G3-02-lead-management.md) | Hộp tiếp nhận lead của VTV8 | Xem danh sách, nguồn bài, offering, trạng thái, người phụ trách và chi tiết theo quyền. | CORE | B |
| [G3-02-F005](G3-02-lead-management.md) | Phân công và chuyển giao lead cho đối tác | Chọn đối tác/nhân viên phụ trách, ghi nhận thời điểm và phương thức bàn giao; bước đầu hỗ trợ thao tác thủ công. | CORE | T |
| [G3-02-F006](G3-02-lead-management.md) | Cập nhật tiến độ tư vấn và kết quả lead | Ghi trạng thái mới, đang liên hệ, có nhu cầu, thành công/không phù hợp, lý do; không coi đó là đơn hàng đã thanh toán. | CORE | B |
| [G3-02-F007](G3-02-lead-management.md) | Thống kê chuyển đổi từ nội dung sang lead | Theo dõi số lead theo video/bài/địa phương/offering/đối tác/kỳ và trạng thái, có nguồn truy vết. | CORE | B |
| [G3-03-F001](G3-03-partner-offer-directory.md) | Hồ sơ đơn vị đối tác | Quản lý đơn vị lữ hành, nhà hàng, khách sạn, HTX/nhà sản xuất, đầu mối liên hệ, ngành nghề và địa bàn. | CORE | T |
| [G3-03-F002](G3-03-partner-offer-directory.md) | Danh mục offering sản phẩm/dịch vụ mức giới thiệu | Nhập tên, mô tả, loại dịch vụ, ảnh, vùng địa lý, đối tác, cách liên hệ và trạng thái; giá chỉ theo xác nhận đối tác. | CORE | B |
| [G3-03-F003](G3-03-partner-offer-directory.md) | Thẩm định và phê duyệt đối tác/offering | Phê duyệt hoặc từ chối hồ sơ/đề xuất cung cấp; checklist giấy phép/đầu mối/quyền khai thác theo VTV8 xác nhận. | CORE | B |
| [G3-03-F004](G3-03-partner-offer-directory.md) | Quản lý thông tin liên hệ và điều khoản hợp tác | Lưu liên hệ phụ trách, kênh hỗ trợ, tài liệu/thời hạn thỏa thuận, mô hình nhận lead/affiliate/booking. | CORE | B |
| [G3-03-F005](G3-03-partner-offer-directory.md) | Quản lý danh mục ngành dịch vụ và địa phương | Gắn đối tác/offering vào các taxonomy địa phương, sản phẩm OCOP, tour, khách sạn, dịch vụ; tái sử dụng G1-04. | CORE | B |
| [G3-03-F006](G3-03-partner-offer-directory.md) | Quản lý chất lượng, tạm khóa và ngừng cung cấp | Tạm ngừng nhận lead/booking/công khai khi sản phẩm hết hiệu lực hoặc có vấn đề; có lý do và ngày cập nhật. | CORE | B |
| [G3-03-F007](G3-03-partner-offer-directory.md) | Kết nối dữ liệu đối tác từ API tự động | Đồng bộ thông tin offering/giá/tình trạng sẵn có từ nguồn có API và hợp đồng phù hợp, tránh nhiều đầu nhập tay. | CONDITIONAL | B |
| [G3-04-F001](G3-04-affiliate-tracking.md) | Chương trình affiliate và đường dẫn giới thiệu | Khai báo chương trình giới thiệu theo đối tác/offering/kênh, link hoặc mã giới thiệu có hiệu lực. | CONDITIONAL | T |
| [G3-04-F002](G3-04-affiliate-tracking.md) | Ghi nhận nhấp và phiên giới thiệu | Ghi click-out hoặc chuyển hướng khi người xem mở CTA affiliate, có giới hạn lưu dữ liệu và consent. | CONDITIONAL | B |
| [G3-04-F003](G3-04-affiliate-tracking.md) | Quy tắc quy kết và thời hạn attribution | Cấu hình thời hạn ghi nhận giới thiệu, xử lý trùng/cùng khách qua nhiều nguồn theo hợp đồng đối tác; không hứa cookie xuyên miền khi không được phép. | CONDITIONAL | B |
| [G3-04-F004](G3-04-affiliate-tracking.md) | Nhận conversion/callback từ đối tác | Nhận conversion do đối tác gửi hoặc file đối soát định kỳ, xác minh nguồn và chống xử lý trùng. | CONDITIONAL | B |
| [G3-04-F005](G3-04-affiliate-tracking.md) | Theo dõi trạng thái chuyển đổi affiliate | Quản lý trạng thái pending/accepted/rejected/cancelled của conversion và liên kết chứng cứ; không coi pending là hoa hồng phải trả. | CONDITIONAL | B |
| [G3-04-F006](G3-04-affiliate-tracking.md) | Báo cáo hiệu quả affiliate theo nguồn nội dung | Số click/conversion theo bài/video/đối tác/kỳ, chuyển bảng dữ liệu được chấp thuận sang G3-09 để đối soát hoa hồng. | CONDITIONAL | B |
| [G3-05-F001](G3-05-travel-booking.md) | Danh sách dịch vụ du lịch có thể đặt | Hiển thị những tour/lưu trú/trải nghiệm/vé/nhà hàng được đối tác mở bán, có phạm vi địa phương và loại dịch vụ. | CONDITIONAL | T |
| [G3-05-F002](G3-05-travel-booking.md) | Trang chi tiết và điều kiện dịch vụ | Thông tin mô tả, ngày áp dụng, giờ/địa điểm, điều kiện và liên hệ theo dữ liệu đối tác; không tự bảo đảm giá/slot theo thời gian thực nếu không API. | CONDITIONAL | B |
| [G3-05-F003](G3-05-travel-booking.md) | Chuyển hướng đặt dịch vụ tại hệ thống đối tác | Đường đặt dịch vụ outbound kèm mã giới thiệu nếu có; đối tác chịu checkout và xác nhận booking theo thỏa thuận. | CONDITIONAL | T |
| [G3-05-F004](G3-05-travel-booking.md) | Kiểm tra giá và tình trạng chỗ qua API đối tác | Lấy ngày/giờ/giá/slot theo API nếu vendor hỗ trợ; lưu mốc cập nhật và trạng thái không khả dụng. | CONDITIONAL | B |
| [G3-05-F005](G3-05-travel-booking.md) | Tạo yêu cầu đặt chỗ trực tiếp qua API | Gửi thông tin khách và dịch vụ theo yêu cầu tối thiểu, nhận ID yêu cầu từ đối tác; chỉ khi có API và trách nhiệm giao dịch xác nhận. | CONDITIONAL | B |
| [G3-05-F006](G3-05-travel-booking.md) | Đồng bộ và hiển thị trạng thái đặt chỗ | Hiển thị booking pending/confirmed/rejected/completed/cancelled theo nguồn đối tác, xử lý webhooks trùng/trễ. | CONDITIONAL | B |
| [G3-05-F007](G3-05-travel-booking.md) | Hủy/đổi lịch theo chính sách bên cung cấp | Ghi nhận yêu cầu hủy/đổi và hướng dẫn sang đối tác; gọi API hủy nếu vendor hỗ trợ và VTV8 có trách nhiệm. | CONDITIONAL | B |
| [G3-05-F008](G3-05-travel-booking.md) | Theo dõi lỗi và đối soát booking với đối tác | Phát hiện trạng thái booking mồ côi, lỗi kết nối hoặc sai lệch, có hàng đợi xử lý theo quyền. | CONDITIONAL | B |
| [G3-06-F001](G3-06-marketplace-catalog.md) | Đánh giá và kích hoạt đối tác thành người bán | Xác nhận người bán nào được đăng sản phẩm và chịu trách nhiệm giao hàng/hóa đơn; kế thừa partner G3-03, lưu điều kiện giao dịch theo mô hình kinh doanh. | CONDITIONAL | B |
| [G3-06-F002](G3-06-marketplace-catalog.md) | Danh mục sản phẩm bán trực tiếp | Lưu sản phẩm/SKU, phân loại, mô tả, ảnh, đơn vị tính và tình trạng bán; tách rõ offering giới thiệu khỏi SKU thực giao dịch. | CONDITIONAL | T |
| [G3-06-F003](G3-06-marketplace-catalog.md) | Giá niêm yết và điều kiện bán hàng | Giá/biến thể hiệu lực và cấu hình quy tắc bán tối thiểu, chi phí không mặc định thuộc giá; tuân theo chính sách thương mại được duyệt. | CONDITIONAL | B |
| [G3-06-F004](G3-06-marketplace-catalog.md) | Quản lý tồn kho cơ bản | Theo dõi tồn có sẵn, giữ chỗ và hoàn tồn khi đơn hủy; inventory owner phải được xác nhận nếu đối tác xử lý kho riêng. | CONDITIONAL | B |
| [G3-06-F005](G3-06-marketplace-catalog.md) | Tổ chức danh mục và lọc sản phẩm | Xem sản phẩm theo địa phương, chủ đề, OCOP/đặc sản, người bán và trạng thái bán; dùng taxonomy G1-04. | CONDITIONAL | B |
| [G3-06-F006](G3-06-marketplace-catalog.md) | Kiểm duyệt thông tin và quyền sử dụng hình ảnh sản phẩm | Kiểm tra hình ảnh/nguồn gốc/thông tin cam kết được phép sử dụng; chính sách chứng nhận OCOP/truy xuất cần đối tác xác minh. | CONDITIONAL | B |
| [G3-06-F007](G3-06-marketplace-catalog.md) | Trang gian hàng người bán mức cơ bản | Xem thông tin người bán, các sản phẩm có thể mua và kênh hỗ trợ, không cung cấp cổng quản trị riêng cho seller. | OPTION | B |
| [G3-07-F001](G3-07-cart-order-payment.md) | Giỏ hàng và điều chỉnh số lượng | Thêm/bỏ SKU đang bán, cập nhật số lượng, phản hồi hết hàng; giao dịch nhiều người bán chỉ khi mô hình vận hành đủ điều kiện. | CONDITIONAL | T |
| [G3-07-F002](G3-07-cart-order-payment.md) | Thu thập địa chỉ và thông tin giao hàng | Nhập người nhận/địa chỉ/số liên lạc phù hợp cách giao hàng, ghi nhận điều khoản và chính sách dữ liệu. | CONDITIONAL | B |
| [G3-07-F003](G3-07-cart-order-payment.md) | Tính phí giao hàng và cách nhận hàng | Đề xuất phương án giao hàng/nhận tại điểm theo đối tác hỗ trợ; phí được xác nhận trước khi tạo đơn, không cam kết thời gian khi chưa có carrier API. | CONDITIONAL | B |
| [G3-07-F004](G3-07-cart-order-payment.md) | Tạo đơn hàng với giá snapshot và kiểm tra tồn | Chốt SKU/giá/số lượng/ưu đãi đã được phép, snapshot thời điểm mua, giữ tồn có giới hạn, trạng thái chờ thanh toán. | CONDITIONAL | T |
| [G3-07-F005](G3-07-cart-order-payment.md) | Tích hợp thanh toán đơn hàng TMĐT | Thanh toán qua nhà cung cấp đã được VTV8 chọn; chỉ tái dùng adapter G2-09 nếu cùng gateway và phù hợp loại giao dịch, không tự xây gateway. | CONDITIONAL | T |
| [G3-07-F006](G3-07-cart-order-payment.md) | Nhận kết quả và đối soát thanh toán đơn hàng | Webhook xác minh, xử lý trùng/trễ; thanh toán sai lệch phải vào hàng đợi xử lý, không nhân đôi payment gateway infrastructure GĐ2. | CONDITIONAL | B |
| [G3-07-F007](G3-07-cart-order-payment.md) | Tra cứu đơn hàng và trạng thái mua | Xem danh sách/chi tiết đơn và trạng thái thanh toán/xử lý/đã giao/hủy; định nghĩa rõ trạng thái seller và buyer. | CONDITIONAL | B |
| [G3-07-F008](G3-07-cart-order-payment.md) | Thông báo thay đổi đơn hàng | Nhận thông báo xác nhận đơn và thay đổi trạng thái; dùng inbox G2-07, email chỉ nếu kênh được kích hoạt. | CONDITIONAL | B |
| [G3-07-F009](G3-07-cart-order-payment.md) | Mã ưu đãi và điều chỉnh giá khi đặt hàng | OPTION voucher dành riêng cho SKU/giỏ, khác khuyến mại gói premium G2-09; chỉ làm khi có quy chế ưu đãi. | OPTION | B |
| [G3-08-F001](G3-08-fulfillment-returns-support.md) | Bảng điều hành tiếp nhận và xử lý đơn | Xem đơn cần xử lý, xác nhận chuẩn bị/đã bàn giao và người chịu trách nhiệm; triển khai bằng CMS/admin thay vì cổng seller tự phục vụ GĐ4. | CONDITIONAL | B |
| [G3-08-F002](G3-08-fulfillment-returns-support.md) | Chuyển đơn cho đối tác cung ứng | Chuyển thông tin đơn tối thiểu đến đúng seller, lưu bằng chứng bàn giao, không chuyển PII ngoài mục đích hợp lệ. | CONDITIONAL | B |
| [G3-08-F003](G3-08-fulfillment-returns-support.md) | Tích hợp vận chuyển và mã theo dõi | Gắn mã vận đơn theo nhà vận chuyển, tự động lấy trạng thái nếu có API; giai đoạn cơ sở có thể nhập thủ công. | CONDITIONAL | B |
| [G3-08-F004](G3-08-fulfillment-returns-support.md) | Xử lý yêu cầu hủy đơn | Gửi yêu cầu hủy theo trạng thái đơn và điều kiện seller; xác nhận hủy mới trả tồn/hoàn tiền theo chính sách. | CONDITIONAL | B |
| [G3-08-F005](G3-08-fulfillment-returns-support.md) | Đổi trả và hoàn tiền | Ghi yêu cầu trả hàng/hoàn tiền, lý do/chứng cứ, trạng thái phê duyệt theo hợp đồng và gateway; không mặc định VTV8 chịu mọi nghĩa vụ. | CONDITIONAL | B |
| [G3-08-F006](G3-08-fulfillment-returns-support.md) | Tiếp nhận khiếu nại và tranh chấp | Theo dõi ticket khiếu nại đơn/đối tác, lịch sử liên hệ, quyết định và thời hạn xử lý theo chính sách. | CONDITIONAL | B |
| [G3-08-F007](G3-08-fulfillment-returns-support.md) | Theo dõi thời hạn xử lý và chất lượng người bán | Đo đơn chậm xử lý, giao trễ, tỷ lệ hủy/hoàn theo seller để quyết định tạm khóa hoặc cải tiến; không xây BI enterprise. | OPTION | B |
| [G3-09-F001](G3-09-commerce-reconciliation.md) | Quy tắc hoa hồng theo đối tác và loại giao dịch | Lưu mức tỷ lệ/giá trị và điều kiện đủ hoa hồng theo hợp đồng; lead có thể trả phí theo lead hoặc theo booking tùy thỏa thuận. | CONDITIONAL | T |
| [G3-09-F002](G3-09-commerce-reconciliation.md) | Tiếp nhận dữ liệu đối soát đối tác | Nhận xác nhận booking/sale hợp lệ từ API hoặc file đối tác, so khớp referral/conversion/đơn; ghi ngoại lệ. | CONDITIONAL | B |
| [G3-09-F003](G3-09-commerce-reconciliation.md) | Tính và lưu kết quả hoa hồng theo kỳ | Tính hoa hồng với các giao dịch đã đủ điều kiện, snapshot công thức/mốc hiệu lực và xử lý hủy/đảo tiền theo chính sách. | CONDITIONAL | B |
| [G3-09-F004](G3-09-commerce-reconciliation.md) | Bảng kê và xác nhận đối soát với đối tác | Xuất bảng kê theo kỳ/đối tác và trạng thái xác nhận/tranh chấp; không tự động chi trả tiền nếu chưa có nghiệp vụ thanh toán seller. | CONDITIONAL | B |
| [G3-09-F005](G3-09-commerce-reconciliation.md) | Báo cáo thương mại theo nội dung/đối tác | Báo cáo content → lead → conversion → hoa hồng/doanh thu xác nhận, theo địa phương và kỳ; không lấy pageview làm doanh thu. | CONDITIONAL | B |
| [G3-09-F006](G3-09-commerce-reconciliation.md) | Điều chỉnh, truy thu và xử lý tranh chấp đối soát | Ghi nhận điều chỉnh đã có chứng cứ, lý do và người phê duyệt, tránh sửa thẳng giao dịch gốc. | OPTION | B |
| [G3-10-F001](G3-10-sponsored-b2b-packages.md) | Danh mục gói dịch vụ truyền thông B2B | Định nghĩa gói truyền thông điểm đến/di sản/OCOP/chương trình tài trợ theo mô tả, hạng mục bàn giao và điều kiện bán được VTV8 duyệt. | OPTION | T |
| [G3-10-F002](G3-10-sponsored-b2b-packages.md) | Tiếp nhận yêu cầu quảng bá hoặc tài trợ | Gửi nhu cầu và liên hệ B2B qua mẫu riêng dùng hạ tầng lead G3-02; không tạo lead store thứ hai. | OPTION | B |
| [G3-10-F003](G3-10-sponsored-b2b-packages.md) | Lập và phê duyệt đề xuất truyền thông | Tạo phạm vi gói, lịch thực hiện, đầu ra, giá dự kiến; phê duyệt nội bộ trước khi gửi khách, không thay hệ quản lý hợp đồng/ERP. | OPTION | B |
| [G3-10-F004](G3-10-sponsored-b2b-packages.md) | Liên kết nội dung tài trợ và nhãn hợp tác | Khi sản xuất nội dung theo hợp đồng, gắn ref chiến dịch/tài trợ, theo workflow CMS và nhãn công khai G3-01-F004. | OPTION | T |
| [G3-10-F005](G3-10-sponsored-b2b-packages.md) | Theo dõi bàn giao nội dung, chương trình và báo cáo | Ghi đầu ra đã sản xuất/phát, bằng chứng liên kết và kết quả hiển thị/lượt xem từ G1-09/G2-11; không tự hứa kết quả quảng cáo. | OPTION | B |
| [G3-10-F006](G3-10-sponsored-b2b-packages.md) | Bảng quản lý khách hàng và hợp đồng B2B tối thiểu | Theo dõi đầu mối khách hàng, hợp đồng hiệu lực, đơn vị phụ trách và trạng thái doanh thu ghi nhận thủ công; không tự xây billing và CRM đầy đủ. | OPTION | B |

## IV. Những thiết kế không được tính trùng

- **GĐ1/GĐ2:** CMS/media/taxonomy/account/consent/notification/payment adapter có trước; GĐ3 chỉ phát triển phần content-commerce tăng thêm.
- **G3-03 partner master ≠ G3-06 merchant activation:** không có hai hồ sơ doanh nghiệp tương đương.
- **G3-02 lead ≠ G3-04 conversion ≠ G3-05 booking ≠ G3-07 order.** Affiliate tracking G3-04 không tự sở hữu số tiền thanh toán; đối soát/hoa hồng đã duyệt thuộc G3-09.
- **G3-05 booking partner ≠ G3-07 order TMĐT:** booking ở đối tác có id/status riêng, checkout marketplace ở VTV8 chỉ khi gate TMĐT bật.
- **Thanh toán thuê bao G2-09 ≠ thanh toán đơn TMĐT G3-07:** có thể dùng lại gateway adapter nếu phù hợp, không dùng lại DB order và các luật hoàn/hủy của subscription.
- **G3-08 hậu mãi** chỉ bật khi có trách nhiệm vận hành; VTV8 đóng vai trò giới thiệu không mặc nhiên chịu tất cả hoạt động giao hàng/hóa đơn.
- **G3-10 B2B** tái dùng CMS G1 và lead G3-02; không xây quảng cáo programmatic hoặc cổng partner tự phục vụ (hướng GĐ4).

Đọc [ranh giới thành phần dùng chung](G3-THANH-PHAN-DUNG-CHUNG.md).

## V. Gate trước khi triển khai

- [G3-RELEASE-GATES.md](G3-RELEASE-GATES.md): vai trò của VTV8, đơn vị nhận tiền, chia dữ liệu người dùng, quyền media, hợp đồng affiliate, API booking, người bán, seller payout, hoàn/đổi và nghĩa vụ TMĐT.
- [G3-H01](G3-H01-ha-tang-tich-hop.md) + [G3-H02](G3-H02-phap-ly-nghiem-thu.md): hạ tầng/vendor, pháp lý, kiểm thử chuyên sâu và bàn giao tách ngoài Coding.
- [G3-TIEU-CHI-NGHIEM-THU.md](G3-TIEU-CHI-NGHIEM-THU.md): 11 kịch bản end-to-end theo ba bước và B2B.

## VI. Những điều cần kiểm tra chất lượng ở vòng sau

1. Chốt VTV8 vận hành theo **referral/lead, affiliate, booking agent hay marketplace merchant**, ai thu tiền/thuế/hóa đơn/CSKH.
2. Xác minh đối tác thật, hình thức API/redirect, thời hạn attribution, quy tắc commission và chứng cứ đối soát; không lập trình đủ 40 mục CONDITIONAL khi chưa có đối tác.
3. Kiểm tra số bước UI tối thiểu cho Content + Lead để không phát triển một CRM hoặc CMS thứ hai.
4. Marketplace C chỉ làm khi có KPI quy mô/quyết định đầu tư rõ ràng, không lén tính như bước B.
5. Kiểm tra ranh giới G3-10 với mô hình quảng cáo/tài trợ B2B chung và GĐ4 về partner portal/licensing.

**Chưa có giờ FE/BE, báo giá, headcount, timeline nhân sự hay kế hoạch triển khai 6–12 tháng được chứng minh.** Báo giá về sau phải theo bước A/B1/B2/C/B2B chứ không cộng tất cả 70 tính năng mặc định.
