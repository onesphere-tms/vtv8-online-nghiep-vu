# G3-01 – Liên kết nội dung với sản phẩm và dịch vụ

> **GĐ3 Content Commerce – bản phân tích nghiệp vụ đề xuất, 09/10/2026.** Chưa có phê duyệt từ VTV8, chưa ước tính giờ FE/BE. Phạm vi theo ba bước trong tài liệu nguồn: Content + Lead → Affiliate/Booking → Sàn TMĐT khi đủ quy mô.

## Mục tiêu
Biến bài viết/video/phóng sự thành điểm bắt đầu hành trình khám phá dịch vụ và sản phẩm, giữ nguyên tính độc lập biên tập của VTV8.

## Giai đoạn nội bộ và trách nhiệm
- **Bước:** A – Content + Lead.
- **Chủ sở hữu nghiệp vụ:** Content Commerce + biên tập CMS.
- **Kế thừa:** G1-03/04 nội dung cấu trúc; G1-01 trang bài; G1-05 quyền media; G2-04 search. Không làm lại CMS hay taxonomy..
- Những mục `CONDITIONAL` chỉ triển khai khi đạt gate đối tác/pháp lý/kinh doanh tại [G3-RELEASE-GATES.md](G3-RELEASE-GATES.md). `OPTION` chỉ thực hiện khi chọn. `CORE` là cơ sở đề xuất cho bước A, không phải yêu cầu đã ký.

## Tính năng (7)

| Mã | Tính năng | Actor | Mô tả nghiệp vụ | FE phát triển mới | BE phát triển mới | Nghiệm thu sơ bộ | Phân loại | Nguồn |
|---|---|---|---|---|---|---|---|---|
| G3-01-F001 | **Liên kết nội dung với sản phẩm/dịch vụ** | Biên tập viên | Chọn bài/video/chương trình, gắn một hoặc nhiều offering đã được duyệt ở G3-03; nêu ngữ cảnh liên quan. | Picker offering dùng CMS và bảng liên kết | Content–offering relation API, quyền biên tập, chống trùng | Một video có nhiều dịch vụ liên quan và không lộ offering chưa duyệt | CORE | T |
| G3-01-F002 | **Khối giới thiệu dịch vụ trong trang nội dung** | Người xem | Hiển thị thẻ tour/khách sạn/đặc sản hoặc liên hệ đối tác trong trang bài/video, có CTA theo hình thức giao dịch. | Card responsive và CTA được phân loại | API đọc offering công khai có kiểm tra trạng thái | Nội dung có liên kết hiển thị đúng sản phẩm và CTA hợp lệ | CORE | T |
| G3-01-F003 | **Trang giới thiệu sản phẩm hoặc dịch vụ liên quan** | Người xem | Hiển thị mô tả, ảnh được phép sử dụng, đối tác, địa phương và đường dẫn tư vấn/đặt dịch vụ; giao dịch chuyên sâu thuộc module khác. | Template chi tiết dùng component GĐ1 | Public offering API từ G3-03; links đến lead/affiliate/booking | Không tạo bản sao catalog sản phẩm; thông tin lấy từ offering đã duyệt | CORE | B |
| G3-01-F004 | **Phân biệt nội dung biên tập và nội dung thương mại** | Biên tập; người xem | Đánh dấu vị trí có hợp tác thương mại/tài trợ theo chính sách VTV8; không tự biến nội dung báo chí thành quảng cáo không kiểm soát. | Nhãn giới thiệu/hợp tác và trường chọn khi biên tập | Commercial disclosure metadata, log cập nhật | Nội dung được đánh dấu thể hiện nhãn theo chính sách trước xuất bản | CORE | B |
| G3-01-F005 | **Kiểm tra trạng thái offering khi công khai** | Hệ thống; biên tập | Chặn liên kết đến đối tác bị khóa, sản phẩm/dịch vụ ngừng cung cấp, media thiếu quyền hoặc CTA không còn hợp lệ. | Fallback 'không còn cung cấp', ẩn CTA lỗi | Publish/visibility guard dùng G3-03 và DAM | Không dẫn đến đối tác/offering chưa hợp lệ từ trang công khai | CORE | B |
| G3-01-F006 | **Liên kết sâu và mã QR tới trang dịch vụ** | Người xem | Tạo link/QR dẫn về trang dịch vụ hoặc luồng lead/booking hợp lệ để sử dụng trong video, ấn phẩm/sự kiện. | Hiển thị/copy link, QR trên trang liên quan | Stable link/short-code nếu cần, chống redirect không an toàn | QR mở đúng trang, giữ tham số tracking hợp lệ khi được phép | OPTION | T |
| G3-01-F007 | **Đề xuất dịch vụ liên quan theo địa danh/chủ đề** | Người xem | Hiển thị offering theo metadata nội dung và địa phương, dựa trên luật đơn giản; không xây AI recommendation mới. | Widget 'khám phá thêm' tái dùng card | Query relation/taxonomy, ưu tiên rule-based và quyền hiển thị | Phân loại đúng địa phương/chủ đề, không đưa offering hết hiệu lực | OPTION | B |

**Nhãn nguồn:** `T` = nhóm yêu cầu/ví dụ được đề xuất VTV8 nêu, nhưng thao tác cụ thể có thể suy luận; `B` = nghiệp vụ chi tiết bổ sung để có thể triển khai. `CORE/CONDITIONAL/OPTION` đều là quyết định phân kỳ **đề xuất**, chưa phải phạm vi khách hàng chốt.

[Trở về GĐ3](README.md).
