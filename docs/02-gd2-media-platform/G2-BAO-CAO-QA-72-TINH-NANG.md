# GĐ2 – Báo cáo rà soát chất lượng và phạm vi 72 tính năng (09/10/2026)

> **BẢN QA LỊCH SỬ TRÊN 72 MÃ TRƯỚC CHỈNH.** Các kiến nghị trong báo cáo này **đã được áp dụng** trong [danh mục 66 tính năng hiện hành](G2-DANH-MUC-TINH-NANG.md): **33 CORE, 9 OPTION, 24 CONDITIONAL và 6 mã gộp**. [Bảng mapping đầy đủ 72→66](G2-MAPPING-72-66.md) giải thích từng thay đổi. Những dòng dưới đây nói “chưa áp dụng”, “nếu duyệt” phản ánh thời điểm rà soát ban đầu, **không còn là tình trạng hiện tại**. VTV8 chưa phê duyệt chính thức.

> **Trạng thái: ĐÃ RÀ SOÁT, KIẾN NGHỊ; CHƯA ÁP DỤNG VÀO DANH MỤC GỐC.** Kiểm đủ 72/72 mã theo [danh mục GĐ2](G2-DANH-MUC-TINH-NANG.md) và 11 tài liệu module. Nội dung phân loại mới là phương án đề xuất, **chưa được VTV8 hoặc người dùng phê duyệt**; không tính FE/BE ở bước này.
>
> **Căn cứ:** [Bản trích xuất đề xuất VTV8–IIEL](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md), lộ trình GĐ2 trang 3, mục GĐ2 trang 6–7, kiến trúc/nguồn lực trang 8–11; [phạm vi 82 tính năng GĐ1 đã rà soát](../01-gd1-vtv8online-v1/G1-DANH-MUC-TINH-NANG.md) và [quy tắc không tính trùng GĐ1](../01-gd1-vtv8online-v1/G1-THANH-PHAN-DUNG-CHUNG.md).
>
> **Không suy diễn nguồn:** tài liệu VTV8 nêu nhóm Account/SSO, theo dõi, lịch sử xem, yêu thích, playlist, gợi ý, thông báo, tương tác có giấy phép, VOD/live, subscription/paywall/DRM và analytics; không cung cấp chi tiết công thức cấp quyền, provider thanh toán, giá gói, nguồn consent hoặc chức năng hoàn tiền. Những điểm đó là **yêu cầu cần xác nhận/đề xuất vận hành**, không phải cam kết nguồn.

## 1. Tiêu chí kiểm tra

1. **Phù hợp nguồn:** yêu cầu gốc thuộc GĐ2 hay nghiệp vụ suy luận cần tách nhãn `SOURCE`/`PROPOSED`/`TBC`.
2. **Không phát triển trùng GĐ1:** chỉ phần tăng thêm của CMS/Website/Video/DAM/Streaming/Analytics.
3. **Không trùng GĐ2:** follow, progress, analytics, preview, player, notification, subscription và entitlement có một nơi sở hữu.
4. **Trọn luồng nghiệm thu:** tính năng phụ thuộc vendor/giấy phép/chủ thể giao dịch phải có release gate đủ cả frontend, backend, quyền, thanh toán và trạng thái lỗi.
5. **Kiểm soát độ rộng:** không mặc định hệ dữ liệu lớn, ML/AI, full DRM, mobile push hoặc billing suite nếu chưa có căn cứ.

## 2. Kết quả kiểm tra và phân loại

| Kết luận trên 72 mã gốc | Số lượng | Hành động |
|---|---:|---|
| Giữ phạm vi hiện hành | **8** | Không cần thay đổi chính |
| Giữ loại CONDITIONAL hiện hành | **17** | Giữ điều kiện pháp lý/vendor, chốt đầu vào |
| Giữ OPTION hiện hành | **7** | Chưa đưa vào scope cơ sở |
| Chỉnh mô tả, chủ sở hữu hoặc điều kiện nghiệm thu | **25** | Cần sửa đặc tả |
| Đề xuất gộp để không có một feature độc lập | **6** | Giữ nghiệp vụ, đưa vào feature/nhóm chủ sở hữu |
| Đề xuất CORE thành OPTION | **2** | Chưa bắt buộc ở gói cơ sở |
| Đề xuất CORE thành CONDITIONAL | **7** | Gắn điều kiện kênh hoặc toàn bộ luồng thương mại |
| **Tổng đã kiểm** | **72** | |

