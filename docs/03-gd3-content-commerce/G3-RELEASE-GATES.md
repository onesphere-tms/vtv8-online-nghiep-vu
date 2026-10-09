# GĐ3 – Điều kiện triển khai theo ba bước Content Commerce

> **ĐỀ XUẤT NỘI BỘ – 09/10/2026.** Tài liệu nguồn VTV8 mô tả ba bước, dự kiến 6–12 tháng nhưng chưa chốt mô hình pháp lý, kinh doanh, quy mô, đơn vị giao dịch hoặc API. Các gate dưới đây là đề xuất quản trị phạm vi, **không phải xác nhận của VTV8 hay tư vấn pháp lý chính thức**.

## I. Kết cấu phát hành đề xuất

| Bước | Nhóm tính năng | Phần cần đạt | Ranh giới |
|---|---|---|---|
| **A – Content + Lead** | G3-01 (CORE), G3-02 (CORE), G3-03 (CORE) | Content → offering đối tác có hồ sơ được duyệt → người dùng đồng ý chia sẻ thông tin → gửi yêu cầu → đối tác tiếp nhận → cập nhật trạng thái/báo cáo | **Không khẳng định có booking hoặc thanh toán**; đây là luồng lead trước giao dịch |
| **B1 – Referral / Affiliate** | G3-04, phần outbound booking G3-05-F003 và offering detail G3-01-F003/G3-03-F002; listing G3-05-F001 là OPTION và đối soát G3-09 | Link/QR/redirect có attribution theo hợp đồng → đối tác xác nhận conversion → đối soát hoa hồng | VTV8 chưa nhất thiết trực tiếp nhận tiền từ người mua, phụ thuộc mã giới thiệu/API và chứng cứ đối soát |
| **B2 – Booking API trực tiếp** | G3-05-F004–F008 nếu được chốt | Giá/tình trạng chỗ → gửi yêu cầu → phản hồi/trạng thái vendor → hỗ trợ hủy/đổi/đối soát | Không thể tự báo có slot/confirmed khi chưa có API hoặc vendor chưa phản hồi; booking money flow cần scope riêng |
| **C – Sàn TMĐT khi quy mô đủ lớn** | G3-06/07/08 và phần liên quan G3-09 | Sản phẩm/seller hợp lệ → tồn/giá → giỏ → order → thanh toán → thực hiện đơn → đổi trả/hậu mãi → đối soát | **Không mặc định phát triển trong đợt GĐ3 đầu tiên**; chỉ khởi động sau quyết định về quy mô, seller, giao dịch và trách nhiệm |
| **B2B mở rộng** | G3-10 | Gói truyền thông/tài trợ và quản lý đề xuất/bàn giao | Nguồn có trong phần mô hình kinh doanh chung, chưa bắt buộc trong riêng ba bước GĐ3 |

**Quan trọng:** GĐ3 không mặc định hoàn tất sàn TMĐT chỉ vì nằm trong cùng tiêu đề giai đoạn. Cũng không gọi redirect/lead là booking hay conversion trả hoa hồng khi chưa có xác nhận từ đối tác.

**Ranh giới sau QA 70→64:** G3-05-F002 đã gộp vào G3-01-F003 và G3-03-F002. G3-05-F001 chỉ là trang danh sách booking mở rộng, không chặn bước B1 redirect. G3-08-F003 là carrier API OPTION; trạng thái giao hàng thủ công tối thiểu nằm trong G3-08-F001. Bước A chỉ yêu cầu 15 CORE theo danh mục hiện hành. Xem [mapping](G3-MAPPING-70-64.md).

## II. Quyết định bắt buộc theo nhóm

