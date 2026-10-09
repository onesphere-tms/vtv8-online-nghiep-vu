# Báo cáo kiểm tra chất lượng và phạm vi GĐ1 – 86 đầu việc (09/10/2026)

> **HỒ SƠ QA LỊCH SỬ (TRÊN BẢN 86 MÃ TRƯỚC CHỈNH).** Kiến nghị đã được áp dụng vào [danh mục hiện hành 82 tính năng](G1-DANH-MUC-TINH-NANG.md): **72 CORE, 10 OPTION/CONDITIONAL**, 5 mã phi-feature chuyển sang H02 và đã thêm **G1-03-F010 – Quản lý trang tĩnh CMS**. Các cụm 'chưa chỉnh danh mục' phía dưới phản ánh thời điểm lập báo cáo QA, không phải trạng thái hiện tại. Chưa được VTV8 phê duyệt và chưa tính FE/BE.

> **Trạng thái: ĐÃ RÀ SOÁT / KIẾN NGHỊ CHỈNH, CHƯA CHỐT BẢN FEATURE MỚI.**  
> Căn cứ: [tài liệu đề xuất VTV8–IIEL](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md), phạm vi đã thống nhất loại bỏ mạng xã hội và [86 tính năng hiện hành](G1-DANH-MUC-TINH-NANG.md).  
> Mục tiêu kiểm tra: đúng nguồn/nhu cầu, đơn vị tính effort, không trùng chủ sở hữu, nghiệm thu được, giới hạn đúng V1 và điều kiện vendor/đầu vào. Không có bằng chứng kết quả khảo sát GĐ0 hay xác nhận mới của VTV8.
>
> **Lưu ý:** Báo cáo này giữ nguyên tất cả **86 ID** để dễ đối chiếu. Các nhãn CORE/OPTION trong 11 tài liệu feature gốc **chưa đổi** và phải được cập nhật nhất quán khi đề xuất được duyệt. Không tự động coi đề xuất ở đây là scope hợp đồng.

## 1. Kết quả kiểm tra đủ 86 ID

| Chỉ số | Kết quả |
|---|---:|
| Số mã tính năng đã rà soát (không trùng) | **86/86** |
| Giữ nguyên phạm vi như đang mô tả | **12** |
| Giữ các OPTION sẵn có | **5** |
| Giữ các CONDITIONAL sẵn có | **3** |
| Giữ nhưng phải sửa/thu hẹp mô tả, ranh giới, nghiệm thu | **59** |
| Kiến nghị đổi CORE thành OPTION | **2** |
| Kiến nghị chuyển từ feature sang công việc khảo sát/test/triển khai riêng | **5** |
| **Tổng** | **86** |

**Số lượng sau rà soát nếu chấp thuận điều chỉnh:** 81 tính năng phần mềm/tích hợp (**71 CORE, 10 OPTION/CONDITIONAL**) + **5 công việc phi-feature vẫn phải thực hiện**. **Chưa cộng** 01 tính năng quản lý trang tĩnh CMS có khả năng thiếu; khi chốt nhu cầu có thể tăng danh mục thêm 01. Đây là phân loại lại chứ không đồng nghĩa giảm khối lượng thực tế/chi phí tương ứng.

## 2. Theo module: danh mục gốc và cơ cấu đề xuất

| Module | Mã đang có | CORE sau rà soát | OPTION/CONDITIONAL sau rà soát | Chuyển phi-feature |
|---|---:|---:|---:|---:|
| [G1-01](G1-QA-G1-01.md) – Website VTV8Online | 9 | 7 | 2 | 0 |
| [G1-02](G1-QA-G1-02.md) – Tài khoản và phân quyền CMS | 6 | 5 | 1 | 0 |
| [G1-03](G1-QA-G1-03.md) – Biên tập và xuất bản | 9 | 7 | 2 | 0 |
| [G1-04](G1-QA-G1-04.md) – Nội dung có cấu trúc | 9 | 9 | 0 | 0 |
| [G1-05](G1-QA-G1-05.md) – Thư viện media – DAM | 8 | 8 | 0 | 0 |
| [G1-06](G1-QA-G1-06.md) – Video VOD | 6 | 6 | 0 | 0 |
| [G1-07](G1-QA-G1-07.md) – Livestream và lịch phát | 8 | 8 | 0 | 0 |
| [G1-08](G1-QA-G1-08.md) – Streaming – tích hợp kỹ thuật | 9 | 5 | 2 | 2 |
| [G1-09](G1-QA-G1-09.md) – Báo cáo, thống kê | 6 | 4 | 2 | 0 |
| [G1-10](G1-QA-G1-10.md) – Nhuận bút | 8 | 7 | 1 | 0 |
| [G1-11](G1-QA-G1-11.md) – Chuyển dữ liệu cũ | 8 | 5 | 0 | 3 |
| **Tổng** | **86** | **71** | **10** | **5** |

