# GĐ1 – VTV8Online V1: 11 module và 82 tính năng sau rà soát

> **09/10/2026 – DRAFT với VTV8**. Danh mục 11 module + 2 nhóm hỗ trợ đã chọn nội bộ; đã áp dụng QA vào mô tả/ranh giới từng tính năng: **82 tính năng (72 CORE, 10 OPTION/CONDITIONAL), 5 công việc phi-feature chuyển WBS**, không bỏ khỏi GĐ1.
> Tài liệu nguồn dự kiến **8–12 tuần**, chưa được xác nhận khả thi khi chưa có ước tính và phương án media/migration.
> **Không có tích hợp, đồng bộ hay quản trị mạng xã hội** trong phạm vi phát triển.

## 11 module

| Mã | Module | Tổng | CORE | Tùy chọn/điều kiện |
|---|---|---:|---:|---:|
| [G1-01 – Website VTV8Online](G1-01-website-vtv8online.md) | 9 | 7 | 2 |
| [G1-02 – Tài khoản và phân quyền CMS](G1-02-cms-quan-tri.md) | 6 | 5 | 1 |
| [G1-03 – Biên tập và xuất bản](G1-03-bien-tap-xuat-ban.md) | 10 | 8 | 2 |
| [G1-04 – Nội dung có cấu trúc](G1-04-noi-dung-co-cau-truc.md) | 9 | 9 | 0 |
| [G1-05 – Thư viện media – DAM](G1-05-dam-thu-vien-media.md) | 8 | 8 | 0 |
| [G1-06 – Video VOD](G1-06-video-vod.md) | 6 | 6 | 0 |
| [G1-07 – Livestream và lịch phát](G1-07-livestream-lich-phat.md) | 8 | 8 | 0 |
| [G1-08 – Tích hợp Streaming](G1-08-streaming-integration.md) | 7 | 5 | 2 |
| [G1-09 – Báo cáo và thống kê](G1-09-bao-cao-thong-ke.md) | 6 | 4 | 2 |
| [G1-10 – Quản lý và tính nhuận bút](G1-10-nhuan-but.md) | 8 | 7 | 1 |
| [G1-11 – Chuyển đổi dữ liệu cũ](G1-11-chuyen-doi-du-lieu.md) | 5 | 5 | 0 |

**[Danh mục 82 tính năng và mô tả nghiệp vụ](G1-DANH-MUC-TINH-NANG.md)**. Mỗi module có bảng actor, nghiệp vụ, phạm vi FE/BE, tiêu chí nghiệm thu riêng và ranh giới sau rà soát.

## Giờ FE/BE ước tính theo tính năng (09/10/2026)

- **[Dự toán chi tiết 82 tính năng FE/BE](../../bao-gia/DU-TOAN-EFFORT-GD1-FE-BE-DU-THAO.md)** và [CSV bảng công sức](../../bao-gia/DU-TOAN-EFFORT-GD1-FE-BE.csv).
- **CORE (72):** FE 1.616h + BE 2.600h = 4.216h Coding; tổng 7.665,45h / 958,18 MD theo tỷ trọng BA/Design/QA của biểu mẫu.
- **OPTION/CONDITIONAL (10):** FE 208h + BE 364h = 572h Coding, để riêng, chỉ cộng nếu được xác nhận.
- **H01/H02, thuê streaming/CDN, kiểm thử tải chuyên sâu, chạy migration dữ liệu và PM** chưa có dự toán giờ/giá ở bản FE/BE này, không tự động nằm trong 958,18 MD.

## Nhóm công việc triển khai

- [G1-H01 – Hạ tầng và vận hành ứng dụng](G1-H01-ha-tang-van-hanh.md): 7 công việc ngoài phát triển chức năng (DevOps, backup, security, CI/CD, giám sát ứng dụng).
- [G1-H02 – Kiểm thử, UAT, migration operations và chuyển giao](G1-H02-nghiem-thu-chuyen-giao.md): 11 công việc, trong đó bao gồm **5 đầu việc chuyển khỏi bảng FE/BE**. Không tính QA trong công thức phần mềm hoặc kết quả GĐ0 hai lần.

## Tài liệu chất lượng

- [Nguyên tắc và owner thành phần dùng chung](G1-THANH-PHAN-DUNG-CHUNG.md).
- [Checklist nghiệm thu chung và 10 kịch bản E2E](G1-TIEU-CHI-NGHIEM-THU.md).
- [Báo cáo QA trên danh sách 86 mã ban đầu](G1-BAO-CAO-RA-SOAT-86-TINH-NANG.md) và 11 file `G1-QA-G1-xx.md`: hồ sơ review lịch sử trước chỉnh.

## Quyết định ranh giới

1. G1-02 auth/RBAC; G1-03 quy trình duyệt và trang tĩnh CMS; G1-04 taxonomy/thực thể; G1-05 DAM/rights.
2. G1-01 website; G1-06 VOD/player dùng chung; G1-07 live/lịch; G1-08 tích hợp nguồn media/vendor và CDN, không mặc định tự xây transcoder/media server.
3. G1-09 báo cáo lượt xem bài/chuyên mục/thời gian, G1-10 tính nhuận bút theo **quy chế VTV8 chưa cung cấp**, không phát triển HRM/payroll toàn diện.
4. G1-11 script ETL cho website/CMS/kho cũ; H02 đảm nhận đối soát/cutover; không kết nối mạng xã hội.
5. Ngoài V1 cơ sở: tài khoản người xem, SSO công cộng, DRM, premium, AI, booking, bình luận, các chức năng mạng xã hội.

**Nguồn:** [Đề xuất VTV8–IIEL](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md), GĐ1 trang 4–6 và kiến trúc trang 8–11. Chưa chốt FE/BE hours, đơn giá hoặc ngân sách.
