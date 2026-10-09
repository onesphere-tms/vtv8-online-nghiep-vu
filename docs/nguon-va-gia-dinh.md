# Tài liệu nguồn, giả định và ranh giới xác nhận

## Tài liệu nền
- **Tên:** “Đề xuất phương án hợp tác – Xây dựng và phát triển nền tảng nội dung số văn hóa – di sản – du lịch – thương mại VTV8Online”.
- **Tệp người dùng cung cấp:** `Đề xuất hợp tác VTV8 - IIEL_VTV8 note.docx`.
- **Độ dài tệp được đọc:** 15 trang ở bản hiển thị; **chưa đưa tệp gốc vào repo**.
- **Tình trạng:** đề xuất hợp tác, không phải SRS hoặc hợp đồng kỹ thuật được ký duyệt.
- **Chú ý:** chưa xác minh người viết từng ghi chú và chưa có biên bản xác nhận của VTV8.

## Yêu cầu chính có trong tài liệu
| Phần tài liệu | Nội dung |
|---|---|
| I–II | Bối cảnh, độc lập kênh phân phối, làm chủ nội dung/người dùng, content-to-commerce |
| III | Lộ trình GĐ0–GĐ4; GĐ0 khảo sát; GĐ1 website/CMS, dữ liệu cũ, video/live; GĐ2 account/VOD/analytics/paywall; GĐ3 lead/affiliate/booking/TMĐT |
| Kiến trúc kỹ thuật | Web/mobile/TV, CDN, API, services, data, streaming ingest-transcode-HLS/DASH |
| Bài toán 120k CCU | Tải người xem giả định và yêu cầu kiểm thử, SLA |
| Lưu trữ / Database | Media storage tiering; PostgreSQL/Redis/search/object storage/analytics theo nhu cầu |
| AI & Kinh doanh | Speech-to-text, phụ đề, semantic search, licensing; quảng cáo, tài trợ, premium, commerce, du lịch |
| Hợp tác | Vai trò dự kiến của VTV8 và IIEL |

## Giả định đang dùng để phân rã tài liệu
- **A-01:** 5 giai đoạn được dùng làm khung WBS; số module từng giai đoạn do nhóm phân tích đề xuất, không phải quy định trực tiếp của VTV8.
- **A-02:** Các chức năng UI/API cơ bản như SEO, audit log, background jobs, retry, QA là phần kỹ thuật `PROPOSED` để đáp ứng yêu cầu gốc.
- **A-03:** Cấu phần livestream **chưa chốt** phương án VTVcab/VTVprime hay tự vận hành.
- **A-04:** 120.000 CCU là mục tiêu cần xác minh kịch bản đo; không đồng nhất CCU đọc website với CCU xem video.
- **A-05:** Bản quyền, quyền lưu trữ/tái phân phối các nội dung từ nền tảng bên ngoài phải được xác minh.
- **A-06:** GĐ3/GĐ4 có độ bất định cao; sẽ ước tính theo tùy chọn/kịch bản đến khi mô hình kinh doanh được chốt.
- **A-07:** Chưa xác định tiền tệ, đơn giá nhân sự, thuế, license, mức SLA hợp đồng và kỳ bảo trì.

## Những câu hỏi cần làm rõ
1. Website/CMS hiện tại có những chức năng nào, có source/database/API và quyền truy cập đến đâu?
2. Bao nhiêu nội dung cần migration? Quyền tái sử dụng video Facebook/TikTok/YouTube thế nào?
3. VTVcab/VTVprime cung cấp ingest, transcoding, recording, DRM, CDN, SLA, API ở mức nào?
4. 120k CCU là yêu cầu cho landing/pageview, video VOD hay livestream? Bitrate, khu vực phục vụ, thời lượng peak?
5. Công thức nhuận bút, cấp duyệt và nguồn dữ liệu tính nhuận bút cụ thể?
6. GĐ2 cần tài khoản riêng hay dùng SSO? Mô hình subscription, thanh toán và bản quyền?
7. GĐ3 chỉ dẫn lead/affiliate hay có booking/checkout và xử lý hậu mãi?
8. GĐ4 cần ứng dụng cho OS nào? AI dùng API bên thứ ba hay xử lý tại chỗ?
9. Quyền sở hữu dữ liệu, trách nhiệm pháp lý, vận hành, chia sẻ doanh thu, ngân sách?

**Quy tắc:** Không tự coi câu trả lời cho những câu hỏi trên là đúng nếu chưa có xác nhận và chứng cứ.
