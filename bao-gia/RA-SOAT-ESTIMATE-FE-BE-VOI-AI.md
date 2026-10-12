# Rà soát sâu dự toán FE/BE VTV8Online với hỗ trợ AI

**Cập nhật V2 ngày 12/10/2026:** giữ đủ 290 tính năng; giờ code dự toán nội bộ **4.865h = 1.415 FE + 3.450 BE**. Đây là phương án triển khai nhanh có điều kiện, chưa được đo bằng code thực tế. Xem tổng mới tại **mục 13** và từng dòng tại **mục 10**; các bảng V1 giữ để đối chiếu.

**Đã đồng bộ CSV/Markdown ngày 12/10/2026** theo giờ V2 trong mục 10 và 13. Các cột CSV trước V2 và bảng V1 lưu lịch sử đối chiếu. File báo giá Excel hiện tại đã được điền FE/BE V2 cho đủ 290 tính năng ngày 12/10/2026.

Ngày: **12/10/2026**. Trạng thái: **PROPOSED / DRAFT REVIEW**. Đầu vào được người dùng chọn: bốn CSV `DU-TOAN-EFFORT-GD1–GD4-FE-BE.csv`; không phải số giờ mới nhập trong Excel.

Đã đối chiếu **290 tính năng thuộc 41 module phần mềm** với đúng dòng nghiệp vụ của từng mã, các bảng thành phần dùng chung, điều kiện nghiệm thu, giả định của bản dự toán và công thức workbook. Cả 290 mã đều có mô tả nghiệp vụ tương ứng; phép cộng Coding và quy đổi Total trong CSV đều khớp. **Không có lỗi số học trong CSV.** GĐ0 gồm 33 công việc khảo sát của 8 module được tách riêng khỏi việc rà FE/BE.

## 1. Kết luận

**Dự toán hiện tại có nhiều dòng bảo thủ hơn mức có thể hướng tới khi lập trình viên biết dùng AI, có component/SDK phù hợp và làm theo đúng phạm vi incremental.** Căn cứ rõ nhất là các tính năng giao diện nhỏ, CRUD theo form/list chung và phần mở rộng sử dụng dữ liệu/API giai đoạn trước. Một số khoảng giảm lớn còn đến từ việc xác định lại khối lượng code mới, không thể quy toàn bộ phần giảm cho AI.

Tuy nhiên, dữ liệu hiện có là hồ sơ phân tích, chưa phải bằng chứng code/SDK/API đã chạy. Bảng dưới là **khoảng giờ lập kế hoạch đề xuất theo điều kiện**, không phải thời gian đã đo, khoảng tin cậy thống kê hay cam kết giới hạn trên. Một vendor không tương thích, dữ liệu xấu hoặc quy chế chưa rõ có thể khiến giờ vượt cả biên cao.

Trong bản dự toán trước khi cập nhật V2, GĐ2 ghi rõ “Middle Developer không có hệ số tăng năng suất bởi AI”; GĐ4 ghi rõ “chưa giảm nhờ AI coding”. GĐ1 đã giả định dùng thư viện/framework, GĐ3 đã giả định kế thừa và admin primitives. Các CSV/Markdown hiện hành đã chuyển sang V2 có hỗ trợ AI. Những nhận định cũ được giữ ở đây để giải thích quá trình rà soát, không phải giả định hiện hành.

## 2. Phân tích ví dụ 28 giờ FE: Khung website và điều hướng

Nguồn: [G1-01-F001](../docs/01-gd1-vtv8online-v1/G1-01-website-vtv8online.md). Ranh giới sau QA ghi rõ: **chỉ shell và điều hướng, không chứa thiết kế hoàn chỉnh mọi template trang khác**. Trang chủ, trang bài, chuyên mục, chương trình, video và SEO đã có dòng riêng.

| Hạng mục code FE thực sự | Giờ đề xuất |
|---|---:|
| Khởi tạo route/layout và ghép nền giao diện đã chọn | 1–2 |
| Header, menu desktop/mobile trên component có sẵn | 2–4 |
| Footer và breadcrumb dùng chung | 1–2 |
| Loading, empty cơ bản, 404 và đường điều hướng | 1–2 |
| Ghép dữ liệu menu, kiểm tra trực tiếp các breakpoint và sửa lỗi cục bộ | 1–2 |
| **Tổng FE** | **6–12** |

BE đề xuất **4–8 giờ**: model/query cấu hình menu, read endpoint, cache nhẹ và validation/visibility; mỗi phần khoảng 1–2 giờ, trên backend skeleton đã có. Đây không phải công xây dựng toàn bộ backend framework, CMS menu editor hay page builder.

**FE 28 giờ là cao so với phạm vi nhỏ này nếu thiết kế đã chốt và dùng component/AI.** Mức 6–12 giờ là giả thuyết tốt hơn để đo thử. Nếu chưa có thiết kế/stack, header đặc thù nhiều tương tác, cần nhiều phương án UI/vòng sửa hoặc bootstrap cả design system, thì 16–28 giờ vẫn có thể hợp lý; phải ghi rõ khối lượng đó và không tính thêm ở dòng khác.

Theo công thức hiện tại: 28 FE + 12 BE = 40 giờ coding → 72,73 giờ tổng effort → 9,09 MD. Nếu FE 6–12 và BE 4–8, coding là 10–20 giờ → 18,18–36,36 giờ effort theo mẫu. **28 giờ FE = 3,5 ngày công FE, không phải 3,5 ngày triển khai tính năng của cả nhóm.** FE/BE có thể chạy song song, còn API/design/vendor có thể gây thời gian chờ.

Điều kiện “thiết kế đã chốt” chưa được chứng minh chỉ bằng GĐ0: dự toán GĐ0 mới có tối đa 6 wireframe mức thấp và không có design system hoặc toàn bộ thiết kế high-fidelity.

## 3. Những nguyên nhân làm tổng giờ lớn

### 3.1. Tổng đang chứa nhiều phạm vi tùy chọn

GĐ1 có 72 CORE, GĐ2 33 CORE, GĐ3 15 CORE, GĐ4 34 CORE; còn CONDITIONAL/OPTION chỉ được cộng khi bật. Đặc biệt, **CORE GĐ4 là cơ sở của từng module được kích hoạt**, không phải tất cả module bắt buộc phải làm. B1 redirect/affiliate và B2 booking API không cùng khối lượng; TV một OS không tương đương mọi TV OS; Mobile không tự có commerce hoặc offline.

### 3.2. Khai báo dùng chung chưa đồng nghĩa giờ đã phản ánh đầy đủ incremental

Ví dụ: G1-01-F009 trang tĩnh public dùng renderer/read API sẵn nhưng cũ vẫn 12+12; G1-05-F007 chỉ gắn tag/relation có sẵn nhưng cũ 12+16; G2-06-F001 dùng API progress đã có nhưng cũ 24+8; G4-05-F003 chỉ bổ sung fallback đã có G2 nhưng cũ 16+48; G4-06-F002 một member status card/projection nhưng cũ 64+48. Đây là các dòng có căn cứ ưu tiên giảm.

Đây là **dấu hiệu mức giờ incremental còn lớn**, chưa phải bằng chứng từng dòng tính trùng thực tế. Cần đối chiếu code đã có và các task cụ thể trước khi xóa giờ.

### 3.3. Mẫu chuyển 1 giờ code thành 1,82 giờ effort, sau đó còn PM

Config: Req=10%, Detail=15%, Cod=55%, UnitTest=20%, MD=8. Vì vậy BA = Coding×10/55; Design = Coding×15/55; QA = Coding×20/55; Total = Coding/0,55. Phần BA/Design/QA **bằng 81,82% giờ code**, không phải chỉ thêm 45% giờ code.

Workbook còn `L348=0.2*(L4+L333+L342)` cho PM. Nếu chỉ xét feature code, hệ số tổng với PM 20% là xấp xỉ **2,18 lần coding**, trước các khoản độc lập khác. Đây là công thức còn trong mẫu, không phải xác nhận PM 20% phù hợp dự án này.

Các tỷ trọng là phương pháp người dùng đã thống nhất. Báo cáo giữ nguyên để so sánh và chưa sửa Config. Nhưng cần phân biệt: AI giảm thao tác code không bảo đảm số giờ workshop, thiết kế và QA giảm tương ứng. Nếu giảm FE/BE rồi tự động giảm QA theo tỷ lệ, phải kiểm tra QA vẫn đủ cho các kịch bản nghiệm thu.

### 3.4. BA/Design/QA, GĐ0 và developer testing cần ranh giới rõ

GĐ0 có BA/UX/kiến trúc; phase phát triển vẫn có phân tích chi tiết và thiết kế màn hình thật. Chỉ loại phần giao cùng một deliverable, không bỏ toàn bộ BA/Design vì đã làm GĐ0. GĐ4 mô tả BE có unit test mức phát triển: developer tự test và QA độc lập khác trách nhiệm, chỉ là tính trùng khi cùng một bộ công việc được cộng hai lần. CSV không đủ để chứng minh đã tính trùng.

G4-08-F001 “định nghĩa chỉ số/data contracts” có phần BA đáng kể; nếu chỉ tạo tài liệu thì **không đưa workshop vào FE/BE rồi nhân BA thêm**. Khoảng code trong phụ lục chỉ áp dụng khi thật sự xây schema/catalog configuration.

### 3.5. Cộng toàn workbook có thể lẫn scope và công việc GĐ0

`E4=SUM(E5:E332)` và `F4=SUM(F5:F332)` trong file báo giá hiện tại cộng mọi dòng của GĐ0–GĐ4. Chưa có cơ chế loại CONDITIONAL/OPTION khỏi tổng nếu nhập số vào đó; scope được ghi trong comment. Không điền giờ khảo sát GĐ0 vào FE/BE vì sẽ bị nhân tỷ trọng phần mềm. Sau khi chọn scope, cần tổng hợp theo phase/module và chỉ cộng tập mã đã chọn.

## 4. Giả định cho khoảng FE/BE đề xuất

- Lập trình viên đủ năng lực kiểm tra kết quả AI, dùng AI để sinh skeleton/form/query/test mẫu và sửa code trong một stack quen thuộc; không tính thời gian người học công nghệ từ đầu.
- Layout và trường dữ liệu giới hạn; dùng bộ UI/form/table, editor, player, queue, auth và SDK có sẵn phù hợp. Thiết kế các màn phải đủ rõ trước khi triển khai; code vẫn gồm ghép API, xử lý trạng thái và sửa lỗi tại chỗ.
- Owner component chung được xây một lần; module sau chỉ làm delta. GĐ2 trở đi chỉ dùng năng lực GĐ1/GĐ2/GĐ3 nếu chúng thực sự đã triển khai. Một dòng CONDITIONAL chưa làm không tự thành API miễn phí.
- Mỗi nhóm tích hợp một provider/gateway/nguồn dữ liệu, có tài liệu và sandbox phù hợp. Vendor chưa xác định, TV devices, DRM, offline, recognition và dữ liệu migration được giữ khoảng rộng; nhiều trường hợp chưa thể đóng giá.
- Các biên thấp là kịch bản thuận lợi, component/API chạy được, quy tắc nhỏ và rõ; biên cao thêm tích hợp/sửa lỗi thông thường trong scope đã mô tả. **Không dùng tổng biên thấp để cam kết deadline.** Các bất định chung như vendor và design ảnh hưởng đồng thời nhiều dòng, không được coi là rủi ro độc lập triệt tiêu nhau.
- Nếu chưa có project skeleton kỹ thuật, dự kiến sơ bộ **16–24 FE + 16–24 BE = 32–48 giờ coding dùng chung** để dựng foundations UI/admin/API/DB/config/logging; chưa gồm CI/CD/production. Đây là khoản PROPOSED, chưa đo; chỉ cộng một lần nếu chưa được owner feature khác bao gồm. Khoảng theo module chưa cộng khoản này vì repo hiện chỉ có hồ sơ phân tích.
- Giờ không gồm BA/Design/QA độc lập, DevOps, vendor fees, data clean thủ công, chờ phê duyệt, pháp lý, load/security test chuyên sâu hoặc PM; những khoản đó vẫn cần WBS riêng.

## 5. Owner dùng chung cần kiểm tra trước khi đưa số vào báo giá

| Phần dùng chung | Owner / dòng xây lần đầu | Các dòng sau chỉ tính mới |
|---|---|---|
| Shell/card/list/filter public | G1-01-F001/F002/F003 | Trang chương trình, video, offering và danh sách GĐ2 |
| Admin list/form primitives | Foundations hoặc G1-02-F003, chọn một nơi ghi giờ | Metadata CRUD G1-04, partner/offering, báo cáo, portal |
| Auth/RBAC/audit | G1-02-F001/F004/F006 | Quyền từng action; audience policy G2 và tenant portal G4 vẫn có logic mới |
| Editor/renderer | G1-03-F001 và G1-01-F004 | Preview, static pages, offering description |
| Workflow primitives | G1-03-F003/F004/F006 | Video approval, partner approval, AI review; không đồng nhất rule từng domain |
| Taxonomy/typed relations | G1-04-F001/F009 | DAM tags, offering locations, search filters, AI tag review |
| DAM upload/picker/rights | G1-05-F001/F006/F004 | CMS/editor, VOD, AI, derivative và licensing; quyền sublicensing mới vẫn phải code |
| Player + errors | G1-06-F003/F005 | Live, resume, quality, subtitle; Mobile/TV vẫn là client SDK và UX mới |
| Playback/recording adapter | G1-08-F004/F007 | VOD/live chỉ liên kết/duyệt; không receiver recording lần hai |
| Events/inbox/progress | G2-11/G2-07/G2-03 | Recommendation, mobile push, partner/data metrics chỉ delta; không progress DB khác |
| Partner/offering/lead master | G3-03/G3-02 | Merchant activation, B2B, partner portal và license intake |
| Payment handler | G2-09 nếu thực tế compatible | Commerce order domain mới G3-07, reuse adapter nhưng vẫn phải code order/refund policy |
| Transcript/job/version/review | G4-03 | Semantic index, translation, AI tags, shorts dùng cùng input/queue/version |

## 6. Tổng hợp các khoảng V1 — đối chiếu với V2 ở mục 13

Đơn vị dưới đây là **coding hours (FE+BE)**. Số cũ lưu từ CSV trước cập nhật V2; khoảng V1 lấy từ các cột V1 trong phụ lục. Các bảng ở mục này là lịch sử đối chiếu; giờ hiện hành trong CSV/Markdown là V2 tại mục 13. Các số chưa có foundations/chi phí ngoài coding; khoảng V1 là kịch bản điều kiện, không phải ngân sách được bảo đảm.

| Giai đoạn | Coding cũ: mọi tính năng | Coding đề xuất: mọi tính năng | Coding cũ: CORE | Coding đề xuất: CORE |
|---|---:|---:|---:|---:|
| GĐ1 | 4.788 | 1.604–3.124 | 4.216 | 1.396–2.686 |
| GĐ2 | 5.028 | 1.564–3.110 | 2.220 | 624–1.224 |
| GĐ3 | 7.308 | 2.218–4.544 | 1.320 | 354–654 |
| GĐ4 | 14.904 | 3.804–8.478 | 6.160 | 1.496–3.174 |

**Không cộng tất cả CORE GĐ4 vào một release mặc định.** Tổng mọi feature chỉ là so sánh danh mục; đề xuất trên cũng không chứng minh toàn dự án giảm cùng một tỷ lệ. Đặc biệt GĐ3 bước A (15 CORE) khác các phần booking/TMĐT/finance có điều kiện; GĐ4 còn phụ thuộc module GĐ2/GĐ3 tương ứng.

### Bảng theo 41 module: mọi feature trong module, gồm tùy chọn

| Module | Tên theo CSV | Số dòng | FE cũ | BE cũ | Coding cũ | FE đề xuất | BE đề xuất | Coding đề xuất |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| G1-01 | Website VTV8Online | 9 | 228 | 176 | 404 | 60–106 | 52–98 | 112–204 |
| G1-02 | Tài khoản và phân quyền CMS | 6 | 128 | 216 | 344 | 44–78 | 96–168 | 140–246 |
| G1-03 | Biên tập và xuất bản | 10 | 256 | 336 | 592 | 80–142 | 118–228 | 198–370 |
| G1-04 | Nội dung có cấu trúc | 9 | 216 | 264 | 480 | 56–96 | 74–130 | 130–226 |
| G1-05 | Thư viện media – DAM | 8 | 224 | 320 | 544 | 78–132 | 126–244 | 204–376 |
| G1-06 | Video VOD | 6 | 168 | 144 | 312 | 48–82 | 44–82 | 92–164 |
| G1-07 | Livestream và lịch phát | 8 | 192 | 228 | 420 | 46–84 | 74–136 | 120–220 |
| G1-08 | Tích hợp Streaming | 7 | 60 | 296 | 356 | 14–38 | 116–252 | 130–290 |
| G1-09 | Báo cáo và thống kê | 6 | 128 | 248 | 376 | 36–68 | 88–180 | 124–248 |
| G1-10 | Tính nhuận bút | 8 | 224 | 368 | 592 | 62–112 | 156–300 | 218–412 |
| G1-11 | Chuyển đổi dữ liệu cũ | 5 | 0 | 368 | 368 | 0–0 | 136–368 | 136–368 |
| G2-01 | Tài khoản và định danh người xem | 6 | 180 | 344 | 524 | 42–78 | 108–226 | 150–304 |
| G2-02 | Theo dõi và yêu thích | 5 | 76 | 112 | 188 | 16–30 | 20–40 | 36–70 |
| G2-03 | Lịch sử xem và playlist | 6 | 148 | 224 | 372 | 36–64 | 62–124 | 98–188 |
| G2-04 | Tìm kiếm và khám phá | 6 | 92 | 288 | 380 | 22–40 | 88–176 | 110–216 |
| G2-05 | Gợi ý và cá nhân hóa | 4 | 80 | 176 | 256 | 20–38 | 48–96 | 68–134 |
| G2-06 | Nâng cấp VOD/livestream | 4 | 116 | 76 | 192 | 26–52 | 16–44 | 42–96 |
| G2-07 | Bản tin và thông báo | 7 | 168 | 332 | 500 | 44–78 | 112–216 | 156–294 |
| G2-08 | Bình luận và tương tác | 6 | 164 | 304 | 468 | 44–74 | 98–196 | 142–270 |
| G2-09 | Thuê bao và thanh toán | 8 | 268 | 576 | 844 | 66–130 | 232–468 | 298–598 |
| G2-10 | Quyền xem và DRM | 6 | 168 | 464 | 632 | 44–86 | 196–396 | 240–482 |
| G2-11 | Phân tích hành vi, QoE | 8 | 188 | 484 | 672 | 52–106 | 172–352 | 224–458 |
| G3-01 | Content → dịch vụ | 6 | 152 | 184 | 336 | 32–58 | 38–80 | 70–138 |
| G3-02 | Lead và bàn giao | 6 | 204 | 352 | 556 | 46–86 | 112–216 | 158–302 |
| G3-03 | Đối tác và offering | 6 | 208 | 420 | 628 | 52–88 | 126–260 | 178–348 |
| G3-04 | Affiliate & tracking | 6 | 168 | 416 | 584 | 42–80 | 152–308 | 194–388 |
| G3-05 | Booking dịch vụ | 7 | 260 | 616 | 876 | 58–116 | 252–560 | 310–676 |
| G3-06 | Seller, SKU & inventory | 7 | 300 | 552 | 852 | 68–122 | 166–332 | 234–454 |
| G3-07 | Đơn hàng và thanh toán | 8 | 328 | 760 | 1.088 | 74–140 | 236–520 | 310–660 |
| G3-08 | Fulfillment & hậu mãi | 6 | 272 | 632 | 904 | 66–126 | 224–504 | 290–630 |
| G3-09 | Đối soát hoa hồng | 6 | 264 | 664 | 928 | 70–134 | 280–568 | 350–702 |
| G3-10 | Dịch vụ B2B/tài trợ | 6 | 208 | 348 | 556 | 46–90 | 78–156 | 124–246 |
| G4-01 | Ứng dụng Mobile iOS/Android | 9 | 832 | 424 | 1.256 | 244–512 | 100–308 | 344–820 |
| G4-02 | Ứng dụng Smart TV | 8 | 720 | 440 | 1.160 | 232–488 | 104–296 | 336–784 |
| G4-03 | AI Media Processing | 9 | 608 | 1.280 | 1.888 | 168–316 | 376–840 | 544–1.156 |
| G4-04 | Semantic Search | 8 | 280 | 992 | 1.272 | 50–108 | 248–520 | 298–628 |
| G4-05 | Recommendation / Video Automation | 9 | 552 | 1.240 | 1.792 | 136–274 | 352–792 | 488–1.066 |
| G4-06 | Membership nâng cao | 8 | 504 | 792 | 1.296 | 90–176 | 172–420 | 262–596 |
| G4-07 | Partner Platform | 9 | 760 | 1.144 | 1.904 | 176–312 | 328–688 | 504–1.000 |
| G4-08 | Data Platform | 9 | 560 | 1.752 | 2.312 | 108–220 | 464–1.256 | 572–1.476 |
| G4-09 | Archive & Content Licensing | 9 | 720 | 1.304 | 2.024 | 160–288 | 296–664 | 456–952 |

