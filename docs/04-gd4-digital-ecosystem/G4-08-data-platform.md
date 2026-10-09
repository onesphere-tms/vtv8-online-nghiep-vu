# G4-08 – Data Platform và quản trị dữ liệu hệ sinh thái

> **GĐ4 Digital Ecosystem – DRAFT phân tích nghiệp vụ ngày 09/10/2026.** Nguồn chỉ định hướng dài hạn, chưa có yêu cầu cấp phép triển khai hoặc ngân sách được phê duyệt. CORE là phần cơ sở của **nhóm được chọn**, không có nghĩa toàn GĐ4 cùng mở.

## Mục tiêu
Xây lớp dữ liệu phân tích xuyên Content, Audience và Transaction khi đã có mục đích sử dụng và khối lượng dữ liệu phù hợp. Không mặc định dựng kho lớn (ClickHouse/data lake) trước khi có workload thật.

## Phân kỳ và kế thừa
- **Nhóm phát hành:** D – Data Intelligence.
- **Không tính trùng:** G1-09 thống kê nội dung, G2-11 event/analytics, G2-01 consent, G3-02/04/05/07/09 lead/referral/booking/order/commission. Các hệ source giữ ownership; Data Platform là lớp tổng hợp/khai thác được phép.
- Các nội dung CONDITIONAL/OPTION cần xác nhận tại [G4-RELEASE-GATES.md](G4-RELEASE-GATES.md) trước khi cam kết nghiệm thu.

## Danh mục tính năng (9)

| Mã | Tính năng | Actor | Nghiệp vụ/đầu ra | FE mới | BE/Integration mới | Nghiệm thu sơ bộ | Phạm vi | Căn cứ | Gate/giả định |
|---|---|---|---|---|---|---|---|---|---|
| G4-08-F001 | **Danh mục nguồn và định nghĩa chỉ số kinh doanh** | Phân tích; quản trị dữ liệu | Định nghĩa Content/Audience/Transaction assets, chủ sở hữu dataset, chuẩn event và KPI, phân biệt view/click/lead/booking/order/doanh thu. | KPI and data catalog UI mức cơ sở | Data contracts/schema registry mức gọn, source ownership metadata | Mỗi chỉ số có nguồn, công thức và thời điểm cập nhật; không gọi lead là doanh thu. | CORE | T4 | DATA_GOV |
| G4-08-F002 | **Pipeline thu thập dữ liệu tăng thêm xuyên giai đoạn** | Kỹ thuật dữ liệu | Lấy dữ liệu được phép từ G1/G2/G3 theo event/CDC/batch phù hợp, chịu được event trùng, trễ và thay schema. | Data ingest status/health tối thiểu | Connectors, validation/dedupe, backfill, error queue, lineage links | Đếm nguồn/đích đối chiếu được, chạy lại không nhân dữ liệu giao dịch. | CORE | P | DATA_SOURCES |
| G4-08-F003 | **Kiểm soát chất lượng, đối chiếu và lịch sử dữ liệu** | Phân tích; kỹ thuật | Theo dõi độ đầy đủ, freshness, reconcile và source lineage, cảnh báo sai lệch dữ liệu vận hành. | Data quality rules/results, anomaly log mức gọn | DQ assertions, aggregates, lineage and audit | Nguồn thiếu hoặc dữ liệu đếm trùng được phát hiện trước dashboard công bố. | CORE | P | DATA_QUALITY |
| G4-08-F004 | **Lớp lưu trữ phân tích theo quy mô thực tế** | Kỹ thuật dữ liệu | Chọn kho phân tích/warehouse khi khối lượng truy vấn đã chứng minh; chưa mặc định ClickHouse hoặc lakehouse nếu Postgres/analytics G2 đủ. | Không cần UI ngoài console kỹ thuật khi chọn | Warehouse schema/partitioning, ingestion and queries, cost controls | Có phép so sánh tải/giá và phương án lưu giữ dữ liệu trước khi bật hạ tầng riêng. | CONDITIONAL | T4 | WAREHOUSE_SCALE |
| G4-08-F005 | **Liên kết dữ liệu nội dung, người xem và giao dịch** | Phân tích; quyền riêng tư | Mô hình kết nối entity/media/interaction/commercial events được phép, có pseudonymization và chính sách mục đích dữ liệu. | Không xây giao diện hồ sơ cá nhân công khai mới | Privacy-safe join keys and permissions, consent filtering across datasets | Không dùng ID cá nhân vượt phạm vi consent; delete/retention áp dụng xuyên các bản phân tích. | CONDITIONAL | P | IDENTITY_PRIVACY |
| G4-08-F006 | **Dashboard liên thông Content-to-Commerce** | Quản trị VTV8 | Phễu bài/video→nhu cầu→lead→conversion→booking/order→tiền đã xác nhận, không thay báo cáo nghiệp vụ G3 tại nguồn. | Cross-domain dashboards, filter by content/partner/time | Aggregates across G1/2/3 với consistent attribution and freshness | Các giá trị khớp số liệu chủ hệ và phân biệt trạng thái chưa xác nhận. | CONDITIONAL | P | G3_FINANCE |
| G4-08-F007 | **Phân khúc khách hàng phục vụ nội dung/membership** | Phân tích; kinh doanh | Đề xuất segment từ hành vi được phép, gói thành viên và mối quan tâm; không tự mở targeting quảng cáo cá nhân nếu chưa được duyệt. | Segment definition/list and preview | Rules/segment computation with consent and membership eligibility | Tắt tracking hoặc xóa dữ liệu làm segment cập nhật phù hợp chính sách. | CONDITIONAL | T4 | SEGMENT_PRIVACY |
| G4-08-F008 | **Xuất dữ liệu và chia sẻ chỉ số cho đối tác được cấp quyền** | Quản trị dữ liệu; đối tác | Xuất dữ liệu tổng hợp/báo cáo giới hạn theo vai trò/hợp đồng, không tự xuất PII người xem hay thông tin đối tác khác. | Export request/approval, reporting API status | Scoped aggregates, policy audit, signed export and expiry | Chỉ chia các trường/kỳ/đối tác được phép, có log và thời hạn truy cập. | CONDITIONAL | P | DATA_SHARING |
| G4-08-F009 | **Tự động hóa phân tích dự báo theo dữ liệu** | Kinh doanh; phân tích | Dự báo nhu cầu nội dung/lead hoặc churn khi đủ dữ liệu, có kiểm thử độ lệch và kiểm soát quyết định con người; không mặc định dùng ML. | Forecast panel and validation reporting | Forecast/model pipeline only when justified, baseline comparison | Có đối chiếu dự báo với thực tế và có thể tắt nếu mô hình không đáng tin. | OPTION | P | MODEL_BENCH |

**Nhãn căn cứ:** `T4` = App/AI/Membership/Partner/Data hoặc archive dài hạn trong lộ trình GĐ4; `TBIZ` = mô hình kinh doanh Content Licensing/Archive Licensing trang 12–13; `P` = phân rã bổ sung. Ngay cả khi chủ đề có nguồn, các thao tác chi tiết và chính sách vẫn cần VTV8 xác nhận.

[Danh mục GĐ4](G4-DANH-MUC-TINH-NANG.md) · [Phân kỳ và gate](G4-RELEASE-GATES.md).
