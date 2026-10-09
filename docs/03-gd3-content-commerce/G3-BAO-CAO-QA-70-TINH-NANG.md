# GĐ3 – Báo cáo QA phạm vi 70 tính năng Content Commerce

> **HỒ SƠ QA LỊCH SỬ:** các kiến nghị **đã áp dụng** trong [64 tính năng hiện hành](G3-DANH-MUC-TINH-NANG.md) với [mapping đầy đủ 70→64](G3-MAPPING-70-64.md). Những câu dưới đây nói 'chưa áp dụng' chỉ thể hiện trạng thái lúc viết QA ban đầu; VTV8 chưa phê duyệt.

> **09/10/2026 – ĐÃ RÀ SOÁT, CHƯA ÁP DỤNG KIẾN NGHỊ VÀO DANH MỤC GỐC.** Đối chiếu đủ 70/70 mã theo 10 module, [nguồn đề xuất VTV8–IIEL](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md), [GĐ1](../01-gd1-vtv8online-v1/README.md), [GĐ2](../02-gd2-media-platform/README.md). Chưa được VTV8 phê duyệt, chưa tính giờ FE/BE.

## 1. Kết quả

| Kết luận | Số |
|---|---:|
| GIỮ không phải chỉnh lớn | 3 |
| GIỮ OPTION | 9 |
| GIỮ CONDITIONAL | 3 |
| CHỈNH nghiệp vụ, FE/BE hoặc nghiệm thu | 47 |
| GỘP (không bỏ nghiệp vụ) | 6 |
| ĐỔI OPTION | 2 |
| **Đã kiểm** | **70** |

Nếu được duyệt, danh mục **64 tính năng độc lập: 15 CORE, 35 CONDITIONAL, 14 OPTION**, vẫn **10 module + 2 nhóm hỗ trợ H01/H02**. 18 CORE hiện hành giảm 3 là do gộp vào mã CORE khác, không cắt luồng Content + Lead.

## 2. Sáu mã đề xuất gộp

| Mã cũ | Nơi sở hữu sau khi gộp | Lý do |
|---|---|---|
| G3-01-F005 | G3-03-F006 và G3-01-F002/F003 | Một quy tắc kiểm tra trạng thái partner/offering, tái dùng DAM rights |
| G3-02-F003 | G3-02-F001 + G3-H01-W001 | Kiểm tra trùng/rate-limit là nghiệm thu form, không là phân hệ riêng |
| G3-03-F005 | G3-03-F002 + G1-04 | Phân loại địa phương/dịch vụ dùng taxonomy có trước |
| G3-05-F002 | G3-01-F003 + G3-03-F002; dữ liệu live quote tại G3-05-F004 | Không làm hai trang chi tiết offering và booking |
| G3-07-F008 | G3-07-F004/F007 + G2-07 | Dùng inbox/thông báo GĐ2, chỉ bổ sung sự kiện từ đơn hàng |
| G3-08-F002 | G3-08-F001 + G3-03 | Bàn giao cho seller là thao tác của quy trình xử lý đơn |

**ĐỔI CONDITIONAL → OPTION:** G3-05-F001 (danh sách bookable độc lập chưa cần ở bước redirect) và G3-08-F003 (API vận chuyển nâng cao, vẫn cần theo dõi trạng thái thủ công tối thiểu trong G3-08-F001). Các OPTION này chỉ có ý nghĩa khi phân kỳ liên quan được triển khai.

## 3. Đánh giá theo nhóm

| Nhóm | Nhận xét về phạm vi và chất lượng |
|---|---|
| G3-01–03 **Content + Lead** | Giữ CORE khép kín: nội dung → offering đã phê duyệt → consent đúng đối tác → lead có nguồn → phân công/bàn giao → trạng thái tư vấn → báo cáo. Không tự phát triển CRM, CMS hay catalog thứ hai |
| G3-04 **Affiliate** | Phải tách click/traffic, conversion vendor xác nhận và hoa hồng đủ điều kiện. Attribution window/chứng cứ phải theo hợp đồng; không tự coi click là sale |
| G3-05 **Booking** | Phân B1 redirect và B2 API giá/chỗ/đặt/hủy; không báo confirmed khi chưa có xác nhận vendor, không tự xây booking inventory |
| G3-06 **Marketplace catalog** | Seller là vai trò bổ sung của partner master; SKU, giá chốt/tồn/kiểm duyệt hàng hóa khác offering giới thiệu |
| G3-07–08 **Order và vận hành** | Chốt ai bán/nhận tiền/chịu vận chuyển; cùng một CommerceOrder state, không sao chép subscription order G2-09; hậu mãi là nghĩa vụ cần xác nhận |
| G3-09 **Đối soát** | Commission cần định nghĩa thời điểm đủ điều kiện, kỳ, chính sách đảo/hủy và dữ liệu đối tác; báo cáo doanh thu khác báo cáo lead |
| G3-10 **B2B** | Là OPTION vì nằm trong mô hình kinh doanh tổng thể trang 12–13, chưa phải bước bắt buộc GĐ3 trang 7; tái dùng lead/CMS và partner master |

