# GĐ0 – Ước tính chi tiết 33 công việc khảo sát và thiết kế tổng thể

> **Ngày lập:** 09/10/2026 · **Trạng thái:** `DRAFT ESTIMATE` – đề xuất để người dùng rà soát, CHƯA phải số giờ đã chốt/giá trị phê duyệt của VTV8.  
> **Căn cứ phạm vi đã chốt nội bộ:** [8 module, 33 công việc GĐ0](../docs/00-gd0-khao-sat-thiet-ke/G0-TONG-HOP-PHAN-TICH-NGHIEP-VU.md).  
> **Loại ước tính:** effort theo **giờ công chuyên môn**; không phải thời lượng lịch, số ngày làm việc của 1 người hay giờ FE/BE coding. Không có đơn giá/số tiền.  
> **Giới hạn:** ước tính chủ quan dựa trên phạm vi trong tài liệu, không phải kết quả khảo sát hiện trạng đã được đo đạc.

## 1. Định nghĩa vai trò và cách tính

| Mã vai trò | Vai trò | Phạm vi công sức |
|---|---|---|
| BA | Phân tích nghiệp vụ | Khảo sát, phân tích, xây dựng và rà soát đầu ra thuộc chuyên môn |
| UX | Thiết kế UX/UI | Khảo sát, phân tích, xây dựng và rà soát đầu ra thuộc chuyên môn |
| ARC | Kiến trúc giải pháp | Khảo sát, phân tích, xây dựng và rà soát đầu ra thuộc chuyên môn |
| SYS | Kỹ thuật hệ thống/dữ liệu | Khảo sát, phân tích, xây dựng và rà soát đầu ra thuộc chuyên môn |
| MEDIA | Chuyên gia video/streaming | Đánh giá VOD/live, khả năng vendor và phương án phân phối |
| LEGAL | Phân tích bản quyền/phối hợp pháp lý | Khảo sát hồ sơ quyền và phối hợp rà soát điều kiện; không cung cấp ý kiến pháp lý chính thức |
| PM | Quản lý và tổng hợp dự án | Khảo sát, phân tích, xây dựng và rà soát đầu ra thuộc chuyên môn |

- Mỗi dòng công việc: `Tổng giờ = BA + UX + ARC + SYS + MEDIA + LEGAL + PM`.
- Quy đổi `MD = Tổng giờ / 8`; MD là **man-day effort**, không phải số ngày lịch.
- Giờ theo vai trò **bao gồm** thời gian chuẩn bị, làm việc với các bên, ghi nhận kết quả, hoàn thiện tài liệu và **một vòng rà soát hợp nhất** trong giới hạn giả định bên dưới.
- **Không** áp dụng công thức `Coding=55%` để suy ra giờ BA/Design/QA cho GĐ0; phương pháp đó chỉ áp dụng với tính năng phần mềm của GĐ1–GĐ4 khi được chốt.

## 2. Tổng hợp theo module và vai trò (đơn vị: giờ)

| Module | Số công việc | BA | UX | ARC | SYS | MEDIA | LEGAL | PM | Tổng giờ | MD |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| G0-01 | 7 | 56 | 0 | 0 | 0 | 4 | 0 | 6 | **66** | 8.25 |
| G0-02 | 6 | 6 | 0 | 8 | 46 | 0 | 0 | 0 | **60** | 7.50 |
| G0-03 | 3 | 6 | 0 | 0 | 0 | 0 | 14 | 2 | **22** | 2.75 |
| G0-04 | 3 | 4 | 44 | 0 | 0 | 0 | 0 | 0 | **48** | 6.00 |
| G0-05 | 4 | 2 | 0 | 32 | 6 | 0 | 0 | 0 | **40** | 5.00 |
| G0-06 | 4 | 0 | 0 | 8 | 2 | 26 | 0 | 2 | **38** | 4.75 |
| G0-07 | 3 | 6 | 0 | 2 | 16 | 0 | 0 | 0 | **24** | 3.00 |
| G0-08 | 3 | 6 | 0 | 2 | 0 | 0 | 0 | 14 | **22** | 2.75 |
| **Tổng** | **33** | **86** | **44** | **52** | **70** | **30** | **14** | **24** | **320** | **40.00** |

