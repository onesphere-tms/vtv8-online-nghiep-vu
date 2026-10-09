# G3-H02 – Pháp lý, hợp đồng, kiểm thử và chuyển giao Content Commerce (DRAFT)

> **Ngoài giờ Coding và QA thường.** Cần tài liệu xác nhận VTV8/đối tác để nghiệm thu; không thay cho ý kiến chuyên môn pháp lý.

| WBS | Công việc | Đầu ra | Tránh tính trùng |
|---|---|---|---|
| G3-H02-W001 | Xác định mô hình vai trò VTV8 theo ba bước | Lead/referrer/agent/marketplace operator/merchant-of-record và ai chịu hậu mãi | Không tự coi VTV8 là seller |
| G3-H02-W002 | Điều khoản và dữ liệu cá nhân khi chuyển lead | Consent purpose, đối tác nhận, retention, privacy UAT | QA riêng về PII ngoài kiểm tra form tiêu chuẩn |
| G3-H02-W003 | Đối tác affiliate và chính sách commission | Hợp đồng, tracking window, nguồn conversion, quy trình đối soát | Không tính lại BE callback/ledger đã nằm feature |
| G3-H02-W004 | Đối tác booking, SLA và test giao dịch | Ma trận API, tình huống hết slot/đổi giá/hủy/booking orphan | Chỉ API được xác nhận; vendor testing chuyên sâu |
| G3-H02-W005 | Gate pháp lý/vận hành sàn TMĐT | Xác nhận yêu cầu pháp lý áp dụng, người bán, thuế/hóa đơn, hàng hóa bị hạn chế và nghĩa vụ hỗ trợ | Gate trước bước C, không tự giả định đã có giấy phép |
| G3-H02-W006 | UAT đơn hàng, payment, giao hàng, hoàn tiền | Kịch bản order end-to-end với đối tác, đối soát seller/commission | QA feature tiêu chuẩn theo công thức không cộng hai lần |
| G3-H02-W007 | Cutover và bàn giao theo bước A/B/C | Hướng dẫn vận hành, người trực hỗ trợ, kịch bản rollback, hỗ trợ đối tác | Bắt buộc lựa chọn bước triển khai thực tế, không triển khai tất cả đồng thời |
| G3-H02-W008 | Đối soát kết quả thương mại và nghiệm thu nghiệp vụ | Số lead/conversion/booking/order/hoa hồng được chấp thuận và bằng chứng | Tách công việc đối soát thực tế khỏi lập trình G3-09 |
