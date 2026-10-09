# G3-09 – Đối soát doanh thu, hoa hồng và báo cáo thương mại

> **Đề xuất nghiệp vụ GĐ3 (09/10/2026), chưa được VTV8 xác nhận hoặc tính giờ FE/BE.** Ba bước trong nguồn: Content + Lead; Affiliate/Booking; Sàn TMĐT khi đủ quy mô. `G3-10` là mở rộng dựa mô hình kinh doanh chung, **không phải bước bắt buộc GĐ3 được nguồn khẳng định**.

## Mục tiêu
Phân biệt lượt quan tâm, chuyển đổi hợp lệ, doanh thu và khoản hoa hồng được chấp thuận; chuẩn hóa đối soát với đối tác mà không tự lập hệ thống kế toán.

## Phạm vi và ranh giới
- **Nhóm phân kỳ:** B – Affiliate/Booking; C – Sàn TMĐT.
- **Chủ sở hữu:** Commerce Finance & Reconciliation.
- **Kế thừa:** G3-02 leads, G3-04 affiliate conversions, G3-05 booking statuses, G3-07 orders; không nhập lại transaction hoặc attribution vào một hệ thống khác..
- Đối với marketplace, toàn bộ phần core commerce được đặt `CONDITIONAL` cho đến khi có [điều kiện TMĐT và trách nhiệm giao dịch](G3-RELEASE-GATES.md). Không mặc định VTV8 có nghĩa vụ pháp lý của seller/merchant trước khi mô hình được quyết định.

## Danh sách tính năng (6)

| Mã | Tính năng | Actor | Nghiệp vụ và đầu ra | FE mới | BE mới | Nghiệm thu riêng | Phạm vi đề xuất | Nguồn |
|---|---|---|---|---|---|---|---|---|
| G3-09-F001 | **Quy tắc hoa hồng theo đối tác và loại giao dịch** | Kinh doanh; tài chính | Lưu mức tỷ lệ/giá trị và điều kiện đủ hoa hồng theo hợp đồng; lead có thể trả phí theo lead hoặc theo booking tùy thỏa thuận. | Commission terms form và ngày hiệu lực | Commission rule versioning, partner/model references | Một conversion có cơ sở tính rõ và không sửa hồi tố kỳ đã khóa | CONDITIONAL | T |
| G3-09-F002 | **Tiếp nhận dữ liệu đối soát đối tác** | Tài chính; đối tác | Nhận xác nhận booking/sale hợp lệ từ API hoặc file đối tác, so khớp referral/conversion/đơn; ghi ngoại lệ. | Import reconciliation file, mapping preview | Reconcile import/adapter, idempotent matching, exception list | Không coi đơn pending là doanh thu đã đối soát; import lại không tăng số liệu | CONDITIONAL | B |
| G3-09-F003 | **Tính và lưu kết quả hoa hồng theo kỳ** | Tài chính | Tính hoa hồng với các giao dịch đã đủ điều kiện, snapshot công thức/mốc hiệu lực và xử lý hủy/đảo tiền theo chính sách. | Statement preview/filter theo kỳ | Commission calculation engine, versioned snapshots, reversal | Một giao dịch hợp lệ không được tính hai lần; kỳ cũ không tự đổi vì sửa biểu phí | CONDITIONAL | B |
| G3-09-F004 | **Bảng kê và xác nhận đối soát với đối tác** | Tài chính; kinh doanh | Xuất bảng kê theo kỳ/đối tác và trạng thái xác nhận/tranh chấp; không tự động chi trả tiền nếu chưa có nghiệp vụ thanh toán seller. | Statement download và trạng thái xác nhận | Ledger-like statement metadata, export, audit | Tổng bảng kê bằng tổng chi tiết đã duyệt và có xử lý sai lệch | CONDITIONAL | B |
| G3-09-F005 | **Báo cáo thương mại theo nội dung/đối tác** | Quản lý | Báo cáo content → lead → conversion → hoa hồng/doanh thu xác nhận, theo địa phương và kỳ; không lấy pageview làm doanh thu. | Dashboard filter/export | Cross-domain aggregate G3-02/04/05/07, definitions và access controls | Phân biệt lead, booking, đơn, đã thanh toán, hoa hồng; số liệu truy vết được | CONDITIONAL | B |
| G3-09-F006 | **Điều chỉnh, truy thu và xử lý tranh chấp đối soát** | Tài chính; kinh doanh | Ghi nhận điều chỉnh đã có chứng cứ, lý do và người phê duyệt, tránh sửa thẳng giao dịch gốc. | Adjustment case and approval | Adjustment ledger, audit, period locking khi cần | Không mất lịch sử cũ, bảng kê thể hiện khoản điều chỉnh tách biệt | OPTION | B |

**Nhãn nguồn:** `T` = hướng/ví dụ hoặc nhóm mô hình kinh doanh có trong đề xuất VTV8, không bảo đảm từng thao tác được tài liệu mô tả nguyên văn; `B` = phân rã nghiệp vụ được đề xuất. `CORE` đề xuất triển khai ngay trong bước Content + Lead, `CONDITIONAL` phụ thuộc điều kiện đối tác/pháp lý/đầu tư, `OPTION` là mở rộng chưa bắt buộc.

[Trở lại GĐ3](README.md).