## 3. Ước tính từng công việc (33 dòng)

**Cách đọc:** Phân bổ vai trò như `BA 6 + PM 2` nghĩa là 6 giờ phân tích nghiệp vụ + 2 giờ quản lý/phối hợp, tổng 8 giờ, không tính hai lần.

### G0-01 – 66 giờ / 8.25 MD

| Mã công việc | Tên công việc | Giờ theo vai trò | Tổng giờ | MD |
|---|---|---|---:|---:|
| G0-01-F001 | Khảo sát các bộ phận và nhóm người sử dụng | BA 6 + PM 2 | 8 | 1.00 |
| G0-01-F002 | Khảo sát quy trình sản xuất và xuất bản tin bài | BA 10 | 10 | 1.25 |
| G0-01-F003 | Khảo sát quy trình quản lý chương trình và video | BA 8 + MEDIA 2 | 10 | 1.25 |
| G0-01-F004 | Khảo sát quy trình tổ chức livestream | BA 6 + MEDIA 2 | 8 | 1.00 |
| G0-01-F005 | Khảo sát nghiệp vụ báo cáo và nhuận bút | BA 8 | 8 | 1.00 |
| G0-01-F006 | Xác định nhu cầu người xem và khai thác kinh doanh | BA 8 + PM 2 | 10 | 1.25 |
| G0-01-F007 | Tổng hợp yêu cầu và phạm vi phát triển | BA 10 + PM 2 | 12 | 1.50 |
| **Cộng G0-01** | | | **66** | **8.25** |

### G0-02 – 60 giờ / 7.50 MD

| Mã công việc | Tên công việc | Giờ theo vai trò | Tổng giờ | MD |
|---|---|---|---:|---:|
| G0-02-F001 | Khảo sát website VTV8 hiện tại | BA 2 + SYS 6 | 8 | 1.00 |
| G0-02-F002 | Khảo sát CMS và các hệ thống quản trị đang sử dụng | BA 4 + SYS 6 | 10 | 1.25 |
| G0-02-F003 | Khảo sát mã nguồn, cơ sở dữ liệu và kết nối hiện có | ARC 4 + SYS 10 | 14 | 1.75 |
| G0-02-F004 | Kiểm kê kho nội dung và tài sản số | SYS 10 | 10 | 1.25 |
| G0-02-F005 | Khảo sát nội dung trên Facebook, TikTok và YouTube | SYS 6 | 6 | 0.75 |
| G0-02-F006 | Đánh giá hạ tầng, lưu lượng và khả năng kế thừa | ARC 4 + SYS 8 | 12 | 1.50 |
| **Cộng G0-02** | | | **60** | **7.50** |

### G0-03 – 22 giờ / 2.75 MD

| Mã công việc | Tên công việc | Giờ theo vai trò | Tổng giờ | MD |
|---|---|---|---:|---:|
| G0-03-F001 | Phân loại quyền sở hữu các loại nội dung | BA 4 + LEGAL 4 | 8 | 1.00 |
| G0-03-F002 | Khảo sát giấy phép và quyền khai thác nội dung | BA 2 + LEGAL 6 | 8 | 1.00 |
| G0-03-F003 | Xác định các ràng buộc pháp lý và trách nhiệm | LEGAL 4 + PM 2 | 6 | 0.75 |
| **Cộng G0-03** | | | **22** | **2.75** |

### G0-04 – 48 giờ / 6.00 MD

| Mã công việc | Tên công việc | Giờ theo vai trò | Tổng giờ | MD |
|---|---|---|---:|---:|
| G0-04-F001 | Xây dựng cấu trúc và phân loại nội dung | BA 4 + UX 8 | 12 | 1.50 |
| G0-04-F002 | Thiết kế cấu trúc website và CMS | UX 12 | 12 | 1.50 |
| G0-04-F003 | Thiết kế giao diện sơ bộ | UX 24 | 24 | 3.00 |
| **Cộng G0-04** | | | **48** | **6.00** |

