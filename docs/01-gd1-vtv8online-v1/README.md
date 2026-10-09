# GĐ1 – VTV8Online V1: Module và tính năng (bản phân tích DRAFT)

> **Ngày cập nhật:** 09/10/2026 · **Cấu trúc được người dùng chọn:** 11 module, 2 nhóm hỗ trợ. Chi tiết **86 tính năng đề xuất** chưa phải yêu cầu/báo giá đã được VTV8 duyệt. 
> **Thời lượng trong tài liệu nguồn:** 8–12 tuần; chưa khẳng định phù hợp khi chưa ước tính giờ FE/BE và xác minh streaming/migration.
> **Quyết định phạm vi:** **không tích hợp, không đồng bộ, không quản trị mạng xã hội**; dữ liệu migration chỉ lấy từ hệ thống cũ và kho do VTV8 cung cấp.

## Danh mục 11 module

| Mã | Module | Tính năng | FE/BE | Phụ thuộc quan trọng |
|---|---|---:|---|---|
| G1-01 | [Website VTV8Online](G1-01-website-vtv8online.md) | 9 | FE + BE theo tính năng | Thiết kế giao diện GĐ0 |
| G1-02 | [Quản trị tài khoản và phân quyền CMS](G1-02-cms-quan-tri.md) | 6 | FE + BE theo tính năng | Vai trò/phòng ban |
| G1-03 | [Sản xuất, biên tập và xuất bản nội dung](G1-03-bien-tap-xuat-ban.md) | 9 | FE + BE theo tính năng | Quy trình duyệt |
| G1-04 | [Quản lý danh mục và nội dung có cấu trúc](G1-04-noi-dung-co-cau-truc.md) | 9 | FE + BE theo tính năng | Taxonomy/quan hệ dữ liệu |
| G1-05 | [Quản lý tài sản số – DAM cơ bản](G1-05-dam-thu-vien-media.md) | 8 | FE + BE theo tính năng | Quyền khai thác media |
| G1-06 | [Quản lý và phát video VOD cơ bản](G1-06-video-vod.md) | 6 | FE + BE theo tính năng | Nguồn playback và asset |
| G1-07 | [Livestream và lịch phát sóng](G1-07-livestream-lich-phat.md) | 8 | FE + BE theo tính năng | Kênh phát trực tiếp |
| G1-08 | [Tích hợp và vận hành nền tảng Streaming](G1-08-streaming-integration.md) | 9 | FE/BE tích hợp + DevOps/vendor riêng | VTVcab/VTVprime, API, SLA, tải |
| G1-09 | [Báo cáo và thống kê nội dung](G1-09-bao-cao-thong-ke.md) | 6 | FE + BE theo tính năng | Định nghĩa lượt xem và dữ liệu |
| G1-10 | [Quản lý và tính nhuận bút](G1-10-nhuan-but.md) | 8 | FE + BE theo tính năng | Quy chế nhuận bút |
| G1-11 | [Chuyển đổi dữ liệu từ hệ thống cũ](G1-11-chuyen-doi-du-lieu.md) | 8 | BE/tool + chạy dữ liệu riêng | Nguồn và khối lượng dữ liệu cũ |
| **Tổng** | | **86** | | **78 CORE; 8 OPTION/CONDITIONAL** |

**[Xem bảng tổng hợp 86 tính năng và mô tả nghiệp vụ](G1-DANH-MUC-TINH-NANG.md)**. Mỗi module có file riêng mô tả **actor, luồng thực hiện, phần FE, phần BE, tiêu chí nghiệm thu và phạm vi cần xác nhận**.

## Hai nhóm hỗ trợ (không tính là module nghiệp vụ)
- [G1-H01 – Hạ tầng, bảo mật và vận hành ứng dụng](G1-H01-ha-tang-van-hanh.md): DevOps, CI/CD, DB, backup, app-monitoring và các chi phí môi trường.
- [G1-H02 – Kiểm thử tích hợp, UAT, triển khai và chuyển giao](G1-H02-nghiem-thu-chuyen-giao.md): tách phần hỗ trợ nghiệm thu/đào tạo/handover khỏi QA chuẩn đã tính theo công thức báo giá.

