# G3-H01 – Hạ tầng và tích hợp vận hành Content Commerce (DRAFT)

> **Công việc DevOps/tích hợp kỹ thuật xuyên module, tính riêng với FE/BE feature.** Chỉ tăng năng lực thực sự mới từ GĐ1–GĐ2.

| WBS | Công việc | Đầu ra | Phụ thuộc/ranh giới |
|---|---|---|---|
| G3-H01-W001 | Vận hành dữ liệu lead và bảo vệ PII | Retention/audit/backup/access của lead và log chuyển đối tác | Không tạo hạ tầng audience auth G2-01 lần nữa |
| G3-H01-W002 | Kết nối affiliate/callback đối tác | Secrets, endpoint bảo mật, verify signature, monitoring/retry mức hệ thống | G3-04 coding adapter thuộc BE feature; phí dịch vụ tính riêng |
| G3-H01-W003 | Kết nối booking API và quan sát giao dịch | Sandbox/prod, network/secret, timeouts, logs và cảnh báo theo nhà cung cấp | Chỉ khi G3-GATE-B02 được xác nhận; không mặc định API nào cũng có |
| G3-H01-W004 | Nền tảng commerce order/payment | Môi trường payment/queue/order monitoring, tài nguyên tăng thêm cho order/stock | Kế thừa config gateway G2-09 nếu phù hợp; không tự triển khai cổng thanh toán |
| G3-H01-W005 | Kết nối vận chuyển/hoàn tiền và dữ liệu merchant | Cấu hình carrier, đối tác hoàn/đảo tiền, bảo vệ PII và logs nếu cần | Chỉ nếu marketplace G3-GATE-C được bật |
| G3-H01-W006 | Bảo mật giao dịch và sao lưu phục hồi | Secrets, role segregation, incident response, backup và phục hồi state giao dịch | Phần security hạ tầng mới; không tính test nghiệp vụ lặp |
| G3-H01-W007 | Giám sát hiệu năng, tải và chi phí commerce | Latency/error per partner, queue depth, metrics conversion, cảnh báo | Không gộp với analytics dashboard nội dung G2-11 |