**Xem quyết định riêng trên từng ID:** [G1-01](G1-QA-G1-01.md) · [G1-02](G1-QA-G1-02.md) · [G1-03](G1-QA-G1-03.md) · [G1-04](G1-QA-G1-04.md) · [G1-05](G1-QA-G1-05.md) · [G1-06](G1-QA-G1-06.md) · [G1-07](G1-QA-G1-07.md) · [G1-08](G1-QA-G1-08.md) · [G1-09](G1-QA-G1-09.md) · [G1-10](G1-QA-G1-10.md) · [G1-11](G1-QA-G1-11.md). Mỗi file có chính xác một dòng đánh giá cho từng tính năng của module, ghi rõ điều chỉnh cần thiết trước khi ước tính.

## 3. Năm đầu việc không nên đưa vào công thức FE/BE theo feature

| ID cũ | Nhận định | Đề xuất điểm đến/chi phí |
|---|---|---|
| **G1-08-F001** | Đánh giá năng lực và ma trận hợp đồng media là khảo sát/đầu vào từ **G0-06**; phần tiếp nhận technical specs ở GĐ1 không phải một màn/feature riêng | Sử dụng sản phẩm GĐ0; chỉ tính effort cập nhật/phối hợp khi phát sinh khác phạm vi GĐ0 |
| **G1-08-F009** | Kiểm thử tải, QoE, kiểm chứng 120k CCU/SLA là yêu cầu kỹ thuật thực tế, **không phải giờ code FE/BE** | Công việc kiểm chứng hiệu năng trong **G1-H02**, kèm trách nhiệm vendor và đơn vị đo; không bỏ khỏi GĐ1 |
| **G1-11-F001** | Manifest/kiểm kê nguồn dữ liệu là kết quả của **G0-07** được xác nhận lại khi nhận bàn giao | Gate đầu vào/khóa phạm vi migration; chỉ tính effort cập nhật ngoài GĐ0 |
| **G1-11-F007** | Đối soát và nghiệm thu sau chạy chuyển dữ liệu là **data-operation / UAT**, không hoàn toàn là feature lập trình | Chi phí migration thực tế và đối soát riêng; nếu cần viết công cụ đối soát thì tách giờ BE đúng phần code |
| **G1-11-F008** | Cutover/rollback thuộc kế hoạch vận hành và chuyển production; chỉ mapping URL là thành phần công cụ | **G1-H02/H01** cho cutover, **G1-11** cho URL map, **G1-01-F008** cho logic redirect; không tính trùng |

**Cảnh báo:** Nếu xóa 5 dòng này khỏi sheet feature mà không đưa sang WBS/chi phí đặc thù tương ứng thì sẽ **bỏ sót công việc và báo thiếu chi phí**.

## 4. Hai mục nên đổi CORE thành OPTION

| ID | Lý do | Scope khuyến nghị |
|---|---|---|
| **G1-01-F007** | Tài liệu giai đoạn GĐ2 nêu tìm kiếm; website V1 có thể vận hành bằng chuyên mục, menu và trang danh sách | Tìm kiếm từ khóa đơn giản **chỉ triển khai nếu VTV8 yêu cầu ở V1**; chưa mặc định full-text engine nâng cao |
| **G1-09-F006** | Quy trình khóa kỳ và sổ điều chỉnh thống kê có mức độ nghiệp vụ/chi phí cao hơn yêu cầu báo cáo lượt xem cơ bản | CORE chỉ cần định nghĩa chỉ số, nguồn và thời điểm đồng bộ ở F003/F005. Khóa kỳ/đối soát nâng cao là OPTION |

**Lưu ý:** Các thông tin bắt buộc của báo cáo CMS V1 gồm **số lượng tin bài, lượt xem theo bài/chuyên mục/thời gian**; việc cắt tính năng G1-09-F006 không được làm mất các chỉ số này.

## 5. Các điểm trùng chủ sở hữu cần xử lý trước khi báo giá