## 7. Những phần không nên ép giảm đồng loạt

| Nhóm | Mã điển hình | Căn cứ cần giữ công thực |
|---|---|---|
| Tiền và quyền lợi | G1-10-F004, G2-09-F004/F006, G3-09-F003 | Snapshot, rounding, rerun, late/duplicate callback, refund và reversal |
| Quyền truy cập thực | G1-05-F004, G2-10-F002/F004/F005, G4-07-F001 | Server enforcement, protected media, tenant isolation; ẩn UI không đủ |
| Stock và order | G3-06-F004, G3-07-F004, G3-08-F005 | Atomic reservation, timeout, payment/stock consistency, partial refunds |
| Booking/vendor | G3-05-F004…F008, G3-03-F007 | Schema/authority/retry/orphan/cancel policy từ sandbox thực |
| Dữ liệu cũ | G1-11 | Dữ liệu mẫu, rich-text/file refs, quyền còn thiếu, idempotent import; chưa kết luận giờ cũ thừa |
| Mobile/TV/DRM/offline | G4-01-F004/F009, G4-02-F004/F005 | SDK/OS/remote/device/license và kiểm chứng trên môi trường thật |
| AI/data chất lượng | G4-03-F006, G4-05-F005…F009, G4-08 | Provider output, quality evaluation, source drift/retention; gọi API nhanh không bảo đảm kết quả dùng được |

AI hỗ trợ viết phần lớn skeleton và truy vấn, nhưng không thay thế việc đối chiếu số tiền, kiểm tra quyền truy cập, dữ liệu thực hay compatibility SDK. Biên cao cũ được giữ ở nhiều dòng rủi ro vì chưa có cơ sở bác bỏ.

## 8. Cách hiệu chỉnh bằng dữ liệu thực

Đề xuất một batch đo năng suất trước khi lấy khoảng thấp làm căn cứ: G1-01-F001 (shell), G1-04-F005 (metadata CRUD sau khi nền admin có), G1-03-F004 (workflow), G1-08-F007 (vendor callback sau khi có sandbox). Đây là kế hoạch kiểm chứng, **chưa thực hiện code hay benchmark trong lần rà này**.

Ghi giờ người thực sự làm: làm rõ scope riêng, sinh/sửa code, ghép API, review/debug, developer test, QA độc lập, rework sau QA. Thời gian AI chạy hoặc chờ vendor chỉ ghi vào lịch; không tự nhân thành giờ công nhiều người. Nếu developer làm việc khác trong lúc AI chạy, không đếm đồng thời cả hai task như full active effort.

Nghiệm thu giữ theo tài liệu: không lộ draft/asset thiếu quyền, không vượt user/tenant boundary, retry không tạo bản ghi/giao dịch trùng, public UI đúng published data, media SDK chạy thật. Không dùng tốc độ dựng screenshot/prototype làm bằng chứng hoàn thành feature production.

Sau batch, điều chỉnh riêng nhóm UI/CRUD, workflow và external integration bằng kết quả đã đo; không lấy tốc độ shell để giảm payment hay migration. Nếu foundations chưa có thì ghi WBS một lần trước, rồi re-estimate delta sau.

## 9. Căn cứ về AI và giới hạn diễn giải

