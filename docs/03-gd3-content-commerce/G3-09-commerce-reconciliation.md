# G3-09 – Đối soát doanh thu, hoa hồng và báo cáo thương mại

> **GĐ3 – đã chuẩn hóa nội bộ 09/10/2026, chưa được VTV8 phê duyệt và chưa ước tính FE/BE.** Thương mại và B2B theo gate/hợp đồng thực tế, không mặc định mở toàn bộ.

## Mục tiêu
Phân biệt lượt quan tâm, chuyển đổi hợp lệ, doanh thu và khoản hoa hồng được chấp thuận; chuẩn hóa đối soát với đối tác mà không tự lập hệ thống kế toán.

## Phạm vi và ranh giới
- **Nhóm phân kỳ:** B – Affiliate/Booking; C – Sàn TMĐT.
- **Chủ sở hữu:** Commerce Finance & Reconciliation.
- **Kế thừa:** G3-02 leads, G3-04 affiliate conversions, G3-05 booking statuses, G3-07 orders; không nhập lại transaction hoặc attribution vào một hệ thống khác.
- Đối với marketplace, toàn bộ phần core commerce được đặt `CONDITIONAL` cho đến khi có [điều kiện TMĐT và trách nhiệm giao dịch](G3-RELEASE-GATES.md). Không mặc định VTV8 có nghĩa vụ pháp lý của seller/merchant trước khi mô hình được quyết định.

## Tính năng độc lập (6)

| Mã | Tính năng | Actor | Nghiệp vụ sau QA | FE mới | BE mới | Nghiệm thu sơ bộ | Phạm vi | Nguồn | Ranh giới/điều kiện QA |
|---|---|---|---|---|---|---|---|---|---|
| G3-09-F001 | **Quy tắc hoa hồng theo đối tác và loại giao dịch** | Kinh doanh; tài chính | Hoa hồng theo đối tác/giao dịch khi đạt điều kiện hợp đồng (qualified lead/booking completed/sale settled), thời hạn đảo và kỳ áp dụng; có lịch sử mức phí. | Commission terms form và ngày hiệu lực | Commission rule versioning, partner/model references | Một conversion có cơ sở tính rõ và không sửa hồi tố kỳ đã khóa | CONDITIONAL | T | Quy tắc hoa hồng cần nguồn hợp đồng, thời điểm đủ điều kiện và thời hạn đối soát. |
| G3-09-F002 | **Tiếp nhận dữ liệu đối soát đối tác** | Tài chính; đối tác | Đối soát tài chính dựa conversion G3-04, booking G3-05 và commerce order G3-07; nhập file đối tác khi được cung cấp, không viết receiver conversion thô lần hai. | Import reconciliation file, mapping preview | Reconcile import/adapter, idempotent matching, exception list | Không coi đơn pending là doanh thu đã đối soát; import lại không tăng số liệu | CONDITIONAL | B | Dữ liệu đối soát tài chính khác tín hiệu chuyển đổi ban đầu ở G3-04. |
| G3-09-F003 | **Tính và lưu kết quả hoa hồng theo kỳ** | Tài chính | Tính theo kỳ từ sự kiện đủ điều kiện, chốt ảnh chụp công thức/biểu phí và xử lý hoàn/hủy/đảo giao dịch đúng chính sách. | Statement preview/filter theo kỳ | Commission calculation engine, versioned snapshots, reversal | Một giao dịch hợp lệ không được tính hai lần; kỳ cũ không tự đổi vì sửa biểu phí | CONDITIONAL | B | Tính theo kỳ phải lưu công thức có hiệu lực và xử lý giao dịch bị đảo. |
| G3-09-F004 | **Bảng kê và xác nhận đối soát với đối tác** | Tài chính; kinh doanh | Bảng kê kỳ/đối tác, xác nhận và tranh chấp; không mặc định hệ thanh toán hoa hồng hoặc chuyển tiền seller. | Statement download và trạng thái xác nhận | Ledger-like statement metadata, export, audit | Tổng bảng kê bằng tổng chi tiết đã duyệt và có xử lý sai lệch | CONDITIONAL | B | Bảng kê có xác nhận, trạng thái tranh chấp và không mặc định chi trả tự động. |
| G3-09-F005 | **Báo cáo thương mại theo nội dung/đối tác** | Quản lý | Báo cáo tài chính thương mại chỉ từ giao dịch/hoa hồng đã xác minh; số lead và click lấy từ G3-02/G3-04, không xây event collector mới. | Dashboard filter/export | Cross-domain aggregate G3-02/04/05/07, definitions và access controls | Phân biệt lead, booking, đơn, đã thanh toán, hoa hồng; số liệu truy vết được | CONDITIONAL | B | Báo cáo doanh thu chỉ dùng dữ liệu đã xác minh; lead/click lấy từ G3-02/G3-04. |
| G3-09-F006 | **Điều chỉnh, truy thu và xử lý tranh chấp đối soát** | Tài chính; kinh doanh | Ghi nhận điều chỉnh đã có chứng cứ, lý do và người phê duyệt, tránh sửa thẳng giao dịch gốc. | Adjustment case and approval | Adjustment ledger, audit, period locking khi cần | Không mất lịch sử cũ, bảng kê thể hiện khoản điều chỉnh tách biệt | OPTION | B | Điều chỉnh/truy thu nhiều cấp chỉ sau khi chốt chính sách tài chính. |

**Nhãn nguồn:** `T` = nhóm/ví dụ có trong nguồn VTV8, không đồng nghĩa chi tiết được chốt; `B` = suy luận nghiệp vụ. Nhãn CORE/CONDITIONAL/OPTION là phân kỳ nội bộ; xem [64 tính năng](G3-DANH-MUC-TINH-NANG.md), [70→64](G3-MAPPING-70-64.md) và [release gates](G3-RELEASE-GATES.md).

[Trở lại GĐ3](README.md).
