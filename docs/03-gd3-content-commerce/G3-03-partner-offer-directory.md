# G3-03 – Hồ sơ đối tác và danh mục dịch vụ

> **GĐ3 Content Commerce – bản phân tích nghiệp vụ đề xuất, 09/10/2026.** Chưa có phê duyệt từ VTV8, chưa ước tính giờ FE/BE. Phạm vi theo ba bước trong tài liệu nguồn: Content + Lead → Affiliate/Booking → Sàn TMĐT khi đủ quy mô.

## Mục tiêu
Có một nguồn đối tác và offering thống nhất cho giới thiệu, lead, affiliate, booking và sàn TMĐT.

## Giai đoạn nội bộ và trách nhiệm
- **Bước:** A – Content + Lead; mở rộng B/C.
- **Chủ sở hữu nghiệp vụ:** Partner & Offer Directory.
- **Kế thừa:** G1-04 taxonomy/địa danh; G1-05 DAM; G1-02 admin roles. Partner self-service portal chuyên biệt để GĐ4, chưa thuộc đây..
- Những mục `CONDITIONAL` chỉ triển khai khi đạt gate đối tác/pháp lý/kinh doanh tại [G3-RELEASE-GATES.md](G3-RELEASE-GATES.md). `OPTION` chỉ thực hiện khi chọn. `CORE` là cơ sở đề xuất cho bước A, không phải yêu cầu đã ký.

## Tính năng (7)

| Mã | Tính năng | Actor | Mô tả nghiệp vụ | FE phát triển mới | BE phát triển mới | Nghiệm thu sơ bộ | Phân loại | Nguồn |
|---|---|---|---|---|---|---|---|---|
| G3-03-F001 | **Hồ sơ đơn vị đối tác** | Kinh doanh VTV8 | Quản lý đơn vị lữ hành, nhà hàng, khách sạn, HTX/nhà sản xuất, đầu mối liên hệ, ngành nghề và địa bàn. | Danh sách/form đối tác | Partner master data, trùng định danh và tham chiếu taxonomy | Mỗi đối tác có hồ sơ chính duy nhất dùng xuyên các bước GĐ3 | CORE | T |
| G3-03-F002 | **Danh mục offering sản phẩm/dịch vụ mức giới thiệu** | Nhân viên kinh doanh; biên tập | Nhập tên, mô tả, loại dịch vụ, ảnh, vùng địa lý, đối tác, cách liên hệ và trạng thái; giá chỉ theo xác nhận đối tác. | Offering CRUD admin, filter, media picker | Offering catalog schema và public read API, audit | Offering có đối tác sở hữu, chỉ đã duyệt mới public | CORE | B |
| G3-03-F003 | **Thẩm định và phê duyệt đối tác/offering** | Quản trị kinh doanh | Phê duyệt hoặc từ chối hồ sơ/đề xuất cung cấp; checklist giấy phép/đầu mối/quyền khai thác theo VTV8 xác nhận. | Approval status và biên bản kiểm tra | Workflow approval, trạng thái suspensions và log | Đối tác chưa phê duyệt không được nhận lead hoặc cung cấp offering public | CORE | B |
| G3-03-F004 | **Quản lý thông tin liên hệ và điều khoản hợp tác** | Kinh doanh; pháp lý | Lưu liên hệ phụ trách, kênh hỗ trợ, tài liệu/thời hạn thỏa thuận, mô hình nhận lead/affiliate/booking. | Thông tin liên hệ, tài liệu mức cơ bản | Contract metadata/reference và effective dates, permissions | Biết được mô hình giao dịch áp dụng và hiệu lực thỏa thuận của đối tác | CORE | B |
| G3-03-F005 | **Quản lý danh mục ngành dịch vụ và địa phương** | Nhân sự nội dung; kinh doanh | Gắn đối tác/offering vào các taxonomy địa phương, sản phẩm OCOP, tour, khách sạn, dịch vụ; tái sử dụng G1-04. | Taxonomy picker/filter dùng chung | Relation mapping tới G1-04, không tạo hệ danh mục tỉnh riêng | Một địa danh/chủ đề thống nhất từ CMS sang offering | CORE | B |
| G3-03-F006 | **Quản lý chất lượng, tạm khóa và ngừng cung cấp** | Kinh doanh; hỗ trợ | Tạm ngừng nhận lead/booking/công khai khi sản phẩm hết hiệu lực hoặc có vấn đề; có lý do và ngày cập nhật. | Suspend/reactivate, cảnh báo nội dung liên kết | Shared eligibility guard, audit, partner status API | Tạm khóa đối tác làm liên kết lead/CTA và booking chặn theo chính sách | CORE | B |
| G3-03-F007 | **Kết nối dữ liệu đối tác từ API tự động** | Kỹ thuật tích hợp | Đồng bộ thông tin offering/giá/tình trạng sẵn có từ nguồn có API và hợp đồng phù hợp, tránh nhiều đầu nhập tay. | Màn trạng thái sync tối thiểu | Vendor adapter mapping, sync log/retry | Không ghi đè dữ liệu biên tập ngoài phạm vi mapping; lỗi có trạng thái | CONDITIONAL | B |

**Nhãn nguồn:** `T` = nhóm yêu cầu/ví dụ được đề xuất VTV8 nêu, nhưng thao tác cụ thể có thể suy luận; `B` = nghiệp vụ chi tiết bổ sung để có thể triển khai. `CORE/CONDITIONAL/OPTION` đều là quyết định phân kỳ **đề xuất**, chưa phải phạm vi khách hàng chốt.

[Trở về GĐ3](README.md).
