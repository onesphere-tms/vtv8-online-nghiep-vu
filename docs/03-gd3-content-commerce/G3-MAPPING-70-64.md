# GĐ3 – Mapping 70 tính năng trước QA sang 64 tính năng đang sử dụng

> **Áp dụng 09/10/2026 trong hồ sơ nội bộ.** 64 mã giữ nguyên ID; 6 mã MERGED chỉ là mã lịch sử, không tái sử dụng hoặc tính giờ riêng. Đây không phải sự cắt giảm 6 nghiệp vụ. [Báo cáo QA 70 mã](G3-BAO-CAO-QA-70-TINH-NANG.md) lưu các kiến nghị và [danh mục 64 mã](G3-DANH-MUC-TINH-NANG.md) là bản hiện hành. VTV8 chưa phê duyệt phạm vi cuối.

| Mã gốc | Tính năng cũ | Trước QA | Trạng thái sau QA | Mã hiện hành / owner tiếp nhận | Giải thích |
|---|---|---|---|---|---|
| G3-01-F001 | Liên kết nội dung với sản phẩm/dịch vụ | CORE | CORE | G3-01-F001 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-01-F002 | Khối giới thiệu dịch vụ trong trang nội dung | CORE | CORE | G3-01-F002 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-01-F003 | Trang giới thiệu sản phẩm hoặc dịch vụ liên quan | CORE | CORE | G3-01-F003 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-01-F004 | Phân biệt nội dung biên tập và nội dung thương mại | CORE | CORE | G3-01-F004 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-01-F005 | Kiểm tra trạng thái offering khi công khai | CORE | MERGED | G3-03-F006, G3-01-F002/F003 | Eligibility/visibility của offering và CTA dùng một chính sách chính, kế thừa quyền DAM. |
| G3-01-F006 | Liên kết sâu và mã QR tới trang dịch vụ | OPTION | OPTION | G3-01-F006 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-01-F007 | Đề xuất dịch vụ liên quan theo địa danh/chủ đề | OPTION | OPTION | G3-01-F007 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-02-F001 | Biểu mẫu đăng ký tư vấn/liên hệ sản phẩm | CORE | CORE | G3-02-F001 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-02-F002 | Thông báo và ghi nhận đồng ý chia sẻ thông tin | CORE | CORE | G3-02-F002 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-02-F003 | Chống gửi trùng và spam lead | CORE | MERGED | G3-02-F001, G3-H01-W001 | Anti-spam, dedupe, rate limit là nghiệm thu form lead và bảo vệ hạ tầng, không là luồng riêng. |
| G3-02-F004 | Hộp tiếp nhận lead của VTV8 | CORE | CORE | G3-02-F004 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-02-F005 | Phân công và chuyển giao lead cho đối tác | CORE | CORE | G3-02-F005 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-02-F006 | Cập nhật tiến độ tư vấn và kết quả lead | CORE | CORE | G3-02-F006 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-02-F007 | Thống kê chuyển đổi từ nội dung sang lead | CORE | CORE | G3-02-F007 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-03-F001 | Hồ sơ đơn vị đối tác | CORE | CORE | G3-03-F001 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-03-F002 | Danh mục offering sản phẩm/dịch vụ mức giới thiệu | CORE | CORE | G3-03-F002 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-03-F003 | Thẩm định và phê duyệt đối tác/offering | CORE | CORE | G3-03-F003 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-03-F004 | Quản lý thông tin liên hệ và điều khoản hợp tác | CORE | CORE | G3-03-F004 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-03-F005 | Quản lý danh mục ngành dịch vụ và địa phương | CORE | MERGED | G3-03-F002, G1-04 | Taxonomy ngành/địa phương là trường offering dùng lại CMS GĐ1. |
| G3-03-F006 | Quản lý chất lượng, tạm khóa và ngừng cung cấp | CORE | CORE | G3-03-F006 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-03-F007 | Kết nối dữ liệu đối tác từ API tự động | CONDITIONAL | CONDITIONAL | G3-03-F007 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-04-F001 | Chương trình affiliate và đường dẫn giới thiệu | CONDITIONAL | CONDITIONAL | G3-04-F001 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-04-F002 | Ghi nhận nhấp và phiên giới thiệu | CONDITIONAL | CONDITIONAL | G3-04-F002 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-04-F003 | Quy tắc quy kết và thời hạn attribution | CONDITIONAL | CONDITIONAL | G3-04-F003 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-04-F004 | Nhận conversion/callback từ đối tác | CONDITIONAL | CONDITIONAL | G3-04-F004 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-04-F005 | Theo dõi trạng thái chuyển đổi affiliate | CONDITIONAL | CONDITIONAL | G3-04-F005 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-04-F006 | Báo cáo hiệu quả affiliate theo nguồn nội dung | CONDITIONAL | CONDITIONAL | G3-04-F006 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-05-F001 | Danh sách dịch vụ du lịch có thể đặt | CONDITIONAL | OPTION | G3-05-F001 | Trang listing booking riêng chỉ thực hiện khi cần; B1 vẫn dùng offering G3-01. |
| G3-05-F002 | Trang chi tiết và điều kiện dịch vụ | CONDITIONAL | MERGED | G3-01-F003, G3-03-F002; G3-05-F004 cho quote/slot | Không lặp trang chi tiết dịch vụ; giá/chỗ realtime vẫn thuộc API booking. |
| G3-05-F003 | Chuyển hướng đặt dịch vụ tại hệ thống đối tác | CONDITIONAL | CONDITIONAL | G3-05-F003 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-05-F004 | Kiểm tra giá và tình trạng chỗ qua API đối tác | CONDITIONAL | CONDITIONAL | G3-05-F004 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-05-F005 | Tạo yêu cầu đặt chỗ trực tiếp qua API | CONDITIONAL | CONDITIONAL | G3-05-F005 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-05-F006 | Đồng bộ và hiển thị trạng thái đặt chỗ | CONDITIONAL | CONDITIONAL | G3-05-F006 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-05-F007 | Hủy/đổi lịch theo chính sách bên cung cấp | CONDITIONAL | CONDITIONAL | G3-05-F007 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-05-F008 | Theo dõi lỗi và đối soát booking với đối tác | CONDITIONAL | CONDITIONAL | G3-05-F008 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-06-F001 | Đánh giá và kích hoạt đối tác thành người bán | CONDITIONAL | CONDITIONAL | G3-06-F001 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-06-F002 | Danh mục sản phẩm bán trực tiếp | CONDITIONAL | CONDITIONAL | G3-06-F002 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-06-F003 | Giá niêm yết và điều kiện bán hàng | CONDITIONAL | CONDITIONAL | G3-06-F003 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-06-F004 | Quản lý tồn kho cơ bản | CONDITIONAL | CONDITIONAL | G3-06-F004 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-06-F005 | Tổ chức danh mục và lọc sản phẩm | CONDITIONAL | CONDITIONAL | G3-06-F005 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-06-F006 | Kiểm duyệt thông tin và quyền sử dụng hình ảnh sản phẩm | CONDITIONAL | CONDITIONAL | G3-06-F006 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-06-F007 | Trang gian hàng người bán mức cơ bản | OPTION | OPTION | G3-06-F007 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-07-F001 | Giỏ hàng và điều chỉnh số lượng | CONDITIONAL | CONDITIONAL | G3-07-F001 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-07-F002 | Thu thập địa chỉ và thông tin giao hàng | CONDITIONAL | CONDITIONAL | G3-07-F002 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-07-F003 | Tính phí giao hàng và cách nhận hàng | CONDITIONAL | CONDITIONAL | G3-07-F003 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-07-F004 | Tạo đơn hàng với giá snapshot và kiểm tra tồn | CONDITIONAL | CONDITIONAL | G3-07-F004 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-07-F005 | Tích hợp thanh toán đơn hàng TMĐT | CONDITIONAL | CONDITIONAL | G3-07-F005 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-07-F006 | Nhận kết quả và đối soát thanh toán đơn hàng | CONDITIONAL | CONDITIONAL | G3-07-F006 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-07-F007 | Tra cứu đơn hàng và trạng thái mua | CONDITIONAL | CONDITIONAL | G3-07-F007 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-07-F008 | Thông báo thay đổi đơn hàng | CONDITIONAL | MERGED | G3-07-F004/F007, G2-07 | Phát event order dùng inbox/notification GĐ2; không xây thêm một hệ thông báo. |
| G3-07-F009 | Mã ưu đãi và điều chỉnh giá khi đặt hàng | OPTION | OPTION | G3-07-F009 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-08-F001 | Bảng điều hành tiếp nhận và xử lý đơn | CONDITIONAL | CONDITIONAL | G3-08-F001 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-08-F002 | Chuyển đơn cho đối tác cung ứng | CONDITIONAL | MERGED | G3-08-F001, G3-03 | Bàn giao cho seller là hành động của fulfillment và dùng hồ sơ đối tác chung. |
| G3-08-F003 | Tích hợp vận chuyển và mã theo dõi | CONDITIONAL | OPTION | G3-08-F003 | Carrier API tự động được hoãn; theo dõi vận chuyển thủ công ở G3-08-F001. |
| G3-08-F004 | Xử lý yêu cầu hủy đơn | CONDITIONAL | CONDITIONAL | G3-08-F004 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-08-F005 | Đổi trả và hoàn tiền | CONDITIONAL | CONDITIONAL | G3-08-F005 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-08-F006 | Tiếp nhận khiếu nại và tranh chấp | CONDITIONAL | CONDITIONAL | G3-08-F006 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-08-F007 | Theo dõi thời hạn xử lý và chất lượng người bán | OPTION | OPTION | G3-08-F007 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-09-F001 | Quy tắc hoa hồng theo đối tác và loại giao dịch | CONDITIONAL | CONDITIONAL | G3-09-F001 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-09-F002 | Tiếp nhận dữ liệu đối soát đối tác | CONDITIONAL | CONDITIONAL | G3-09-F002 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-09-F003 | Tính và lưu kết quả hoa hồng theo kỳ | CONDITIONAL | CONDITIONAL | G3-09-F003 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-09-F004 | Bảng kê và xác nhận đối soát với đối tác | CONDITIONAL | CONDITIONAL | G3-09-F004 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-09-F005 | Báo cáo thương mại theo nội dung/đối tác | CONDITIONAL | CONDITIONAL | G3-09-F005 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-09-F006 | Điều chỉnh, truy thu và xử lý tranh chấp đối soát | OPTION | OPTION | G3-09-F006 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-10-F001 | Danh mục gói dịch vụ truyền thông B2B | OPTION | OPTION | G3-10-F001 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-10-F002 | Tiếp nhận yêu cầu quảng bá hoặc tài trợ | OPTION | OPTION | G3-10-F002 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-10-F003 | Lập và phê duyệt đề xuất truyền thông | OPTION | OPTION | G3-10-F003 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-10-F004 | Liên kết nội dung tài trợ và nhãn hợp tác | OPTION | OPTION | G3-10-F004 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-10-F005 | Theo dõi bàn giao nội dung, chương trình và báo cáo | OPTION | OPTION | G3-10-F005 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |
| G3-10-F006 | Bảng quản lý khách hàng và hợp đồng B2B tối thiểu | OPTION | OPTION | G3-10-F006 | Mã giữ độc lập; nội dung/ràng buộc đã chuẩn hóa theo QA. |

**Đối soát:** 70 mã gốc = **64 mã độc lập (15 CORE + 35 CONDITIONAL + 14 OPTION) + 6 MERGED**.

**Mã đã gộp:** `G3-01-F005`, `G3-02-F003`, `G3-03-F005`, `G3-05-F002`, `G3-07-F008`, `G3-08-F002`. **Chuyển CONDITIONAL → OPTION:** `G3-05-F001`, `G3-08-F003`. Tất cả các mã hoạt động còn lại giữ phân loại và mã, nhưng có thể đã cập nhật mô tả FE/BE và nghiệm thu.

**Lưu ý khi ước tính:** phần công việc mới tiếp nhận từ mã gộp được tính ở owner còn hoạt động (nếu chưa có ở GĐ1/GĐ2). Không nhân đôi phần kế thừa GĐ1/GĐ2; không cộng mọi CONDITIONAL của các bước B/C vào phạm vi CORE bước A.