## Dòng nghiệp vụ xuyên module

1. **Tin bài:** G1-02 (phân quyền) → G1-03 (soạn, duyệt, xuất bản) ↔ G1-04 (metadata, phân loại) ↔ G1-05 (asset) → G1-01 (website).
2. **Video:** G1-04 (chương trình/tập) ↔ G1-05 (file, quyền) → G1-08 (playback/CDN) → G1-06 (VOD website).
3. **Livestream:** G1-07 (lịch và sự kiện) ↔ G1-08 (nguồn phát, streaming, CDN, recording) → G1-07 (trang live) → G1-06 (phát lại sau biên tập).
4. **Báo cáo và nhuận bút:** G1-03/G1-04 (sản lượng, người tham gia) + G1-01/G1-06/G1-07 (số liệu xem có định nghĩa) → G1-09 (báo cáo) → G1-10 (quy tắc/kỳ/bảng kê).
5. **Migration:** G1-11 (thu thập, chuẩn hóa, import/đối soát) → G1-03/04/05; redirect trang cũ tại G1-01.

## Quy ước phân tích và lập dự toán

- `T`: **chủ đề/chức năng được VTV8 nêu trực tiếp**; các luồng chi tiết có thể là suy luận cần xác minh. `B`: **bổ sung** để hoàn thiện vận hành V1. `C`: **có điều kiện** theo quyết định nghiệp vụ/vendor.
- `CORE`: đề xuất đưa vào V1 để lập dự toán **nếu được chốt**. `OPTION`/`CONDITIONAL`: **chưa cộng vào baseline**, chờ xác nhận. Tổng 86 là danh mục phân tích, không có nghĩa chốt triển khai hết 86.
- GĐ1 chỉ quản lý tài khoản **CMS nội bộ**; tài khoản người xem/SSO, premium, DRM, cá nhân hóa, commerce, AI thuộc các giai đoạn sau. Nội dung địa danh/di sản ở đây là dữ liệu biên tập, không phải chức năng booking.
- G1-08 Streaming cần **hai phương án giá** nếu còn thiếu xác nhận: (A) tích hợp VTVcab/VTVprime/nhà cung cấp và (B) tự triển khai phần thiếu. **Không mặc định phải tự xây transcoding, media server, origin/CDN**.
- Mục tiêu 120.000 CCU và SLA V1 ≥99,9% là **yêu cầu phải kiểm chứng theo kịch bản và hợp đồng**, không phải khả năng đã chứng minh. Phải phân biệt CCU website với CCU xem livestream.
- Khi chốt tính năng, nhập giờ **FE/BE của một Middle Developer** cho từng feature vào báo giá; phần BA/Design/QA tính theo công thức đã thống nhất. Riêng effort kỹ thuật streaming, migration thực tế, hạ tầng và hỗ trợ nghiệm thu phải được tính riêng, không đếm trùng.
- Chưa có giờ FE/BE, MD, chi phí hay cam kết 8–12 tuần tại thời điểm lập bản này.

## Căn cứ và trạng thái
- [Tài liệu đề xuất VTV8–IIEL](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md): phần GĐ1 trang 4–6, kiến trúc/video/CDN/SLA/CCU trang 8–11.
- [GĐ0 – phân tích nghiệp vụ và khảo sát](../00-gd0-khao-sat-thiet-ke/G0-TONG-HOP-PHAN-TICH-NGHIEP-VU.md), chưa phải kết quả khảo sát thực địa.
- Danh sách module **đã được chọn trong trao đổi**; danh sách tính năng, mức CORE/OPTION và tiêu chí nghiệm thu chỉ là **đề xuất để người dùng và VTV8 rà soát**.
