# GĐ4 – Chủ sở hữu dữ liệu, thành phần dùng chung và ranh giới FE/BE

> **DRAFT 09/10/2026.** Một dữ liệu/nghiệp vụ nên có một nơi sở hữu chính; GĐ4 chỉ là lớp kênh mới, AI, phân tích và khai thác nâng cao, không phải quyết định phải chuyển hệ thống sang microservices.

| Domain | Nguồn chuẩn | Thành phần GĐ4 dùng | Không xây hoặc tính trùng |
|---|---|---|---|
| Nội dung CMS, bài, series, chương trình, địa danh | G1-03/04 | G4-01/02/03/04/05/09 | CMS biên tập, taxonomy, chương trình, hồ sơ địa danh |
| Media, bản quyền/DRM cơ sở, VOD/live, streaming | G1-05/06/07/08; G2-10 khi triển khai | Mobile/TV, AI enrichment, archive | Streaming/transcoder/CDN, tệp gốc riêng, quyền phát media thứ hai |
| Tài khoản người xem, session, consent | G2-01 | G4-01/02/05/06/08 | Audience account/identity DB mới, privacy request portal lặp |
| Favorites, follow, watch history/playlist | G2-02/03 | G4-01/05 | Watch progress store/hệ thống sở thích riêng |
| Tìm kiếm từ khóa và rule-based recommendation | G2-04/05 | G4-04/05 | Hệ keyword search và cold-start thứ hai |
| Thông báo và sự kiện người xem | G2-07/11 | Mobile push, membership, partner và data analytics | Inbox, notification preferences, event ingestion trùng nếu đủ năng lực |
| Thuê bao, payment, entitlement/DRM | G2-09/10 | G4-01/02/06 | Subscription order, payment state, entitlement service hoặc license server thứ hai |
| Partner master, offering, lead và partner privacy | G3-03/02 | G4-07/09 (B2B entity) | Hồ sơ doanh nghiệp, catalog giới thiệu, lead state machine mới |
| Affiliate/booking/order/commission | G3-04/05/07/08/09 nếu phát triển | G4-07/08 | Partner platform chỉ làm UI/API theo quyền, không lập đơn/booking/ledger khác |
| Transcript/timed subtitles/AI suggestion bản nháp | G4-03, khi duyệt cập nhật DAM/CMS G1 | G4-04 search, G4-05 highlights/shorts, G4-09 archive | STT/translation/transcript index và job versioning riêng cho mỗi module |
| Embedding và semantic retrieval | G4-04 | Mobile/web/TV search nếu được mở | Nhiều chỉ mục vector không nhất quán; quyền snippet phải theo DAM |
| AI recommendation/short derivatives | G4-05, asset derivatives thuộc DAM G1-05 | Web/Mobile/TV, Archive | Không tạo hệ xuất bản hoặc data lake thứ hai |
| Membership tier/benefit projection | G4-06; nguồn giao dịch G2-09/10 | G4-01/02 và các điểm hiển thị | Không chốt quyền premium ở FE, không tạo payment ledger mới |
| Data contracts và aggregate liên hệ | G4-08 dựa source G1/G2/G3 | Kinh doanh, recommendation, partner, B2B | Không thay data source nghiệp vụ; không thêm hồ sơ người xem trái consent |
| License grant cấp cho bên thứ ba | G4-09, rights evidence từ G1-05 | B2B archive, export, finance | Quyền phát nội bộ khác quyền cấp license; không dùng subscription entitlement G2 thay cho hợp đồng B2B |

## Cần phân biệt

- **Transcript có nguồn, phiên bản và duyệt** khác văn bản AI gợi ý chưa kiểm tra. Search công khai chỉ dựa phiên bản và quyền được cho phép.
- **Audience membership** khác sản phẩm **media subscription GĐ2** về tiếp thị/benefit nhưng không được tạo hệ thống thu tiền/thanh toán lặp.
- **Partner admin GĐ3** là giao diện VTV8; **Partner Platform GĐ4** là đối tác tự đăng nhập và chỉ thao tác trên dữ liệu thuộc quyền.
- **Data Platform** là lớp phân tích/khai thác dữ liệu có mục đích; **Archive & Licensing** là nghiệp vụ khai thác bản quyền nội dung, tách vai trò và nguồn tiền.
- **Smart TV** là kênh được kiến trúc mô tả cho tương lai, chưa được xác nhận triển khai cùng Mobile.
- Nếu một thành phần GĐ2/GĐ3 còn `CONDITIONAL` hoặc `OPTION` chưa được làm, **không được giả định có sẵn** và loại giờ tích hợp khỏi GĐ4.

[Xem điều kiện phát hành](G4-RELEASE-GATES.md) · [Danh mục tính năng](G4-DANH-MUC-TINH-NANG.md).