Nghiên cứu thực địa của [Microsoft Research](https://www.microsoft.com/en-us/research/publication/the-effects-of-generative-ai-on-high-skilled-work-evidence-from-three-field-experiments-with-software-developers/) báo cáo tác động tích cực lên số tác vụ hoàn thành trong bối cảnh họ khảo sát. Điều này không chuyển trực tiếp thành “mỗi tính năng VTV8 giảm cùng tỷ lệ”.

[METR cập nhật ngày 24/02/2026](https://metr.org/blog/2026-02-24-uplift-update/) cho rằng AI có khả năng giúp developer nhanh hơn so với giai đoạn đầu 2025, nhưng số liệu mới chịu selection bias và không đáng tin để đo chính xác mức cải thiện. Vì vậy **các khoảng giờ ở báo cáo này là đánh giá kỹ thuật theo scope/tái sử dụng, không lấy nghiên cứu AI làm hệ số giảm**, và phải hiệu chỉnh bằng throughput của nhóm thực hiện.

Nguồn nội bộ chính: [phương pháp ước tính](PHUONG-PHAP-UOC-TINH.md), bốn bản dự toán DRAFT, [owner GĐ1](../docs/01-gd1-vtv8online-v1/G1-THANH-PHAN-DUNG-CHUNG.md), [owner GĐ2](../docs/02-gd2-media-platform/G2-THANH-PHAN-DUNG-CHUNG.md), [owner GĐ3](../docs/03-gd3-content-commerce/G3-THANH-PHAN-DUNG-CHUNG.md), [owner GĐ4](../docs/04-gd4-digital-ecosystem/G4-THANH-PHAN-DUNG-CHUNG.md), tiêu chí nghiệm thu và từng module liên kết trong phụ lục.

## 10. Phụ lục: đối chiếu V1 và giờ tối ưu V2 từng tính năng

**CSV trước V2 FE/BE** lưu giờ gốc trước cập nhật để đối chiếu; các CSV hiện hành đã dùng giờ V2. **V1 FE/V1 BE** giữ khoảng đề xuất lần trước để đối chiếu; **V2 FE/V2 BE** là số giờ công mục tiêu đã rà lại từng dòng cho cách phát triển bằng AI, dùng nền và component có sẵn. V2 là DRAFT theo điều kiện, chưa đo thực tế. Cột căn cứ V1 giữ nguyên lịch sử nhận định; các đề cập biên cao trong cột đó thuộc V1. Cột cách tính V2 mô tả nền cần có để dùng số mới. Những dòng 0 BE/FE chỉ khi API/component đã đủ; mọi nghiệp vụ/ngoại lệ/tiêu chí nghiệm thu gốc vẫn giữ qua link module.

### G1-01 – Website VTV8Online

[Nghiệp vụ và nghiệm thu gốc](../docs/01-gd1-vtv8online-v1/G1-01-website-vtv8online.md) · Coding mọi scope: CSV **404h** · V1 **112–204h** · V2 **64h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G1-01-F001 | Khung website và điều hướng | CORE | 28/12 | 6–12 | 4–8 | 4 | 4 | Chỉ shell/header/footer/menu/breadcrumb/loading/404; thiết kế được duyệt, component responsive có sẵn; không chứa template các trang khác. | AI sinh route/layout/card/renderer theo thiết kế, shared public query; chỉ ghép props, states và kiểm tra tại chỗ. |
| G1-01-F002 | Trang chủ và các khối nổi bật | CORE | 40/24 | 12–20 | 8–16 | 6 | 4 | Giới hạn 4–6 khối cố định, dùng card chung; query published/cache; page builder và nhiều phương án bố cục phải tính thêm. | AI sinh route/layout/card/renderer theo thiết kế, shared public query; chỉ ghép props, states và kiểm tra tại chỗ. |
| G1-01-F003 | Danh sách nội dung theo chuyên mục | CORE | 24/20 | 6–10 | 6–10 | 3 | 4 | Dùng card, pagination/filter chung; chỉ query published theo chuyên mục; không xây list framework riêng. | AI sinh route/layout/card/renderer theo thiết kế, shared public query; chỉ ghép props, states và kiểm tra tại chỗ. |
| G1-01-F004 | Trang chi tiết bài viết | CORE | 32/24 | 10–16 | 6–10 | 4 | 4 | Một renderer rich-text + metadata; giữ sanitize và published guard; không lặp editor ở CMS. | AI sinh route/layout/card/renderer theo thiết kế, shared public query; chỉ ghép props, states và kiểm tra tại chỗ. |
| G1-01-F005 | Trang chương trình, series và chủ đề | CORE | 32/24 | 8–14 | 6–10 | 3 | 4 | Một template chương trình/series/chủ đề, list tập dùng chung; nhiều thiết kế độc lập sẽ tăng giờ. | AI sinh route/layout/card/renderer theo thiết kế, shared public query; chỉ ghép props, states và kiểm tra tại chỗ. |
| G1-01-F006 | Trang hồ sơ thực thể nội dung | OPTION | 20/12 | 4–8 | 4–8 | 2 | 3 | Template hồ sơ dùng lại list/detail; chỉ field public và liên kết nội dung; OPTION. | AI sinh route/layout/card/renderer theo thiết kế, shared public query; chỉ ghép props, states và kiểm tra tại chỗ. |
| G1-01-F007 | Tìm kiếm cơ bản trên website | OPTION | 24/24 | 6–10 | 8–16 | 3 | 4 | Keyword theo dữ liệu hiện có và phân trang; không engine riêng; nếu chọn phải trừ phần kế thừa trong G2-04. | AI sinh route/layout/card/renderer theo thiết kế, shared public query; chỉ ghép props, states và kiểm tra tại chỗ. |
| G1-01-F008 | SEO, đường dẫn và metadata | CORE | 16/24 | 6–10 | 8–16 | 3 | 6 | Route/meta/sitemap/robots/redirect từ mapping có sẵn; không gồm sinh mapping hay SEO chiến lược. | AI sinh route/layout/card/renderer theo thiết kế, shared public query; chỉ ghép props, states và kiểm tra tại chỗ. |
| G1-01-F009 | Trang thông tin tĩnh và cấu hình điều hướng | CORE | 12/12 | 2–6 | 2–4 | 1 | 2 | Render trang tĩnh bằng renderer/read API đã có; cấu hình menu không xây lại F001. | AI sinh route/layout/card/renderer theo thiết kế, shared public query; chỉ ghép props, states và kiểm tra tại chỗ. |

### G1-02 – Tài khoản và phân quyền CMS

[Nghiệp vụ và nghiệm thu gốc](../docs/01-gd1-vtv8online-v1/G1-02-cms-quan-tri.md) · Coding mọi scope: CSV **344h** · V1 **140–246h** · V2 **61h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G1-02-F001 | Đăng nhập, đăng xuất và phiên CMS | CORE | 24/40 | 8–12 | 16–28 | 3 | 6 | Dùng auth/session library; giữ revoke, rate-limit, server guard; chưa gồm dựng hệ IAM riêng. | Auth/RBAC/admin primitives đã có; cấu hình roles/policy và endpoint riêng, test revoke/ownership trực tiếp. |
| G1-02-F002 | Hồ sơ cá nhân và đổi/đặt lại mật khẩu | CORE | 16/24 | 4–8 | 8–16 | 2 | 4 | Profile/password form và admin reset cơ bản; xác nhận mẫu không yêu cầu luồng email reset mới. | Auth/RBAC/admin primitives đã có; cấu hình roles/policy và endpoint riêng, test revoke/ownership trực tiếp. |
| G1-02-F003 | Quản lý tài khoản nội bộ | CORE | 24/32 | 8–16 | 12–20 | 4 | 6 | Tạo list/form CRUD quản trị làm nền tái sử dụng; deactivate không xóa lịch sử; các module sau chỉ tính delta. | Auth/RBAC/admin primitives đã có; cấu hình roles/policy và endpoint riêng, test revoke/ownership trực tiếp. |
| G1-02-F004 | Quản lý vai trò và ma trận quyền | CORE | 24/48 | 10–16 | 24–40 | 4 | 10 | Owner RBAC chung, ma trận quyền V1; test API thiếu quyền là bắt buộc, không chỉ ẩn nút FE. | Auth/RBAC/admin primitives đã có; cấu hình roles/policy và endpoint riêng, test revoke/ownership trực tiếp. |
| G1-02-F005 | Phân quyền theo phòng ban hoặc chuyên mục | OPTION | 24/40 | 8–16 | 24–40 | 3 | 10 | Policy phòng ban/chuyên mục là phần mới thật; giới hạn V1 và tránh leakage theo scope; OPTION. | Auth/RBAC/admin primitives đã có; cấu hình roles/policy và endpoint riêng, test revoke/ownership trực tiếp. |
| G1-02-F006 | Nhật ký thao tác quản trị nhạy cảm | CORE | 16/32 | 6–10 | 12–24 | 3 | 6 | Owner audit hook và một màn lọc cơ bản; không dashboard SIEM hoặc append-only infrastructure. | Auth/RBAC/admin primitives đã có; cấu hình roles/policy và endpoint riêng, test revoke/ownership trực tiếp. |

### G1-03 – Biên tập và xuất bản

[Nghiệp vụ và nghiệm thu gốc](../docs/01-gd1-vtv8online-v1/G1-03-bien-tap-xuat-ban.md) · Coding mọi scope: CSV **592h** · V1 **198–370h** · V2 **103h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G1-03-F001 | Soạn thảo và cập nhật bài viết | CORE | 64/56 | 24–40 | 20–36 | 10 | 12 | Tích hợp editor sẵn có, toolbar/Word blocks được chốt; CRUD/sanitize; picker DAM tính tại G1-05-F006. | Editor và workflow primitives đã chạy; code delta field/action/transition và một bộ developer checks. |
| G1-03-F002 | Danh sách bài và quản lý bản nháp | CORE | 24/28 | 6–10 | 8–16 | 3 | 4 | Dùng list/filter chung; draft/ownership/version guard mới; không lặp CRUD bài ở F001. | Editor và workflow primitives đã chạy; code delta field/action/transition và một bộ developer checks. |
| G1-03-F003 | Gửi duyệt và hàng đợi biên tập | CORE | 24/32 | 8–14 | 12–24 | 4 | 8 | Owner transition/workflow V1 và hàng đợi; một quy trình cố định, không workflow designer. | Editor và workflow primitives đã chạy; code delta field/action/transition và một bộ developer checks. |
| G1-03-F004 | Yêu cầu chỉnh sửa và phê duyệt | CORE | 24/40 | 6–10 | 12–24 | 3 | 6 | Bổ sung trả/duyệt, lý do và history trên transition đã có; không tạo state machine lần hai. | Editor và workflow primitives đã chạy; code delta field/action/transition và một bộ developer checks. |
| G1-03-F005 | Xem trước nội dung trước khi công khai | CORE | 12/12 | 2–6 | 4–8 | 1 | 2 | Tái dùng renderer bài public; chỉ protected preview và trải nghiệm mở preview. | Editor và workflow primitives đã chạy; code delta field/action/transition và một bộ developer checks. |
| G1-03-F006 | Xuất bản, cập nhật và gỡ bài | CORE | 20/40 | 6–10 | 16–28 | 3 | 8 | Publish/gỡ, rights gate, audit/cache; vẫn phải kiểm tra transition/asset bị BLOCK, không làm rights engine mới. | Editor và workflow primitives đã chạy; code delta field/action/transition và một bộ developer checks. |
| G1-03-F007 | Lập lịch xuất bản | OPTION | 12/32 | 4–8 | 12–24 | 2 | 6 | Queue/scheduler có sẵn; date-time, cancel/retry idempotent; OPTION, không vận hành scheduler riêng. | Editor và workflow primitives đã chạy; code delta field/action/transition và một bộ developer checks. |
| G1-03-F008 | Lịch sử phiên bản và khôi phục | OPTION | 32/48 | 12–24 | 20–40 | 6 | 12 | Snapshot/diff/restore có thư viện; quy tắc bài published và không bypass duyệt phải giữ; OPTION. | Editor và workflow primitives đã chạy; code delta field/action/transition và một bộ developer checks. |
| G1-03-F009 | Điều phối vị trí hiển thị nội dung | CORE | 24/24 | 8–12 | 8–16 | 3 | 4 | Ghim/sắp xếp slot cố định; dùng UI drag/order có sẵn, không page builder. | Editor và workflow primitives đã chạy; code delta field/action/transition và một bộ developer checks. |
| G1-03-F010 | Quản lý trang thông tin tĩnh trên CMS | CORE | 20/24 | 4–8 | 6–12 | 2 | 4 | Static page là loại content mới trên editor/workflow sẵn có; không viết CMS thứ hai. | Editor và workflow primitives đã chạy; code delta field/action/transition và một bộ developer checks. |

### G1-04 – Nội dung có cấu trúc

[Nghiệp vụ và nghiệm thu gốc](../docs/01-gd1-vtv8online-v1/G1-04-noi-dung-co-cau-truc.md) · Coding mọi scope: CSV **480h** · V1 **130–226h** · V2 **59h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G1-04-F001 | Chuyên mục và cây phân cấp | CORE | 32/32 | 12–20 | 12–20 | 4 | 6 | Tree/category editor là owner component cây; giữ unique slug, chống vòng lặp và bảo vệ reference. | Schema-driven forms/list/API, typed relations dùng chung; coder kiểm tra constraint và dữ liệu mẫu. |
| G1-04-F002 | Hồ sơ tác giả và cộng tác viên | CORE | 20/24 | 4–8 | 6–10 | 2 | 3 | Profile contributor CRUD độc lập user CMS; dùng list/form chung, tránh tạo hồ sơ nhân sự lần hai. | Schema-driven forms/list/API, typed relations dùng chung; coder kiểm tra constraint và dữ liệu mẫu. |
| G1-04-F003 | Chương trình truyền hình và series | CORE | 32/36 | 8–12 | 10–16 | 3 | 4 | Form chương trình/series và quan hệ/thứ tự; media picker chung, không player. | Schema-driven forms/list/API, typed relations dùng chung; coder kiểm tra constraint và dữ liệu mẫu. |
| G1-04-F004 | Tập/chương trình phát hành | CORE | 24/28 | 6–10 | 6–12 | 2 | 4 | Metadata tập, ngày/thứ tự và reference; trạng thái bản phát thuộc G1-06. | Schema-driven forms/list/API, typed relations dùng chung; coder kiểm tra constraint và dữ liệu mẫu. |
| G1-04-F005 | Hồ sơ nhân vật | CORE | 16/20 | 4–6 | 4–8 | 1 | 3 | Metadata nhân vật + relation; không có trang public hoặc nhận diện AI trong dòng này. | Schema-driven forms/list/API, typed relations dùng chung; coder kiểm tra constraint và dữ liệu mẫu. |
| G1-04-F006 | Hồ sơ địa danh và cấu trúc địa lý | CORE | 24/28 | 6–10 | 8–16 | 2 | 4 | Cây địa danh cơ bản, dùng component taxonomy; không maps/geocoding hay danh mục hành chính đầy đủ. | Schema-driven forms/list/API, typed relations dùng chung; coder kiểm tra constraint và dữ liệu mẫu. |
| G1-04-F007 | Hồ sơ di sản | CORE | 20/24 | 4–8 | 6–10 | 2 | 3 | Form di sản và relation địa danh trên primitives đã có. | Schema-driven forms/list/API, typed relations dùng chung; coder kiểm tra constraint và dữ liệu mẫu. |
| G1-04-F008 | Sự kiện và thời gian diễn ra | CORE | 20/24 | 4–8 | 6–10 | 2 | 3 | Form sự kiện/thời gian và relation; không lập lịch phát lần hai. | Schema-driven forms/list/API, typed relations dùng chung; coder kiểm tra constraint và dữ liệu mẫu. |
| G1-04-F009 | Tag, chủ đề và liên kết nội dung | CORE | 28/48 | 8–14 | 16–28 | 3 | 8 | Owner tag/typed relations/picker dùng chung; validation đa loại có công thật, các module khác chỉ gắn thêm. | Schema-driven forms/list/API, typed relations dùng chung; coder kiểm tra constraint và dữ liệu mẫu. |

### G1-05 – Thư viện media – DAM

[Nghiệp vụ và nghiệm thu gốc](../docs/01-gd1-vtv8online-v1/G1-05-dam-thu-vien-media.md) · Coding mọi scope: CSV **544h** · V1 **204–376h** · V2 **100h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G1-05-F001 | Tải lên và tiếp nhận file media | CORE | 48/64 | 20–32 | 32–64 | 8 | 20 | Owner upload presigned/progress/validation; phải chốt file lớn và chunk/resume. Upper giữ 64 BE; nguồn/vendor chưa rõ chưa kết luận quá cao. | Storage/upload/picker primitives đã có; SDK cấu hình sẵn; chỉ thêm metadata/rights/references và ghép UI. |
| G1-05-F002 | Thư viện media và tìm lọc | CORE | 32/40 | 12–20 | 16–24 | 5 | 8 | Library grid/list/filter/preview dùng component chung; quyền query và pagination giữ nguyên. | Storage/upload/picker primitives đã có; SDK cấu hình sẵn; chỉ thêm metadata/rights/references và ghép UI. |
| G1-05-F003 | Metadata gốc và thông tin sản xuất | CORE | 24/40 | 6–12 | 10–20 | 3 | 6 | Metadata provenance form/validation; relation nhân vật/địa danh/taxonomy dùng G1-04, không tạo taxonomy mới. | Storage/upload/picker primitives đã có; SDK cấu hình sẵn; chỉ thêm metadata/rights/references và ghép UI. |
| G1-05-F004 | Quản lý quyền và thời hạn khai thác | CORE | 32/64 | 12–20 | 32–64 | 4 | 16 | Owner rights gate/WARN/BLOCK/expiry/evidence; policy mơ hồ cần giữ biên trên và thử nghiệm trước. | Storage/upload/picker primitives đã có; SDK cấu hình sẵn; chỉ thêm metadata/rights/references và ghép UI. |
| G1-05-F005 | Quản lý bản gốc và phiên bản xuất bản | CORE | 24/40 | 8–12 | 12–24 | 3 | 6 | Bảng liên kết asset/variant/provider refs; không tự transcode/render. | Storage/upload/picker primitives đã có; SDK cấu hình sẵn; chỉ thêm metadata/rights/references và ghép UI. |
| G1-05-F006 | Ảnh đại diện, thumbnail và chọn file dùng trong bài | CORE | 32/24 | 12–20 | 8–16 | 6 | 4 | Owner picker/crop/thumbnail dùng thư viện; các editor khác chỉ gọi lại. | Storage/upload/picker primitives đã có; SDK cấu hình sẵn; chỉ thêm metadata/rights/references và ghép UI. |
| G1-05-F007 | Gắn tag, nhóm và liên kết đối tượng media | CORE | 12/16 | 2–6 | 4–8 | 1 | 2 | Chỉ gắn API tag/relation có sẵn, không một hệ tag thứ hai. | Storage/upload/picker primitives đã có; SDK cấu hình sẵn; chỉ thêm metadata/rights/references và ghép UI. |
| G1-05-F008 | Thao tác xóa, lưu trữ và kiểm tra nơi sử dụng | CORE | 20/32 | 6–10 | 12–24 | 2 | 6 | Soft-delete/archive và where-used check; không xóa làm gãy asset đã xuất bản. | Storage/upload/picker primitives đã có; SDK cấu hình sẵn; chỉ thêm metadata/rights/references và ghép UI. |

### G1-06 – Video VOD

[Nghiệp vụ và nghiệm thu gốc](../docs/01-gd1-vtv8online-v1/G1-06-video-vod.md) · Coding mọi scope: CSV **312h** · V1 **92–164h** · V2 **48h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G1-06-F001 | Quản lý bản phát VOD và trạng thái sẵn sàng | CORE | 20/32 | 6–10 | 12–20 | 2 | 6 | Asset-to-playback reference và readiness, dùng adapter G1-08; không viết adapter hai lần. | Một SDK player chung đã chọn; dữ liệu/config từ media adapter; không lặp player/workflow giữa các dòng. |
| G1-06-F002 | Xuất bản và danh mục video công khai | CORE | 24/32 | 6–10 | 10–20 | 3 | 6 | Delta video publish/list trên workflow và rights gate; không quy trình duyệt riêng. | Một SDK player chung đã chọn; dữ liệu/config từ media adapter; không lặp player/workflow giữa các dòng. |
| G1-06-F003 | Trình phát VOD trên website | CORE | 56/16 | 20–32 | 4–8 | 10 | 3 | Owner player SDK VOD/live; Controls/responsive/browser integration, BE chỉ config; test SDK thật quyết định upper. | Một SDK player chung đã chọn; dữ liệu/config từ media adapter; không lặp player/workflow giữa các dòng. |
| G1-06-F004 | Trang video và điều hướng tập/chương trình | CORE | 24/20 | 6–10 | 6–10 | 3 | 4 | Video detail/episode links dùng template chương trình; không trang chương trình khác. | Một SDK player chung đã chọn; dữ liệu/config từ media adapter; không lặp player/workflow giữa các dòng. |
| G1-06-F005 | Trạng thái lỗi phát và dự phòng UI | CORE | 24/12 | 6–12 | 4–8 | 3 | 2 | Owner UI lỗi/retry chung; bắt error từ SDK, không phát triển playback engine. | Một SDK player chung đã chọn; dữ liệu/config từ media adapter; không lặp player/workflow giữa các dòng. |
| G1-06-F006 | Phát lại sau sự kiện Livestream | CORE | 20/32 | 4–8 | 8–16 | 2 | 4 | Review/publish recording đã nhận; ingestion/webhook tính duy nhất G1-08-F007. | Một SDK player chung đã chọn; dữ liệu/config từ media adapter; không lặp player/workflow giữa các dòng. |

### G1-07 – Livestream và lịch phát

[Nghiệp vụ và nghiệm thu gốc](../docs/01-gd1-vtv8online-v1/G1-07-livestream-lich-phat.md) · Coding mọi scope: CSV **420h** · V1 **120–220h** · V2 **61h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G1-07-F001 | Danh mục chương trình/sự kiện livestream | CORE | 24/32 | 6–10 | 8–16 | 3 | 4 | Live session CRUD reference chương trình/sự kiện chung. | Calendar/state/health primitives và adapter có sẵn; thêm rule/transition/hiển thị tương ứng. |
| G1-07-F002 | Lập và thay đổi lịch phát | CORE | 40/40 | 12–20 | 16–28 | 6 | 8 | Calendar/timezone/channel overlap là logic riêng; dùng calendar library, không scheduling engine mới. | Calendar/state/health primitives và adapter có sẵn; thêm rule/transition/hiển thị tương ứng. |
| G1-07-F003 | Gắn nguồn phát/kênh và kiểm tra sẵn sàng | CORE | 20/28 | 4–8 | 8–16 | 2 | 4 | Gắn kênh và đọc readiness từ adapter; API provider thiếu không được giả ready. | Calendar/state/health primitives và adapter có sẵn; thêm rule/transition/hiển thị tương ứng. |
| G1-07-F004 | Trạng thái trước/đang/sau phát | CORE | 24/40 | 6–10 | 16–28 | 3 | 8 | State transitions từ provider/manual override; không suy trạng thái LIVE chỉ từ giờ lịch. | Calendar/state/health primitives và adapter có sẵn; thêm rule/transition/hiển thị tương ứng. |
| G1-07-F005 | Trang xem trực tiếp | CORE | 28/16 | 6–12 | 4–8 | 3 | 2 | Trang live dùng player lỗi/controls từ G1-06; chỉ metadata/upcoming UI mới. | Calendar/state/health primitives và adapter có sẵn; thêm rule/transition/hiển thị tương ứng. |
| G1-07-F006 | Lịch phát sóng công khai | CORE | 24/24 | 6–10 | 6–12 | 3 | 4 | Public schedule từ lịch đã có, list/filter chung; không calendar admin mới. | Calendar/state/health primitives và adapter có sẵn; thêm rule/transition/hiển thị tương ứng. |
| G1-07-F007 | Kết thúc live và chuyển sang phát lại | CORE | 20/32 | 4–8 | 12–20 | 2 | 6 | Close/link recording/draft VOD, idempotent; không receiver recording mới. | Calendar/state/health primitives và adapter có sẵn; thêm rule/transition/hiển thị tương ứng. |
| G1-07-F008 | Thông báo gián đoạn và trạng thái sự cố | CORE | 12/16 | 2–6 | 4–8 | 1 | 2 | Bind health signal vào error UI chung; fallback source chỉ nếu provider hỗ trợ. | Calendar/state/health primitives và adapter có sẵn; thêm rule/transition/hiển thị tương ứng. |

### G1-08 – Tích hợp Streaming

[Nghiệp vụ và nghiệm thu gốc](../docs/01-gd1-vtv8online-v1/G1-08-streaming-integration.md) · Coding mọi scope: CSV **356h** · V1 **130–290h** · V2 **85h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G1-08-F002 | Cấu hình kết nối đối tác và kênh phát | CORE | 8/48 | 0–4 | 20–40 | 1 | 12 | Một provider adapter/kênh với SDK/API rõ; secrets ngoài UI; không media server. SDK chưa chốt có thể vượt upper. | Một provider có sandbox và contract rõ; sinh adapter từ API schema, review callback/token/retry. |
| G1-08-F003 | Tích hợp nguồn RTMP/SRT ingest | CONDITIONAL | 8/40 | 0–4 | 16–40 | 1 | 10 | Chỉ provisioning/nhận stream key endpoint của provider; không code SRT/RTMP transport; CONDITIONAL. | Một provider có sandbox và contract rõ; sinh adapter từ API schema, review callback/token/retry. |
| G1-08-F004 | Playback manifest và tương thích trình phát | CORE | 12/48 | 4–8 | 20–40 | 2 | 12 | Owner playback manifest/token mapping một vendor; thư viện player do G1-06 sở hữu. | Một provider có sandbox và contract rõ; sinh adapter từ API schema, review callback/token/retry. |
| G1-08-F005 | Cấu hình transcoding và bitrate thích ứng | CONDITIONAL | 8/40 | 0–4 | 12–32 | 1 | 8 | Chỉ gọi API/config profile ABR có sẵn; không tự vận hành transcoder; CONDITIONAL. | Một provider có sandbox và contract rõ; sinh adapter từ API schema, review callback/token/retry. |
| G1-08-F006 | Kết nối Origin, lưu trữ phân phối và CDN | CORE | 0/24 | 0 | 4–12 | 0 | 3 | Code URL/routing media; cấu hình origin/CDN kỹ thuật nằm H01/vendor, không gộp vào code. | Một provider có sandbox và contract rõ; sinh adapter từ API schema, review callback/token/retry. |
| G1-08-F007 | Tiếp nhận bản ghi sau livestream | CORE | 8/56 | 4–8 | 28–56 | 2 | 20 | Signed recording webhook/dedupe/DAM association; khó ở callback thật, upper cũ hợp lý nếu provider bất ổn. | Một provider có sandbox và contract rõ; sinh adapter từ API schema, review callback/token/retry. |
| G1-08-F008 | Theo dõi trạng thái nguồn và cảnh báo cơ bản | CORE | 16/40 | 6–10 | 16–32 | 3 | 10 | Status/alert từ API vendor; không tự tạo observability hoặc QoE engine. | Một provider có sandbox và contract rõ; sinh adapter từ API schema, review callback/token/retry. |

### G1-09 – Báo cáo và thống kê

[Nghiệp vụ và nghiệm thu gốc](../docs/01-gd1-vtv8online-v1/G1-09-bao-cao-thong-ke.md) · Coding mọi scope: CSV **376h** · V1 **124–248h** · V2 **64h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G1-09-F001 | Tổng quan CMS/dashboard nội dung | CORE | 24/32 | 6–12 | 8–16 | 3 | 4 | CMS counts và chart từ query có sẵn; một dashboard, không BI platform. | Shared metric/query/chart/export; AI sinh SQL và UI, coder kiểm tra mẫu chống đếm đôi. |
| G1-09-F002 | Thống kê sản lượng theo tác giả và chuyên mục | CORE | 24/32 | 6–10 | 12–20 | 3 | 6 | Aggregate sản lượng theo author/category; chặn đếm đôi contributor, query reuse. | Shared metric/query/chart/export; AI sinh SQL và UI, coder kiểm tra mẫu chống đếm đôi. |
| G1-09-F003 | Thu thập lượt xem bài viết | CORE | 8/64 | 4–8 | 24–48 | 2 | 12 | Owner view ingestion/definition/bot dedupe cơ bản; không yêu cầu warehouse; không cắt thành counter ngây thơ. | Shared metric/query/chart/export; AI sinh SQL và UI, coder kiểm tra mẫu chống đếm đôi. |
| G1-09-F004 | Lượt xem video và livestream | CONDITIONAL | 24/48 | 8–16 | 20–48 | 4 | 12 | Một API/export vendor analytics và mapping definitions; chưa có mẫu dữ liệu thì giữ upper cũ. | Shared metric/query/chart/export; AI sinh SQL và UI, coder kiểm tra mẫu chống đếm đôi. |
| G1-09-F005 | Báo cáo theo thời gian và xuất dữ liệu | CORE | 24/32 | 6–10 | 8–16 | 3 | 4 | Filter/export một CSV/XLSX, dùng aggregate API và export primitive đã có. | Shared metric/query/chart/export; AI sinh SQL và UI, coder kiểm tra mẫu chống đếm đôi. |
| G1-09-F006 | Quy tắc thống kê, đối soát và khóa kỳ dữ liệu | OPTION | 24/40 | 6–12 | 16–32 | 3 | 8 | OPTION điều chỉnh/khóa kỳ thực tế; dùng audit/snapshot, tránh lẫn tính nhuận bút. | Shared metric/query/chart/export; AI sinh SQL và UI, coder kiểm tra mẫu chống đếm đôi. |

### G1-10 – Tính nhuận bút

[Nghiệp vụ và nghiệm thu gốc](../docs/01-gd1-vtv8online-v1/G1-10-nhuan-but.md) · Coding mọi scope: CSV **592h** · V1 **218–412h** · V2 **114h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G1-10-F001 | Quản lý người tham gia và vai trò trên sản phẩm | CORE | 24/32 | 6–10 | 8–16 | 3 | 4 | Contributor-role picker dùng hồ sơ G1-04; chỉ quan hệ đóng góp per sản phẩm. | Bộ quy chế/mẫu tiền đã có; dùng period/snapshot/audit/export chung, kiểm tra tính lại và rounding. |
| G1-10-F002 | Quản lý bảng mức và quy tắc nhuận bút | CORE | 32/56 | 10–16 | 20–40 | 4 | 10 | Fixed tariff/version/effective date đã có quy chế; không rule designer tổng quát. | Bộ quy chế/mẫu tiền đã có; dùng period/snapshot/audit/export chung, kiểm tra tính lại và rounding. |
| G1-10-F003 | Xác định sản phẩm đủ điều kiện tính | CORE | 24/48 | 6–10 | 20–40 | 3 | 10 | Eligibility giải thích được, dữ liệu đủ điều kiện; quy chế chưa chốt không được khóa lower. | Bộ quy chế/mẫu tiền đã có; dùng period/snapshot/audit/export chung, kiểm tra tính lại và rounding. |
| G1-10-F004 | Tạo kỳ và chạy tính nhuận bút | CORE | 40/88 | 12–24 | 48–88 | 6 | 32 | Period/snapshot/rounding/rerun là logic tiền thực; upper giữ cũ, cần bộ mẫu đối chiếu. | Bộ quy chế/mẫu tiền đã có; dùng period/snapshot/audit/export chung, kiểm tra tính lại và rounding. |
| G1-10-F005 | Bảng kê chi tiết theo người và sản phẩm | CORE | 32/40 | 10–16 | 12–24 | 4 | 6 | Statement list/drilldown dùng table/aggregate; không BI riêng. | Bộ quy chế/mẫu tiền đã có; dùng period/snapshot/audit/export chung, kiểm tra tính lại và rounding. |
| G1-10-F006 | Điều chỉnh và xử lý ngoại lệ | CORE | 24/40 | 6–12 | 20–36 | 3 | 10 | Điều chỉnh có audit/reason, không sửa giao dịch gốc; không kế toán kép. | Bộ quy chế/mẫu tiền đã có; dùng period/snapshot/audit/export chung, kiểm tra tính lại và rounding. |
| G1-10-F007 | Rà soát, phê duyệt và khóa kỳ | OPTION | 32/40 | 8–16 | 20–40 | 3 | 10 | OPTION approval/lock period incremental; fixed flow, không workflow platform. | Bộ quy chế/mẫu tiền đã có; dùng period/snapshot/audit/export chung, kiểm tra tính lại và rounding. |
| G1-10-F008 | Xuất bảng kê phục vụ chi trả | CORE | 16/24 | 4–8 | 8–16 | 2 | 4 | Một mẫu export đã duyệt, tổng tiền khớp; không payment/HRM. | Bộ quy chế/mẫu tiền đã có; dùng period/snapshot/audit/export chung, kiểm tra tính lại và rounding. |

### G1-11 – Chuyển đổi dữ liệu cũ

[Nghiệp vụ và nghiệm thu gốc](../docs/01-gd1-vtv8online-v1/G1-11-chuyen-doi-du-lieu.md) · Coding mọi scope: CSV **368h** · V1 **136–368h** · V2 **96h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G1-11-F002 | Trích xuất website/CMS/kho dữ liệu cũ | CORE | 0/64 | 0 | 24–64 | 0 | 16 | Một nguồn có export/API/schema dễ đọc; nếu phải reverse engineer/crawl có thể vượt cũ. Không đủ dữ liệu để kết luận 64 quá cao. | Một export/schema/sample tốt; chung pipeline ETL/checkpoint/retry, AI viết mapping/scripts; verify quyền và idempotency. |
| G1-11-F003 | Mapping dữ liệu sang cấu trúc mới | CORE | 0/80 | 0 | 32–80 | 0 | 24 | Map rich-text/media refs/URL/contributor vào schema mới; đo trên sample trước, upper giữ cũ. | Một export/schema/sample tốt; chung pipeline ETL/checkpoint/retry, AI viết mapping/scripts; verify quyền và idempotency. |
| G1-11-F004 | Làm sạch, chuẩn hóa và khử trùng | CORE | 0/80 | 0 | 24–80 | 0 | 16 | Scripts clean/dedupe có dữ liệu mẫu; chi phí làm sạch thủ công/chạy khối lượng tách riêng, không vì AI mà bỏ exception. | Một export/schema/sample tốt; chung pipeline ETL/checkpoint/retry, AI viết mapping/scripts; verify quyền và idempotency. |
| G1-11-F005 | Nhập dữ liệu nội dung/media có kiểm soát quyền | CORE | 0/80 | 0 | 32–80 | 0 | 24 | Idempotent import/rights pending/checkpoint; nguồn file/media khó thì giữ upper. | Một export/schema/sample tốt; chung pipeline ETL/checkpoint/retry, AI viết mapping/scripts; verify quyền và idempotency. |
| G1-11-F006 | Chạy thử, báo cáo lỗi và chạy lại lô | CORE | 0/64 | 0 | 24–64 | 0 | 16 | Dry-run/retry/error report CLI; thời gian chạy batch thực tế không tương đương giờ viết tool. | Một export/schema/sample tốt; chung pipeline ETL/checkpoint/retry, AI viết mapping/scripts; verify quyền và idempotency. |

### G2-01 – Tài khoản và định danh người xem

[Nghiệp vụ và nghiệm thu gốc](../docs/02-gd2-media-platform/G2-01-tai-khoan-nguoi-xem.md) · Coding mọi scope: CSV **524h** · V1 **150–304h** · V2 **75h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G2-01-F001 | Đăng ký tài khoản người xem | CORE | 32/56 | 8–16 | 16–32 | 3 | 8 | Audience registration một kênh, email verify/duplicate dùng auth library; identity CMS và audience vẫn tách quyền. | Dùng auth/consent/admin nền; API audience có policy riêng, kiểm tra session/account/data scope. |
| G2-01-F002 | Đăng nhập, đăng xuất và khôi phục tài khoản | CORE | 44/80 | 10–18 | 24–48 | 4 | 12 | Dùng session/auth primitives G1, mở audience policy/reset/revoke; không tự xây auth engine. | Dùng auth/consent/admin nền; API audience có policy riêng, kiểm tra session/account/data scope. |
| G2-01-F003 | Đăng nhập một lần SSO | CONDITIONAL | 20/64 | 4–8 | 20–48 | 2 | 12 | Một OIDC provider chuẩn; account linking/duplicate vẫn phải kiểm tra; CONDITIONAL. | Dùng auth/consent/admin nền; API audience có policy riêng, kiểm tra session/account/data scope. |
| G2-01-F004 | Hồ sơ và thiết lập cá nhân | CORE | 24/28 | 4–8 | 4–10 | 2 | 3 | Personal profile form/API ownership, dùng schema/form primitives. | Dùng auth/consent/admin nền; API audience có policy riêng, kiểm tra session/account/data scope. |
| G2-01-F005 | Chấp thuận dữ liệu và yêu cầu quyền riêng tư | CORE | 32/72 | 8–16 | 32–64 | 4 | 16 | Consent version và data request orchestration; dữ liệu trải G2-03/11, chưa có policy thì chưa chốt. | Dùng auth/consent/admin nền; API audience có policy riêng, kiểm tra session/account/data scope. |
| G2-01-F007 | Quản trị tài khoản người xem | CORE | 28/44 | 8–12 | 12–24 | 3 | 6 | Audience admin delta từ user management; PII scope/lock/audit, không CMS user thứ hai. | Dùng auth/consent/admin nền; API audience có policy riêng, kiểm tra session/account/data scope. |

### G2-02 – Theo dõi và yêu thích

[Nghiệp vụ và nghiệm thu gốc](../docs/02-gd2-media-platform/G2-02-theo-doi-yeu-thich.md) · Coding mọi scope: CSV **188h** · V1 **36–70h** · V2 **17h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G2-02-F001 | Theo dõi và bỏ theo dõi chương trình | CORE | 12/20 | 2–4 | 4–8 | 1 | 2 | Toggle follow idempotent, unique user-program và ownership; UI/button/API pattern dùng chung. | Một typed relation/toggle/library primitive, endpoint mỏng + unique keys/user scope. |
| G2-02-F002 | Lưu và bỏ yêu thích nội dung | CORE | 12/20 | 2–4 | 4–8 | 1 | 2 | Typed favorite relation cùng primitives follow, không copy hệ quan hệ mới. | Một typed relation/toggle/library primitive, endpoint mỏng + unique keys/user scope. |
| G2-02-F003 | Danh sách chương trình đang theo dõi | CORE | 20/24 | 4–8 | 4–8 | 2 | 2 | My Library tab/list/pagination dùng shared card và relation API. | Một typed relation/toggle/library primitive, endpoint mỏng + unique keys/user scope. |
| G2-02-F004 | Danh sách nội dung yêu thích | CORE | 12/24 | 4–6 | 4–8 | 1 | 2 | Favorite list delta của library; guard published/rights, không truy vấn cả DB riêng. | Một typed relation/toggle/library primitive, endpoint mỏng + unique keys/user scope. |
| G2-02-F005 | Chủ đề nội dung quan tâm | OPTION | 20/24 | 4–8 | 4–8 | 2 | 2 | OPTION topic selector taxonomy + account preferences; không taxonomy service mới. | Một typed relation/toggle/library primitive, endpoint mỏng + unique keys/user scope. |

### G2-03 – Lịch sử xem và playlist

[Nghiệp vụ và nghiệm thu gốc](../docs/02-gd2-media-platform/G2-03-lich-su-playlist.md) · Coding mọi scope: CSV **372h** · V1 **98–188h** · V2 **48h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G2-03-F001 | Ghi tiến độ xem theo tài khoản | CORE | 16/48 | 6–12 | 20–40 | 3 | 10 | Owner progress API, throttle/write conflict/multi-device; vẫn cần bảo vệ user boundary. | Shared progress/history/playlist primitives; chỉ API query/update/delete/order và UI delta. |
| G2-03-F002 | Danh sách xem tiếp | CORE | 20/24 | 4–8 | 6–12 | 2 | 3 | Query resumable và UI card reused; không lặp store watch-progress. | Shared progress/history/playlist primitives; chỉ API query/update/delete/order và UI delta. |
| G2-03-F003 | Xem lịch sử video đã xem | CORE | 24/28 | 6–10 | 6–12 | 2 | 3 | History list/time filter reused, không analytics ingestion khác. | Shared progress/history/playlist primitives; chỉ API query/update/delete/order và UI delta. |
| G2-03-F004 | Xóa lịch sử hoặc từng mục xem | CORE | 12/32 | 2–4 | 8–16 | 1 | 4 | Xóa history/progress theo account; coordination consent còn cần nhưng không form privacy thứ hai. | Shared progress/history/playlist primitives; chỉ API query/update/delete/order và UI delta. |
| G2-03-F005 | Tạo và quản lý danh sách phát cá nhân | CORE | 44/56 | 10–16 | 12–24 | 4 | 6 | Playlist CRUD và quan hệ item dùng list/form; owner/access guards giữ nguyên. | Shared progress/history/playlist primitives; chỉ API query/update/delete/order và UI delta. |
| G2-03-F006 | Sắp xếp và phát tuần tự danh sách cá nhân | CORE | 32/36 | 8–14 | 10–20 | 4 | 6 | Reorder component + next playable item; không player hoặc episode engine mới. | Shared progress/history/playlist primitives; chỉ API query/update/delete/order và UI delta. |

### G2-04 – Tìm kiếm và khám phá

[Nghiệp vụ và nghiệm thu gốc](../docs/02-gd2-media-platform/G2-04-tim-kiem-kham-pha.md) · Coding mọi scope: CSV **380h** · V1 **110–216h** · V2 **54h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G2-04-F001 | Chỉ mục tìm kiếm nội dung có cấu trúc | CORE | 0/80 | 0 | 24–48 | 0 | 12 | Một index public/content mapping; baseline giả định chưa chọn keyword G1; nếu đã có chỉ delta còn thấp hơn. | Một engine/index contract và worker chung; configure mapping/query/facets/sync, không viết search engine. |
| G2-04-F002 | Trang kết quả tìm kiếm thống nhất | CORE | 36/48 | 8–16 | 12–24 | 4 | 6 | Unified result view/query nhiều loại dùng cards/pagination; không viết search engine. | Một engine/index contract và worker chung; configure mapping/query/facets/sync, không viết search engine. |
| G2-04-F003 | Tự động gợi ý từ khóa khi nhập | OPTION | 24/24 | 6–10 | 8–16 | 2 | 4 | OPTION prefix query/debounce/keyboard dropdown từ component sẵn. | Một engine/index contract và worker chung; configure mapping/query/facets/sync, không viết search engine. |
| G2-04-F004 | Lọc kết quả theo loại và chủ đề | CORE | 24/40 | 6–10 | 12–24 | 3 | 6 | Filter chips/query facets trên index đã có; không reindex lần hai. | Một engine/index contract và worker chung; configure mapping/query/facets/sync, không viết search engine. |
| G2-04-F005 | Đồng bộ chỉ mục và tái tạo khi cần | CORE | 0/64 | 0 | 20–40 | 0 | 10 | Worker publish/gỡ/rebuild/retry chung queue, không dashboard kỹ thuật mới. | Một engine/index contract và worker chung; configure mapping/query/facets/sync, không viết search engine. |
| G2-04-F006 | Điều chỉnh mức liên quan/khả năng chịu lỗi gõ | OPTION | 8/32 | 2–4 | 12–24 | 1 | 6 | OPTION weights/typo rule cấu hình engine; chất lượng relevance cần sample, không hứa semantic. | Một engine/index contract và worker chung; configure mapping/query/facets/sync, không viết search engine. |

### G2-05 – Gợi ý và cá nhân hóa

[Nghiệp vụ và nghiệm thu gốc](../docs/02-gd2-media-platform/G2-05-goi-y-ca-nhan-hoa.md) · Coding mọi scope: CSV **256h** · V1 **68–134h** · V2 **34h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G2-05-F001 | Gợi ý nội dung liên quan theo metadata | CORE | 8/32 | 2–4 | 8–16 | 1 | 4 | Related widget sẵn, chỉ ranking/rights delta theo taxonomy; không recommender mới. | Query/rule ranker nhỏ trên metadata và user signals có sẵn; dùng shared feed/fallback. |
| G2-05-F002 | Gợi ý theo chương trình đang theo dõi | CORE | 24/40 | 6–10 | 8–16 | 3 | 4 | Follow-feed query từ G2-02, shared feed/card; không inbox notification. | Query/rule ranker nhỏ trên metadata và user signals có sẵn; dùng shared feed/fallback. |
| G2-05-F003 | Gợi ý theo chủ đề và lịch sử xem | CORE | 32/72 | 8–16 | 24–48 | 4 | 12 | Rules có tín hiệu/history + cold-start sẵn; mức này không gồm trained ML engine. | Query/rule ranker nhỏ trên metadata và user signals có sẵn; dùng shared feed/fallback. |
| G2-05-F005 | Quy tắc ưu tiên nội dung biên tập | OPTION | 16/32 | 4–8 | 8–16 | 2 | 4 | OPTION chỉ weights/editorial delta; nếu slot G1 đủ dùng, không triển khai dòng này. | Query/rule ranker nhỏ trên metadata và user signals có sẵn; dùng shared feed/fallback. |

### G2-06 – Nâng cấp VOD/livestream

[Nghiệp vụ và nghiệm thu gốc](../docs/02-gd2-media-platform/G2-06-nang-cap-vod-livestream.md) · Coding mọi scope: CSV **192h** · V1 **42–96h** · V2 **21h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G2-06-F001 | Tiếp tục phát từ vị trí đang xem | CORE | 24/8 | 4–8 | 0–4 | 2 | 0 | Resume dialog + seek dùng progress API; BE=0 khi API G2-03 đủ, không progress endpoint mới. | Bật/ghép controls của SDK player; progress/track/rendition/order APIs đã đủ, không code lại stores. |
| G2-06-F002 | Chọn chất lượng video theo nguồn cung cấp | CONDITIONAL | 28/20 | 8–16 | 4–12 | 4 | 2 | SDK quality selector + rendition metadata; CONDITIONAL, cần capability thực. | Bật/ghép controls của SDK player; progress/track/rendition/order APIs đã đủ, không code lại stores. |
| G2-06-F003 | Phụ đề và bản âm thanh thay thế | CONDITIONAL | 32/32 | 8–16 | 8–20 | 4 | 4 | Track menu/metadata trên player sẵn; không tạo transcript/subtitle bằng AI. | Bật/ghép controls của SDK player; progress/track/rendition/order APIs đã đủ, không code lại stores. |
| G2-06-F004 | Điều hướng tập kế tiếp và tự phát | CORE | 32/16 | 6–12 | 4–8 | 3 | 2 | Next-episode overlay/autoplay bổ sung, reuse order và entitlement, không player lần hai. | Bật/ghép controls của SDK player; progress/track/rendition/order APIs đã đủ, không code lại stores. |

### G2-07 – Bản tin và thông báo

[Nghiệp vụ và nghiệm thu gốc](../docs/02-gd2-media-platform/G2-07-ban-tin-thong-bao.md) · Coding mọi scope: CSV **500h** · V1 **156–294h** · V2 **77h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G2-07-F001 | Quản lý nội dung bản tin cập nhật | CORE | 24/32 | 6–10 | 8–16 | 3 | 4 | Chọn content/preview template dùng CMS, không CMS mới. | Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |
| G2-07-F002 | Sinh thông báo theo chương trình đang theo dõi | CORE | 12/52 | 4–8 | 20–40 | 2 | 10 | Event-trigger recipient filter/dedupe là owner mới; dùng queue/channels chung. | Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |
| G2-07-F003 | Hộp thư thông báo trong tài khoản | CORE | 36/48 | 10–16 | 16–28 | 5 | 8 | Owner account inbox/read state API; một component notification, không realtime chat. | Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |
| G2-07-F004 | Thông báo đẩy trên trình duyệt | CONDITIONAL | 24/64 | 6–12 | 24–48 | 3 | 12 | Web-push permission/subscription/service-worker/provider integration; CONDITIONAL, browser matrix thật. | Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |
| G2-07-F005 | Bản tin cập nhật qua email | OPTION | 24/64 | 6–12 | 20–40 | 3 | 10 | OPTION email opt-in/opt-out, provider/template rõ; không email marketing suite. | Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |
| G2-07-F006 | Thiết lập sở thích và tần suất thông báo | CORE | 24/32 | 6–10 | 8–16 | 2 | 4 | Form preferences chung consent/follow; only channels implemented. | Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |
| G2-07-F007 | Theo dõi trạng thái gửi và lỗi | CONDITIONAL | 24/40 | 6–10 | 16–28 | 3 | 8 | Delivery console/retry delta một provider; inbox core log sẵn, không duplicate orchestration. | Một notification queue/inbox/preferences/provider adapter chung; mỗi dòng chỉ thêm nguồn/kênh/trạng thái mới. |

### G2-08 – Bình luận và tương tác

[Nghiệp vụ và nghiệm thu gốc](../docs/02-gd2-media-platform/G2-08-binh-luan-tuong-tac.md) · Coding mọi scope: CSV **468h** · V1 **142–270h** · V2 **71h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G2-08-F001 | Bật/tắt tương tác theo loại nội dung | CONDITIONAL | 16/24 | 4–6 | 6–12 | 2 | 3 | Toggle/policy theo content với server gate; chỉ code, công phê duyệt vận hành/pháp lý tách riêng. | Shared CRUD/queue/state/rate-limit primitives; thêm comment domain và kiểm tra moderation/owner. |
| G2-08-F002 | Gửi và hiển thị bình luận | CONDITIONAL | 40/72 | 12–20 | 24–48 | 6 | 12 | Comment input/list + state/sanitize/owner; không realtime/chat platform. | Shared CRUD/queue/state/rate-limit primitives; thêm comment domain và kiểm tra moderation/owner. |
| G2-08-F003 | Phản hồi bình luận có kiểm soát | CONDITIONAL | 24/32 | 6–10 | 8–16 | 3 | 4 | One-level reply incremental trên comment CRUD; giới hạn nesting. | Shared CRUD/queue/state/rate-limit primitives; thêm comment domain và kiểm tra moderation/owner. |
| G2-08-F004 | Kiểm duyệt, ẩn và xóa bình luận | CONDITIONAL | 48/72 | 12–20 | 24–48 | 6 | 12 | Moderation queue/actions/audit, state model comment riêng nhưng reuse primitives. | Shared CRUD/queue/state/rate-limit primitives; thêm comment domain và kiểm tra moderation/owner. |
| G2-08-F005 | Báo cáo bình luận vi phạm | CONDITIONAL | 24/40 | 6–10 | 12–24 | 3 | 6 | Report reason/API/dedupe trên moderation queue; không ticketing system khác. | Shared CRUD/queue/state/rate-limit primitives; thêm comment domain và kiểm tra moderation/owner. |
| G2-08-F006 | Chống spam và kiểm soát lạm dụng | CONDITIONAL | 12/64 | 4–8 | 24–48 | 2 | 12 | Rate-limit/restriction/audit primitives; bot/fraud model nâng cao không gồm. | Shared CRUD/queue/state/rate-limit primitives; thêm comment domain và kiểm tra moderation/owner. |

### G2-09 – Thuê bao và thanh toán

[Nghiệp vụ và nghiệm thu gốc](../docs/02-gd2-media-platform/G2-09-thue-bao-thanh-toan.md) · Coding mọi scope: CSV **844h** · V1 **298–598h** · V2 **144h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G2-09-F001 | Danh mục gói thuê bao và quyền lợi | CONDITIONAL | 36/56 | 10–16 | 16–32 | 4 | 8 | Plan/benefit CRUD versions fixed, reused admin form; thương mại chỉ bật cùng entitlement đầy đủ. | Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| G2-09-F002 | Giá, chu kỳ và điều kiện đăng ký | CONDITIONAL | 24/40 | 6–10 | 12–24 | 3 | 6 | Price/cycle/effective-date schedule, không multi-currency pricing engine. | Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| G2-09-F003 | Đăng ký gói và khởi tạo thanh toán | CONDITIONAL | 52/96 | 12–24 | 40–80 | 6 | 16 | Một hosted gateway checkout, giữ payment intent/order và integration sandbox; không tự viết gateway. | Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| G2-09-F004 | Nhận trạng thái giao dịch và đối soát đơn | CONDITIONAL | 28/112 | 8–16 | 64–112 | 4 | 28 | Signed callback/dedupe/pending/refund reconciliation là phần khó; giữ upper cũ đến khi test sandbox. | Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| G2-09-F005 | Vòng đời thuê bao và ngày hết hạn | CONDITIONAL | 32/80 | 8–16 | 32–64 | 4 | 16 | Subscription lifecycle new domain/events; không dùng auth expiry thay entitlement. | Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| G2-09-F006 | Gia hạn, hủy và xử lý thanh toán thất bại | CONDITIONAL | 36/96 | 8–20 | 40–96 | 4 | 24 | Prepaid renewal thấp hơn; autocharge/cancel/proration chưa chốt nên upper giữ cũ. | Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| G2-09-F007 | Lịch sử thanh toán và chứng từ | CONDITIONAL | 28/48 | 6–12 | 8–20 | 3 | 4 | Transaction read/receipt refs từ provider, không xây hóa đơn điện tử. | Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |
| G2-09-F008 | Khuyến mại, dùng thử hoặc tặng quyền | OPTION | 32/48 | 8–16 | 20–40 | 4 | 10 | OPTION voucher/trial fixed constraints; không engine khuyến mại tổng quát, rights expiry giữ nguyên. | Một gateway SDK + shared payment/job/read views; code domain transition/callback/rule, kiểm tra cases sandbox. |

### G2-10 – Quyền xem và DRM

[Nghiệp vụ và nghiệm thu gốc](../docs/02-gd2-media-platform/G2-10-quyen-xem-drm.md) · Coding mọi scope: CSV **632h** · V1 **240–482h** · V2 **121h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G2-10-F001 | Phân loại nội dung miễn phí và trả phí | CONDITIONAL | 24/56 | 6–10 | 16–32 | 3 | 8 | Content-plan mapping + policy delta; use DAM rights and CMS, không rights metadata thứ hai. | Một entitlement service + media SDK đã có; thêm decision/token/DRM/session policies, test server guard. |
| G2-10-F002 | Kiểm tra quyền xem theo tài khoản | CONDITIONAL | 20/112 | 6–12 | 48–96 | 3 | 24 | Owner central entitlement/time/revoke/rights, bảo vệ server; không chỉ UI gate. | Một entitlement service + media SDK đã có; thêm decision/token/DRM/session policies, test server guard. |
| G2-10-F003 | Giao diện paywall và nâng cấp quyền xem | CONDITIONAL | 40/24 | 8–16 | 4–12 | 4 | 3 | Paywall component/offer thật; entitlement và giao dịch đã tính ở owner. | Một entitlement service + media SDK đã có; thêm decision/token/DRM/session policies, test server guard. |
| G2-10-F004 | Bảo vệ URL và phiên phát nội dung có quyền | CONDITIONAL | 16/96 | 4–8 | 40–80 | 2 | 20 | Private playback signed URL/session một provider; expiry/revoke thật và media integration test giữ. | Một entitlement service + media SDK đã có; thêm decision/token/DRM/session policies, test server guard. |
| G2-10-F005 | Tích hợp hệ thống DRM được cấp phép | CONDITIONAL | 36/96 | 12–24 | 48–96 | 6 | 24 | Một DRM vendor SDK, browser/device có license test; upper cũ chưa thể loại. | Một entitlement service + media SDK đã có; thêm decision/token/DRM/session policies, test server guard. |
| G2-10-F006 | Quản lý số thiết bị/phiên xem đồng thời | OPTION | 32/80 | 8–16 | 40–80 | 4 | 20 | OPTION device/session lease limit thực, concurrency/abnormal expiry; không cắt thành counter đơn giản. | Một entitlement service + media SDK đã có; thêm decision/token/DRM/session policies, test server guard. |

### G2-11 – Phân tích hành vi, QoE

[Nghiệp vụ và nghiệm thu gốc](../docs/02-gd2-media-platform/G2-11-analytics-qoe.md) · Coding mọi scope: CSV **672h** · V1 **224–458h** · V2 **113h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G2-11-F001 | Định nghĩa sự kiện hành vi và vòng đời phiên xem | CORE | 24/80 | 8–16 | 32–64 | 4 | 16 | Owner event taxonomy/ingestion/consent/dedupe; reuse G1 collector khi có, không thêm progress DB. | Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| G2-11-F002 | Ghi nhận và tổng hợp hành vi xem video | CORE | 8/72 | 4–8 | 24–48 | 2 | 12 | Aggregations watch metrics trên same events, không intake pipeline khác. | Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| G2-11-F003 | Dashboard người xem và hoạt động nội dung | CORE | 48/64 | 12–24 | 20–40 | 6 | 10 | Dashboard/chart/filter reused, definitions/permission giữ; không BI platform. | Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| G2-11-F004 | Thống kê hành trình tương tác nội dung | OPTION | 32/56 | 8–16 | 20–40 | 4 | 10 | OPTION funnel fixed events, không customer journey engine enterprise. | Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| G2-11-F005 | Đo chất lượng phát từ player và nguồn streaming | CONDITIONAL | 24/64 | 8–16 | 24–56 | 4 | 12 | QoE SDK mapping từ provider thật; không tự đo chỉ số không có API. | Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| G2-11-F006 | Kiểm soát lưu giữ và xóa dữ liệu hành vi | CORE | 8/56 | 0–4 | 24–48 | 1 | 12 | Retention/anonymize worker theo privacy policy sẵn; không privacy UI thứ hai. | Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| G2-11-F007 | Phân tích nhóm người xem và tỷ lệ quay lại | OPTION | 24/48 | 6–12 | 16–32 | 3 | 8 | OPTION cohort queries fixed và threshold; không CDP/segmentation suite. | Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |
| G2-11-F008 | Xuất báo cáo và kiểm tra chất lượng dữ liệu | CORE | 20/44 | 6–10 | 12–24 | 3 | 6 | Shared export/dq/source tags, không recommender analytics engine mới. | Một event/aggregate/retention/chart layer chung; sinh mapping/SQL/UI theo event contracts đã rõ. |

### G3-01 – Content → dịch vụ

[Nghiệp vụ và nghiệm thu gốc](../docs/03-gd3-content-commerce/G3-01-content-to-offer.md) · Coding mọi scope: CSV **336h** · V1 **70–138h** · V2 **39h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G3-01-F001 | Liên kết nội dung với sản phẩm/dịch vụ | CORE | 28/40 | 6–10 | 10–20 | 3 | 6 | CMS offering picker + typed relation + CTA capabilities, reuse CMS/taxonomy; không marketplace mới. | Shared relation/picker/card/detail + eligibility API; thêm props/CTA/disclosure, không layout thứ hai. |
| G3-01-F002 | Khối giới thiệu dịch vụ trong trang nội dung | CORE | 32/24 | 8–12 | 4–8 | 4 | 3 | One shared commerce card/CTA cho article/video; eligibility từ G3-03-F006. | Shared relation/picker/card/detail + eligibility API; thêm props/CTA/disclosure, không layout thứ hai. |
| G3-01-F003 | Trang giới thiệu sản phẩm hoặc dịch vụ liên quan | CORE | 36/40 | 10–16 | 10–20 | 5 | 6 | One offering detail layout trên shell G1; không catalog CRUD hay realtime booking quote. | Shared relation/picker/card/detail + eligibility API; thêm props/CTA/disclosure, không layout thứ hai. |
| G3-01-F004 | Phân biệt nội dung biên tập và nội dung thương mại | CORE | 20/24 | 2–6 | 4–8 | 1 | 2 | Nhãn và metadata disclosure, reused editor và audit; không workflow/contract mới. | Shared relation/picker/card/detail + eligibility API; thêm props/CTA/disclosure, không layout thứ hai. |
| G3-01-F006 | Liên kết sâu và mã QR tới trang dịch vụ | OPTION | 16/24 | 2–6 | 2–8 | 1 | 2 | QR/link thư viện, safe destination; không link shortener platform. | Shared relation/picker/card/detail + eligibility API; thêm props/CTA/disclosure, không layout thứ hai. |
| G3-01-F007 | Đề xuất dịch vụ liên quan theo địa danh/chủ đề | OPTION | 20/32 | 4–8 | 8–16 | 2 | 4 | Rules/taxonomy query và card reused; không AI recommendation. | Shared relation/picker/card/detail + eligibility API; thêm props/CTA/disclosure, không layout thứ hai. |

### G3-02 – Lead và bàn giao

[Nghiệp vụ và nghiệm thu gốc](../docs/03-gd3-content-commerce/G3-02-lead-management.md) · Coding mọi scope: CSV **556h** · V1 **158–302h** · V2 **81h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G3-02-F001 | Biểu mẫu đăng ký tư vấn/liên hệ sản phẩm | CORE | 32/64 | 8–16 | 20–40 | 4 | 10 | Lead form + create/idempotent/rate-limit; use existing auth/eligibility, không CRM suite. | Forms/queue/consent/audit từ nền; chỉ lead transitions và partner/data-scope nghiệp vụ. |
| G3-02-F002 | Thông báo và ghi nhận đồng ý chia sẻ thông tin | CORE | 20/44 | 4–8 | 12–24 | 2 | 6 | Consent snapshot purpose/partner trên G2 primitives; không consent portal lần hai. | Forms/queue/consent/audit từ nền; chỉ lead transitions và partner/data-scope nghiệp vụ. |
| G3-02-F004 | Hộp tiếp nhận lead của VTV8 | CORE | 48/64 | 12–20 | 20–40 | 6 | 10 | Lead queue/detail/PII permission/audit reused admin; state model fixed. | Forms/queue/consent/audit từ nền; chỉ lead transitions và partner/data-scope nghiệp vụ. |
| G3-02-F005 | Phân công và chuyển giao lead cho đối tác | CORE | 40/76 | 8–16 | 28–56 | 4 | 16 | Manual assignment/forward/ack, không partner portal hoặc omnichannel automation. | Forms/queue/consent/audit từ nền; chỉ lead transitions và partner/data-scope nghiệp vụ. |
| G3-02-F006 | Cập nhật tiến độ tư vấn và kết quả lead | CORE | 28/48 | 6–12 | 16–28 | 3 | 8 | Fixed status/contact-log transitions; không nhầm lead qualified với giao dịch tiền. | Forms/queue/consent/audit từ nền; chỉ lead transitions và partner/data-scope nghiệp vụ. |
| G3-02-F007 | Thống kê chuyển đổi từ nội dung sang lead | CORE | 36/56 | 8–14 | 16–28 | 4 | 8 | Aggregate lead metrics/export từ records có nguồn; reuse reporting/chart. | Forms/queue/consent/audit từ nền; chỉ lead transitions và partner/data-scope nghiệp vụ. |

### G3-03 – Đối tác và offering

[Nghiệp vụ và nghiệm thu gốc](../docs/03-gd3-content-commerce/G3-03-partner-offer-directory.md) · Coding mọi scope: CSV **628h** · V1 **178–348h** · V2 **94h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G3-03-F001 | Hồ sơ đơn vị đối tác | CORE | 40/72 | 10–18 | 20–36 | 5 | 10 | Partner master CRUD/legal id/dedupe, reusable admin/media; không xây CRM tổ chức. | Schema/admin/evidence/workflow nền; partner/offering fields và một sync adapter có sample. |
| G3-03-F002 | Danh mục offering sản phẩm/dịch vụ mức giới thiệu | CORE | 52/88 | 16–24 | 24–40 | 8 | 12 | Offering form/media/taxonomy/CTA, không SKU/stock/booking slot; reuse editor. | Schema/admin/evidence/workflow nền; partner/offering fields và một sync adapter có sample. |
| G3-03-F003 | Thẩm định và phê duyệt đối tác/offering | CORE | 44/72 | 10–18 | 20–40 | 5 | 10 | Fixed approval/evidence on workflow primitives; thẩm định con người tính riêng. | Schema/admin/evidence/workflow nền; partner/offering fields và một sync adapter có sample. |
| G3-03-F004 | Quản lý thông tin liên hệ và điều khoản hợp tác | CORE | 28/40 | 6–10 | 10–20 | 3 | 6 | Contact/contract metadata and permissions, không e-contract hoặc hợp đồng engine. | Schema/admin/evidence/workflow nền; partner/offering fields và một sync adapter có sample. |
| G3-03-F006 | Quản lý chất lượng, tạm khóa và ngừng cung cấp | CORE | 24/60 | 6–10 | 20–36 | 3 | 10 | Owner eligibility/suspended/expiry check + chặn CTA/lead mới; không lặp guards mỗi module. | Schema/admin/evidence/workflow nền; partner/offering fields và một sync adapter có sample. |
| G3-03-F007 | Kết nối dữ liệu đối tác từ API tự động | CONDITIONAL | 20/88 | 4–8 | 32–88 | 2 | 20 | Một API sync có schema, retry/mapping; chưa thấy sandbox giữ upper cũ. | Schema/admin/evidence/workflow nền; partner/offering fields và một sync adapter có sample. |

### G3-04 – Affiliate & tracking

[Nghiệp vụ và nghiệm thu gốc](../docs/03-gd3-content-commerce/G3-04-affiliate-tracking.md) · Coding mọi scope: CSV **584h** · V1 **194–388h** · V2 **97h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G3-04-F001 | Chương trình affiliate và đường dẫn giới thiệu | CONDITIONAL | 32/64 | 8–16 | 20–40 | 4 | 10 | Campaign/referral link CRUD trên partner master; không affiliate network engine. | Shared redirect/event/attribution/callback framework; contract/rules/samples đã chốt. |
| G3-04-F002 | Ghi nhận nhấp và phiên giới thiệu | CONDITIONAL | 12/56 | 4–8 | 24–48 | 2 | 12 | Redirect/click id/consent/anti-bot cơ bản, reuse events; click không tiền. | Shared redirect/event/attribution/callback framework; contract/rules/samples đã chốt. |
| G3-04-F003 | Quy tắc quy kết và thời hạn attribution | CONDITIONAL | 24/64 | 6–12 | 24–48 | 3 | 12 | Fixed attribution window/rule đã ký; không identity graph xuyên site. | Shared redirect/event/attribution/callback framework; contract/rules/samples đã chốt. |
| G3-04-F004 | Nhận conversion/callback từ đối tác | CONDITIONAL | 28/104 | 6–12 | 48–104 | 3 | 24 | One authenticated callback/file schema + idempotency; giữ upper nếu vendor data chưa rõ. | Shared redirect/event/attribution/callback framework; contract/rules/samples đã chốt. |
| G3-04-F005 | Theo dõi trạng thái chuyển đổi affiliate | CONDITIONAL | 32/64 | 8–14 | 16–32 | 4 | 8 | Conversion state/evidence reused tables, không commission ledger. | Shared redirect/event/attribution/callback framework; contract/rules/samples đã chốt. |
| G3-04-F006 | Báo cáo hiệu quả affiliate theo nguồn nội dung | CONDITIONAL | 40/64 | 10–18 | 20–36 | 5 | 10 | Click/conversion dashboard trên shared metrics; không finance reporting engine khác. | Shared redirect/event/attribution/callback framework; contract/rules/samples đã chốt. |

### G3-05 – Booking dịch vụ

[Nghiệp vụ và nghiệm thu gốc](../docs/03-gd3-content-commerce/G3-05-travel-booking.md) · Coding mọi scope: CSV **876h** · V1 **310–676h** · V2 **167h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G3-05-F001 | Danh sách dịch vụ du lịch có thể đặt | OPTION | 40/32 | 8–16 | 8–16 | 4 | 4 | OPTION listing bookable dựa offering/card sẵn; không trang detail thứ hai. | Một booking provider với SDK/contracts/sandbox; giữ quote authority/idempotency/state/cancel/retry thật. |
| G3-05-F003 | Chuyển hướng đặt dịch vụ tại hệ thống đối tác | CONDITIONAL | 16/24 | 2–4 | 4–8 | 1 | 2 | Safe outbound CTA + ref param, không API booking hoặc payment. | Một booking provider với SDK/contracts/sandbox; giữ quote authority/idempotency/state/cancel/retry thật. |
| G3-05-F004 | Kiểm tra giá và tình trạng chỗ qua API đối tác | CONDITIONAL | 40/112 | 10–20 | 48–96 | 5 | 24 | Vendor quote/slots + TTL/timezone/stale-price check, một provider; sandbox quyết định. | Một booking provider với SDK/contracts/sandbox; giữ quote authority/idempotency/state/cancel/retry thật. |
| G3-05-F005 | Tạo yêu cầu đặt chỗ trực tiếp qua API | CONDITIONAL | 52/144 | 12–24 | 64–144 | 6 | 32 | Real booking idempotency/reference/error/authority, giữ upper cũ khi vendor chưa chốt. | Một booking provider với SDK/contracts/sandbox; giữ quote authority/idempotency/state/cancel/retry thật. |
| G3-05-F006 | Đồng bộ và hiển thị trạng thái đặt chỗ | CONDITIONAL | 40/104 | 8–16 | 40–96 | 4 | 24 | Webhook/poll state/retry trên adapter, UI status incremental, không order TMĐT. | Một booking provider với SDK/contracts/sandbox; giữ quote authority/idempotency/state/cancel/retry thật. |
| G3-05-F007 | Hủy/đổi lịch theo chính sách bên cung cấp | CONDITIONAL | 40/112 | 10–20 | 48–112 | 5 | 28 | Vendor cancel/reschedule rules; không mặc định refund local. Upper giữ cũ. | Một booking provider với SDK/contracts/sandbox; giữ quote authority/idempotency/state/cancel/retry thật. |
| G3-05-F008 | Theo dõi lỗi và đối soát booking với đối tác | CONDITIONAL | 32/88 | 8–16 | 40–88 | 4 | 24 | Orphan/reconciliation/retry tools trên booking state, không finance ledger. | Một booking provider với SDK/contracts/sandbox; giữ quote authority/idempotency/state/cancel/retry thật. |

### G3-06 – Seller, SKU & inventory

[Nghiệp vụ và nghiệm thu gốc](../docs/03-gd3-content-commerce/G3-06-marketplace-catalog.md) · Coding mọi scope: CSV **852h** · V1 **234–454h** · V2 **115h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G3-06-F001 | Đánh giá và kích hoạt đối tác thành người bán | CONDITIONAL | 32/64 | 8–14 | 16–32 | 4 | 8 | Activation relation seller-partner/evidence; không seller master khác. | Commerce primitives cho catalog/price/stock, reuse partner/DAM; code seller policy và reservation semantics. |
| G3-06-F002 | Danh mục sản phẩm bán trực tiếp | CONDITIONAL | 48/104 | 14–24 | 32–64 | 6 | 16 | Basic SKU/variants/product owner mới thật, reuse form/media/taxonomy; không PIM enterprise. | Commerce primitives cho catalog/price/stock, reuse partner/DAM; code seller policy và reservation semantics. |
| G3-06-F003 | Giá niêm yết và điều kiện bán hàng | CONDITIONAL | 40/72 | 8–14 | 20–40 | 4 | 10 | Price/effective conditions, order snapshot tính G3-07; không pricing engine rộng. | Commerce primitives cho catalog/price/stock, reuse partner/DAM; code seller policy và reservation semantics. |
| G3-06-F004 | Quản lý tồn kho cơ bản | CONDITIONAL | 48/128 | 12–20 | 64–128 | 5 | 32 | Inventory reservation/concurrency/release/timeout là khó; upper giữ, không CRUD số tồn đơn thuần. | Commerce primitives cho catalog/price/stock, reuse partner/DAM; code seller policy và reservation semantics. |
| G3-06-F005 | Tổ chức danh mục và lọc sản phẩm | CONDITIONAL | 44/64 | 10–18 | 12–24 | 5 | 6 | Catalog filters/cards dựa taxonomy, không category tree khác. | Commerce primitives cho catalog/price/stock, reuse partner/DAM; code seller policy và reservation semantics. |
| G3-06-F006 | Kiểm duyệt thông tin và quyền sử dụng hình ảnh sản phẩm | CONDITIONAL | 40/72 | 8–16 | 16–32 | 4 | 8 | Product review/evidence dùng approval/DAM rights; không công xác minh giấy tờ trong code. | Commerce primitives cho catalog/price/stock, reuse partner/DAM; code seller policy và reservation semantics. |
| G3-06-F007 | Trang gian hàng người bán mức cơ bản | OPTION | 48/48 | 8–16 | 6–12 | 4 | 3 | OPTION public seller page reused layout/list, không seller portal. | Commerce primitives cho catalog/price/stock, reuse partner/DAM; code seller policy và reservation semantics. |

### G3-07 – Đơn hàng và thanh toán

[Nghiệp vụ và nghiệm thu gốc](../docs/03-gd3-content-commerce/G3-07-cart-order-payment.md) · Coding mọi scope: CSV **1.088h** · V1 **310–660h** · V2 **163h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G3-07-F001 | Giỏ hàng và điều chỉnh số lượng | CONDITIONAL | 48/80 | 12–24 | 24–48 | 6 | 12 | Single seller cart/quantities/eligibility; không split-order/multi-merchant checkout. | Cart/order/payment primitives và gateway adapter đã chạy; thêm CommerceOrder mapping/stock/payment checks. |
| G3-07-F002 | Thu thập địa chỉ và thông tin giao hàng | CONDITIONAL | 32/48 | 6–10 | 8–16 | 3 | 4 | Address/contact form ownership/PII, reuse validation/location fields; không geocoding. | Cart/order/payment primitives và gateway adapter đã chạy; thêm CommerceOrder mapping/stock/payment checks. |
| G3-07-F003 | Tính phí giao hàng và cách nhận hàng | CONDITIONAL | 32/80 | 6–12 | 16–32 | 3 | 8 | Fixed shipping table/pickup, không carrier API hoặc engine tuyến. | Cart/order/payment primitives và gateway adapter đã chạy; thêm CommerceOrder mapping/stock/payment checks. |
| G3-07-F004 | Tạo đơn hàng với giá snapshot và kiểm tra tồn | CONDITIONAL | 56/144 | 12–24 | 64–144 | 6 | 36 | Order snapshot/atomic stock/idempotent events; domain riêng, giữ upper cho concurrency. | Cart/order/payment primitives và gateway adapter đã chạy; thêm CommerceOrder mapping/stock/payment checks. |
| G3-07-F005 | Tích hợp thanh toán đơn hàng TMĐT | CONDITIONAL | 44/120 | 10–20 | 40–96 | 5 | 20 | Reuse gateway G2 nếu compatible, chỉ CommerceOrder adapter delta; không subscription order. | Cart/order/payment primitives và gateway adapter đã chạy; thêm CommerceOrder mapping/stock/payment checks. |
| G3-07-F006 | Nhận kết quả và đối soát thanh toán đơn hàng | CONDITIONAL | 36/136 | 8–16 | 48–112 | 4 | 28 | Reuse signed callback handler, thêm order payment authority/reconcile; không bỏ late/duplicate handling. | Cart/order/payment primitives và gateway adapter đã chạy; thêm CommerceOrder mapping/stock/payment checks. |
| G3-07-F007 | Tra cứu đơn hàng và trạng thái mua | CONDITIONAL | 48/72 | 12–20 | 12–24 | 6 | 6 | Order history/detail/status từ API, shared inbox events, không notification system khác. | Cart/order/payment primitives và gateway adapter đã chạy; thêm CommerceOrder mapping/stock/payment checks. |
| G3-07-F009 | Mã ưu đãi và điều chỉnh giá khi đặt hàng | OPTION | 32/80 | 8–14 | 24–48 | 4 | 12 | OPTION SKU/cart voucher constraints, reusable promo primitives nhưng domain rule mới. | Cart/order/payment primitives và gateway adapter đã chạy; thêm CommerceOrder mapping/stock/payment checks. |

### G3-08 – Fulfillment & hậu mãi

[Nghiệp vụ và nghiệm thu gốc](../docs/03-gd3-content-commerce/G3-08-fulfillment-returns-support.md) · Coding mọi scope: CSV **904h** · V1 **290–630h** · V2 **155h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G3-08-F001 | Bảng điều hành tiếp nhận và xử lý đơn | CONDITIONAL | 56/120 | 14–28 | 40–80 | 8 | 20 | Fulfillment board/dispatch/manual tracking fixed states; order state machine source G3-07, không viết lại. | Shared order/workflow/return/refund primitives; một carrier contract, coder kiểm tra side effects. |
| G3-08-F003 | Tích hợp vận chuyển và mã theo dõi | OPTION | 32/112 | 8–16 | 40–112 | 4 | 24 | OPTION một carrier adapter khi sandbox rõ; upper giữ cũ cho nhiều ngoại lệ. | Shared order/workflow/return/refund primitives; một carrier contract, coder kiểm tra side effects. |
| G3-08-F004 | Xử lý yêu cầu hủy đơn | CONDITIONAL | 40/96 | 10–18 | 40–88 | 5 | 20 | Cancel request/approval/return stock/payment reversal; integration khó, không một nút update status. | Shared order/workflow/return/refund primitives; một carrier contract, coder kiểm tra side effects. |
| G3-08-F005 | Đổi trả và hoàn tiền | CONDITIONAL | 56/144 | 14–28 | 64–144 | 8 | 36 | Return/refund evidence/partial policy, giữ upper đến khi gateway và RMA policy chốt. | Shared order/workflow/return/refund primitives; một carrier contract, coder kiểm tra side effects. |
| G3-08-F006 | Tiếp nhận khiếu nại và tranh chấp | CONDITIONAL | 48/96 | 12–20 | 24–48 | 6 | 12 | Order-scoped ticket/contact timeline, không triển khai helpdesk riêng. | Shared order/workflow/return/refund primitives; một carrier contract, coder kiểm tra side effects. |
| G3-08-F007 | Theo dõi thời hạn xử lý và chất lượng người bán | OPTION | 40/64 | 8–16 | 16–32 | 4 | 8 | OPTION SLA/seller aggregate dùng existing order metrics; không BI enterprise. | Shared order/workflow/return/refund primitives; một carrier contract, coder kiểm tra side effects. |

### G3-09 – Đối soát hoa hồng

[Nghiệp vụ và nghiệm thu gốc](../docs/03-gd3-content-commerce/G3-09-commerce-reconciliation.md) · Coding mọi scope: CSV **928h** · V1 **350–702h** · V2 **173h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G3-09-F001 | Quy tắc hoa hồng theo đối tác và loại giao dịch | CONDITIONAL | 40/88 | 10–18 | 32–64 | 4 | 16 | Commission versioned rate/eligibility từ contract fixed; không generic financial rules platform. | Shared period/snapshot/audit/export từ nền, commission rule riêng đã chốt; sample đối soát đầy đủ. |
| G3-09-F002 | Tiếp nhận dữ liệu đối soát đối tác | CONDITIONAL | 48/128 | 12–24 | 64–128 | 6 | 32 | Finance matching đối tác/file/source refs thật; khác raw conversion receiver, upper giữ khi data chưa biết. | Shared period/snapshot/audit/export từ nền, commission rule riêng đã chốt; sample đối soát đầy đủ. |
| G3-09-F003 | Tính và lưu kết quả hoa hồng theo kỳ | CONDITIONAL | 48/160 | 14–28 | 80–160 | 6 | 40 | Period/snapshot/reversal/rounding engine là tiền; không giảm sâu khi chưa có đối chiếu mẫu. | Shared period/snapshot/audit/export từ nền, commission rule riêng đã chốt; sample đối soát đầy đủ. |
| G3-09-F004 | Bảng kê và xác nhận đối soát với đối tác | CONDITIONAL | 40/96 | 10–20 | 32–64 | 5 | 16 | Statement/ack/dispute trên existing data; không payout hoặc seller settlement. | Shared period/snapshot/audit/export từ nền, commission rule riêng đã chốt; sample đối soát đầy đủ. |
| G3-09-F005 | Báo cáo thương mại theo nội dung/đối tác | CONDITIONAL | 48/88 | 12–20 | 24–48 | 6 | 12 | Verified-revenue dashboard reused metrics, không click=tiền và không collector mới. | Shared period/snapshot/audit/export từ nền, commission rule riêng đã chốt; sample đối soát đầy đủ. |
| G3-09-F006 | Điều chỉnh, truy thu và xử lý tranh chấp đối soát | OPTION | 40/104 | 12–24 | 48–104 | 6 | 24 | OPTION adjustment/audit/approval, không sửa thẳng financial source; upper giữ. | Shared period/snapshot/audit/export từ nền, commission rule riêng đã chốt; sample đối soát đầy đủ. |

### G3-10 – Dịch vụ B2B/tài trợ

[Nghiệp vụ và nghiệm thu gốc](../docs/03-gd3-content-commerce/G3-10-sponsored-b2b-packages.md) · Coding mọi scope: CSV **556h** · V1 **124–246h** · V2 **62h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G3-10-F001 | Danh mục gói dịch vụ truyền thông B2B | OPTION | 40/56 | 8–16 | 12–24 | 4 | 6 | OPTION B2B package catalog fixed trên existing offering primitives. | Partner/lead/offer/workflow/checklist nền; chỉ schema/fields/relations/actions bổ sung. |
| G3-10-F002 | Tiếp nhận yêu cầu quảng bá hoặc tài trợ | OPTION | 16/28 | 2–6 | 4–8 | 1 | 2 | Lead service G3-02 đã có, thêm field B2B; không lead engine khác. | Partner/lead/offer/workflow/checklist nền; chỉ schema/fields/relations/actions bổ sung. |
| G3-10-F003 | Lập và phê duyệt đề xuất truyền thông | OPTION | 48/88 | 12–24 | 24–48 | 6 | 12 | Proposal/version/approval reused workflow fixed; không e-sign/ERP. | Partner/lead/offer/workflow/checklist nền; chỉ schema/fields/relations/actions bổ sung. |
| G3-10-F004 | Liên kết nội dung tài trợ và nhãn hợp tác | OPTION | 20/40 | 4–8 | 6–12 | 2 | 3 | Campaign-content relation + shared disclosure label; không composer mới. | Partner/lead/offer/workflow/checklist nền; chỉ schema/fields/relations/actions bổ sung. |
| G3-10-F005 | Theo dõi bàn giao nội dung, chương trình và báo cáo | OPTION | 40/64 | 10–18 | 16–32 | 5 | 8 | Delivery checklist/metrics from G1/G2; không tự tạo ad performance đo không được. | Partner/lead/offer/workflow/checklist nền; chỉ schema/fields/relations/actions bổ sung. |
| G3-10-F006 | Bảng quản lý khách hàng và hợp đồng B2B tối thiểu | OPTION | 44/72 | 10–18 | 16–32 | 5 | 8 | B2B profile/contract refs use partner master, không CRM entity thứ hai. | Partner/lead/offer/workflow/checklist nền; chỉ schema/fields/relations/actions bổ sung. |

### G4-01 – Ứng dụng Mobile iOS/Android

[Nghiệp vụ và nghiệm thu gốc](../docs/04-gd4-digital-ecosystem/G4-01-mobile-app.md) · Coding mọi scope: CSV **1.256h** · V1 **344–820h** · V2 **208h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G4-01-F001 | Nền tảng ứng dụng và điều hướng | CORE | 120/32 | 32–56 | 4–12 | 16 | 4 | One cross-platform starter app/navigation/lifecycle/network config; release/signing riêng H01. Không responsive web thay app. | Cross-platform starter + generated API clients, shared UI state; media/push/offline SDK đã chọn. |
| G4-01-F002 | Tài khoản và phiên người xem | CORE | 56/32 | 12–24 | 4–12 | 6 | 3 | Audience API sẵn, mobile secure storage/refresh/logout mới; không auth domain mới. | Cross-platform starter + generated API clients, shared UI state; media/push/offline SDK đã chọn. |
| G4-01-F003 | Trang chủ, chuyên mục, tìm kiếm | CORE | 120/32 | 32–56 | 4–16 | 16 | 4 | Feed/browse/search/detail components trên API có sẵn; số template và renderer phải chốt. | Cross-platform starter + generated API clients, shared UI state; media/push/offline SDK đã chọn. |
| G4-01-F004 | Phát VOD và livestream trên mobile | CORE | 128/64 | 48–128 | 12–64 | 24 | 12 | SDK mobile player hai OS + playback/resume/error; khả năng DRM/thiết bị thật quyết định upper. | Cross-platform starter + generated API clients, shared UI state; media/push/offline SDK đã chọn. |
| G4-01-F005 | Thư viện cá nhân và tiếp tục xem | CORE | 80/32 | 20–40 | 4–12 | 10 | 3 | Mobile library views qua G2 APIs, không follow/history/playlist backend mới. | Cross-platform starter + generated API clients, shared UI state; media/push/offline SDK đã chọn. |
| G4-01-F006 | Thông báo đẩy trên điện thoại | CONDITIONAL | 64/80 | 20–40 | 24–56 | 10 | 16 | Native permission/token/deep link và provider adapter mới; reuse notification engine. | Cross-platform starter + generated API clients, shared UI state; media/push/offline SDK đã chọn. |
| G4-01-F007 | Quyền xem premium và membership trên app | CONDITIONAL | 80/64 | 20–40 | 16–64 | 10 | 16 | Paywall/entitlement UI nếu API đủ; IAP/store billing mới chưa chốt có thể vượt range này. | Cross-platform starter + generated API clients, shared UI state; media/push/offline SDK đã chọn. |
| G4-01-F008 | Trải nghiệm nội dung tới dịch vụ thương mại | CONDITIONAL | 72/32 | 20–40 | 8–16 | 10 | 4 | Mobile offering/lead/referral qua API G3 đã bật; không tự cộng checkout. | Cross-platform starter + generated API clients, shared UI state; media/push/offline SDK đã chọn. |
| G4-01-F009 | Tải nội dung xem offline | OPTION | 112/56 | 40–88 | 24–56 | 24 | 20 | OPTION offline expiry/license/deletion cần SDK/provider quyền thật, không download file công khai đơn giản. | Cross-platform starter + generated API clients, shared UI state; media/push/offline SDK đã chọn. |

### G4-02 – Ứng dụng Smart TV

[Nghiệp vụ và nghiệm thu gốc](../docs/04-gd4-digital-ecosystem/G4-02-smart-tv.md) · Coding mọi scope: CSV **1.160h** · V1 **336–784h** · V2 **200h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G4-02-F001 | Bộ ứng dụng TV và ma trận thiết bị | CONDITIONAL | 128/40 | 40–80 | 8–24 | 24 | 6 | One TV OS pilot starter/package/performance baseline; nhiều OS/thiết bị không cùng mức giá. | Một TV OS với SDK/focus/pairing scaffold chạy được trên thiết bị; UI/controls vẫn theo TV. |
| G4-02-F002 | Điều hướng remote và focus/accessibility | CONDITIONAL | 112/16 | 32–64 | 0–4 | 20 | 0 | D-pad/back/focus/idle UX thật khác web; reuse OS focus framework, không tự viết accessibility engine. | Một TV OS với SDK/focus/pairing scaffold chạy được trên thiết bị; UI/controls vẫn theo TV. |
| G4-02-F003 | Trang khám phá chương trình và tìm kiếm trên TV | CONDITIONAL | 96/32 | 32–56 | 4–12 | 16 | 4 | Lean-back shelves/search/keyboard trên API sẵn, chưa voice. | Một TV OS với SDK/focus/pairing scaffold chạy được trên thiết bị; UI/controls vẫn theo TV. |
| G4-02-F004 | Phát VOD/live trên thiết bị TV | CONDITIONAL | 160/88 | 64–160 | 24–88 | 40 | 24 | TV native/media SDK/audio/subtitle/DRM/device constraints; chưa có thiết bị không kết luận 160 FE thừa. | Một TV OS với SDK/focus/pairing scaffold chạy được trên thiết bị; UI/controls vẫn theo TV. |
| G4-02-F005 | Đăng nhập bằng mã liên kết thiết bị | CONDITIONAL | 64/104 | 20–40 | 40–88 | 10 | 20 | Pairing code expiration/poll/security/device token thật, không reuse mật khẩu UI trực tiếp. | Một TV OS với SDK/focus/pairing scaffold chạy được trên thiết bị; UI/controls vẫn theo TV. |
| G4-02-F006 | Kiểm tra gói và quyền xem trên TV | CONDITIONAL | 72/64 | 20–40 | 16–40 | 10 | 8 | TV entitlement UX on G2; không subscription/payment service khác. | Một TV OS với SDK/focus/pairing scaffold chạy được trên thiết bị; UI/controls vẫn theo TV. |
| G4-02-F007 | Theo dõi phiên phát và chất lượng TV | CONDITIONAL | 24/64 | 8–16 | 12–32 | 4 | 6 | Client telemetry SDK maps G2 schema; không kho analytics mới. | Một TV OS với SDK/focus/pairing scaffold chạy được trên thiết bị; UI/controls vẫn theo TV. |
| G4-02-F008 | Tìm kiếm giọng nói bằng tính năng TV OS | OPTION | 64/32 | 16–32 | 0–8 | 8 | 0 | OPTION TV OS voice API ready, không STT provider mới. | Một TV OS với SDK/focus/pairing scaffold chạy được trên thiết bị; UI/controls vẫn theo TV. |

### G4-03 – AI Media Processing

[Nghiệp vụ và nghiệm thu gốc](../docs/04-gd4-digital-ecosystem/G4-03-ai-media-processing.md) · Coding mọi scope: CSV **1.888h** · V1 **544–1.156h** · V2 **292h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G4-03-F001 | Pipeline yêu cầu và theo dõi job AI media | CORE | 64/152 | 20–36 | 48–96 | 10 | 24 | Owner AI job queue/provider adapter/retry/quota/progress, nền chung cho mọi tác vụ. | Một job/version/review/provider framework; STT/cues/tags/translation/recognition có API và samples. |
| G4-03-F002 | Speech-to-text và transcript có mốc thời gian | CORE | 88/176 | 24–48 | 48–96 | 12 | 24 | STT provider timed output + segment editor/version association; không train model từ đầu. | Một job/version/review/provider framework; STT/cues/tags/translation/recognition có API và samples. |
| G4-03-F003 | Tạo và đồng bộ phụ đề từ transcript | CORE | 80/120 | 24–48 | 24–56 | 12 | 12 | Cues/timeline + VTT/SRT export/import reuse timed transcript; không subtitle engine khác. | Một job/version/review/provider framework; STT/cues/tags/translation/recognition có API và samples. |
| G4-03-F004 | Biên tập, thẩm định và xuất bản kết quả AI | CORE | 88/128 | 24–40 | 32–64 | 12 | 16 | Review/diff/approve/provenance reuse CMS; mới ở approved AI version và sync DAM. | Một job/version/review/provider framework; STT/cues/tags/translation/recognition có API và samples. |
| G4-03-F005 | Dịch transcript và phụ đề đa ngôn ngữ | CONDITIONAL | 64/144 | 16–32 | 40–88 | 8 | 20 | One translation provider/language workflow, reuse job/version/review; quality policy chưa chốt. | Một job/version/review/provider framework; STT/cues/tags/translation/recognition có API và samples. |
| G4-03-F006 | Gợi ý nhân vật xuất hiện trong video | CONDITIONAL | 64/192 | 20–40 | 80–192 | 10 | 56 | CONDITIONAL recognition identity/legal/data chưa chốt; upper cũ chưa thể hạ vì integration/accuracy thật. | Một job/version/review/provider framework; STT/cues/tags/translation/recognition có API và samples. |
| G4-03-F007 | Nhận diện/đề xuất địa điểm và địa danh | CONDITIONAL | 56/136 | 16–28 | 40–104 | 8 | 24 | NER/vision provider + taxonomy match, reuse suggestion reviewer; thị giác có thể phức tạp hơn text. | Một job/version/review/provider framework; STT/cues/tags/translation/recognition có API và samples. |
| G4-03-F008 | Gắn nhãn chủ đề/di sản theo taxonomy | CORE | 48/104 | 12–20 | 24–56 | 6 | 12 | Taxonomy-tag suggestion bằng provider/rules, reuse evidence/review/job; không classifiers riêng. | Một job/version/review/provider framework; STT/cues/tags/translation/recognition có API và samples. |
| G4-03-F009 | Xử lý lại phiên bản và giám sát chất lượng AI | OPTION | 56/128 | 12–24 | 40–88 | 6 | 20 | OPTION reprocess/metering/version compare dùng queue/version đã có; quality eval thủ công riêng. | Một job/version/review/provider framework; STT/cues/tags/translation/recognition có API và samples. |

### G4-04 – Semantic Search

[Nghiệp vụ và nghiệm thu gốc](../docs/04-gd4-digital-ecosystem/G4-04-semantic-search.md) · Coding mọi scope: CSV **1.272h** · V1 **298–628h** · V2 **157h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G4-04-F001 | Chuẩn hóa đoạn transcript để lập chỉ mục | CORE | 16/120 | 0–4 | 24–48 | 0 | 12 | Approved transcript chunk/timecode mapping; version metadata reuse G4-03, không transcript store khác. | Shared job/index/query/snippet UI; vector adapter/schema/ACL đã rõ, kiểm tra approved/expired corpus. |
| G4-04-F002 | Tạo embeddings và chỉ mục vector | CORE | 8/176 | 0–4 | 40–80 | 0 | 20 | One embedding model/index adapter/worker/retry, reuse queue; không engine vector hoặc model training. | Shared job/index/query/snippet UI; vector adapter/schema/ACL đã rõ, kiểm tra approved/expired corpus. |
| G4-04-F003 | Tìm kiếm nội dung bằng câu tự nhiên | CORE | 56/152 | 12–24 | 40–80 | 6 | 20 | Semantic retrieval API + existing search UI; không chatbot/RAG generated answers trong nguồn. | Shared job/index/query/snippet UI; vector adapter/schema/ACL đã rõ, kiểm tra approved/expired corpus. |
| G4-04-F004 | Hiển thị đoạn trích có timecode và mở video tương ứng | CORE | 56/80 | 12–24 | 16–32 | 6 | 8 | Snippet/timecode/seek trên player sẵn, rights kiểm tại common gate. | Shared job/index/query/snippet UI; vector adapter/schema/ACL đã rõ, kiểm tra approved/expired corpus. |
| G4-04-F005 | Kết hợp tìm kiếm từ khóa với ngữ nghĩa | CORE | 56/120 | 10–20 | 32–64 | 5 | 16 | Hybrid merge/rank/dedupe/fallback dùng keyword G2; không search UI/index base thứ hai. | Shared job/index/query/snippet UI; vector adapter/schema/ACL đã rõ, kiểm tra approved/expired corpus. |
| G4-04-F006 | Áp dụng phân quyền khi truy vấn và hiển thị transcript | CORE | 16/96 | 4–8 | 32–64 | 2 | 16 | ACL filtering/snippet suppression/expired media khác UI; reuse entitlement policy nhưng phải enforce tại query. | Shared job/index/query/snippet UI; vector adapter/schema/ACL đã rõ, kiểm tra approved/expired corpus. |
| G4-04-F007 | Đồng bộ chỉ mục và xử lý thay đổi quyền/media | CORE | 24/144 | 4–8 | 40–88 | 2 | 24 | Index updates/tombstone/rights event/retry; reuse worker nền, không bỏ dữ liệu bị thu hồi. | Shared job/index/query/snippet UI; vector adapter/schema/ACL đã rõ, kiểm tra approved/expired corpus. |
| G4-04-F008 | Đánh giá độ liên quan và kiểm soát cải thiện tìm kiếm | OPTION | 48/104 | 8–16 | 24–64 | 4 | 16 | OPTION query set/rating/latency monitor; relevance phải đo, không AI tự chứng minh chất lượng. | Shared job/index/query/snippet UI; vector adapter/schema/ACL đã rõ, kiểm tra approved/expired corpus. |

### G4-05 – Recommendation / Video Automation

[Nghiệp vụ và nghiệm thu gốc](../docs/04-gd4-digital-ecosystem/G4-05-ai-recommendation-video-automation.md) · Coding mọi scope: CSV **1.792h** · V1 **488–1.066h** · V2 **260h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G4-05-F001 | Hồ sơ tín hiệu cho gợi ý nâng cao | CORE | 16/144 | 4–8 | 32–64 | 2 | 16 | Incremental signals projection từ G2 analytics/consent, không event collection hay audience identity mới. | Reuse signals/transcript/render templates/job/review; code ranking/highlight/render và rights delta. |
| G4-05-F002 | Xếp hạng gợi ý nâng cao theo nội dung/người xem | CORE | 48/176 | 12–24 | 48–112 | 6 | 24 | New candidate/ranking delta so với rules G2; nếu chỉ cùng rule thì bỏ triển khai mới, không cộng hai lần. | Reuse signals/transcript/render templates/job/review; code ranking/highlight/render và rights delta. |
| G4-05-F003 | Fallback và kiểm soát đề xuất cho người mới | CORE | 16/48 | 2–6 | 4–12 | 1 | 2 | Fallback G2 có sẵn, chỉ hòa rank/rights mới; 16+48 khó phù hợp với incremental scope. | Reuse signals/transcript/render templates/job/review; code ranking/highlight/render và rights delta. |
| G4-05-F004 | Đo chất lượng recommendation trong analytics chung | CORE | 32/88 | 6–12 | 12–28 | 3 | 6 | Source/rank/coverage thêm vào G2 metrics, không recommender dashboard/pipeline khác. | Reuse signals/transcript/render templates/job/review; code ranking/highlight/render và rights delta. |
| G4-05-F005 | Đề xuất phân đoạn highlight từ transcript/video | CONDITIONAL | 96/168 | 24–48 | 64–128 | 12 | 32 | Highlight timed suggestions/editor/provider, reuse STT; chốt output quality và test videos. | Reuse signals/transcript/render templates/job/review; code ranking/highlight/render và rights delta. |
| G4-05-F006 | Tạo video ngắn từ đoạn đã chọn | CONDITIONAL | 104/184 | 28–56 | 64–136 | 14 | 36 | Trim/crop preset jobs/preview/rights using provider/render tooling; không NLE editor hoặc GPU infra. | Reuse signals/transcript/render templates/job/review; code ranking/highlight/render và rights delta. |
| G4-05-F007 | Tạo phụ đề/bố cục cho clip ngắn | CONDITIONAL | 112/144 | 32–64 | 40–88 | 16 | 24 | Fixed subtitle/layout presets/overflow, reuse subtitles; template designer tùy ý phải tính thêm. | Reuse signals/transcript/render templates/job/review; code ranking/highlight/render và rights delta. |
| G4-05-F008 | Kiểm duyệt, lưu nguồn và phát hành video tái sử dụng | CONDITIONAL | 64/112 | 12–24 | 24–48 | 6 | 12 | Derivative provenance/rights/review/DAM publish reuse CMS, không social distribution chưa có. | Reuse signals/transcript/render templates/job/review; code ranking/highlight/render và rights delta. |
| G4-05-F009 | Thử nghiệm mô hình recommendation nâng cao/A-B | OPTION | 64/176 | 16–32 | 64–176 | 8 | 40 | OPTION A/B/eval/model rollback mới thật; nếu custom ML thì range không đủ, chưa chốt upper. | Reuse signals/transcript/render templates/job/review; code ranking/highlight/render và rights delta. |

### G4-06 – Membership nâng cao

[Nghiệp vụ và nghiệm thu gốc](../docs/04-gd4-digital-ecosystem/G4-06-membership.md) · Coding mọi scope: CSV **1.296h** · V1 **262–596h** · V2 **142h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G4-06-F001 | Danh mục hạng thành viên và tập quyền lợi | CORE | 80/112 | 16–28 | 24–48 | 8 | 12 | Tier/benefit config delta G2 plan schema; không danh mục thuê bao/phí lần hai. | Reuse subscription/entitlement/pricing/cards; tier/benefit/proration/quality/ad policy đã chốt. |
| G4-06-F002 | Hồ sơ/thẻ trạng thái thành viên | CORE | 64/48 | 8–16 | 4–12 | 4 | 3 | Member status card/date/reason từ entitlement projection; 64 FE khó có căn cứ với một card. | Reuse subscription/entitlement/pricing/cards; tier/benefit/proration/quality/ad policy đã chốt. |
| G4-06-F003 | Kiểm tra quyền lợi thành viên qua entitlement chung | CORE | 48/112 | 10–20 | 24–48 | 5 | 12 | Benefit predicates mới trên entitlement G2; không service quyền xem riêng. | Reuse subscription/entitlement/pricing/cards; tier/benefit/proration/quality/ad policy đã chốt. |
| G4-06-F004 | Đổi hạng/gia hạn/hủy Membership | CONDITIONAL | 88/128 | 12–24 | 40–96 | 6 | 24 | Tier-change/proration bổ sung từ subscription G2; nếu quy chế mới thì cần sandbox và upper cao. | Reuse subscription/entitlement/pricing/cards; tier/benefit/proration/quality/ad policy đã chốt. |
| G4-06-F005 | Chế độ xem không quảng cáo cho hội viên | CONDITIONAL | 40/104 | 6–12 | 16–64 | 3 | 12 | Ad-free capability gate ở ad placements sẵn; hiện danh mục thiếu owner ad inventory, chưa đóng được giá. | Reuse subscription/entitlement/pricing/cards; tier/benefit/proration/quality/ad policy đã chốt. |
| G4-06-F006 | Chất lượng video cao cấp theo gói | CONDITIONAL | 56/112 | 8–16 | 16–48 | 4 | 10 | Rendition allowlist/entitlement theo provider thật; không dựng transcoder/CDN hay nguồn 8K. | Reuse subscription/entitlement/pricing/cards; tier/benefit/proration/quality/ad policy đã chốt. |
| G4-06-F007 | Sự kiện/chương trình dành riêng cho thành viên | OPTION | 80/80 | 20–40 | 32–64 | 10 | 16 | OPTION member event registration/capacity, nếu ticketing/payments rộng phải bóc mới. | Reuse subscription/entitlement/pricing/cards; tier/benefit/proration/quality/ad policy đã chốt. |
| G4-06-F008 | Báo cáo duy trì, chuyển hạng và giá trị membership | OPTION | 48/96 | 10–20 | 16–40 | 5 | 8 | Membership aggregates dùng G2 metrics, không data platform khác. | Reuse subscription/entitlement/pricing/cards; tier/benefit/proration/quality/ad policy đã chốt. |

### G4-07 – Partner Platform

[Nghiệp vụ và nghiệm thu gốc](../docs/04-gd4-digital-ecosystem/G4-07-partner-platform.md) · Coding mọi scope: CSV **1.904h** · V1 **504–1.000h** · V2 **252h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G4-07-F001 | Cổng đăng nhập tổ chức đối tác và phân quyền | CORE | 96/160 | 24–40 | 64–128 | 12 | 32 | Partner organization auth/tenant isolation mới, reuse IAM primitives; security boundary không thể chỉ ẩn tab. | Shared partner schemas/scoped APIs/admin views; tenant/org boundary và machine delivery phải kiểm tra riêng. |
| G4-07-F002 | Đăng ký/thẩm định quyền tham gia portal | CORE | 80/112 | 16–28 | 24–48 | 8 | 12 | Invite/activation/approval reuse G3 partner record, không master/onboarding enterprise. | Shared partner schemas/scoped APIs/admin views; tenant/org boundary và machine delivery phải kiểm tra riêng. |
| G4-07-F003 | Đối tác tự quản hồ sơ và offering được cho phép | CORE | 104/128 | 28–48 | 32–64 | 14 | 16 | Scoped self-service forms trên G3 schema, submit review; không catalog domain mới. | Shared partner schemas/scoped APIs/admin views; tenant/org boundary và machine delivery phải kiểm tra riêng. |
| G4-07-F004 | Nhận và cập nhật lead trên portal | CONDITIONAL | 72/88 | 16–28 | 20–40 | 8 | 10 | Partner lead queue/ack/status từ G3-02, chỉ scoped API/UI delta và privacy guard. | Shared partner schemas/scoped APIs/admin views; tenant/org boundary và machine delivery phải kiểm tra riêng. |
| G4-07-F005 | Báo cáo referral và conversion cho đối tác | CONDITIONAL | 56/64 | 12–20 | 12–24 | 6 | 6 | Partner charts dùng G3-04 aggregates, permission scoping; không affiliate engine khác. | Shared partner schemas/scoped APIs/admin views; tenant/org boundary và machine delivery phải kiểm tra riêng. |
| G4-07-F006 | Quản lý booking/đơn hàng phía đối tác | CONDITIONAL | 104/120 | 24–40 | 32–64 | 12 | 16 | Scoped booking/order screens/actions on G3 states; chưa có G3 không được giả free backend. | Shared partner schemas/scoped APIs/admin views; tenant/org boundary và machine delivery phải kiểm tra riêng. |
| G4-07-F007 | Bảng kê hoa hồng/đối soát cho đối tác | CONDITIONAL | 64/96 | 16–28 | 24–48 | 8 | 12 | Scoped statements/ack/dispute API/UI, commission ledger belongs G3-09. | Shared partner schemas/scoped APIs/admin views; tenant/org boundary và machine delivery phải kiểm tra riêng. |
| G4-07-F008 | Partner API và webhooks có xác thực | CONDITIONAL | 112/232 | 24–48 | 80–176 | 12 | 40 | Machine API clients/scopes/signature/quota/webhook delivery thật; chỉ developer UI, không API gateway platform. | Shared partner schemas/scoped APIs/admin views; tenant/org boundary và machine delivery phải kiểm tra riêng. |
| G4-07-F009 | Sandbox, tài liệu tích hợp và thử nghiệm đối tác | OPTION | 72/144 | 16–32 | 40–96 | 8 | 20 | OPTION docs/test fixtures/sandbox against F008, operational deployment tách H01. | Shared partner schemas/scoped APIs/admin views; tenant/org boundary và machine delivery phải kiểm tra riêng. |

### G4-08 – Data Platform

[Nghiệp vụ và nghiệm thu gốc](../docs/04-gd4-digital-ecosystem/G4-08-data-platform.md) · Coding mọi scope: CSV **2.312h** · V1 **572–1.476h** · V2 **342h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G4-08-F001 | Danh mục nguồn và định nghĩa chỉ số kinh doanh | CORE | 64/136 | 8–20 | 16–48 | 4 | 8 | KPI/data contract định nghĩa là BA; FE/BE chỉ schema/catalog configuration cần code, không nạp cả workshop vào coding. | Shared source event contracts/SQL/DQ/metrics/export; dữ liệu mẫu sạch, lineage/schema/forecast requirements rõ. |
| G4-08-F002 | Pipeline thu thập dữ liệu tăng thêm xuyên giai đoạn | CORE | 32/240 | 8–16 | 80–192 | 4 | 48 | 3 nguồn nội bộ đã có event/query contracts; CDC/schema drift/backfill làm upper cao, không Kafka platform mặc định. | Shared source event contracts/SQL/DQ/metrics/export; dữ liệu mẫu sạch, lineage/schema/forecast requirements rõ. |
| G4-08-F003 | Kiểm soát chất lượng, đối chiếu và lịch sử dữ liệu | CORE | 64/176 | 16–32 | 48–128 | 8 | 28 | DQ/reconcile/freshness checks and dashboard delta, lineage yêu cầu bao nhiêu nguồn phải chốt. | Shared source event contracts/SQL/DQ/metrics/export; dữ liệu mẫu sạch, lineage/schema/forecast requirements rõ. |
| G4-08-F004 | Lớp lưu trữ phân tích theo quy mô thực tế | CONDITIONAL | 16/240 | 0–4 | 64–240 | 0 | 48 | CONDITION warehouse khi cần; existing database đủ thì không kích hoạt. Migrations/partition/incremental SQL khác dựng hạ tầng. | Shared source event contracts/SQL/DQ/metrics/export; dữ liệu mẫu sạch, lineage/schema/forecast requirements rõ. |
| G4-08-F005 | Liên kết dữ liệu nội dung, người xem và giao dịch | CONDITIONAL | 24/216 | 4–8 | 64–144 | 2 | 36 | Privacy-safe joins/identity mapping/retention new logic, không master dữ liệu người xem khác. | Shared source event contracts/SQL/DQ/metrics/export; dữ liệu mẫu sạch, lineage/schema/forecast requirements rõ. |
| G4-08-F006 | Dashboard liên thông Content-to-Commerce | CONDITIONAL | 104/176 | 24–48 | 40–96 | 12 | 24 | Fixed cross-stage funnel dashboard trên aggregate, không thay source revenue/report engine. | Shared source event contracts/SQL/DQ/metrics/export; dữ liệu mẫu sạch, lineage/schema/forecast requirements rõ. |
| G4-08-F007 | Phân khúc khách hàng phục vụ nội dung/membership | CONDITIONAL | 88/176 | 20–36 | 40–96 | 10 | 24 | Segments rules/filter và consent, không CDP/ML/ad targeting mặc định. | Shared source event contracts/SQL/DQ/metrics/export; dữ liệu mẫu sạch, lineage/schema/forecast requirements rõ. |
| G4-08-F008 | Xuất dữ liệu và chia sẻ chỉ số cho đối tác được cấp quyền | CONDITIONAL | 72/152 | 12–24 | 32–72 | 6 | 16 | Scoped aggregate export/expiry/approval reuse primitives, không xuất raw PII. | Shared source event contracts/SQL/DQ/metrics/export; dữ liệu mẫu sạch, lineage/schema/forecast requirements rõ. |
| G4-08-F009 | Tự động hóa phân tích dự báo theo dữ liệu | OPTION | 96/240 | 16–32 | 80–240 | 8 | 56 | OPTION forecasts/provider/model and evaluation chưa có dataset; nếu custom ML không cam kết giảm. | Shared source event contracts/SQL/DQ/metrics/export; dữ liệu mẫu sạch, lineage/schema/forecast requirements rõ. |

### G4-09 – Archive & Content Licensing

[Nghiệp vụ và nghiệm thu gốc](../docs/04-gd4-digital-ecosystem/G4-09-archive-content-licensing.md) · Coding mọi scope: CSV **2.024h** · V1 **456–952h** · V2 **236h**.

| ID | Tính năng | Scope | CSV trước V2 FE/BE | V1 FE | V1 BE | V2 FE | V2 BE | Căn cứ V1 / phạm vi | Cách tính V2 |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| G4-09-F001 | Tra cứu bộ sưu tập di sản/tư liệu phục vụ cấp phép | CORE | 88/112 | 20–36 | 24–48 | 10 | 12 | Collections/search trên DAM + taxonomy sẵn, không archive storage hay keyword index mới. | Reuse DAM/partner/workflow/version/delivery nền; license-purpose/territory/evidence/grant rules riêng đã chốt. |
| G4-09-F002 | Ma trận quyền khai thác và hạn sử dụng theo mục đích | CORE | 96/176 | 24–40 | 64–144 | 12 | 32 | New sublicensing rights/evidence matrix thật khác nội bộ; cần quy chế, giữ biên cho quyền lãnh thổ/thời hạn. | Reuse DAM/partner/workflow/version/delivery nền; license-purpose/territory/evidence/grant rules riêng đã chốt. |
| G4-09-F003 | Danh mục gói khai thác tư liệu | CORE | 88/144 | 20–36 | 24–48 | 10 | 12 | License package catalog/detail có restricted preview, reuse offering primitives; không tự public originals. | Reuse DAM/partner/workflow/version/delivery nền; license-purpose/territory/evidence/grant rules riêng đã chốt. |
| G4-09-F004 | Tiếp nhận yêu cầu cấp phép sử dụng nội dung | CORE | 72/96 | 12–24 | 20–40 | 6 | 10 | License request form + media references dùng lead/inbox primitives; nghiệp vụ license riêng giữ. | Reuse DAM/partner/workflow/version/delivery nền; license-purpose/territory/evidence/grant rules riêng đã chốt. |
| G4-09-F005 | Báo giá, kiểm tra và duyệt yêu cầu license | CONDITIONAL | 96/144 | 24–40 | 32–64 | 12 | 16 | Quote revisions/approval/eligibility on workflow, không e-sign/contract suite. | Reuse DAM/partner/workflow/version/delivery nền; license-purpose/territory/evidence/grant rules riêng đã chốt. |
| G4-09-F006 | Theo dõi hợp đồng/giấy phép và hiệu lực sử dụng | CONDITIONAL | 88/176 | 20–36 | 40–88 | 10 | 24 | Contract/license-grant fields/validity trên partner refs; không subscription entitlement tái sử dụng sai domain. | Reuse DAM/partner/workflow/version/delivery nền; license-purpose/territory/evidence/grant rules riêng đã chốt. |
| G4-09-F007 | Bàn giao file chất lượng gốc có kiểm soát | CONDITIONAL | 72/192 | 12–24 | 48–120 | 6 | 28 | Approved secure export/expiring downloads/watermark conditional; bandwidth và vận hành ngoài code. | Reuse DAM/partner/workflow/version/delivery nền; license-purpose/territory/evidence/grant rules riêng đã chốt. |
| G4-09-F008 | Ghi nhận phí khai thác và đối soát cấp phép | CONDITIONAL | 64/160 | 16–28 | 24–64 | 8 | 12 | Payment evidence/status records và finance refs, không gateway mới khi chưa yêu cầu. | Reuse DAM/partner/workflow/version/delivery nền; license-purpose/territory/evidence/grant rules riêng đã chốt. |
| G4-09-F009 | Gia hạn, thu hồi và báo cáo khai thác bản quyền | OPTION | 56/104 | 12–24 | 20–48 | 6 | 10 | OPTION renew/revoke/report on license data and scheduler, không AI tự xử lý pháp lý. | Reuse DAM/partner/workflow/version/delivery nền; license-purpose/territory/evidence/grant rules riêng đã chốt. |

## 11. Những đầu vào còn thiếu để chốt estimate

- Thiết kế thực tế và số template màn hình; component/admin skeleton sẽ dùng và task foundations đã được tính ở đâu.
- Stack/code hiện có của nhà thầu và năng suất đã đo khi dùng AI; hồ sơ hiện không chứng minh các shared components đã chạy.
- Provider streaming/DRM/payment/booking/AI cụ thể, sandbox và bộ callback/error cases.
- Quy chế nhuận bút, renewal/proration/refund, commission và sublicensing có ví dụ đối chiếu.
- Sample export migration đủ đại diện, số nguồn/file, mẫu dữ liệu xấu và trách nhiệm clean thủ công.
- Các gói/module thực sự được chọn; không mặc định CORE GĐ4 cùng phát hành hay backend CONDITIONAL đã tồn tại.

Báo cáo là căn cứ để sửa dự toán; V2 đã được đồng bộ vào CSV và Markdown dự toán ngày 12/10/2026; file báo giá Excel hiện tại đã được điền FE/BE V2 cho đủ 290 tính năng; **Config, lương, đơn giá và cách tính của mẫu giữ nguyên**. Không tạo một workbook báo giá khác. Phần chốt giờ cần dựa trên scope đã chọn và các điều kiện trên.

## 12. Kiểm tra mục tiêu giảm thời gian còn 1/5 — giữ đủ 290 tính năng

**Cập nhật 12/10/2026 theo lựa chọn của người dùng: giữ đủ 290 mã tính năng GĐ1–GĐ4, gồm CORE/CONDITIONAL/OPTION; không dùng phương án bỏ/hoãn tính năng để giải thích mức giảm.** Giữ bảng lương, đơn giá và cách tính của template. Phần này là kiểm tra khả thi/định hướng triển khai, không thay các khoảng FE/BE ở phụ lục bằng số chia 5.

### 12.1. Mốc so sánh và ngân sách cần đạt

“Hiện tại” là **9.190–19.256 giờ code** trong đề xuất AI ở báo cáo này, không phải 32.028 giờ của CSV cũ. Giảm 5 lần so với CSV cũ sẽ là 6.405,6 giờ, nhưng đó không phải giảm 5 lần so với khoảng vừa báo người dùng.

Muốn giảm tiếp còn 1/5 của đề xuất hiện tại, cần đạt **1.838–3.851,2 giờ code**, tương đương **229,75–481,40 ngày code** cho một người 8h/ngày. Trung bình chỉ còn **6,34–13,28 giờ code/mã tính năng**; chức năng không đồng đều, nên không được cấp cùng số giờ cho từng dòng.

Bảng sau là **ngân sách mục tiêu toán học nếu mỗi phase cùng giảm 5 lần**, không phải estimate mới có bằng chứng:

| Giai đoạn | Giờ code cần đạt | Ngày chỉ code | Ngày theo mẫu gồm BA/Design/QA | Ngày cộng PM 20% phần tính năng |
|---|---:|---:|---:|---:|
| GĐ1 | 320,80–624,80 | 40,10–78,10 | 72,91–142,00 | 87,49–170,40 |
| GĐ2 | 312,80–622,00 | 39,10–77,75 | 71,09–141,36 | 85,31–169,64 |
| GĐ3 | 443,60–908,80 | 55,45–113,60 | 100,82–206,55 | 120,98–247,85 |
| GĐ4 | 760,80–1.695,60 | 95,10–211,95 | 172,91–385,36 | 207,49–462,44 |
| TỔNG | 1.838,00–3.851,20 | 229,75–481,40 | 417,73–875,27 | 501,27–1.050,33 |

Các số trên chỉ áp dụng phần tính năng GĐ1–GĐ4. GĐ0, foundations, hạ tầng, các dòng mẫu khác, vendor costs và công việc độc lập chưa nằm trong khoảng này. Các thông số hạ tầng/NFR được giữ theo mẫu trong Excel không tự giảm 5 lần. Với một người, đây là effort quy đổi, chưa cộng ngày nghỉ hoặc thời gian chờ.

### 12.2. Kết luận về khả thi

**Có cơ hội tối ưu thêm đáng kể; hiện chưa đủ bằng chứng để xác nhận toàn bộ 290 chức năng có thể giảm tiếp 5 lần mà vẫn giữ đúng nghiệm thu.** Bản trước đã dùng component/SDK/framework, AI và ownership incremental trong các giả định. Vì vậy, “dùng AI”, “dùng lại header” hay “dùng thư viện player” không phải khoản tiết kiệm mới để cộng lại lần nữa.

Mức giảm lớn tiếp theo phải đến từ **đổi cách triển khai**: dùng sản phẩm CMS/commerce/identity/media đã có sẵn nhiều nghiệp vụ, cấu hình chúng, rồi chỉ code khoảng trống nghiệp vụ VTV8. Khác với dùng thư viện giao diện hoặc ORM, cách này có thể loại nhiều task viết admin/API/state management tự làm. Đây là phương án cần fit-gap và thử nghiệm; các docs sản phẩm chứng minh có capability nền, không chứng minh số giờ hoặc tương thích đầy đủ với VTV8.

Chín module đặc thù/tích hợp gồm G1-10/G1-11/G2-09/G2-10/G3-05/G3-09/G4-02/G4-08/G4-09 có **66 feature**, hiện riêng chúng đã là **2.916–6.450 giờ code** trong khoảng cũ. Đây không phải cận dưới vật lý và có thể tối ưu, nhưng cho thấy để đạt tổng 1.838–3.851h, cần giảm thật cả nhóm này; chỉ làm UI nhanh hơn không đủ, cũng không thể lấy giờ ít hơn bằng cách đổi booking thành link giới thiệu.

### 12.3. Nền tảng có capability đã kiểm tra

| Lớp | Capability có tài liệu chính thức | Cách dùng để giảm code mới | Phần chưa được chứng minh đáp ứng |
|---|---|---|---|
| CMS nền, ví dụ Payload | [Drafts/schedule](https://payloadcms.com/docs/versions/drafts), [Access control](https://payloadcms.com/docs/access-control/overview), [Hooks](https://payloadcms.com/docs/hooks/overview) | Sinh admin/schema, dùng editor/draft/version/access primitives, thêm workflow hooks | Workflow nhiều vai trò của VTV8, DAM rights gate, audit nghiệp vụ, royalty/partner/PII |
| Commerce engine, ví dụ Medusa | [Commerce modules](https://docs.medusajs.com/resources/commerce-modules), [Inventory trong workflows](https://docs.medusajs.com/resources/commerce-modules/inventory/inventory-in-flows) | Product/cart/order/inventory/payment primitives thay phần tự viết backend TMĐT | Quy tắc seller, payment gateway cụ thể, partner commission, refunds/fulfillment semantics và đồng bộ nguồn tồn |
| Managed media, ví dụ Cloudflare Stream | [Live input và recording](https://developers.cloudflare.com/stream/stream-live/start-stream-live/), [Webhooks](https://developers.cloudflare.com/stream/manage-video-library/using-webhooks/) | Một ingest/playback/recording adapter; reuse provider SDK/output | Toàn bộ yêu cầu SRT/DRM/TV/QoE/recording/fallback và provider trách nhiệm phải kiểm tra riêng; đây chỉ là ví dụ capability, chưa chọn vendor |
| STT/subtitles API, ví dụ Amazon Transcribe | [StartTranscriptionJob và VTT/SRT outputs](https://docs.aws.amazon.com/transcribe/latest/APIReference/API_StartTranscriptionJob.html) | Một job nhận transcript/subtitles, hạn chế code tạo output máy | Tiếng Việt/nguồn audio thực, quality, timed editor, human approval/version sync, recognition/translation/shorts không tự nằm trong STT |

Không cài package hoặc chốt vendor ở lần kiểm tra này. Việc dùng engine có sẵn vẫn cần cost/version/provider fit-gap; giảm giờ phát triển không đồng nghĩa tổng chi phí vận hành giảm cùng tỷ lệ.

### 12.4. Ma trận tối ưu đủ 41 module — không loại mã tính năng

Giữ nguyên danh mục nghiệm thu 290 mã. Gộp **task xây nền**, không gộp để bỏ đầu ra. Các tính năng dùng chung vẫn cần phần validation, trạng thái và tích hợp riêng. Ví dụ một form engine sinh nhiều forms; không có nghĩa các forms nghiệp vụ không cần kiểm tra.

| Module | Cách giảm task code mới | Công việc vẫn phải có |
|---|---|---|
| G1-01 | Public layouts/card/list/SEO dùng một template và renderer; AI sinh routes và UI variants. | Menu/cache/API mapping, published guards và responsive từng trang vẫn cần ghép. Đây là nhóm đã giảm nhiều trong bản trước. |
| G1-02 | Dùng auth/admin/access-control của CMS nền; chỉ cấu hình collections/roles. | Ma trận quyền VTV8, revoke/reset, phạm vi chuyên mục và audit phải được kiểm chứng qua API. |
| G1-03 | CMS có editor, draft, versions và schedule sẵn; cấu hình schema và workflow hooks. | Trả bài/duyệt/publish/rights gate, preview kín và lịch sử actor khác draft cơ bản; không coi CMS đã làm đủ quy trình VTV8. |
| G1-04 | Sinh schemas/list/forms bằng CMS/admin generator; dùng một typed-relations/picker. | Tree cycles, unique slug, order và reference semantics phải test; không sinh chín bộ CRUD độc lập. |
| G1-05 | Dùng upload/storage plugin + picker/crop chung; metadata forms sinh từ schema. | File lớn/resume, bản gốc/biến thể, WARN/BLOCK/evidence/expiry và where-used là phần tùy biến. |
| G1-06 | Một player SDK nhận VOD/live; video admin là một loại content trên CMS. | Readiness, quyền công khai, lỗi/retry và recording approval vẫn có logic mới. |
| G1-07 | Dùng calendar/UI/state primitives; đọc readiness từ provider sẵn. | Xung đột lịch, timezone, authority trạng thái live và close→recording→draft VOD cần logic riêng. |
| G1-08 | Một managed media provider có ingest/playback/recording/ABR phù hợp; một adapter. | Không đồng nhất vendor bất kỳ với đủ DRM/SRT/QoE/fallback; recording callbacks cần signature/dedupe và sample thực. |
| G1-09 | Dashboard/chart/export dựa shared aggregate layer hoặc analytics service được chọn. | Định nghĩa view/content metrics, tránh đếm đôi contributor và đối chiếu vendor metrics. |
| G1-10 | Dùng list/form/audit/snapshot/export primitives chung; chỉ thêm royalty domain. | Quy chế tính tiền, hiệu lực mức, eligibility, rounding và rerun không có sẵn chỉ vì dùng CMS. |
| G1-11 | Một ETL pipeline extract→map→clean→validate→load với checkpoints, thay năm tool. | Cùng pipeline vẫn phải xử lý đủ năm đầu ra; nguồn xấu/rights thiếu/file refs không được xóa khỏi scope. |
| G2-01 | Reuse auth primitives nhưng tách audience policies; use identity service nếu phù hợp. | Consent version, privacy request orchestration, account linking và data scopes mới vẫn phải làm. |
| G2-02 | Một generic user-content relation + shared toggles/library tabs cho follow/favorite/topics. | Typed relation, unique keys, user ownership và visibility validation. |
| G2-03 | Một progress/history store và playlist/order primitives; UI sinh từ shared library. | Throttle/multi-device conflict, delete scope, ownership, playable next item. |
| G2-04 | Một search service/index/query API, configured facets/sync/relevance; use UI chung. | Publish/gỡ sync, permission filtering và typo/reindex thật; không bỏ các đầu ra nâng cao để gọi là keyword search. |
| G2-05 | Một rule ranker/projector từ follow/favorite/history, cùng widget/feed/fallback. | Rules/freshness/rights/source labels, không cộng thêm kho tín hiệu hoặc collector khác. |
| G2-06 | Bật cấu hình/controls của player SDK cho resume/quality/tracks/next. | Renditions, track metadata/rights, seek và next-item correctness; SDK thiếu capability vẫn phải code adapter. |
| G2-07 | Một notification engine: source/recipients/preferences/inbox/delivery retries; providers cho email/push. | Chọn đúng recipient/consent, unsubscribe, dedupe, read state và browser subscription. |
| G2-08 | Dùng comment/moderation package nếu đáp ứng; shared admin queues và flags. | Premoderation, actor permissions, one-level replies, restrictions/audit vẫn cần ghép vào content. |
| G2-09 | Hosted gateway/subscription provider, một payment adapter và shared admin views. | Mô hình thuê bao thực, callbacks/refund/renew/cancel/receipt authority; provider Việt Nam và entitlement integration cần fit-gap. |
| G2-10 | Provider playback/DRM/session SDK + một entitlement decision service. | Server-side rights/revoke/expiry, protected URLs, device limits; không trả nội dung rồi chỉ ẩn FE. |
| G2-11 | Một event/aggregate/reporting layer cho viewer/session/QoE/cohorts/funnel/export. | Consent/dedupe/retention, definitions/QoE SDK mapping và privacy thresholds, không chỉ cài analytics widget. |
| G3-01 | Một offering/card/CTA component + CMS content links cho mọi kênh. | Eligibility/disclosure và phân biệt lead/referral/booking/commerce, không coi các giao dịch tương đương. |
| G3-02 | Lead intake/queue/status dùng CMS forms và shared workflow primitives. | Consent đúng bên nhận, assignment/ack/PII/audit, result semantics và source attribution. |
| G3-03 | Partner/offering schemas + approval/evidence state trên CMS chung. | Eligibility/suspension, partner master và một vendor sync adapter mới thật. |
| G3-04 | Dùng referral/campaign/attribution primitives hoặc affiliate service phù hợp. | Click != conversion; authenticated callback/window/consent/accepted evidence cần mapping theo contract. |
| G3-05 | Tích hợp một booking API/provider; shared CTA/detail/errors/retry console. | Quote TTL, real slot authority, idempotent booking/status/cancel/orphans không thể thay bằng outbound link. |
| G3-06 | Commerce engine có product/SKU/variants/inventory; bổ sung seller-partner và media links. | Nguồn tồn/reservation/concurrency và product review, không mặc định có marketplace workflow VTV8. |
| G3-07 | Commerce engine có cart/order/pricing/payment/promotion primitives; reuse adapters. | CommerceOrder snapshot/stock consistency, payment webhook authority và user/order scope; template storefront không tự đủ. |
| G3-08 | Commerce engine/extension có fulfill/return/refund flow, reused order admin. | Carrier adapter, cancel/partial refund/seller handover/disputes và nghĩa vụ thao tác theo scope. |
| G3-09 | Share period/snapshot/export/audit primitives với nhuận bút; code commission domain riêng. | Commission contract/settled-event/reversal/partner matching khác royalty formulas; không dùng một ledger sai domain. |
| G3-10 | B2B schemas/checklists trên partner/lead/workflow đã có. | Proposal version/approval, campaign/content disclosure và delivery metrics, không cần CRM/ERP khác. |
| G4-01 | Một cross-platform mobile app + generated API clients + shared cards/forms/state. | Native player, token storage/push/deep links/offline/IAP paths và hai OS vẫn cần thật; không thay app bằng web responsive. |
| G4-02 | Một TV OS pilot + SDK/focus library + shared API contracts. | D-pad/focus/back/pairing/DRM/playback telemetry trên thiết bị thật; không mặc định dùng nguyên mobile UI. |
| G4-03 | Một job/version/provider/review console; provider STT/subtitles/translation/classification. | Timed editor, approved vs machine versions, evidence/provenance, identity/quality và model mapping; mọi task còn được giữ. |
| G4-04 | One vector/hybrid search adapter và chung job/index/search UI, dùng transcript đã duyệt. | ACL/snippets/timecode seek/tombstones/relevance dataset; không thay bằng chatbot thiếu nguồn. |
| G4-05 | Share signal/ranking/events và transcript/render/job/review với G2/G4-03; fixed render templates. | AI highlights, crop/layout overflow, derivative rights và A/B/rollback outputs vẫn phải đáp ứng. |
| G4-06 | Tier/benefit projection trên subscription/entitlement; shared pricing/admin/status card. | Proration/ad-free inventory/quality availability/event-capacity rules riêng, không tạo billing thứ hai. |
| G4-07 | Partner portal từ API/schema/form/workflow G3; một tenant-aware client/service façade. | Org isolation, staff/owner invitation, scoped writes/PII và signed machine webhooks/quota/sandbox là công mới. |
| G4-08 | Một pipeline trên source events; reusable SQL models/DQ/metrics/segments/exports và BI phù hợp. | CDC/schema changes/freshness/privacy-safe joins/reconciliation/forecast quality; giữ đủ tính năng, không mặc định dataset sạch. |
| G4-09 | Extend DAM rights/partner/workflow/version/docs/delivery shared nền. | Quyền sublicensing/territory/purpose/license grant, quotes/contract/payment evidence và secure original export khác quyền phát. |

### 12.5. Cách estimate lại để kiểm chứng mục tiêu thay vì chia giờ

Tách một WBS triển khai với bốn loại task: **cấu hình nền có sẵn**, **component dùng chung xây một lần**, **custom nghiệp vụ per domain**, **tích hợp provider/dữ liệu**. Mỗi task có một owner, rồi map vào một hoặc nhiều feature IDs. Tổng giờ tính theo task duy nhất; vẫn giữ đủ feature IDs và tiêu chí nghiệm thu trong báo giá.

Ví dụ cụ thể:

- CMS: một schema/admin/editor/workflow foundation phục vụ article/static page/program/episode/entity/offering. Task validation/reference/publish policy riêng vẫn có owner, không áp thêm lần thứ hai toàn bộ nền CMS cho mỗi feature.
- Money: chia sẻ kỹ thuật period/snapshot/audit/export giữa royalty và commission, nhưng hai bộ rule/eligibility/reversal vẫn phải riêng; không coi có CMS là có engine tính tiền.
- Notification và analytics: một event intake/recipient/delivery/reporting nền. Watch-progress, commercial payment/stock events và consent vẫn khác mục đích và source authority.
- AI: một queue/version/progress/review/provenance nền cho STT/subtitles/translation/tags/highlights. Adapter/model/output format, timecoded edit/render và quality từng tác vụ vẫn phải có.
- App/TV: chia sẻ API clients/types/session/entitlement contracts; native rendering/player/device focus/offline vẫn theo SDK/OS. Không dùng responsive web để thay native capability.

Để khẳng định 5 lần, cần kiểm chứng ít nhất các phần đại diện: (1) bài nháp → trả/duyệt → publish chỉ khi asset đủ quyền; (2) SKU → giữ tồn → order → signed payment callback → hủy/hoàn; (3) recording → transcript/subtitle → chỉnh/duyệt → semantic result với rights; (4) SDK playback/session/pairing trên Mobile/TV thật. Dữ liệu migration và bộ mẫu tiền phải có trước khi khóa các task custom/tích hợp.

Chưa thực hiện những luồng này trong lần phân tích, nên **không ghi “đã đạt 5 lần”, không thay số CSV/Excel bằng ngân sách mục tiêu**. Nếu đo fit-gap cho thấy số task custom giảm đủ lớn, mới đưa estimate task-level trở lại từng feature theo owner; việc phân bổ đó không được làm tăng tổng do đếm trùng.

### 12.6. Ranh giới với công thức và lương

Giữ nguyên lương, đơn giá, tỷ trọng và logic công thức theo yêu cầu người dùng. Phân tích này tối ưu khối lượng FE/BE, không làm tổng ngắn hơn bằng cách xóa QA/BA/PM khỏi báo giá. Nếu code giảm nhanh nhưng khối lượng QA không giảm tương ứng, phải kiểm tra độ đủ của ngân sách QA tự sinh; tỷ trọng không chứng minh năng suất.

**Kết quả khi lập mục 12 (V1):** mục tiêu 5 lần được lượng hóa và có ma trận hướng triển khai cho đủ 41 module/290 feature. Khả năng đạt mục tiêu chưa được kiểm chứng bằng code/provider/dữ liệu thực. Khoảng cũ vẫn là PROPOSED, không phải deadline đã cam kết; không bổ sung một khoảng nhỏ hơn chỉ để khớp con số người dùng mong muốn.

## 13. Rà giờ lần 2: AI hỗ trợ phân tích và phát triển, FE thường ít công hơn BE

### 13.1. Điều chỉnh cách tính công việc

Bản V1 vẫn dành nhiều giờ cho bước viết form/API thủ công và biên bất định. V2 giả định developer đã có đặc tả do AI hỗ trợ, stack quen thuộc, schema/API contracts rõ và component/SDK/nền dùng chung đã chạy. Dựa trên đó, **estimate riêng từng dòng**, không nhân một hệ số đồng đều và không bỏ tính năng.

- API đọc/list/CRUD cơ bản trên nền có sẵn thường đưa về **2–4 giờ BE**, gồm ghép schema/permission/validation và developer checks. Một endpoint có sẵn pattern khác việc dựng toàn bộ nền API.
- Form/list/tab/toggle FE dùng components thường ở **1–4 giờ FE**; renderer/layout/card được sinh và dùng chung. Các giao diện mới phức tạp hơn vẫn có giờ cao hơn.
- Transition/job/permission scope thường cần nhiều hơn CRUD; webhook/tiền/stock/DRM/migration/native SDK giữ số giờ riêng, không kéo về 4 giờ chỉ để đạt mức giảm.
- Prompt hoặc code AI sinh ra không đồng nghĩa feature đã hoàn thành: giờ V2 vẫn tính người review, sửa code, ghép chạy và kiểm tra trực tiếp. BA/Design/QA độc lập tiếp tục theo mẫu, không xóa khỏi công thức.
- Những contract/data/policy vốn chưa rõ trong V1 phải được làm rõ để dùng V2. Các giờ không chắc chắn không bị tuyên bố biến mất; nếu nền/provider chưa sẵn thì không dùng điểm mục tiêu này làm giá cố định.

**FE không cần mặc định bằng BE.** V2 có 265/290 dòng FE ≤ BE; tổng FE chiếm khoảng 29,1% coding. FE giảm khoảng 50,4% so với biên FE thấp của V1, BE giảm khoảng 45,5% so với biên BE thấp. Các ngoại lệ như public layout, player Mobile/TV hoặc offline có FE lớn hơn BE vì phần client/SDK/UX mới thật, còn backend API được kế thừa.

### 13.2. Ví dụ có API 4 giờ nhưng tổng gần 12 giờ

G1-03-F002 (danh sách bài/bản nháp): V1 BE **8–16h**, V2 BE **4h**; V1 FE **6–10h**, V2 FE **3h**. Code mới là **7h**. Mẫu tính thêm BA/Design/QA, nên Total = 7/0,55 = **12,73h**. Như vậy API 4 giờ và tổng feature khoảng 12 giờ có thể đồng thời đúng, vì đang nói hai loại giờ khác nhau.

Một API mỏng 4 giờ có thể bóc thành khoảng 0,5h rà contract/policy, 1h sinh và sửa endpoint/query, 1h ghép permission/validation/response, 1,5h kiểm tra cases và sửa lỗi. Đây là phân bổ kế hoạch minh họa, không log thực tế; phải đo lại trên nền thực hiện.

Các ví dụ V2 khác:

| ID | Phần việc | V1 FE / BE | V2 FE / BE | Coding V2 |
|---|---|---|---|---:|
| G1-01-F001 | Khung website/menu | 6–12 / 4–8 | 4 / 4 | 8 |
| G1-04-F005 | Metadata hồ sơ nhân vật | 4–6 / 4–8 | 1 / 3 | 4 |
| G2-02-F001 | Follow/unfollow | 2–4 / 4–8 | 1 / 2 | 3 |
| G2-06-F001 | Resume player dùng API progress sẵn | 4–8 / 0–4 | 2 / 0 | 2 |
| G2-09-F004 | Payment callback/đối soát | 8–16 / 64–112 | 4 / 28 | 32 |
| G3-06-F004 | Stock reservation/concurrency | 12–20 / 64–128 | 5 / 32 | 37 |

Các API đơn giản có số mới nhỏ; luồng tiền/stock vẫn khác một endpoint CRUD và cần sandbox/cases thật. Native/complex integration không bị buộc FE phải nhỏ hơn BE.

### 13.3. Tổng giờ V2 — đủ 290 feature, không loại CONDITIONAL/OPTION

**Đây là số mục tiêu DRAFT theo điều kiện phát triển nhanh, không phải thời lượng đã đo hoặc deadline đã cam kết.** Một điểm estimate không có nghĩa đã giải quyết bất định vendor/data. Công thức và lương/đơn giá không thay đổi.

| Giai đoạn | Số tính năng | FE (h) | BE (h) | Coding (h) | Ngày chỉ code (8h) | Ngày gồm BA/Design/QA | Ngày cộng PM 20% phần feature |
|---|---:|---:|---:|---:|---:|---:|---:|
| GĐ1 | 82 | 240 | 615 | 855 | 106,88 | 194,32 | 233,18 |
| GĐ2 | 66 | 198 | 577 | 775 | 96,88 | 176,14 | 211,36 |
| GĐ3 | 64 | 275 | 871 | 1.146 | 143,25 | 260,45 | 312,55 |
| GĐ4 | 78 | 702 | 1.387 | 2.089 | 261,12 | 474,77 | 569,73 |
| TỔNG | 290 | 1.415 | 3.450 | 4.865 | 608,12 | 1.105,68 | 1.326,82 |

Tổng V2 **4.865 giờ code**, giảm **65,8% so với trung điểm V1 14.223h**, tức giảm hơn một nửa theo mốc đó. So với **biên thấp V1 9.190h**, mức giảm là **47,1%**, còn 270h để chạm đúng một nửa biên thấp (4.595h). Không sửa tùy tiện 270h để báo “đã giảm ít nhất 50%” theo mọi mốc. So với biên cao V1 19.256h, mức giảm là khoảng 74,7%.

Do đó có cơ sở đề xuất phương án phát triển nhanh **giảm hơn một nửa so với kịch bản giữa V1**, nhưng không tuyên bố mọi feature hoặc mọi scenario đều giảm đúng 50%. Cần thống nhất mốc đối chiếu; các tỷ lệ trên là phép so sánh dự toán, không phải năng suất đã đo. Một feature được giữ nguyên giờ vẫn có thể hợp lý nếu phụ thuộc/provider khó.

Những số này chỉ tính các feature GĐ1–GĐ4. GĐ0, foundations, DevOps/hạ tầng, legal/vendor costs, data clean thủ công và các công việc độc lập khác chưa nằm trong tổng. Nếu chưa có foundations, khoản sơ bộ 32–48h coding ở mục 4 vẫn phải kiểm tra và cộng một lần; không coi sinh CRUD đã miễn phí xây nền. Các phần NFR/hạ tầng/đơn giá/lương được giữ theo template trong Excel không tự thay đổi vì V2.

### 13.4. Đưa số mới vào dự toán thế nào

Mục 10 đã có V2 FE/BE cho **từng mã**, cạnh số CSV và V1 để kiểm tra. Phạm vi, source IDs và tiêu chí nghiệm thu không bị xóa hoặc thay thành bản đơn giản hơn. Các case quyền truy cập, asset thiếu quyền, retry/dedupe, tiền/stock consistency và SDK/device compatibility vẫn phải đạt.

CSV và Markdown dự toán đã được ghi số V2 ngày 12/10/2026 theo yêu cầu người dùng; Excel hiện tại đã được điền FE/BE V2 cho đủ 290 tính năng và kiểm tra tính lại bằng LibreOffice. Bảng lương, đơn giá và công thức của mẫu giữ nguyên. Tổng cuối trong Excel còn cộng NFR/hạ tầng/PM theo mẫu, khác tổng effort chỉ của 290 tính năng ở bảng trên. Để dùng V2 làm estimate chính thức, cần kiểm chứng một CRUD đại diện, một workflow và một tích hợp khó trên nền sẽ triển khai, rồi hiệu chỉnh những dòng tương ứng; không dùng tốc độ sinh UI để suy ra payment đã xong.