**Nếu duyệt kiến nghị:** còn **66 tính năng độc lập**, phân loại dự kiến **33 CORE + 9 OPTION + 24 CONDITIONAL**. Đây là phép chuẩn hóa **danh mục**, không có nghĩa GĐ2 đã giảm khối lượng hoặc có thể nghiệm thu GĐ2 trọn vẹn chỉ với 33 CORE. **Gói thương mại trả phí vẫn là một yêu cầu của GĐ2 từ nguồn**, nhưng cần thống nhất release gate và phương án thực hiện.

| Module | Ban đầu | Đề xuất còn | CORE | OPTION | CONDITIONAL | Gộp |
|---|---:|---:|---:|---:|---:|---:|
| [G2-01 – Tài khoản và định danh người xem](G2-QA-G2-01.md) | 7 | 6 | 5 | 0 | 1 | 1 |
| [G2-02 – Theo dõi chương trình và yêu thích](G2-QA-G2-02.md) | 5 | 5 | 4 | 1 | 0 | 0 |
| [G2-03 – Lịch sử xem và playlist](G2-QA-G2-03.md) | 6 | 6 | 6 | 0 | 0 | 0 |
| [G2-04 – Tìm kiếm và khám phá](G2-QA-G2-04.md) | 6 | 6 | 4 | 2 | 0 | 0 |
| [G2-05 – Gợi ý và cá nhân hóa](G2-QA-G2-05.md) | 6 | 4 | 3 | 1 | 0 | 2 |
| [G2-06 – Nâng cấp VOD và Livestream](G2-QA-G2-06.md) | 6 | 4 | 2 | 0 | 2 | 2 |
| [G2-07 – Thông báo, bản tin cập nhật](G2-QA-G2-07.md) | 7 | 7 | 4 | 1 | 2 | 0 |
| [G2-08 – Bình luận và tương tác](G2-QA-G2-08.md) | 6 | 6 | 0 | 0 | 6 | 0 |
| [G2-09 – Thuê bao và thanh toán](G2-QA-G2-09.md) | 8 | 8 | 0 | 1 | 7 | 0 |
| [G2-10 – Paywall, quyền xem và DRM](G2-QA-G2-10.md) | 7 | 6 | 0 | 1 | 5 | 1 |
| [G2-11 – Phân tích hành vi và QoE](G2-QA-G2-11.md) | 8 | 8 | 5 | 2 | 1 | 0 |
| **Tổng** | **72** | **66** | **33** | **9** | **24** | **6** |

**11 file QA theo từng mã:** [G2-01](G2-QA-G2-01.md) · [G2-02](G2-QA-G2-02.md) · [G2-03](G2-QA-G2-03.md) · [G2-04](G2-QA-G2-04.md) · [G2-05](G2-QA-G2-05.md) · [G2-06](G2-QA-G2-06.md) · [G2-07](G2-QA-G2-07.md) · [G2-08](G2-QA-G2-08.md) · [G2-09](G2-QA-G2-09.md) · [G2-10](G2-QA-G2-10.md) · [G2-11](G2-QA-G2-11.md).

## 3. Sáu mã đề xuất gộp, không lập trình trùng

| Mã đang có | Phần đã có hoặc nơi nhận | Cách xử lý |
|---|---|---|
| **G2-01-F006** – bảo mật/quản lý phiên | G2-01-F002 + G2-H01 security | Tích hợp session/revocation/rate limit vào IAM; danh sách quản lý thiết bị chỉ thêm nếu được duyệt |
| **G2-05-F004** – gợi ý cho người mới | G1-03-F009 + G2-05-F003 | Cold-start/fallback sử dụng nội dung nổi bật hoặc quy tắc recommendation, không xây service/feed độc lập |
| **G2-05-F006** – đo hiệu quả gợi ý | G2-11-F001/F004 hoặc tập event chung | Gắn nguồn event cho khối đề xuất; báo cáo riêng chỉ phát triển khi có yêu cầu |
| **G2-06-F005** – giới hạn ngày xem | G1-05-F004 + G2-10-F002 | Quyền/tính khả dụng phải có một nguồn chính; giao diện ngày hết hạn là phần hiển thị thêm |
| **G2-06-F006** – chuyển Live sang VOD | G1-07-F007 + G1-06-F006 | Luồng recording/replay đã có ở GĐ1; chỉ làm CTA/trạng thái mới nếu UX yêu cầu |
| **G2-10-F007** – thời hạn khai thác theo giấy phép | G1-05-F004 + G2-10-F002/F004 | Không tạo cơ chế quyền khai thác thứ hai; tích hợp rights gate trong entitlement/URL token khi gói trả phí được bật |

**Lưu ý:** Nếu nhu cầu mới thực sự khác GĐ1, phải giữ công sức incremental và ghi rõ; gộp không đồng nghĩa miễn phí phát triển UI/API tích hợp.

