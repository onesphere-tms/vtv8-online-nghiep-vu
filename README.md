# VTV8Online – Hồ sơ phân tích nghiệp vụ & kỹ thuật

Kho tài liệu làm việc để phân tích, xác nhận phạm vi và lập dự toán/báo giá dự án **VTV8Online**, dựa trên tài liệu đề xuất hợp tác VTV8 – IIEL.

> **Trạng thái:** Tài liệu làm việc (DRAFT). Nội dung trong repository **không tự động được coi là yêu cầu đã phê duyệt**. Các mô tả kỹ thuật và phần mở rộng sẽ được phân biệt với yêu cầu ghi trong tài liệu nguồn.

## Bắt đầu từ đâu?

1. [Mục lục và trạng thái tài liệu](docs/INDEX.md)
2. [Nguồn yêu cầu, giả định và những điểm cần xác nhận](docs/nguon-va-gia-dinh.md)
3. [Mẫu phân tích giai đoạn](templates/giai-doan.md), [mẫu module](templates/module.md), [mẫu tính năng/use case](templates/tinh-nang.md)
4. [Quy chuẩn cộng tác](CONTRIBUTING.md)
5. [Khung quản lý dự toán và báo giá](bao-gia/README.md)

## Cấu trúc dự án

```text
docs/
  00-gd0-khao-sat-thiet-ke/       Khảo sát, BA, UX/UI, kiến trúc
  01-gd1-vtv8online-v1/          Website, CMS, DAM, video, livestream
  02-gd2-media-platform/         Tài khoản, VOD, search, paywall, analytics
  03-gd3-content-commerce/       Content-to-lead, booking, affiliate, TMĐT
  04-gd4-digital-ecosystem/      App, AI, membership, đối tác, dữ liệu
  kien-truc-chung/               Nguyên tắc và quyết định xuyên giai đoạn
  quyet-dinh/                    ADR, các vấn đề chờ chốt
templates/                        Mẫu tài liệu dùng thống nhất
bao-gia/                          WBS, giả định và cấu trúc ước tính
```

## Nguyên tắc

- **GĐ0–GĐ4:** Phân tích lần lượt từng giai đoạn, từng module, xuống đến tính năng/use case.
- **Ba loại căn cứ:** `SOURCE` = có trong tài liệu nguồn; `PROPOSED` = đề xuất phân rã kỹ thuật/nghiệp vụ; `TBC` = cần xác nhận.
- **Trạng thái:** `DRAFT` → `IN_REVIEW` → `CONFIRMED` → `BASELINED`; chưa có xác nhận thì không chuyển sang `CONFIRMED`.
- Báo giá dựa trên **khối lượng và điều kiện nghiệm thu đã chốt**, có phân biệt chi phí xây dựng, tích hợp, thuê dịch vụ và chi phí vận hành.
- Mỗi module có mã định danh ổn định và liên kết với các tính năng cấp dưới.

## Tình trạng hiện tại

Đã khởi tạo khung tài liệu và danh mục dự kiến để tiếp tục phân tích. Chưa lập báo giá chính thức; chưa có phê duyệt phạm vi từ VTV8.

## Tài liệu gốc người dùng cung cấp (09/10/2026)

- [Đề xuất hợp tác VTV8 – IIEL (.docx)](tai-lieu-nguon/Đề%20xuất%20hợp%20tác%20VTV8%20-%20IIEL_VTV8%20note.docx) — bản gốc, căn cứ chính cho phân tích nghiệp vụ.
- [Template Báo giá Dự án (.xlsx)](bao-gia/templates/Template%20Báo%20giá%20Dự%20án.xlsx) — mẫu gốc để lập báo giá.
- [Trích xuất đề xuất (Markdown)](tai-lieu-nguon/De-xuat-hop-tac-VTV8-IIEL-ban-trich-xuat.md) — phục vụ tìm kiếm/truy vết, không thay thế tệp gốc.
- [Phân tích cấu trúc template báo giá](bao-gia/templates/Template-Bao-gia-Du-an-cau-truc.md) — ghi chú để bảo toàn cấu trúc và kiểm tra công thức.

**Quy ước:** Giữ nguyên hai tệp gốc. Khi báo giá VTV8Online, tạo workbook riêng dựa trên mẫu và liên kết từng hạng mục đến mã giai đoạn/module/feature.
