# GĐ2 – Checklist nghiệm thu và 10 kịch bản xuyên module

> **Đề xuất nội bộ 09/10/2026; chưa xác nhận với VTV8.** Áp dụng cùng tiêu chí riêng từng dòng trong [66 tính năng](G2-DANH-MUC-TINH-NANG.md).

## Nguyên tắc chung

- Luồng thành công, lỗi đầu vào, bảo vệ phân quyền tại API, trạng thái chờ/thất bại, tính nhất quán dữ liệu và log phải được kiểm tra.
- Kế thừa CMS, DAM, VOD/live player và provider từ GĐ1; chỉ phần nâng cấp mới được đưa vào nghiệm thu GĐ2.
- Consent, lưu giữ/xóa dữ liệu và phân biệt watch-progress với analytics phải tuân theo chính sách chung được VTV8 duyệt.
- OPTION không ngăn luồng CORE chạy; CONDITIONAL chỉ nghiệm thu khi đáp ứng điều kiện pháp lý/vendor tương ứng.
- Không công khai media đã gỡ, hết quyền khai thác hoặc protected video chưa đủ entitlement.

## 10 luồng E2E

| Mã | Kịch bản kiểm thử | Điều kiện đạt |
|---|---|---|
| G2-E2E-01 | Đăng ký → xác minh → đăng nhập → reset/logout/consent | Account không trùng, session được thu hồi, PII không lộ |
| G2-E2E-02 | Follow/yêu thích → My Library → có tập mới → inbox cập nhật | Dùng đúng một quan hệ follow/favorite, không tạo thông báo trùng |
| G2-E2E-03 | Xem VOD → lưu tiến độ → đổi thiết bị → tiếp tục → xóa history | Tiến độ chính xác và quy tắc xóa theo chính sách |
| G2-E2E-04 | Tìm kiếm theo loại/chủ đề → CMS gỡ nội dung | Index và trang tìm kiếm không còn trả nội dung chưa được public |
| G2-E2E-05 | Gợi ý theo lịch sử và follow; người mới chưa có dữ liệu | Recommendation rule-based có fallback GĐ1, không bắt buộc ML |
| G2-E2E-06 | Live kết thúc → xem bản ghi → auto-next tập | Không tạo lại recording pipeline, tôn trọng thứ tự tập và quyền xem |
| G2-E2E-07 | **Nếu gate thương mại bật:** mua gói → webhook → entitlement → phát video → hết hạn/hoàn tiền | Không cấp quyền sai; playback token và DRM được kiểm chứng theo vendor |
| G2-E2E-08 | **Nếu điều kiện pháp lý bình luận đạt:** gửi → kiểm duyệt → hiển thị/ẩn → báo cáo | Không hiển thị trái trạng thái duyệt và có log xử lý |
| G2-E2E-09 | Bật/tắt loại thông báo và web push/email khi được triển khai | Không gửi khi không consent, inbox cơ bản vẫn hoạt động |
| G2-E2E-10 | Người xem yêu cầu xử lý dữ liệu → xóa/ẩn danh watch-progress/events | Không lộ dữ liệu cá nhân và truy vết được xử lý theo chính sách |

## Đầu vào chưa được xác nhận

Kênh định danh/SSO; privacy/retention; legal gate bình luận; nghĩa của 'bản tin cập nhật'; gateway/giá và thời hạn thuê bao; quyền media và DRM provider; khả năng QoE; mục tiêu hiệu năng media. Chưa dùng checklist này làm chứng nhận pháp lý hoặc cam kết SLA.