## 4. Hai CORE đề xuất chuyển OPTION

| Mã | Lý do |
|---|---|
| **G2-04-F003 – autocomplete** | Tìm kiếm đa loại + lọc đã tạo được một luồng tìm kiếm dùng được. Autocomplete có trong kiến trúc định hướng nhưng không phải điều kiện duy nhất để nghiệm thu tìm kiếm. |
| **G2-11-F004 – funnel hành trình người dùng** | Theo dõi hành trình nhiều bước và checkout funnel là analytics nâng cao; phần checkout G2-09 còn phụ thuộc vendor. Vẫn giữ event cơ bản và dashboard G2-11-F001–003. |

## 5. Bảy CORE đề xuất chuyển CONDITIONAL

| Mã | Lý do |
|---|---|
| **G2-07-F007** | Báo cáo gửi/retry nâng cao chỉ cần khi có kênh push/email; inbox trên website vẫn có state cơ bản từ G2-07-F003 |
| **G2-09-F001, F005** | Danh mục gói và vòng đời thuê bao phải đi cùng phương án thanh toán/kích hoạt quyền thật |
| **G2-10-F001, F002, F003, F004** | Paywall, entitlement, token bảo vệ playback phải kết hợp với tài khoản, thuê bao và vendor; không chốt riêng lẻ khi luồng trả phí chưa đủ đầu-cuối |

**Đề xuất tổ chức:** gắn `COMMERCIAL_RELEASE_GATE` cho G2-09 + G2-10. Gate chỉ đạt khi đã xác nhận mô hình bán, quyền khai thác nội dung, đơn vị nhận tiền, payment gateway, webhook đối soát, các trạng thái subscription, entitlement, cơ chế cấp URL/license và UAT mua–xem–hết hạn/hủy. Nếu gói thương mại là đầu ra bắt buộc của GĐ2, **phải coi cả lát cắt này là cam kết triển khai có điều kiện, không được lược khỏi roadmap hoặc báo giá mà không thương lượng lại yêu cầu**.

## 6. Các phần nghiệp vụ còn thiếu hoặc chưa đủ để chốt

| Mức | Phần cần bổ sung/làm rõ | Nguồn hay suy luận | Vị trí |
|---|---|---|---|
| **P0** | Xác minh tài khoản: kênh đăng ký, khôi phục, định danh, liên kết SSO; tách tài khoản CMS và audience | Nguồn có account/SSO, chi tiết là suy luận | G2-01 |
| **P0** | Consent, phạm vi dữ liệu cá nhân, chính sách lưu giữ/xóa, analytics anonymous vs logged-in; không thu sự kiện cá nhân trái quyền | Phân tích bổ sung; cần xác minh theo pháp lý/chính sách VTV8 | G2-01, G2-03, G2-11 |
| **P0** | Luồng thương mại **mua gói → payment state → subscription → entitlement → playback** có giao dịch thật và xử lý lỗi | Thuê bao/nội dung trả phí/DRM là nguồn; nghiệp vụ chi tiết chưa có | G2-09/G2-10 |
| **P0** | Xử lý hoàn tiền, tranh chấp/chargeback, webhook trễ/lặp, thu hồi quyền, trạng thái giao dịch sai lệch | **Bổ sung suy luận**, chưa có trong tài liệu VTV8; cần policy + nhà cung cấp | Mở rộng G2-09-F004/F006 hoặc feature mới nếu cần |
| **P0** | DRM/video cấp quyền: nguồn playback private, license provider, nền tảng hỗ trợ, chính sách thiết bị/khu vực/thời gian, DRM vs signed URL | Nguồn nêu quyền xem/DRM, không có vendor | G2-10, G1-08, G2-H02 |
| **P0** | Giấy phép/điều kiện tương tác và nhân sự kiểm duyệt; không mở bình luận trước phê duyệt | Nguồn nêu rõ là có điều kiện | G2-08, G2-H02-W001 |
| **P1** | 'Bản tin cập nhật' là thông báo trong tài khoản, digest biên tập trên web hay email newsletter? Push là web hay app? | Nguồn chỉ nêu danh mục tên, thiếu mô hình kênh | G2-07 |
| **P1** | Quyền xem khi nội dung bị gỡ/hết hạn áp dụng cho favorite, playlist, search, recommendation, auto-next như thế nào | Suy luận cần thiết để bảo vệ nội dung | G2-02/03/04/05/06/10 |
| **P1** | Thiết kế search index khi metadata hồ sơ nhân vật/địa danh không có trang public, cập nhật delete/unpublish | Suy luận phụ thuộc GĐ1 | G2-04 |
| **P1** | Ranh giới session analytics với dữ liệu watch-progress và định nghĩa view GĐ1, đối soát chỉ số | Suy luận cần thiết, nguồn chỉ có 'phân tích tương tác' | G2-03/11 |
| **P1** | KPI cá nhân hóa: mức độ rule-based, cold-start, lựa chọn từ chối cá nhân hóa và dự phòng khi không đủ sự kiện | Nguồn chỉ nêu gợi ý, không bắt buộc ML | G2-05 |
| **P2** | Phạm vi tự phát tập, playlist, giao diện profile/theme và phụ đề/chất lượng theo thiết bị | Đề xuất UX, không đủ nguồn để coi tất cả là CORE | G2-03/06 |

