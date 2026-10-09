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