| Gate | Vấn đề cần xác minh | Ai chốt / chứng cứ |
|---|---|---|
| G3-GATE-A01 | Vai trò VTV8 đối với lead (đơn vị truyền thông/giới thiệu, đơn vị tư vấn, hay trực tiếp bán); mục đích thu thập và chia sẻ PII | VTV8 kinh doanh/pháp lý, chính sách quyền riêng tư và đối tác |
| G3-GATE-A02 | Điều kiện hợp tác, hồ sơ đối tác, thông tin công khai, nội dung thương mại và quyền media | VTV8 biên tập/kinh doanh, hợp đồng/biên bản nghiệm thu |
| G3-GATE-B01 | Đối tác affiliate, quy tắc nguồn giới thiệu, TTL attribution, dữ liệu conversion và mức/điều kiện hoa hồng | Hợp đồng đối tác/API/file đối soát, xác nhận mô hình chia doanh thu |
| G3-GATE-B02 | Đối tác có API tìm kiếm giá/slot, tạo/hủy booking, trạng thái và hạn xử lý lỗi hay chỉ hỗ trợ redirect | Ma trận API demo sandbox, sở hữu giao dịch, cơ chế xử lý sai lệch |
| G3-GATE-B03 | Bên thu tiền booking, bên phát hành hóa đơn, hoàn tiền/đổi lịch và đơn vị xử lý khiếu nại | Quyết định pháp lý/kinh doanh và tài liệu nhà cung cấp |
| G3-GATE-C01 | Có đủ quy mô và quyết định đầu tư vận hành sàn TMĐT hay chưa | KPI về nhu cầu giao dịch/người bán/doanh thu/chi phí được VTV8 duyệt, không tự đặt ngưỡng |
| G3-GATE-C02 | Mô hình người bán/chủ thể giao dịch, yêu cầu pháp lý TMĐT áp dụng, thuế/hóa đơn, giao hàng, hậu mãi, dữ liệu cá nhân | VTV8 pháp lý/kinh doanh/tài chính và đơn vị chuyên môn xác nhận |
| G3-GATE-C03 | Payment gateway, seller settlement, carrier, tồn kho, hoàn tiền, dispute, phương án tích hợp G2 payment | Hợp đồng, mẫu luồng trạng thái, API sandbox và phân định trách nhiệm |
| G3-GATE-D01 | B2B tài trợ/quảng cáo có thuộc phạm vi GĐ3 hay là giai đoạn riêng | VTV8 kinh doanh; mô tả gói, cách đo/bàn giao và trách nhiệm phê duyệt |

## III. Luồng tối thiểu để coi mỗi bước có thể nghiệm thu

### Bước A – Lead (đề xuất triển khai trước)

1. Biên tập viên chọn offering đã được phê duyệt từ G3-03 và gắn bài/video trong G3-01.
2. Người xem nhấn đăng ký tư vấn, nhìn thấy đối tác sẽ nhận thông tin và chính sách sử dụng dữ liệu.
3. Hệ thống ghi lead với nguồn nội dung và sự đồng ý phù hợp, chống spam/trùng.
4. VTV8 kiểm tra, phân công, chuyển cho đối tác, ghi trạng thái tiếp nhận và kết quả tư vấn.
5. Quản lý xem báo cáo lead theo chương trình/bài/đối tác/kỳ.

### Bước B1/B2 – Affiliate và Booking

1. B1: Người xem rời VTV8 qua link/mã giới thiệu, hệ thống ghi click theo quy tắc cho phép; **không ghi nhận đơn thành công** chỉ vì đã redirect.
2. B1: Đối tác gửi callback/bảng conversion đủ tin cậy; VTV8 đối soát chuyển đổi và khoản hoa hồng có chứng cứ.
3. B2: Chỉ khi có API và quyền giao dịch, người dùng chọn lịch/giá/slot, hệ thống tạo booking idempotent và đợi trạng thái xác nhận vendor.
4. B2: Thử các trạng thái failed, pending, cancelled, stale quote và sự cố mạng; phân định trách nhiệm hỗ trợ/hủy hoàn.

### Bước C – Sàn TMĐT

1. Phê duyệt seller, hàng hóa, quyền media và điều kiện bán; khóa seller/stock thì không tạo thêm đơn mới.
2. Người mua chọn SKU, giỏ, địa chỉ, phí giao hàng; đơn có snapshot giá/tồn.
3. Payment thật xử lý idempotent qua provider, chỉ chuyển paid khi có xác minh.
4. Seller nhận đơn, giao, cập nhật trạng thái, nhận yêu cầu hủy/đổi/trả theo chính sách.
5. Đối soát doanh thu/hoa hồng/thanh toán với các chứng cứ, không khẳng định payout thật nếu chưa có chức năng liên quan.

## IV. Những điều KHÔNG mặc định xây

- Cổng Partner Platform self-service đầy đủ (thuộc hướng GĐ4); dashboard admin cho VTV8 có thể hỗ trợ bước A/B/C.
- Booking engine tự tạo tồn phòng/vé/slot của đối tác khi chưa có quyền kiểm soát inventory và API.
- Công cụ kế toán/ERP/thuế/hóa đơn riêng, merchant payout automation và payment gateway tự phát triển.
- Sàn TMĐT nhiều người bán và vận chuyển nhiều bên trước khi có quyết định pháp lý/vận hành.
- Hệ thống quảng cáo lập trình/đấu giá quảng cáo hoặc CMS thứ hai để bán nội dung tài trợ.

[Danh mục GĐ3](G3-DANH-MUC-TINH-NANG.md) · [Nghiệm thu E2E](G3-TIEU-CHI-NGHIEM-THU.md).
