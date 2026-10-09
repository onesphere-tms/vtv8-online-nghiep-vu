# GĐ2 – Truy vết 72 mã ban đầu sang 66 tính năng hiện hành

> **Đã áp dụng chuẩn hóa nội bộ ngày 09/10/2026.** Giữ nguyên mã của 66 tính năng còn độc lập. Sáu mã MERGED chỉ là mã lịch sử; nghiệp vụ chuyển sang nơi tiếp nhận, không biến mất. [Báo cáo QA lịch sử](G2-BAO-CAO-QA-72-TINH-NANG.md).

| Mã gốc | Tính năng | Nhãn ban đầu | Nhãn hiện hành | Nơi tiếp nhận / mã hiện hành | Ghi chú |
|---|---|---|---|---|---|
| G2-01-F001 | Đăng ký tài khoản người xem | CORE | CORE | G2-01-F001 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-01-F002 | Đăng nhập, đăng xuất và khôi phục tài khoản | CORE | CORE | G2-01-F002 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-01-F003 | Đăng nhập một lần SSO | CONDITIONAL | CONDITIONAL | G2-01-F003 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-01-F004 | Hồ sơ và thiết lập cá nhân | CORE | CORE | G2-01-F004 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-01-F005 | Chấp thuận dữ liệu và yêu cầu quyền riêng tư | CORE | CORE | G2-01-F005 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-01-F006 | Bảo mật/quản lý phiên người xem | CORE | MERGED | G2-01-F002 + G2-H01-W001/W007 | Revoke/rate limit/audit trở thành phần auth, không xóa nghĩa vụ bảo mật. |
| G2-01-F007 | Quản trị tài khoản người xem | CORE | CORE | G2-01-F007 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-02-F001 | Theo dõi và bỏ theo dõi chương trình | CORE | CORE | G2-02-F001 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-02-F002 | Lưu và bỏ yêu thích nội dung | CORE | CORE | G2-02-F002 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-02-F003 | Danh sách chương trình đang theo dõi | CORE | CORE | G2-02-F003 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-02-F004 | Danh sách nội dung yêu thích | CORE | CORE | G2-02-F004 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-02-F005 | Chủ đề nội dung quan tâm | OPTION | OPTION | G2-02-F005 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-03-F001 | Ghi tiến độ xem theo tài khoản | CORE | CORE | G2-03-F001 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-03-F002 | Danh sách xem tiếp | CORE | CORE | G2-03-F002 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-03-F003 | Xem lịch sử video đã xem | CORE | CORE | G2-03-F003 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-03-F004 | Xóa lịch sử hoặc từng mục xem | CORE | CORE | G2-03-F004 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-03-F005 | Tạo và quản lý danh sách phát cá nhân | CORE | CORE | G2-03-F005 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-03-F006 | Sắp xếp và phát tuần tự danh sách cá nhân | CORE | CORE | G2-03-F006 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-04-F001 | Chỉ mục tìm kiếm nội dung có cấu trúc | CORE | CORE | G2-04-F001 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-04-F002 | Trang kết quả tìm kiếm thống nhất | CORE | CORE | G2-04-F002 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-04-F003 | Tự động gợi ý từ khóa khi nhập | CORE | OPTION | G2-04-F003 | Đổi phân loại sau QA; giữ nghiệp vụ và mã. |
| G2-04-F004 | Lọc kết quả theo loại và chủ đề | CORE | CORE | G2-04-F004 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-04-F005 | Đồng bộ chỉ mục và tái tạo khi cần | CORE | CORE | G2-04-F005 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-04-F006 | Điều chỉnh mức liên quan/khả năng chịu lỗi gõ | OPTION | OPTION | G2-04-F006 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-05-F001 | Gợi ý nội dung liên quan theo metadata | CORE | CORE | G2-05-F001 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-05-F002 | Gợi ý theo chương trình đang theo dõi | CORE | CORE | G2-05-F002 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-05-F003 | Gợi ý theo chủ đề và lịch sử xem | CORE | CORE | G2-05-F003 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-05-F004 | Gợi ý người mới không có lịch sử | CORE | MERGED | G2-05-F003 + G1-03-F009 | Cold-start fallback từ danh sách nổi bật trong recommendation. |
| G2-05-F005 | Quy tắc ưu tiên nội dung biên tập | OPTION | OPTION | G2-05-F005 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-05-F006 | Đo hiệu quả gợi ý | CORE | MERGED | G2-11-F001/F008 | Dữ liệu nguồn đề xuất trong analytics chung, không phát triển bộ thống kê thứ hai. |
| G2-06-F001 | Tiếp tục phát từ vị trí đang xem | CORE | CORE | G2-06-F001 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-06-F002 | Chọn chất lượng video theo nguồn cung cấp | CONDITIONAL | CONDITIONAL | G2-06-F002 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-06-F003 | Phụ đề và bản âm thanh thay thế | CONDITIONAL | CONDITIONAL | G2-06-F003 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-06-F004 | Điều hướng tập kế tiếp và tự phát | CORE | CORE | G2-06-F004 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-06-F005 | Giới hạn thời gian xem | CORE | MERGED | G1-05-F004 + G2-10-F002 + G1-06 | Áp dụng quyền DAM khi miễn phí, entitlement khi bật premium. |
| G2-06-F006 | Chuyển Live sang VOD | CORE | MERGED | G1-07-F007 + G1-06-F006 | Phần replay pipeline đã thuộc GĐ1; chỉ UX mới nếu có. |
| G2-07-F001 | Quản lý nội dung bản tin cập nhật | CORE | CORE | G2-07-F001 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-07-F002 | Sinh thông báo theo chương trình đang theo dõi | CORE | CORE | G2-07-F002 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-07-F003 | Hộp thư thông báo trong tài khoản | CORE | CORE | G2-07-F003 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-07-F004 | Thông báo đẩy trên trình duyệt | CONDITIONAL | CONDITIONAL | G2-07-F004 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-07-F005 | Bản tin cập nhật qua email | OPTION | OPTION | G2-07-F005 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-07-F006 | Thiết lập sở thích và tần suất thông báo | CORE | CORE | G2-07-F006 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-07-F007 | Theo dõi trạng thái gửi và lỗi | CORE | CONDITIONAL | G2-07-F007 | Đổi phân loại sau QA; giữ nghiệp vụ và mã. |
| G2-08-F001 | Bật/tắt tương tác theo loại nội dung | CONDITIONAL | CONDITIONAL | G2-08-F001 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-08-F002 | Gửi và hiển thị bình luận | CONDITIONAL | CONDITIONAL | G2-08-F002 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-08-F003 | Phản hồi bình luận có kiểm soát | CONDITIONAL | CONDITIONAL | G2-08-F003 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-08-F004 | Kiểm duyệt, ẩn và xóa bình luận | CONDITIONAL | CONDITIONAL | G2-08-F004 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-08-F005 | Báo cáo bình luận vi phạm | CONDITIONAL | CONDITIONAL | G2-08-F005 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-08-F006 | Chống spam và kiểm soát lạm dụng | CONDITIONAL | CONDITIONAL | G2-08-F006 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-09-F001 | Danh mục gói thuê bao và quyền lợi | CORE | CONDITIONAL | G2-09-F001 | Đổi phân loại sau QA; giữ nghiệp vụ và mã. |
| G2-09-F002 | Giá, chu kỳ và điều kiện đăng ký | CONDITIONAL | CONDITIONAL | G2-09-F002 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-09-F003 | Đăng ký gói và khởi tạo thanh toán | CONDITIONAL | CONDITIONAL | G2-09-F003 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-09-F004 | Nhận trạng thái giao dịch và đối soát đơn | CONDITIONAL | CONDITIONAL | G2-09-F004 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-09-F005 | Vòng đời thuê bao và ngày hết hạn | CORE | CONDITIONAL | G2-09-F005 | Đổi phân loại sau QA; giữ nghiệp vụ và mã. |
| G2-09-F006 | Gia hạn, hủy và xử lý thanh toán thất bại | CONDITIONAL | CONDITIONAL | G2-09-F006 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-09-F007 | Lịch sử thanh toán và chứng từ | CONDITIONAL | CONDITIONAL | G2-09-F007 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-09-F008 | Khuyến mại, dùng thử hoặc tặng quyền | OPTION | OPTION | G2-09-F008 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-10-F001 | Phân loại nội dung miễn phí và trả phí | CORE | CONDITIONAL | G2-10-F001 | Đổi phân loại sau QA; giữ nghiệp vụ và mã. |
| G2-10-F002 | Kiểm tra quyền xem theo tài khoản | CORE | CONDITIONAL | G2-10-F002 | Đổi phân loại sau QA; giữ nghiệp vụ và mã. |
| G2-10-F003 | Giao diện paywall và nâng cấp quyền xem | CORE | CONDITIONAL | G2-10-F003 | Đổi phân loại sau QA; giữ nghiệp vụ và mã. |
| G2-10-F004 | Bảo vệ URL và phiên phát nội dung có quyền | CORE | CONDITIONAL | G2-10-F004 | Đổi phân loại sau QA; giữ nghiệp vụ và mã. |
| G2-10-F005 | Tích hợp hệ thống DRM được cấp phép | CONDITIONAL | CONDITIONAL | G2-10-F005 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-10-F006 | Quản lý số thiết bị/phiên xem đồng thời | OPTION | OPTION | G2-10-F006 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-10-F007 | Thời hạn giấy phép nội dung | CORE | MERGED | G1-05-F004 + G2-10-F002/F004 | Dùng rights DAM một nguồn, gắn vào quyền xem và token. |
| G2-11-F001 | Định nghĩa sự kiện hành vi và vòng đời phiên xem | CORE | CORE | G2-11-F001 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-11-F002 | Ghi nhận và tổng hợp hành vi xem video | CORE | CORE | G2-11-F002 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-11-F003 | Dashboard người xem và hoạt động nội dung | CORE | CORE | G2-11-F003 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-11-F004 | Thống kê hành trình tương tác nội dung | CORE | OPTION | G2-11-F004 | Đổi phân loại sau QA; giữ nghiệp vụ và mã. |
| G2-11-F005 | Đo chất lượng phát từ player và nguồn streaming | CONDITIONAL | CONDITIONAL | G2-11-F005 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-11-F006 | Kiểm soát lưu giữ và xóa dữ liệu hành vi | CORE | CORE | G2-11-F006 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-11-F007 | Phân tích nhóm người xem và tỷ lệ quay lại | OPTION | OPTION | G2-11-F007 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |
| G2-11-F008 | Xuất báo cáo và kiểm tra chất lượng dữ liệu | CORE | CORE | G2-11-F008 | Giữ mã hoạt động; điều chỉnh mô tả/ranh giới nếu được QA kiến nghị. |

**Đối chiếu:** 72 mã = 66 còn độc lập (**33 CORE, 9 OPTION, 24 CONDITIONAL**) + 6 mã gộp. Hai mã từ CORE thành OPTION: **G2-04-F003, G2-11-F004**. Bảy mã CORE thành CONDITIONAL: **G2-07-F007, G2-09-F001, G2-09-F005, G2-10-F001, G2-10-F002, G2-10-F003, G2-10-F004**. Không đổi mã khác hoặc đánh số lại.

**Quy tắc báo giá về sau:** tính công phần chuyển sang chủ sở hữu mới nếu có bổ sung chưa được phát triển ở GĐ1, không cộng giờ của mã MERGED như tính năng độc lập.