### G0-05 – 40 giờ / 5.00 MD

| Mã công việc | Tên công việc | Giờ theo vai trò | Tổng giờ | MD |
|---|---|---|---:|---:|
| G0-05-F001 | Đề xuất cấu trúc hệ thống VTV8Online | ARC 10 + SYS 2 | 12 | 1.50 |
| G0-05-F002 | Đề xuất cấu trúc dữ liệu tổng thể | BA 2 + ARC 8 | 10 | 1.25 |
| G0-05-F003 | Xác định yêu cầu bảo mật và vận hành | ARC 6 + SYS 4 | 10 | 1.25 |
| G0-05-F004 | Định hướng khả năng mở rộng | ARC 8 | 8 | 1.00 |
| **Cộng G0-05** | | | **40** | **5.00** |

### G0-06 – 38 giờ / 4.75 MD

| Mã công việc | Tên công việc | Giờ theo vai trò | Tổng giờ | MD |
|---|---|---|---:|---:|
| G0-06-F001 | Khảo sát hạ tầng livestream đang sử dụng | SYS 2 + MEDIA 6 | 8 | 1.00 |
| G0-06-F002 | Đánh giá khả năng tích hợp VTVcab/VTVprime | MEDIA 8 + PM 2 | 10 | 1.25 |
| G0-06-F003 | Đề xuất phương án phát video và livestream | ARC 4 + MEDIA 6 | 10 | 1.25 |
| G0-06-F004 | Đánh giá khả năng chịu tải và các phương án đầu tư | ARC 4 + MEDIA 6 | 10 | 1.25 |
| **Cộng G0-06** | | | **38** | **4.75** |

### G0-07 – 24 giờ / 3.00 MD

| Mã công việc | Tên công việc | Giờ theo vai trò | Tổng giờ | MD |
|---|---|---|---:|---:|
| G0-07-F001 | Xác định phạm vi dữ liệu cần chuyển đổi | BA 2 + SYS 4 | 6 | 0.75 |
| G0-07-F002 | Đánh giá khả năng chuyển đổi và chuẩn hóa | BA 2 + SYS 6 | 8 | 1.00 |
| G0-07-F003 | Xây dựng phương án migration tổng thể | BA 2 + ARC 2 + SYS 6 | 10 | 1.25 |
| **Cộng G0-07** | | | **24** | **3.00** |

### G0-08 – 22 giờ / 2.75 MD

| Mã công việc | Tên công việc | Giờ theo vai trò | Tổng giờ | MD |
|---|---|---|---:|---:|
| G0-08-F001 | Tổng hợp phạm vi phát triển từng giai đoạn | BA 6 + PM 2 | 8 | 1.00 |
| G0-08-F002 | Xây dựng kế hoạch triển khai sơ bộ | ARC 2 + PM 6 | 8 | 1.00 |
| G0-08-F003 | Xây dựng cơ sở lập dự toán | PM 6 | 6 | 0.75 |
| **Cộng G0-08** | | | **22** | **2.75** |

## 4. Tổng giờ theo vai trò

| Vai trò | Giờ | MD | Tỷ trọng effort |
|---|---:|---:|---:|
| Phân tích nghiệp vụ (BA) | 86 | 10.75 | 26.9% |
| Thiết kế UX/UI (UX) | 44 | 5.50 | 13.8% |
| Kiến trúc giải pháp (ARC) | 52 | 6.50 | 16.3% |
| Kỹ thuật hệ thống/dữ liệu (SYS) | 70 | 8.75 | 21.9% |
| Chuyên gia video/streaming (MEDIA) | 30 | 3.75 | 9.4% |
| Phân tích bản quyền/phối hợp pháp lý (LEGAL) | 14 | 1.75 | 4.4% |
| Quản lý và tổng hợp dự án (PM) | 24 | 3.00 | 7.5% |
| **Tổng** | **320** | **40.00** | **100%** |

