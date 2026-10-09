# G2-11 – Phân tích hành vi người xem và chất lượng phát

> **GĐ2 Media Platform – thiết kế nghiệp vụ sơ bộ 09/10/2026.** Module và tính năng **DRAFT, chưa được người dùng chốt hoặc VTV8 xác nhận**, chưa ước tính giờ FE/BE.

## Mục tiêu
VTV8 sở hữu dữ liệu tương tác người xem với nội dung và có chỉ số thực tế để tối ưu Media Platform.

## Ranh giới
Nâng từ thống kê tổng lượt xem G1-09 lên event xem theo phiên/tài khoản có kiểm soát quyền riêng tư. QoE analytics chỉ thu dữ liệu từ player/provider được phép; không tự đưa ClickHouse, big-data stack vào baseline khi chưa có tải thực.

## Phụ thuộc
G2-01 consent/privacy, G1-06/07/08 player/media, G2-02/03/05 personalization, G1-09 aggregates.

## Danh mục tính năng (8)

| Mã | Tính năng | Người sử dụng | Luồng nghiệp vụ và đầu ra | Phần việc FE mới | Phần việc BE mới | Tiêu chí nghiệm thu sơ bộ | Nguồn | Phạm vi đề xuất |
|---|---|---|---|---|---|---|---|---|
| G2-11-F001 | **Định nghĩa sự kiện hành vi và vòng đời phiên xem** | Product; kỹ thuật dữ liệu | Thống nhất event start/progress/pause/complete, click/follow/favorite, ID phiên và quan hệ account ẩn danh/có đăng nhập. | Instrumentation trên UI/player tại sự kiện được duyệt | Event schema, ingestion API, pseudonymous session keys, validation | Event có định nghĩa/đơn vị rõ, không thu dữ liệu bị cấm | T | CORE |
| G2-11-F002 | **Ghi nhận và tổng hợp hành vi xem video** | Quản trị sản phẩm | Tính số lần bắt đầu xem, hoàn tất, thời lượng và mức bỏ xem, khác với pageview G1-09. | Không bắt buộc màn riêng; instrumentation gắn player | Viewing events aggregation và public content refs | Số liệu đối soát được theo user/session/video và khoảng thời gian | T | CORE |
| G2-11-F003 | **Dashboard người xem và hoạt động nội dung** | Quản lý nội dung; quản trị sản phẩm | Xem tài khoản đang hoạt động, lượt phát, nội dung thu hút và biến động theo thời gian; phân quyền dữ liệu báo cáo. | Dashboard chỉ số, filter period/content | Metrics API, indexes/aggregates, access guards | Chỉ số có mô tả, mốc cập nhật, không lộ lịch sử cá nhân thô | T | CORE |
| G2-11-F004 | **Thống kê hành trình tương tác nội dung** | Quản trị sản phẩm | Theo dõi từ xem trang nội dung đến bắt đầu video, follow, xem tiếp hoặc đăng ký gói (nếu bật). | Bảng/charts funnel đơn giản | Event correlation/aggregations, chỉ dùng events có consent | Funnel giải thích được mẫu người/sự kiện, không nhân đôi phiên | B | CORE |
| G2-11-F005 | **Đo chất lượng phát từ player và nguồn streaming** | Kỹ thuật media | Nhận startup time, buffering/error, bitrate switches theo SDK/provider được hỗ trợ, đối chiếu trạng thái nguồn. | Client player instrumentation tối thiểu; màn theo dõi | QoE event API, provider metrics mapping G1-08 | Chỉ số không có API/SDK hiển thị là chưa khả dụng, không suy diễn | B | CONDITIONAL |
| G2-11-F006 | **Kiểm soát lưu giữ và xóa dữ liệu hành vi** | Nhân sự vận hành; người xem | Quy định retention và xử lý yêu cầu xóa dữ liệu, tách dữ liệu thống kê tổng khỏi dữ liệu nhận diện cá nhân. | UI quyền riêng tư nếu G2-01 yêu cầu | Retention jobs, deletion/aggregation, consent enforcement | Quy trình xóa/ẩn danh không làm lộ thông tin tài khoản | B | CORE |
| G2-11-F007 | **Phân tích nhóm người xem và tỷ lệ quay lại** | Quản trị sản phẩm | Phân nhóm theo lần truy cập, nhóm chương trình quan tâm và tỷ lệ tiếp tục xem trong kỳ. | Dashboard cohorts đơn giản | Cohort retention queries, privacy threshold | Không cho phép nhận diện từng cá nhân qua nhóm quá nhỏ | B | OPTION |
| G2-11-F008 | **Xuất báo cáo và kiểm tra chất lượng dữ liệu** | Quản trị sản phẩm; kỹ thuật dữ liệu | Xuất chỉ số tổng hợp, theo dõi số sự kiện lỗi/trùng và độ trễ, hỗ trợ đối soát định kỳ. | Filter/export và trạng thái dữ liệu | Batch export/quality checks, event dedupe, lineage | Báo cáo có ngày cập nhật, số liệu đúng và không lộ dữ liệu riêng | B | CORE |

**Quy ước:** `T` là nhóm yêu cầu VTV8 nêu trực tiếp (thao tác chi tiết có thể được suy luận); `B` là phân rã nghiệp vụ bổ sung; `C` là hạng mục có điều kiện pháp lý/vendor. `CORE` là đề xuất phạm vi cơ sở, `OPTION` và `CONDITIONAL` chưa mặc nhiên triển khai. Riêng **G2-08 toàn bộ CONDITIONAL** theo tài liệu GĐ2.

[Trở về tổng quan GĐ2](README.md).
