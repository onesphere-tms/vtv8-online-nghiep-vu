# GĐ2 – VTV8Online Media Platform (đề xuất phân rã 09/10/2026)

> **Trạng thái:** DRAFT thiết kế lần đầu, chưa được VTV8/người dùng chốt module và tính năng. Thời lượng **3–6 tháng** chỉ là dự kiến trong tài liệu nguồn, chưa có dự toán thực hiện.
> **Mục tiêu:** Sau khi VTV8Online V1 vận hành ổn định, phát triển hệ thống tài khoản người xem, dữ liệu hành vi, tìm kiếm, trải nghiệm VOD/live, gợi ý, tương tác có giấy phép, thuê bao và quyền xem trả phí.

## Danh sách đề xuất 11 module / 72 tính năng

| Mã | Module | Tổng | CORE đề xuất | OPTION | CONDITIONAL |
|---|---|---:|---:|---:|---:|
| G2-01 | [Tài khoản và định danh người xem](G2-01-tai-khoan-nguoi-xem.md) | 7 | 6 | 0 | 1 |
| G2-02 | [Theo dõi chương trình và yêu thích](G2-02-theo-doi-yeu-thich.md) | 5 | 4 | 1 | 0 |
| G2-03 | [Lịch sử xem và danh sách phát cá nhân](G2-03-lich-su-playlist.md) | 6 | 6 | 0 | 0 |
| G2-04 | [Tìm kiếm và khám phá nội dung](G2-04-tim-kiem-kham-pha.md) | 6 | 5 | 1 | 0 |
| G2-05 | [Gợi ý và cá nhân hóa nội dung](G2-05-goi-y-ca-nhan-hoa.md) | 6 | 4 | 2 | 0 |
| G2-06 | [Nâng cấp VOD và trải nghiệm Livestream](G2-06-nang-cap-vod-livestream.md) | 6 | 4 | 0 | 2 |
| G2-07 | [Bản tin cập nhật và thông báo](G2-07-ban-tin-thong-bao.md) | 7 | 5 | 1 | 1 |
| G2-08 | [Bình luận và tương tác cộng đồng](G2-08-binh-luan-tuong-tac.md) | 6 | 0 | 0 | 6 |
| G2-09 | [Đăng ký thuê bao và thanh toán nội dung](G2-09-thue-bao-thanh-toan.md) | 8 | 2 | 1 | 5 |
| G2-10 | [Paywall, quyền xem và DRM](G2-10-quyen-xem-drm.md) | 7 | 5 | 1 | 1 |
| G2-11 | [Phân tích hành vi người xem và chất lượng phát](G2-11-analytics-qoe.md) | 8 | 6 | 1 | 1 |
| **Tổng** | | **72** | **47** | **8** | **17** |

**[Mở bảng danh mục 72 tính năng và cơ sở phân tích](G2-DANH-MUC-TINH-NANG.md)**. Mỗi tài liệu module có mục tiêu, ranh giới, phụ thuộc, actor, luồng nghiệp vụ, phạm vi FE/BE mới và nghiệm thu sơ bộ.

## Kết quả kiểm tra chất lượng GĐ2 – 72 tính năng (09/10/2026)

- **[Báo cáo QA 72 tính năng, 11 bảng đánh giá từng mã](G2-BAO-CAO-QA-72-TINH-NANG.md)**: đề xuất gộp 6 mã, chuyển 2 CORE thành OPTION, chuyển 7 CORE thành CONDITIONAL và điều chỉnh ranh giới 25 mã. Nếu duyệt, danh mục dự kiến còn **66 tính năng (33 CORE + 9 OPTION + 24 CONDITIONAL)**.
- **Chưa thay danh mục hiện hành 72 tính năng**: tài liệu module và bảng tổng hợp bên dưới vẫn giữ phân loại gốc 47 CORE/8 OPTION/17 CONDITIONAL để truy vết trước khi duyệt chỉnh phạm vi. Yêu cầu thuê bao/nội dung trả phí/DRM từ nguồn phải được xem là một luồng nghiệm thu có điều kiện, không tự ý bỏ khỏi GĐ2.

## Hai nhóm việc hỗ trợ

- [G2-H01 – Hạ tầng và vận hành Media Platform](G2-H01-ha-tang-media-platform.md).
- [G2-H02 – Pháp lý, kiểm thử và chuyển giao](G2-H02-nghiem-thu-phap-ly.md).
- [Nguyên tắc dùng lại GĐ1 và thành phần chung GĐ2](G2-THANH-PHAN-DUNG-CHUNG.md).

**Lưu ý khi chốt CORE:** G2-09 và G2-10 đang chứa các mục CORE về gói/quyền xem, nhưng nếu chưa có phương án thanh toán và DRM/đối tác cần thiết thì **không thể nghiệm thu một luồng mua gói trả phí hoàn chỉnh**. Khi rà soát scope phải chốt cùng nhau các lát cắt: gói → thanh toán → kích hoạt thuê bao → entitlement → phát video, hoặc đưa toàn bộ luồng trả phí sang nhánh có điều kiện. Các nhãn CORE hiện tại chỉ để thảo luận.

## Cảnh báo phạm vi

- **Bình luận/tương tác:** phải xác minh điều kiện giấy phép trước khi chuyển từ CONDITIONAL vào phát triển.
- **Thanh toán/thuê bao:** nghiệp vụ subscription có trong nguồn nhưng giá gói, phương thức thanh toán, hóa đơn chưa được mô tả; phần tích hợp phụ thuộc nhà cung cấp và quyết định kinh doanh.
- **DRM:** license và bảo vệ luồng là tích hợp dịch vụ, không tự xây DRM.
- **Tìm kiếm:** có trong lộ trình GĐ2 và kiến trúc tìm kiếm; nếu GĐ1 đã làm keyword search thì chỉ làm phần nâng cấp mới.
- **Video/live:** kế thừa CMS/DAM/Streaming/Player GĐ1, không lập lại phần mềm đã có.
- **Không mặc định:** AI/ML nâng cao, app mobile, commerce/booking, mạng xã hội riêng hoặc hệ thống quảng cáo phức tạp.

**Căn cứ:** [Tài liệu đề xuất VTV8–IIEL](../../tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md) trang 3, 6–7 và các kiến trúc đề xuất trang 8–11.