## 5. Giả định định lượng áp dụng cho 320 giờ cơ sở

1. **Tiếp cận thông tin:** VTV8 chỉ định đầu mối và cung cấp tài liệu hiện có/khả năng quan sát website, CMS, codebase, database, logs, số liệu nội dung trong thời gian khảo sát. Các mốc chờ phê duyệt/tài liệu **không** quy đổi thành giờ công nhưng có thể kéo dài lịch.
2. **Khối lượng khảo sát mẫu:** 01 website công khai, 01 CMS, khoảng 01 codebase chính, 01 database chính, 01 môi trường/hệ thống lưu trữ chính; tối đa ba nhóm kênh Facebook/TikTok/YouTube. Nếu có nhiều nền tảng độc lập phải ước tính bổ sung.
3. **Khảo sát nghiệp vụ:** tối đa khoảng 6 buổi làm việc chuyên đề (mỗi buổi 60–90 phút), tổng hợp được bằng chứng đầu vào; trao đổi bổ sung qua tài liệu/email thay vì workshop riêng.
4. **Tài sản số:** thống kê bằng export/báo cáo hiện hữu và kiểm tra **mẫu đại diện**, không kiểm kê thủ công 100% bài/video kể từ 2023.
5. **Bản quyền:** phân loại quyền **theo nhóm tài sản** và mẫu hợp đồng/giấy phép; 14 giờ LEGAL chỉ dành cho phối hợp phân tích nghiệp vụ quyền/điều kiện, không bao gồm tư vấn pháp lý được chứng nhận hoặc kiểm định hiệu lực từng giấy phép.
6. **Thiết kế UI:** tối đa **6 mẫu màn hình wireframe mức thấp**, kèm 01 luồng prototype minh họa; không có thiết kế high-fidelity hoàn chỉnh cho toàn bộ CMS/website và không tạo design system đầy đủ.
7. **Kiến trúc:** 01 hướng kiến trúc tổng thể chủ đạo, một số phương án thay thế ở mức so sánh; sơ đồ dữ liệu **khái niệm**, không đến mức DDL, endpoint hay infrastructure-as-code.
8. **Streaming:** tối đa 01 nhóm đối tác VTVcab/VTVprime để làm rõ năng lực kỹ thuật, phác thảo khoảng 2 kịch bản media/traffic; chưa thực hiện thử tải, chưa mua dịch vụ, chưa có SLA chính thức.
9. **Migration:** hướng tiếp cận và bước đối soát cấp cao, không viết connector, mapping toàn bộ fields hay chạy dry-run/cutover.
10. **Rà soát:** 01 vòng phản hồi tổng hợp từ đầu mối VTV8 và 01 lần bàn giao hồ sơ tổng thể; các vòng bổ sung hoặc thay đổi đáng kể phạm vi cần báo lại effort.
11. **Hình thức làm việc:** chủ yếu trực tuyến hoặc sử dụng tài liệu truy cập từ xa; chưa tính đi lại, lưu trú, onsite, công cụ bản quyền, dịch vụ vendor hoặc thuế.
12. **Mức độ chắc chắn:** dựa trên tài liệu đề xuất, **không có khảo sát thực tế làm căn cứ xác thực thời lượng**. Cần hiệu chỉnh sau kickoff và khi xác định được số hệ thống/mẫu UI/buổi workshop.

## 6. Tiến độ lịch và năng lực huy động

- **Tổng effort cơ sở:** 320 giờ = 40 MD.
- **3 tuần (15 ngày làm việc):** cần bình quân 2.67 FTE quy đổi; phải huy động nhóm chuyên môn linh hoạt và có phản hồi/đầu vào nhanh.
- **4 tuần (20 ngày làm việc):** cần bình quân 2.00 FTE quy đổi; hợp lý hơn với các phụ thuộc nghiệp vụ → UX/kiến trúc → kế hoạch.
- **2 tuần (10 ngày làm việc):** trung bình 4.00 FTE; không khuyến nghị cam kết do phụ thuộc đầu mối và dữ liệu streaming/bản quyền.

