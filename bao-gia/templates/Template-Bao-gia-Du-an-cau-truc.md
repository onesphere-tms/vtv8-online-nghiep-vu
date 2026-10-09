# Template Báo giá Dự án — Cấu trúc và lưu ý sử dụng

> **Căn cứ:** File `Template Báo giá Dự án.xlsx` do người dùng cung cấp 09/10/2026.
> **Trạng thái:** TEMPLATE REFERENCE. Đây là **bản mô tả cấu trúc từ Excel**, KHÔNG phải workbook .xlsx. Tệp Excel gốc đã được lưu ở đường dẫn `bao-gia/templates/Template Báo giá Dự án.xlsx`.
> **Yêu cầu:** Giữ nguyên file mẫu, lập báo giá dự án VTV8Online bằng một bản sao riêng; đừng làm mất định dạng hoặc công thức.

## 1. Sáu sheet của workbook

| Sheet | Nội dung | Áp dụng cho VTV8Online |
|---|---|---|
| `Overview` | Tên, mô tả, ngày báo giá; hiện ghi dự án **Auto Furniture** | Thay thông tin trên bản báo giá, không sửa mẫu gốc |
| `DetailEstimation` | Chi tiết module/feature, công sức theo nhóm, tổng giờ/ngày công và tổng chi phí | Cần phân rã GĐ0–GĐ4 theo từng module và feature ID |
| `Team Estimation` | Team và lương ước tính; gồm BE, FE, Design, Blockchain, PM/PO, Operation | Thay bằng định biên và đơn giá nhân sự VTV8; Blockchain và Contract không nằm trong scope VTV8Online |
| `Timeline` | Bảng timeline theo tuần | Cần tách tiến độ và milestones cho từng giai đoạn |
| `Assumption` | Sheet giả định, hiện chưa có nội dung được ghi nhận | Ghi căn cứ phạm vi, phụ thuộc đối tác, ngoài phạm vi, biến động chi phí |
| `Config` | Tỷ trọng effort và quy đổi ngày/tuần/tháng | Chỉ sử dụng khi công thức đã được kiểm tra xác thực |

## 2. DetailEstimation – cấu trúc cột

| Cột | Nội dung trong mẫu |
|---|---|
| A | Số |
| B | Tiêu đề/module/hạng mục |
| C | Tính năng |
| D | Ghi chú |
| E | FE – giờ lập trình |
| F | BE – giờ lập trình |
| G | Contract – **không áp dụng cho VTV8Online**; để trống trong mẫu sao chép hoặc loại cột và cập nhật công thức |
| H | Total giờ lập trình |
| I | Hiểu nghiệp vụ (giờ) |
| J | Thiết kế (giờ) |
| K | Kiểm thử (giờ) |
| L | Tổng giờ |
| M | MD (man-days) |

Các khối nhìn thấy trong file mẫu: tính năng/module ở các dòng đầu, **yêu cầu phi chức năng** (khoảng dòng 40–48), **hạ tầng** (khoảng dòng 49–53), **PM** (dòng 55), **nhân sự & bảng tiền** (dòng 58–68), **chi phí server** (dòng 71–77), **lộ trình thanh toán** (từ khoảng dòng 79).

## 3. Cấu hình effort hiện có

`Config!B2:E2`: Hiểu nghiệp vụ **10%**, thiết kế **15%**, coding **55%**, kiểm thử **20%**. Quy đổi: 1 MD = **8 giờ**; 1 tuần = **40 giờ**, 1 tháng = **168 giờ**. Theo thống nhất người dùng, dùng những tỷ trọng này để **suy ra BA/Design/QA từ Coding = FE + BE**, thay vì nhập tay các cột BA/Design/QA. Chi tiết: [Phương pháp ước tính](../PHUONG-PHAP-UOC-TINH.md).

## 4. Rủi ro/khoảng trống trước khi đưa vào báo giá chính thức

1. `Overview` chứa thông tin dự án Auto Furniture; `Team Estimation` chứa thông tin định biên/lương từ dự án khác, bao gồm Blockchain.
2. `DetailEstimation` chứa cấu trúc ước tính cũ và giá nhân sự tham khảo; một số hạng mục server liên quan DigitalOcean/Oracle RWA, **không phản ánh nhu cầu VTV8**.
3. Một số **defined names** của workbook hiện trỏ `#REF!` (`InterTest`, `SysTest`). Cần rà soát toàn bộ tham chiếu và công thức mảng trước khi nhập liệu.
4. Công thức tính ở vùng chi tiết dùng phạm vi cố định (chẳng hạn `E5:G39`), khi tăng số tính năng phải mở rộng công thức/định dạng đồng bộ.
5. Phần tính PM trong file dùng hệ số 20%; đây là **giả định ví dụ** và chưa được đồng ý áp dụng cho VTV8.
6. Chi phí phát triển ban đầu, CDN/storage/traffic, license streaming/DRM/AI, vận hành định kỳ và rủi ro tỷ giá phải tách riêng.
7. **Loại bỏ Contract/Blockchain khỏi phạm vi tính giá VTV8Online**; không sử dụng cột G khi nhập effort.

## 5. Ánh xạ quy trình phân tích tới workbook

```
Phase (GĐ0–GĐ4)
  → Module ID (G1-02)
     → Feature ID (G1-02-F001)
       → WBS theo BA / UI-UX / FE / BE / QA / DevOps / Integration
         → Effort (h) → MD → Đơn giá → Thành tiền
```

Khi dùng mẫu thật để lập báo giá, nên bảo toàn 6 sheet nhưng làm rõ nhóm **phase** bằng các block phân cách/tổng hợp, và không đưa các hạng mục ngoài phạm vi VTV8 vào tính giá.

## 6. Trạng thái tài liệu

Bản phân tích này lưu tại Git để có thể xem ngay và theo dõi quyết định. Nó **không thay thế file Excel gốc**; khi bổ sung file gốc cần xác minh định dạng, sheet, công thức, ảnh/logo và phép tính sau upload.
