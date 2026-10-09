# G3-03 – Hồ sơ đối tác và danh mục dịch vụ

> **GĐ3 – phạm vi nội bộ sau QA 09/10/2026.** 64 tính năng trên 10 module đã được chọn để chuẩn hóa; chưa được VTV8 phê duyệt, chưa ước tính giờ FE/BE.

## Mục tiêu
Có một nguồn đối tác và offering thống nhất cho giới thiệu, lead, affiliate, booking và sàn TMĐT.

## Giai đoạn nội bộ và trách nhiệm
- **Bước:** A – Content + Lead; mở rộng B/C.
- **Chủ sở hữu nghiệp vụ:** Partner & Offer Directory.
- **Kế thừa:** G1-04 taxonomy/địa danh; G1-05 DAM; G1-02 admin roles. Partner self-service portal chuyên biệt để GĐ4, chưa thuộc đây.
- Những mục `CONDITIONAL` chỉ triển khai khi đạt gate đối tác/pháp lý/kinh doanh tại [G3-RELEASE-GATES.md](G3-RELEASE-GATES.md). `OPTION` chỉ thực hiện khi chọn. `CORE` là cơ sở đề xuất cho bước A, không phải yêu cầu đã ký.

## Tính năng độc lập (6)

| Mã | Tính năng | Actor | Nghiệp vụ sau QA | FE mới | BE mới | Nghiệm thu sơ bộ | Phạm vi | Nguồn | Ranh giới/điều kiện QA |
|---|---|---|---|---|---|---|---|---|---|
| G3-03-F001 | **Hồ sơ đơn vị đối tác** | Kinh doanh VTV8 | Một partner master duy nhất dùng cho giới thiệu, affiliate, booking, seller và B2B; seller là vai trò bổ sung theo G3-06, không tạo hồ sơ doanh nghiệp thứ hai. | Danh sách/form đối tác | Partner master data, trùng định danh và tham chiếu taxonomy | Mỗi đối tác có hồ sơ chính duy nhất dùng xuyên các bước GĐ3 | CORE | T | Một partner master dùng chung và vai trò riêng cho đối tác/seller. |
| G3-03-F002 | **Danh mục offering sản phẩm/dịch vụ mức giới thiệu** | Nhân viên kinh doanh; biên tập | Quản lý offering giới thiệu kèm mô tả, ảnh, đối tác, loại dịch vụ/địa phương theo taxonomy G1-04 (nhận G3-03-F005), phương thức CTA, nguồn giá và mốc cập nhật; không tự tạo SKU/stock/slot. | Offering CRUD, media picker và taxonomy picker dùng G1-04 | Offering catalog, relation taxonomy/đối tác, kiểm tra visibility và audit | Một offering liên kết đúng partner, địa phương và loại dịch vụ; không xây lại taxonomy hoặc inventory. | CORE | B | Offering giới thiệu khác SKU và inventory, phải ghi nguồn giá và thời điểm cập nhật. |
| G3-03-F003 | **Thẩm định và phê duyệt đối tác/offering** | Quản trị kinh doanh | Duyệt partner và offering dựa tài liệu/chứng cứ được VTV8 xác nhận; không tự công nhận chứng chỉ, quyền bán hoặc nguồn gốc sản phẩm. | Approval status và biên bản kiểm tra | Workflow approval, trạng thái suspensions và log | Đối tác chưa phê duyệt không được nhận lead hoặc cung cấp offering public | CORE | B | Phê duyệt có bằng chứng, không mặc định giấy phép/chứng nhận OCOP đã được xác minh. |
| G3-03-F004 | **Quản lý thông tin liên hệ và điều khoản hợp tác** | Kinh doanh; pháp lý | Lưu liên hệ phụ trách, kênh hỗ trợ, tài liệu/thời hạn thỏa thuận, mô hình nhận lead/affiliate/booking. | Thông tin liên hệ, tài liệu mức cơ bản | Contract metadata/reference và effective dates, permissions | Biết được mô hình giao dịch áp dụng và hiệu lực thỏa thuận của đối tác | CORE | B | Giữ metadata điều khoản/hợp đồng, không xây ERP hoặc ký số. |
| G3-03-F006 | **Quản lý chất lượng, tạm khóa và ngừng cung cấp** | Kinh doanh; hỗ trợ | Chủ sở hữu một quy tắc trạng thái active/suspended/hết hiệu lực của partner/offering, nhận nghiệp vụ cũ G3-01-F005; chặn công khai CTA và tạo lead/booking mới, không tự hủy giao dịch đang chạy. | Suspend/reactivate, cảnh báo nội dung liên kết | Eligibility API/guard dùng cho G3-01-F002/F003, G3-02-F001 và G3-05; audit tạm khóa | Khi partner/offering ngừng cung cấp, mọi CTA và lead mới bị chặn đồng bộ, không ảnh hưởng sai giao dịch cũ. | CORE | B | Chặn cung cấp/nhận lead khi partner bị tạm khóa; nhận guard từ G3-01-F005. |
| G3-03-F007 | **Kết nối dữ liệu đối tác từ API tự động** | Kỹ thuật tích hợp | Đồng bộ thông tin offering/giá/tình trạng sẵn có từ nguồn có API và hợp đồng phù hợp, tránh nhiều đầu nhập tay. | Màn trạng thái sync tối thiểu | Vendor adapter mapping, sync log/retry | Không ghi đè dữ liệu biên tập ngoài phạm vi mapping; lỗi có trạng thái | CONDITIONAL | B | API sync chỉ làm khi có vendor và schema rõ, không ghi đè dữ liệu chủ quản. |

**Nhãn nguồn:** `T` = chủ đề/ví dụ có trong đề xuất VTV8, không phải xác nhận từng chi tiết; `B` = nghiệp vụ đề xuất. `CORE` = nền tảng Content + Lead; `CONDITIONAL` = theo gate đối tác/pháp lý/đầu tư; `OPTION` = tùy chọn. [Danh mục 64 mã](G3-DANH-MUC-TINH-NANG.md) · [Mapping 70→64](G3-MAPPING-70-64.md) · [Nghiệm thu](G3-TIEU-CHI-NGHIEM-THU.md).

[Trở về GĐ3](README.md).

## Mã cũ đã gộp, không còn feature độc lập

- **G3-03-F005 – Quản lý danh mục ngành dịch vụ và địa phương:** chuyển vào **G3-03-F002 + G1-04: chọn taxonomy địa phương/ngành dịch vụ dùng chung**. Nghiệp vụ vẫn được duy trì.