| Giai đoạn lịch tham khảo | Trọng tâm | Công việc có thể song song |
|---|---|---|
| Tuần 1 | Kickoff, khảo sát bộ phận/nghiệp vụ, Website/CMS, tài sản, nguồn quyền | G0-01, G0-02 và bắt đầu G0-03/G0-06 |
| Tuần 2 | Hoàn thiện yêu cầu cấp cao, taxonomy/sitemap, kiến trúc nền, thảo luận streaming | G0-04, G0-05, G0-06 |
| Tuần 3 | Wireframe/prototype đại diện, phương án media, migration, gom scope | G0-04, G0-06, G0-07 và khởi động G0-08 |
| Tuần 4 (nếu sử dụng) | Rà soát hợp nhất, điều chỉnh và bàn giao hồ sơ, chốt vấn đề TBC | G0-08 và review các module |

**Lưu ý:** Các FTE trên là tổng công suất quy đổi; không có nghĩa thuê 2.00 người cố định. Cần BA, UX, ARC, SYS, MEDIA, LEGAL, PM tham gia với cường độ khác nhau. Vai trò MEDIA/VTVcab và LEGAL đặc biệt phụ thuộc thông tin của bên thứ ba.

## 7. Kịch bản và dự phòng

| Kịch bản | Giờ công | MD | Cách sử dụng |
|---|---:|---:|---|
| Phạm vi thuận lợi (giảm 20%) | 256 | 32.00 | Nhiều tài liệu đã sẵn có và workshop/rà soát rất ít |
| **Cơ sở đang đề xuất** | **320** | **40.00** | Theo 12 giả định nêu trên |
| Dự phòng 15% trên effort cơ sở | +48 | +6.00 | Nếu muốn lập ngân sách nội bộ, **không cộng vào cơ sở một cách mặc định** |
| Phương án có dự phòng 15% | 368 | 46.00 | Mức chuẩn bị ngân sách tham khảo, không phải giờ đã phê duyệt |
| Khối lượng lớn hơn (tăng 25%) | 400 | 50.00 | Nhiều dữ liệu/luồng/đầu mối hoặc cần thêm vòng thiết kế; có thể vượt nếu phát sinh major scope |

**Những hạng mục có rủi ro tăng effort mạnh:** G0-02-F003/F004/F006 (quyền truy cập và quy mô thực tế), G0-03 (giấy phép chưa rõ), G0-04-F003 (số mẫu UI/vòng góp ý), G0-06-F002/F004 (phản hồi từ VTVcab và phương pháp kiểm chứng tải), G0-07 (chất lượng dữ liệu cũ).

## 8. Phần loại trừ và điều kiện chuyển sang báo giá

- **Không bao gồm** lập trình FE/BE, cấu hình server production, nhập/chuyển dữ liệu thật, kiểm thử tải/penetration test thực tế, tư vấn pháp lý độc lập, mua license, phí hạ tầng/CDN và chi phí vendor.
- Đơn giá theo vai trò, thuế, tiền tệ, phí công tác và điều kiện thương mại chưa được cung cấp nên **chưa tính thành tiền**.
- Chưa sửa template Excel gốc hoặc đưa những giờ này vào sheet FE/BE của bản báo giá phần mềm. Khi lập báo giá chính thức, dùng **bảng GĐ0 riêng** dựa trên giờ theo chuyên môn.
- Đánh dấu **DRAFT ESTIMATE** đến khi người dùng duyệt bảng giờ; việc chốt nội bộ vẫn khác VTV8 xác nhận/sử dụng để ký hợp đồng.

**Phương pháp FE/BE cho các giai đoạn phát triển:** [PHUONG-PHAP-UOC-TINH.md](PHUONG-PHAP-UOC-TINH.md).
