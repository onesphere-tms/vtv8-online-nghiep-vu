# GĐ2 – Thành phần kế thừa từ GĐ1 và ranh giới không đếm trùng (DRAFT)

| Năng lực | Chủ sở hữu hiện có | Chủ sở hữu phần nâng cấp GĐ2 | Không được tính lại |
|---|---|---|---|
| Website/layout/chuyên mục | G1-01 | G2-01/02/03/04/05 – chỉ trang và widget mới | Header/footer, responsive shell đã có |
| CMS auth/RBAC nội bộ | G1-02 | G2-01 – Audience Account độc lập, liên kết hạ tầng khi hợp lý | Tài khoản quản trị CMS và RBAC đã có |
| CMS bài/chương trình/series/metadata | G1-03/04 | G2-04 index, G2-05 rules, G2-07 thông báo, G2-10 content entitlement | CRUD bài/chương trình và content approval đã có |
| DAM và rights media | G1-05 | G2-10 quyền mua/xem gói và DRM integration | Quyền sở hữu gốc/metadata đã có |
| Player VOD/live và xử lý lỗi | G1-06/07 | G2-06 nâng cấp track/quality/resume, G2-10 entitlement | Không viết lại video player hoặc lịch livestream |
| Playback/recording/CDN/provider adapter | G1-08 | G2-06 nâng cấp thông số, G2-10 private playback token/DRM, G2-11 QoE | Ingest, transcoding, CDN nguyên trạng không tính lại |
| Thống kê bài/lượt xem public | G1-09 | G2-11 session/viewing events và hành vi người xem | Không đếm lại pageview collector GĐ1 nếu dùng được |
| Follow và favorite | Chưa có GĐ1 | G2-02 | G2-03 chỉ playlist/lịch sử, không sở hữu favorites |
| Watch progress/history | Chưa có GĐ1 | G2-03 | G2-06 chỉ lấy resume state để cập nhật player |
| Search và recommendations | G1-01-F007 chỉ là OPTION keyword | G2-04 search nâng cao; G2-05 gợi ý theo rule | Nếu đã có search GĐ1, chỉ làm phần nâng cấp; không trộn tìm kiếm với gợi ý |
| Subscription/entitlements | Chưa có GĐ1 | G2-09 gói + vòng đời/giao dịch; G2-10 entitlement + paywall/DRM | Không để hai module cùng cấp quyền xem và ghi đơn thanh toán |
| Audience analytics | Chưa có GĐ1 ngoài aggregate views | G2-11 event schema/analytics chung | G2-05 và G2-07 chỉ phát event, không xây analytics service riêng |

**Giới hạn giai đoạn:** GĐ2 không phát triển native app, AI semantic search/auto subtitle/auto clip, TMĐT/booking và partner portal (phần sau lộ trình). Nếu VTV8 chuyển một phần sang GĐ2 phải có thay đổi phạm vi được xác nhận.


## Ranh giới sau chuẩn hóa 66 tính năng

- **Xác thực và bảo mật phiên:** G2-01-F006 gộp vào G2-01-F002, DevOps tại H01-W001/W007. Không tự xây thêm một hệ phiên riêng.
- **Recommendation:** cold-start G2-05-F004 đã nằm trong G2-05-F003 và các khối nội dung nổi bật của GĐ1. Tracking hiệu quả G2-05-F006 nằm ở G2-11-F001/F008; funnel G2-11-F004 là OPTION.
- **Media:** giới hạn thời hạn G2-06-F005 được xử lý bằng DAM rights G1-05 cùng entitlement G2-10-F002 khi thương mại bật; live→VOD G2-06-F006 do GĐ1 phụ trách. Player GĐ2 chỉ phát triển resume, lựa chất lượng, subtitle và auto-next khi phù hợp.
- **Commercial:** G2-09 sở hữu gói/giao dịch/vòng đời thuê bao; G2-10 sở hữu entitlement/paywall/playback. Quyền gốc và ngày hết hạn G2-10-F007 được dùng lại từ G1-05 và kiểm tra tại G2-10-F002/F004. Xem [COMMERCIAL_RELEASE_GATE](G2-COMMERCIAL-RELEASE-GATE.md).
- **Privacy:** consent/data requests chỉ một đầu mối G2-01-F005, history do G2-03 và analytics deletion do G2-11-F006; không tạo ba form hoặc ba cơ chế xóa độc lập.
- **Notification:** inbox/read state thuộc G2-07-F003; delivery console G2-07-F007 là CONDITIONAL và chỉ cần nếu kích hoạt kênh bên ngoài.
- **Tìm kiếm:** autocomplete G2-04-F003 là OPTION; G2-04-F001/F005 sở hữu index/reindex, không bắt buộc cụm OpenSearch hay dashboard kỹ thuật riêng.
- **Bình luận:** toàn bộ G2-08 còn CONDITIONAL theo gate pháp lý G2-H02-W001.

[Danh mục 66](G2-DANH-MUC-TINH-NANG.md) · [Mapping 72→66](G2-MAPPING-72-66.md) · [E2E](G2-TIEU-CHI-NGHIEM-THU.md).