| Cặp / nhóm | Hiện tượng | Quyết định kiến nghị |
|---|---|---|
| G1-01-F005 và G1-06-F004 | Trang chương trình/series và danh sách tập dùng chung dữ liệu | 01 template chương trình/series của website, G1-06 chỉ phát triển phần xem video/tập |
| G1-02-F004 và G1-03-F003/F004/F006 | Quyền duyệt khác quy trình duyệt | G1-02 sở hữu policy; G1-03 sở hữu hàng đợi, trạng thái, hành động và log duyệt |
| G1-03-F005 và G1-01-F004 | Preview nháp dùng renderer bài viết | Tái sử dụng renderer, chỉ tính phần bảo vệ nháp và hành động preview thêm |
| G1-04-F002 và G1-10-F001 | Hồ sơ người và quan hệ tham gia sản xuất | Hồ sơ contributor ở G1-04; vai trò/đóng góp theo sản phẩm phục vụ tính nhuận bút ở G1-10; xác định 01 bảng quan hệ nền |
| G1-04-F009 và G1-05-F007 | Tag, phân loại media | Tái dùng taxonomy/tag/relation API, DAM không lập lại hệ tag |
| G1-05-F004, G1-03-F006 và G1-06-F002 | Kiểm tra quyền media và quyền xuất bản | Metadata/chính sách quyền ở DAM; một cổng kiểm tra trước khi công khai dùng chung cho bài/video |
| G1-06-F003/F005, G1-07-F005/F008 và G1-08-F004 | Player, lỗi phát và adapter nguồn | 01 player component và bộ xử lý lỗi FE tái sử dụng; G1-08 chỉ nguồn/config API |
| G1-06-F006, G1-07-F007 và G1-08-F007 | Một quy trình phát lại xuất hiện ở 3 module | G1-08 nhận bản ghi; G1-07 đóng phiên/gắn liên kết; G1-06 duyệt xuất bản và phát lại |
| G1-04-F008 và G1-07-F001 | Sự kiện nội dung khác lịch phiên phát | Sự kiện nội dung chỉ là metadata, lịch live quản lý session nguồn phát; có quan hệ tham chiếu |
| G1-09-F003/F005 và G1-10-F004/F005 | Số liệu lượt xem và tính tiền | G1-09 là nguồn định nghĩa/thống kê; G1-10 tính theo quy tắc, không tự phát sinh một bộ analytics |
| G1-01-F008 và G1-11-F008 | URL cũ và redirect | Migration cung cấp map; website/server thực thi redirect; cutover H02 quản lý |

## 6. Những điểm thiếu hoặc cần làm rõ để tránh báo thiếu

| Mức | Điểm cần bổ sung/sửa | Vị trí đề xuất |
|---|---|---|
| **P0** | **Quy tắc nhuận bút chính thức:** đối tượng, loại bài/video, đồng tác giả, nhiều vai trò, đơn giá/hệ số, bài sửa/gỡ, thời gian hiệu lực, kỳ thanh toán, mẫu bảng kê | G1-10-F001…F008; trước ước tính chính xác module này |
| **P0** | **Ranh giới nhà cung cấp Streaming:** ingress, transcoding, ABR, HLS/DASH, recording, API, CDN, ownership, trách nhiệm SLA và bài test 120k; phân biệt CCU web và CCU viewer | G1-08, G1-07, G1-06 và G1-H02 |
| **P0** | **Tải lên file media lớn:** file 20GB/ngày là giả định về volume phát sinh, không phải giới hạn file đơn lẻ; cần chốt dung lượng lớn nhất/tập, cơ chế upload mất mạng và bảo vệ file không hợp lệ | G1-05-F001 |
| **P0** | **Cổng kiểm tra quyền trước xuất bản** cho bài và video: thiếu quyền, hết hạn, quyền chỉ nội bộ, quyền replay; định nghĩa khi nào chỉ cảnh báo/khi nào chặn | G1-05-F004 + G1-03-F006 + G1-06-F002 |
| **P0** | **View count theo bài/chuyên mục/thời gian** là yêu cầu gốc; hiện ghi rõ đo lượt xem bài nhưng chưa mô tả rõ cách cộng theo chuyên mục và kỳ, chống đếm trùng khi một bài có nhiều chuyên mục | Chỉnh G1-09-F003/F005 |
| **P1** | **Thiếu chức năng CMS quản lý trang tĩnh:** G1-01-F009 dự kiến lấy nội dung giới thiệu/liên hệ/chính sách 'từ CMS' nhưng chưa có tính năng tạo/sửa/xuất bản loại nội dung này | Đề xuất **G1-03-F010 – Quản lý trang tĩnh**, hoặc chốt nội dung cố định/cấu hình không qua CMS |
| **P1** | **Ranh giới dữ liệu và trạng thái xuất bản thực thể**: chương trình/series/tập, hồ sơ địa danh/nhân vật/di sản có public hay chỉ dùng nội bộ | G1-04 toàn module và G1-01-F006 |
| **P1** | **Khối lượng/nguồn migration**: số nguồn thực, chất lượng metadata, đường dẫn ảnh trong nội dung, xử lý bài lỗi, thời gian downtime và rollback | G1-11 + G1-H02 |
| **P1** | **Biên tập bài đã công khai:** xác định chỉnh sửa có bắt buộc duyệt lại không, phiên bản tối thiểu nào cần lưu dù full diff/restore đang OPTION | G1-03-F006/F008 |
| **P1** | **Định nghĩa VOD/live playback availability:** trạng thái 'live' phải dựa vào tín hiệu thực tế, không chỉ đồng hồ lịch, cách xử lý khi vendor mất kết nối | G1-07-F004/F008 + G1-08-F008 |
| **P2** | **Khối lượng UI quản trị taxonomy**: giới hạn form/template dùng chung, giới hạn dữ liệu geographic; không mặc định bản đồ hay bộ hồ sơ di sản chuyên sâu | G1-04 |
| **P2** | **Bảo mật/Vận hành:** kiểm soát upload, backup/restore, mật khẩu, audit quyền, dữ liệu cá nhân người viết/nhân vật, secrets và chính sách retention | G1-H01 và các module liên quan |

