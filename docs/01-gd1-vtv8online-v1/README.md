# GĐ1 – VTV8Online V1

- **Thời lượng nêu trong nguồn:** 8–12 tuần (dự kiến; cần xác thực sau GĐ0).
- **Mục tiêu nguồn:** website chính thức, CMS, dữ liệu cũ, video và livestream.
- **Tình trạng:** DRAFT. Mã module là đề xuất phân rã phục vụ ước tính.

| Mã | Module | Nội dung chính | Căn cứ |
|---|---|---|---|
| G1-01 | Website/cổng thông tin | Trang chủ, bài viết, chương trình, thư viện video, livestream | SOURCE + PROPOSED |
| G1-02 | CMS quản trị và tài khoản nội bộ | Người dùng CMS, vai trò, duyệt/xuất bản, lịch sử | SOURCE + PROPOSED |
| G1-03 | Quản lý nội dung có cấu trúc | Bài viết, chuyên mục, tác giả, chương trình, series, nhân vật, địa danh, di sản | SOURCE |
| G1-04 | Digital Asset Management | Metadata media, kho file, quyền khai thác, phiên bản | SOURCE + PROPOSED |
| G1-05 | Đồng bộ & chuyển đổi dữ liệu | Thu thập, chuẩn hóa, khử trùng, kiểm bản quyền, gắn nhãn, import | SOURCE |
| G1-06 | VOD cơ bản | Video player, bản phát video, phát lại | SOURCE + PROPOSED |
| G1-07 | Livestream | Lịch, nguồn phát, live player, tích hợp streaming, kiểm thử | SOURCE + PROPOSED |
| G1-08 | Báo cáo & nhuận bút | Tin bài, lượt xem, tính nhuận bút | SOURCE + PROPOSED |
| G1-09 | Hạ tầng, an toàn, vận hành | Storage, CDN, backup, security, monitor, kiểm thử tải | SOURCE + PROPOSED |
| G1-10 | QA, UAT và chuyển giao | Kiểm thử, đào tạo, nghiệm thu, cutover | PROPOSED |

## Module mẫu đang phân tích
- [G1-02 – CMS quản trị và tài khoản nội bộ](G1-02-cms-quan-tri.md) — DRAFT, **chưa được VTV8 xác nhận**.

## Phụ thuộc quyết định
- Nền tảng CMS hiện tại, yêu cầu tòa soạn thực tế, số cấp kiểm duyệt.
- Khối lượng dữ liệu cũ, phương pháp xuất/nhập và quyền sở hữu media.
- Phạm vi tích hợp VTVcab; live ingest/CDN do bên nào chịu trách nhiệm.
- Kịch bản chịu tải (website vs xem video) và SLA.

## Ngoài phạm vi mặc định GĐ1
Tài khoản người xem/SSO, DRM trả phí, paywall, booking, thương mại điện tử, hệ thống AI. Những phần này thuộc giai đoạn sau trừ khi có change request chính thức.
