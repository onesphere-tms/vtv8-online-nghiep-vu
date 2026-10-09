# GĐ2 – Media Platform: 66 tính năng đã chuẩn hóa

> **Bản thiết kế được chọn nội bộ ngày 09/10/2026; chưa được VTV8 phê duyệt.** Giữ 11 module + 2 nhóm hỗ trợ, 66 tính năng độc lập: 33 CORE, 9 OPTION, 24 CONDITIONAL. Chưa tính giờ FE/BE và chưa xác nhận mốc 3–6 tháng.
> Nguồn: [Đề xuất VTV8–IIEL](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md), [GĐ1](../01-gd1-vtv8online-v1/README.md) và [báo cáo QA 72 tính năng](G2-BAO-CAO-QA-72-TINH-NANG.md).

## Danh mục 11 module

| Mã | Module | Tổng | CORE | OPTION | CONDITIONAL |
|---|---|---:|---:|---:|---:|
| G2-01 | [Tài khoản và định danh người xem](G2-01-tai-khoan-nguoi-xem.md) | 6 | 5 | 0 | 1 |
| G2-02 | [Theo dõi và yêu thích](G2-02-theo-doi-yeu-thich.md) | 5 | 4 | 1 | 0 |
| G2-03 | [Lịch sử xem và playlist](G2-03-lich-su-playlist.md) | 6 | 6 | 0 | 0 |
| G2-04 | [Tìm kiếm và khám phá](G2-04-tim-kiem-kham-pha.md) | 6 | 4 | 2 | 0 |
| G2-05 | [Gợi ý và cá nhân hóa](G2-05-goi-y-ca-nhan-hoa.md) | 4 | 3 | 1 | 0 |
| G2-06 | [VOD và Livestream nâng cấp](G2-06-nang-cap-vod-livestream.md) | 4 | 2 | 0 | 2 |
| G2-07 | [Bản tin và thông báo](G2-07-ban-tin-thong-bao.md) | 7 | 4 | 1 | 2 |
| G2-08 | [Bình luận và tương tác](G2-08-binh-luan-tuong-tac.md) | 6 | 0 | 0 | 6 |
| G2-09 | [Thuê bao và thanh toán](G2-09-thue-bao-thanh-toan.md) | 8 | 0 | 1 | 7 |
| G2-10 | [Paywall và DRM](G2-10-quyen-xem-drm.md) | 6 | 0 | 1 | 5 |
| G2-11 | [Phân tích người xem](G2-11-analytics-qoe.md) | 8 | 5 | 2 | 1 |
| **Tổng** | | **66** | **33** | **9** | **24** |

**[Xem danh mục đầy đủ 66 tính năng](G2-DANH-MUC-TINH-NANG.md).** Mỗi file module trình bày actor, nghiệp vụ, công việc FE/BE mới, nghiệm thu, phạm vi và nhận xét sau rà soát.

## Hồ sơ kèm theo

- [Bảng đối chiếu 72 → 66](G2-MAPPING-72-66.md) và [QA trên 72 mã trước khi chỉnh](G2-BAO-CAO-QA-72-TINH-NANG.md).
- [Gói nghiệp vụ thuê bao/thanh toán và quyền xem](G2-COMMERCIAL-RELEASE-GATE.md).
- [Tiêu chí nghiệm thu](G2-TIEU-CHI-NGHIEM-THU.md) và [phần dùng chung](G2-THANH-PHAN-DUNG-CHUNG.md).
- [G2-H01 – Hạ tầng vận hành](G2-H01-ha-tang-media-platform.md); [G2-H02 – Pháp lý và UAT](G2-H02-nghiem-thu-phap-ly.md).

**Lưu ý:** Việc giữ 33 CORE không phải tuyên bố đã hoàn thành toàn bộ mục tiêu GĐ2. Nếu VTV8 chốt thương mại trả phí, các tính năng có điều kiện liên quan phải được triển khai và nghiệm thu cùng nhau. Không mặc định xây DRM server, payment gateway, native app hoặc AI/ML riêng.

## Ước tính FE/BE GĐ2 (DRAFT, 09/10/2026)

- [Bảng chi tiết FE/BE cho 66 tính năng](../../bao-gia/DU-TOAN-EFFORT-GD2-FE-BE-DU-THAO.md) · [CSV](../../bao-gia/DU-TOAN-EFFORT-GD2-FE-BE.csv).
- **33 CORE:** 748 giờ FE + 1.472 giờ BE = 2.220 giờ Coding; **504,55 MD tổng effort** BA/Design/QA.
- **24 CONDITIONAL:** 688 giờ FE + 1.500 giờ BE = 2.188 giờ Coding, tính riêng theo gate.
- **9 OPTION:** 212 giờ FE + 408 giờ BE = 620 giờ Coding, chưa đưa vào CORE.
- **Làm đủ 66:** 5.028 giờ Coding ≈ 1.142,73 MD tổng effort. **Chưa bao gồm** H01/H02 và các khoản vendor/operation; chưa xác nhận khả thi mốc 3–6 tháng.