P0 ở đây có nghĩa là **phải biết câu trả lời hoặc đặt giả định/hạng mục rủi ro rõ trước khi cam kết khối lượng/giá**; không phải tất cả đều phải mua/thực thi trong V1 bằng mọi giá.

## 7. Phân tích mức sẵn sàng lập dự toán

| Khía cạnh | Đánh giá | Lý do |
|---|---|---|
| Bao quát yêu cầu gốc | **Khá** | CMS, DAM, migration, live, report, nhuận bút đều có mặt; website/VOD là suy luận hợp lý |
| Truy vết nguồn | **Trung bình** | Ký hiệu T chứng minh có chủ đề trong nguồn, **không** xác nhận từng thao tác/tiêu chí acceptance là nguyên văn |
| Không trùng công sức | **Chưa đạt** | Nhiều thành phần FE dùng chung, 5 đầu việc phi-feature đang lẫn bảng tính năng |
| Khả năng kiểm thử | **Trung bình** | Đã có acceptance một dòng/feature nhưng chưa có kịch bản chính/ngoại lệ, mock API, test data |
| Kiểm soát phạm vi V1 | **Cần hiệu chỉnh** | Quy mô UI taxonomy, quyền, luật nhuận bút và Media Streaming còn mở |
| Đủ điều kiện chốt giờ FE/BE | **Chưa** | Vẫn thiếu các quyết định P0; vendor và khối lượng migration chưa xác minh |

**Không dùng phương pháp CODING 55% cho** khảo sát vendor đã thực hiện ở GĐ0, QA tải chuyên sâu, DevOps, dữ liệu migration thực tế hay cutover. Đưa các phần này sang bảng effort/cost chuyên biệt. Chỉ áp dụng FE/BE Middle Developer và các công thức BA/Design/QA với phần phát triển phần mềm đúng nghĩa.

## 8. Trình tự xử lý kiến nghị

1. Duyệt quyết định 5 đầu việc phi-feature (không loại khỏi WBS) và 2 tính năng chuyển OPTION.
2. Chỉnh **11 file module** theo 59 kiến nghị giới hạn/phân trách nhiệm; đính kèm một danh sách dịch vụ/UI dùng chung được tính giờ một lần.
3. Xác nhận hoặc loại bỏ chức năng quản trị trang tĩnh; nếu chọn thêm thì bổ sung G1-03-F010 với acceptance riêng.
4. Khóa giả định/đầu vào P0 cho nhuận bút, media rights, streaming và số liệu lượt xem; thiết lập kịch bản A/B nếu chưa có vendor.
5. Chuẩn hóa acceptance dùng được để kiểm tra cho từng CORE; chỉ sau đó ước tính FE/BE/DevOps/migration và kiểm tra tiến độ 8–12 tuần.

**Quyết định chưa thực hiện:** Báo cáo QA chưa tự cập nhật các nhãn CORE và danh mục 86 thành 81 trong README; tránh làm mất dấu phạm vi gốc trước khi người dùng duyệt thay đổi. Không khẳng định VTV8 đã phê duyệt bất kỳ bổ sung suy luận nào.