## 4. Điều kiện P0 cần quyết định trước khi chốt phạm vi

1. **Vai trò VTV8** ở từng bước: giới thiệu, đại lý booking, đơn vị vận hành sàn hay chủ thể nhận tiền; bên nào hỗ trợ và xuất chứng từ.
2. **Quyền nhận và chuyển dữ liệu lead** theo mục đích, đơn vị nhận, thời hạn giữ và chính sách được VTV8 phê duyệt.
3. **Hợp đồng Affiliate**: nguồn conversion đủ tin cậy, loại giao dịch được tính hoa hồng, thời hạn attribution, kỳ và đối soát.
4. **Booking**: đối tác có API hay chỉ redirect, quyền lấy giá/slot, đồng bộ trạng thái, điều kiện đổi/hủy và trách nhiệm giao dịch.
5. **TMĐT**: có quyết định mở sàn theo quy mô và pháp lý hay chưa; seller, vận chuyển, thuế, hoàn tiền, hàng hóa/nguồn gốc và hỗ trợ.
6. **Kế thừa GĐ2**: payment gateway, user, consent và thông báo có thực sự nằm trong scope triển khai GĐ2 hay còn CONDITIONAL. Nếu chưa có thì GĐ3 phải dự toán phần phụ thuộc, không mặc định miễn phí.

## 5. Điều kiện P1, phần thiếu cần bổ sung tiêu chí nghiệm thu

- Lead: trạng thái chuyển giao thất bại, bằng chứng đối tác tiếp nhận, quy tắc chống gửi trùng và quyền xem thông tin người dùng.
- Booking: hết chỗ, stale quote, callback chậm, một yêu cầu gửi lại, hủy nhưng chưa được đối tác chấp nhận.
- TMĐT: một hay nhiều seller/đơn, khóa tồn, đổi giá lúc checkout, hoàn một phần và tranh chấp.
- Commerce reporting: phân biệt số lead, số click, conversion accepted, booking confirmed, đơn paid, hoa hồng payable.
- B2B: chỉ đưa vào khi xác nhận đây là sản phẩm phần mềm GĐ3 chứ không chỉ nghiệp vụ kinh doanh ngoài hệ thống.

## 6. Các hồ sơ QA theo từng tính năng

[G3-01](G3-QA-G3-01.md) · [G3-02](G3-QA-G3-02.md) · [G3-03](G3-QA-G3-03.md) · [G3-04](G3-QA-G3-04.md) · [G3-05](G3-QA-G3-05.md) · [G3-06](G3-QA-G3-06.md) · [G3-07](G3-QA-G3-07.md) · [G3-08](G3-QA-G3-08.md) · [G3-09](G3-QA-G3-09.md) · [G3-10](G3-QA-G3-10.md)

**Nguyên tắc:** Mỗi dòng đều có mã, kết luận giữ/chỉnh/gộp/chuyển tùy chọn và nơi tiếp nhận khi gộp. Các tính năng còn hoạt động giữ nguyên ID để truy vết sau khi áp dụng QA.

## 7. Đề xuất bước tiếp theo

**Không chỉnh ngay 70 mã trong bước QA này.** Khi được chọn áp dụng: chuẩn hóa thành **64 mã đang hoạt động**, cập nhật 10 tài liệu module, danh mục G3 và bảng mapping 70→64; phân kỳ A (CORE), B1/B2 (có điều kiện), C (có điều kiện đầu tư/pháp lý), B2B (OPTION). Sau đó mới ước tính thời gian theo từng bước, không cộng 35 CONDITIONAL mặc định.

Bản phân tích chỉ dựa tài liệu đề xuất, không thay biên bản xác nhận nhu cầu hoặc tư vấn pháp lý.
