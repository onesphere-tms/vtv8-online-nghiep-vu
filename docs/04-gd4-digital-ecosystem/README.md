# GĐ4 – Digital Ecosystem: 9 module và 78 tính năng đề xuất

> **09/10/2026 – DRAFT PHÂN TÍCH LẦN ĐẦU.** Chưa được VTV8 duyệt, chưa qua QA từng mã, chưa có dự toán FE/BE. GĐ4 là **giai đoạn dài hạn**, không phải một lần triển khai tất cả chức năng.

## 9 module GĐ4

| Module | Nhóm | Tổng | CORE | CONDITIONAL | OPTION |
|---|---|---:|---:|---:|---:|
| [G4-01 – Mobile App iOS/Android](G4-01-mobile-app.md) | A – Mobile | 9 | 5 | 3 | 1 |
| [G4-02 – Smart TV](G4-02-smart-tv.md) | A+ – Smart TV | 8 | 0 | 7 | 1 |
| [G4-03 – AI Media Processing](G4-03-ai-media-processing.md) | B1 – AI Media | 9 | 5 | 3 | 1 |
| [G4-04 – Semantic Search](G4-04-semantic-search.md) | B2 – Semantic | 8 | 7 | 0 | 1 |
| [G4-05 – Recommendation & Video Automation](G4-05-ai-recommendation-video-automation.md) | B3 – AI Repurposing | 9 | 4 | 4 | 1 |
| [G4-06 – Membership](G4-06-membership.md) | C1 – Membership | 8 | 3 | 3 | 2 |
| [G4-07 – Partner Platform & API](G4-07-partner-platform.md) | C2 – Partner | 9 | 3 | 5 | 1 |
| [G4-08 – Data Platform](G4-08-data-platform.md) | D1 – Data | 9 | 3 | 5 | 1 |
| [G4-09 – Archive & Content Licensing](G4-09-archive-content-licensing.md) | D2 – Licensing | 9 | 4 | 4 | 1 |
| **Tổng** | | **78** | **34** | **34** | **10** |

**[Danh mục chi tiết 78 tính năng](G4-DANH-MUC-TINH-NANG.md)**. Mỗi module có mục tiêu, phụ thuộc từ GĐ1–GĐ3, actor, nghiệp vụ/đầu ra, FE/BE cần bổ sung, tiêu chí nghiệm thu, nhãn CORE/CONDITIONAL/OPTION và gate đầu vào.

## Nguyên tắc chọn gói triển khai

- **A – Mobile App:** có thể ra mắt độc lập khi backend/media GĐ1–GĐ2 ổn định. Premium, push, commerce và offline có điều kiện.
- **A+ – Smart TV:** mở rộng tùy thị trường/thiết bị, **chỉ xuất hiện như định hướng TV tương lai ở tài liệu kiến trúc**; không coi là bắt buộc.
- **B – AI Media/Search/Video:** nên theo chuỗi media → transcript/subtitle/tag được duyệt → semantic search → recommendation/highlights/short video. Không đồng nhất AI-generated content với dữ liệu đã được kiểm chứng.
- **C – Membership/Partner:** kế thừa subscription/entitlement GĐ2 và nguồn partner/lead/booking/order GĐ3. Không có các module nguồn thì không xem GĐ4 đã có dữ liệu tương ứng.
- **D – Data & Archive Licensing:** phân biệt lớp dữ liệu phân tích với kinh doanh quyền khai thác kho media; Data Platform không mặc định cần warehouse lớn, còn archive licensing phải có bằng chứng bản quyền.
- **CORE** = phần nền tảng **của gói module đã chọn**, không phải 34 chức năng toàn hệ sinh thái phải phát triển cùng lúc.

## Tài liệu đi kèm

- [Danh mục 78 tính năng theo mã](G4-DANH-MUC-TINH-NANG.md).
- [Điều kiện release từng nhóm năng lực](G4-RELEASE-GATES.md).
- [Ranh giới kế thừa GĐ1–GĐ3, chủ sở hữu dữ liệu và nghiệp vụ](G4-THANH-PHAN-DUNG-CHUNG.md).
- [G4-H01 – Hạ tầng, bảo mật và tích hợp](G4-H01-ha-tang-tich-hop.md).
- [G4-H02 – Pháp lý, AI governance, nghiệm thu và bàn giao](G4-H02-phap-ly-uat-chuyen-giao.md).
- [13 kịch bản nghiệm thu xuyên module](G4-TIEU-CHI-NGHIEM-THU.md).

**Nguồn:** [Bản trích xuất đề xuất hợp tác VTV8–IIEL](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md), lộ trình GĐ4 trang 3, kiến trúc đa thiết bị trang 8, AI trang 11–12, các mô hình Membership/Content Licensing trang 12–13. Danh sách tính năng là **phương án nghiệp vụ suy luận để thảo luận**, không phải một SRS đã được ký duyệt.

**Bước đề xuất tiếp theo:** kiểm tra chất lượng và phạm vi của 78 mã, gộp tính năng trùng, phân biệt những gì VTV8 thực sự yêu cầu với phần mở rộng; chỉ sau khi chốt gói triển khai mới ước tính FE/BE theo Middle Developer, tách chi phí AI/API/GPU/CDN/DRM/store/DevOps.

## Dự toán FE/BE GĐ4 (DRAFT V0 – 12/10/2026)

- [Dự toán chi tiết 78 feature, BA/Design/QA và kịch bản theo gói](../../bao-gia/DU-TOAN-EFFORT-GD4-FE-BE-DU-THAO.md).
- [CSV chi tiết 78 tính năng](../../bao-gia/DU-TOAN-EFFORT-GD4-FE-BE.csv) · [CSV tổng theo 9 module](../../bao-gia/TONG-HOP-DU-TOAN-GD4-THEO-GOI.csv).
- CORE 34 tính năng: **6.160h Coding = 1.400 MD** tổng effort theo công thức; CONDITIONAL 34 tính năng: **6.888h Coding = 1.565,45 MD**; OPTION 10 tính năng: **1.856h Coding = 421,82 MD**.
- **Toàn bộ 78 tính năng: 14.904h Coding = 3.387,27 MD**. Đây là dự toán sơ bộ khi chưa qua QA và chưa chốt nhà cung cấp/quyền dữ liệu. **CORE chỉ áp dụng nếu module tương ứng được chọn triển khai**, không tự lập một gói CORE bắt buộc.
- **Chưa gồm** hạ tầng H01, pháp lý/UAT chuyên biệt H02, phí sử dụng AI/API/GPU/DRM/TV/CDN/data, PM và vận hành; không xem số MD là số tháng hoàn thành.
