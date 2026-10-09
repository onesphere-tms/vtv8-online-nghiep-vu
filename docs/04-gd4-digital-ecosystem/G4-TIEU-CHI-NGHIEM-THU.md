# GĐ4 – Tiêu chí nghiệm thu và kịch bản E2E theo gói

> **DRAFT 09/10/2026 – chưa được VTV8 phê duyệt.** Đề xuất kiểm thử cho các gói có thể triển khai độc lập. Một kịch bản `CONDITIONAL` chỉ áp dụng khi module/gate tương ứng được chọn; không phải tính năng mới ngoài danh mục.

## A. Nguyên tắc chung

1. **Kế thừa thật:** GĐ4 phải chạy trên API/CMS/DAM/audience/payment/commercial thực tế GĐ1–GĐ3; module CONDITIONAL chưa được triển khai không được mặc định là có.
2. **Người dùng và quyền:** Không xem, tìm transcript, tải media hoặc cấp license khi thiếu quyền; kiểm tra quyền cả phía server/provider, không chỉ UI.
3. **AI có phê duyệt của người biên tập:** Output máy tạo phải truy vết nguồn, phiên bản và được duyệt trước công khai hoặc sử dụng cho licensing; có đường sửa và xóa.
4. **Bảo vệ dữ liệu:** Consent/mục đích/retention và phân quyền theo từng tenant, partner, audience, nhất là khi dùng nhà cung cấp AI hoặc dữ liệu sinh trắc học.
5. **Đối tác/đăng ký:** Membership dùng G2 subscription/entitlement; Partner portal dùng dữ liệu và trạng thái gốc G3; B2B licenses dùng quyền đã xác nhận từ DAM và chính sách pháp lý.
6. **Tính sẵn sàng:** Khi nhà cung cấp STT/vector/payment/TV/warehouse lỗi, các luồng không liên quan phải tiếp tục hoạt động theo khả năng được chốt; lỗi phải theo dõi được.

## B. 13 kịch bản xuyên module

| Mã | Kịch bản | Điều kiện đạt | Nhóm |
|---|---|---|---|
| G4-E2E-01 | Cài Mobile → mở bài/video → live/VOD → đăng nhập → My Library | Media phù hợp OS, tài khoản/tiến độ đồng bộ web; không mở protected content sai quyền | A |
| G4-E2E-02 | Mobile nhận hoặc từ chối push, tap vào nội dung | Consent/opt-out có hiệu lực, thông báo không trùng; chỉ nếu bật push | A có điều kiện |
| G4-E2E-03 | TV remote → tìm video → liên kết tài khoản qua mã → phát protected stream | Không cần bàn phím/chuột; pairing code hết hạn, DRM theo device nếu được chọn | A+ |
| G4-E2E-04 | Chọn video trong DAM → STT → chỉnh transcript/timecode → duyệt subtitle | Bản máy tạo khác bản duyệt; sửa chính xác và lưu provenance | B1 |
| G4-E2E-05 | Dịch/tags địa danh hoặc người xuất hiện → kiểm duyệt → xuất bản | Chỉ metadata được duyệt hiển thị; nhận diện danh tính chỉ nếu qua gate pháp lý | B1 có điều kiện |
| G4-E2E-06 | Tìm bằng câu về kiến trúc Huế qua transcript → mở nguồn ở timecode | Kết quả có video thật và mốc chính xác; media private/hết quyền không lộ snippet | B2 |
| G4-E2E-07 | Người xem có history nhận recommendation → mới/opt-out thấy fallback | Không đếm trùng tracking, không gợi ý nội dung thiếu quyền, có fallback G2 | B3 |
| G4-E2E-08 | Gợi ý highlight → cắt clip ngắn → biên tập duyệt → lưu DAM/đăng bài | Clip đúng đoạn, phụ đề/rights/source đầy đủ; không tự publish trước duyệt | B3 có điều kiện |
| G4-E2E-09 | Đăng ký membership → cấp quyền → xem premium/quality hợp lệ → hết hạn | Entitlement thống nhất trên web/mobile/TV, không tự hứa 4K/8K nếu không có renditions | C1 |
| G4-E2E-10 | Kích hoạt đối tác → chỉnh offering → duyệt → tiếp nhận lead | Phân quyền tenant, không truy cập PII/lead tổ chức khác; workflow G3 không nhân đôi | C2 |
| G4-E2E-11 | Partner API/webhook → conversion/booking/statement | Chỉ với domain G3 thật và API gate; idempotent và scoped theo đối tác | C2 có điều kiện |
| G4-E2E-12 | G1/G2/G3 events → Data Platform → dashboard content-to-commerce → sửa/xóa theo privacy policy | KPI có source/định nghĩa, không đếm lead thành doanh thu, consent/retention đúng | D1 |
| G4-E2E-13 | Chọn archive asset có quyền → yêu cầu license → duyệt → bàn giao file/ghi hạn quyền | Không cấp phép asset thiếu chứng cứ; chỉ file đúng phạm vi được phát hành, ghi log và hạn sử dụng | D2 |

## C. Điều kiện khóa scope trước khi ước tính FE/BE

- Gói phát hành thực sự chọn; loại thiết bị/OS; nguồn video và phiên bản DRM/player; bộ ngôn ngữ và phút media được xử lý.
- Cách triển khai AI (API bên thứ ba hay self-host); quy tắc bảo vệ dữ liệu, nhận diện danh tính, chất lượng kỳ vọng và người chịu trách nhiệm review.
- Cơ chế subscription/member benefits; GĐ2/GĐ3 đã triển khai những tính năng CONDITIONAL nào.
- Nhu cầu Data Platform thực tế, số lượng event, retention, biểu đồ, đối tác và khả năng mở rộng.
- Ma trận cấp phép nội dung, hợp đồng B2B, giá, phạm vi giao media và trách nhiệm hậu mãi.

**GĐ4 không có timeline cụ thể trong nguồn.** Không chuyển tổng số tính năng thành cam kết tháng, cũng không cộng phí AI, GPU, media, license hoặc DevOps vào giờ code FE/BE mặc định.