**P0** = điều kiện đầu vào phải xác nhận hoặc ghi giả định/rủi ro rõ trước khi chốt chi phí và nghiệm thu; không có nghĩa tất cả đều là 'tính năng mới' phải thêm.

## 7. Luồng E2E nên dùng làm tiêu chí nghiệm thu

| Mã | Luồng thực tế | Các module liên quan |
|---|---|---|
| G2-E2E-01 | Đăng ký và xác minh người xem → đăng nhập → hồ sơ cá nhân → đăng xuất/reset | G2-01 |
| G2-E2E-02 | Theo dõi chương trình, yêu thích → mở My Library → nhận cập nhật | G2-01/02/07 |
| G2-E2E-03 | Xem VOD → lưu tiến độ → đăng nhập trên thiết bị khác → xem tiếp đúng vị trí | G2-01/03/06, G1-06 |
| G2-E2E-04 | Tìm video/bài/chương trình, lọc kết quả → gỡ nội dung từ CMS → không còn truy cập trái quyền | G2-04, G1-03/04/05 |
| G2-E2E-05 | Cá nhân hóa bằng favorite/history → đề xuất hợp lệ → fallback người mới không có lịch sử | G2-02/03/05 |
| G2-E2E-06 | Live kết thúc → mở bản ghi VOD có quyền → player thể hiện đúng trạng thái | G1-06/07/08, G2-06 |
| G2-E2E-07 | **Nếu thương mại được mở:** chọn gói → checkout → webhook xác minh → kích hoạt → xem premium → hết hạn/thu hồi, không replay token trái phép | G2-01/09/10, G1-05/08 |
| G2-E2E-08 | **Nếu tương tác được cấp phép:** gửi bình luận → kiểm duyệt → công khai hoặc từ chối → report vi phạm | G2-08 |
| G2-E2E-09 | Người xem tắt thông báo hoặc hủy đăng ký nhận tin → không phát sinh gửi sai kênh → inbox còn trạng thái hợp lệ | G2-01/02/07 |
| G2-E2E-10 | Người xem xem video và yêu cầu xóa lịch sử → tiến độ/history và analytics tuân theo chính sách xóa/ẩn danh, báo cáo tổng không lộ PII | G2-01/03/11 |

## 8. Mức độ sẵn sàng

| Tiêu chí | Đánh giá |
|---|---|
| Bao quát tên nhóm yêu cầu GĐ2 của VTV8 | **Khá đầy đủ** |
| Ranh giới kế thừa từ GĐ1 | **Cần chỉnh** – 6 tính năng đang lặp logic |
| Phân biệt nguồn VTV8 với suy luận | **Tương đối** – nhãn T chỉ chỉ ra chủ đề, không phải xác nhận từng chi tiết |
| Luồng trả phí và DRM | **Chưa đạt để chốt triển khai**, đang lệch CORE/CONDITIONAL |
| Pháp lý bình luận, riêng tư và dữ liệu người xem | **Chưa xác minh**, có gate bắt buộc |
| Khả năng nghiệm thu từng feature | **Cần bổ sung** – hiện mới có acceptance sơ bộ một dòng |
| Đủ điều kiện tính giờ FE/BE/MD | **Chưa**, cần quyết định P0 và chuẩn hóa scope |

**Chốt hướng QA:** giữ cấu trúc **11 module + 2 nhóm hỗ trợ**. Nếu chấp thuận, cập nhật **66 tính năng độc lập** (33 CORE/9 OPTION/24 CONDITIONAL) và mô tả tiêu chí E2E. Nhưng không xem **33 CORE** là đầy đủ nghĩa vụ GĐ2 nếu bên đặt hàng yêu cầu phải có thuê bao/nội dung trả phí trong cùng đợt nghiệm thu. Bảng 72 mã và các file module hiện tại vẫn được giữ nguyên đến khi có chỉ đạo áp dụng QA.
