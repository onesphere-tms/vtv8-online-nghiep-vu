# G3-01 – Liên kết nội dung với sản phẩm và dịch vụ

> **GĐ3 – phạm vi nội bộ sau QA 09/10/2026.** 64 tính năng trên 10 module đã được chọn để chuẩn hóa; chưa được VTV8 phê duyệt, chưa ước tính giờ FE/BE.

## Mục tiêu
Biến bài viết/video/phóng sự thành điểm bắt đầu hành trình khám phá dịch vụ và sản phẩm, giữ nguyên tính độc lập biên tập của VTV8.

## Giai đoạn nội bộ và trách nhiệm
- **Bước:** A – Content + Lead.
- **Chủ sở hữu nghiệp vụ:** Content Commerce + biên tập CMS.
- **Kế thừa:** G1-03/04 nội dung cấu trúc; G1-01 trang bài; G1-05 quyền media; G2-04 search. Không làm lại CMS hay taxonomy.
- Những mục `CONDITIONAL` chỉ triển khai khi đạt gate đối tác/pháp lý/kinh doanh tại [G3-RELEASE-GATES.md](G3-RELEASE-GATES.md). `OPTION` chỉ thực hiện khi chọn. `CORE` là cơ sở đề xuất cho bước A, không phải yêu cầu đã ký.

## Tính năng độc lập (6)

| Mã | Tính năng | Actor | Nghiệp vụ sau QA | FE mới | BE mới | Nghiệm thu sơ bộ | Phạm vi | Nguồn | Ranh giới/điều kiện QA |
|---|---|---|---|---|---|---|---|---|---|
| G3-01-F001 | **Liên kết nội dung với sản phẩm/dịch vụ** | Biên tập viên | Liên kết một bài/video/chương trình với offering G3-03 đã duyệt; CTA phân biệt LEAD, REFERRAL, BOOKING và COMMERCE theo năng lực đã mở. | Picker offering dùng CMS và bảng liên kết | Content–offering relation API, quyền biên tập, chống trùng | Một nội dung có nhiều offering hợp lệ; CTA dẫn đúng luồng, không tự báo đặt chỗ/mua hàng thành công. | CORE | T | Liên kết nội dung/offering một nguồn; CTA phân biệt lead, affiliate, booking và mua hàng. |
| G3-01-F002 | **Khối giới thiệu dịch vụ trong trang nội dung** | Người xem | Hiển thị thẻ tour/khách sạn/đặc sản hoặc liên hệ đối tác trong trang bài/video, có CTA theo hình thức giao dịch. | Một widget card/CTA chung cho bài/video, nhãn hợp tác theo chính sách; ẩn hoặc báo không khả dụng khi offering bị khóa | Đọc offering public và kiểm tra eligibility từ G3-03-F006, DAM rights G1-05 | Đối tác/offering tạm khóa không tạo lead/booking mới và không còn CTA đang hoạt động. | CORE | T | Dùng một widget chung trên bài/video và chỉ hiện offering đã duyệt. |
| G3-01-F003 | **Trang giới thiệu sản phẩm hoặc dịch vụ liên quan** | Người xem | Trang chi tiết dùng offering và thông tin đối tác G3-03 đã duyệt, bao gồm điều khoản/CTA; tiếp nhận phần trang chi tiết giới thiệu từ G3-05-F002, chỉ quote/slot thời gian thực thuộc G3-05-F004. | Template detail dùng chung cho lead/referral và booking giới thiệu, tái dùng layout GĐ1 | Public offering detail G3-03, eligibility/visibility, liên kết tới lead/affiliate/booking khi được bật | Có trang đích đúng cho giới thiệu dịch vụ; chỉ hiển thị giá/chỗ theo thời điểm khi có API booking đã xác nhận. | CORE | B | Trang giới thiệu dùng dữ liệu offering G3-03, không làm lại SKU marketplace. |
| G3-01-F004 | **Phân biệt nội dung biên tập và nội dung thương mại** | Biên tập; người xem | Chính sách nhãn nội dung thương mại/tài trợ do VTV8 duyệt; phân biệt bài giới thiệu và tài trợ, không tự coi mọi liên kết dịch vụ là hợp đồng tài trợ. | Nhãn giới thiệu/hợp tác và trường chọn khi biên tập | Commercial disclosure metadata, log cập nhật | Nội dung được đánh dấu thể hiện nhãn theo chính sách trước xuất bản | CORE | B | Phân biệt nội dung giới thiệu và tài trợ, cần chốt quy chế ghi nhãn. |
| G3-01-F006 | **Liên kết sâu và mã QR tới trang dịch vụ** | Người xem | Tạo link/QR dẫn về trang dịch vụ hoặc luồng lead/booking hợp lệ để sử dụng trong video, ấn phẩm/sự kiện. | Hiển thị/copy link, QR trên trang liên quan | Stable link/short-code nếu cần, chống redirect không an toàn | QR mở đúng trang, giữ tham số tracking hợp lệ khi được phép | OPTION | T | Mã QR/deep link cần quy tắc tracking và chính sách dữ liệu. |
| G3-01-F007 | **Đề xuất dịch vụ liên quan theo địa danh/chủ đề** | Người xem | Hiển thị offering theo metadata nội dung và địa phương, dựa trên luật đơn giản; không xây AI recommendation mới. | Widget 'khám phá thêm' tái dùng card | Query relation/taxonomy, ưu tiên rule-based và quyền hiển thị | Phân loại đúng địa phương/chủ đề, không đưa offering hết hiệu lực | OPTION | B | Gợi ý theo địa phương dùng taxonomy có sẵn, không tự xây AI. |

**Nhãn nguồn:** `T` = chủ đề/ví dụ có trong đề xuất VTV8, không phải xác nhận từng chi tiết; `B` = nghiệp vụ đề xuất. `CORE` = nền tảng Content + Lead; `CONDITIONAL` = theo gate đối tác/pháp lý/đầu tư; `OPTION` = tùy chọn. [Danh mục 64 mã](G3-DANH-MUC-TINH-NANG.md) · [Mapping 70→64](G3-MAPPING-70-64.md) · [Nghiệm thu](G3-TIEU-CHI-NGHIEM-THU.md).

[Trở về GĐ3](README.md).

## Mã cũ đã gộp, không còn feature độc lập

- **G3-01-F005 – Kiểm tra trạng thái offering khi công khai:** chuyển vào **G3-03-F006; kiểm tra tại G3-01-F002/F003, quyền media từ G1-05**. Nghiệp vụ vẫn được duy trì.
