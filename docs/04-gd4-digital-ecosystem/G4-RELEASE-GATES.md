# GĐ4 – Các điều kiện triển khai Digital Ecosystem (DRAFT)

> **09/10/2026 – tài liệu phân tích nội bộ, chưa được VTV8 duyệt.** Đề xuất VTV8–IIEL trang 3 chỉ ghi **GĐ4 dài hạn: App, AI, membership, partner platform, data**. Mục VII trang 11–12 liệt kê các khả năng AI; mục VIII trang 12–13 nêu Content/Archive Licensing. Smart TV được nêu ở kiến trúc tương lai trang 8, không phải một yêu cầu phải ra mắt ngay. **Không có một tiến độ GĐ4 hoặc danh sách nhà cung cấp được chốt.**

## 1. Phân kỳ triển khai theo gói năng lực độc lập

| Gói | Module | Đầu ra có thể nghiệm thu riêng | Không tự mặc định |
|---|---|---|---|
| **A – Mobile Experience** | G4-01 | Ứng dụng iOS/Android xem nội dung VOD/live và tài khoản trên hạ tầng có trước | Không bắt buộc mở premium/commerce/offline ngay hoặc làm lại GĐ2 |
| **A+ – Smart TV** | G4-02 | Ứng dụng cho TV OS được chọn, remote focus, media playback, device sign-in | TV OS khác nhau cần kiểm thử riêng; đây là đề xuất mở rộng từ kiến trúc |
| **B1 – AI Media Intelligence** | G4-03 | Video → STT → transcript/subtitle/tags → biên tập duyệt → metadata DAM | Không tự nhận diện danh tính người xuất hiện, không tự công khai metadata máy tạo |
| **B2 – AI Semantic Search** | G4-04 | Tìm nội dung bằng câu tự nhiên, trả nguồn và timecode, bảo vệ quyền xem | Phụ thuộc transcript được duyệt hoặc dữ liệu nguồn tương đương |
| **B3 – Recommendation & Video Repurposing** | G4-05 | Xếp hạng gợi ý nâng cao, đề xuất highlight/short-video khi chọn và biên tập duyệt | Không làm lại recommendation rule-based GĐ2 hoặc transcoder/CDN từ GĐ1 |
| **C1 – Membership** | G4-06 | Các cấp thành viên, quyền lợi và trạng thái qua subscription/entitlement | Không tự có 8K/không quảng cáo khi provider/ad platform chưa có |
| **C2 – Partner Platform** | G4-07 | Cổng self-service tổ chức/đối tác, kế thừa partner/lead/booking/order nếu GĐ3 thực hiện | Không làm lại G3 back-office hoặc mở API/billing cho mọi đối tác ngay |
| **D1 – Data Platform** | G4-08 | Dữ liệu phân tích có hợp đồng, chất lượng và chỉ số liên thông khi cần | Không mặc định dựng lakehouse/ClickHouse hay thu PII tùy ý |
| **D2 – Archive & Licensing** | G4-09 | Kho tư liệu có quyền cấp phép, yêu cầu/duyệt/khai thác bản quyền B2B | Không đồng nhất quyền phát nội bộ với quyền bán quyền cho bên thứ ba |

**Ghi chú về CORE:** `CORE` trong từng module là phần tối thiểu **sau khi chọn gói triển khai đó**. Không xem tổng CORE của GĐ4 là cam kết một đợt phát hành hoặc một hợp đồng duy nhất.

## 2. Những quyết định đầu vào bắt buộc

| Gate | Phần cần chốt | Ảnh hưởng |
|---|---|---|
| G4-GATE-A01 | OS/phiên bản mục tiêu iOS, Android, vùng phân phối, tài khoản cửa hàng, QA thiết bị | Quy mô công nghệ ứng dụng mobile G4-01 |
| G4-GATE-A02 | Nền tảng TV cụ thể, SDK player, thiết bị thật, cách đăng nhập pairing và DRM | Chỉ khi chọn Smart TV G4-02 |
| G4-GATE-A03 | Payment policy cho mobile/TV, G2-09/10 đã triển khai thực tế hay chưa | Premium/membership và media protected trên app |
| G4-GATE-B01 | Nhà cung cấp STT/dịch/chỉnh phụ đề hoặc mô hình tự vận hành, số phút video, ngôn ngữ, ngân sách và năng lực GPU | G4-03/04/05, chi phí AI và queue, không tự hứa độ chính xác |
| G4-GATE-B02 | Quyền xử lý footage/âm nhạc/giọng nói/hình ảnh; chính sách dữ liệu khi gửi media sang dịch vụ AI; quy trình duyệt | Tất cả job AI và clip tái sử dụng |
| G4-GATE-B03 | Riêng nhận diện danh tính/nhân vật: cơ sở hợp pháp, dữ liệu tham chiếu, mức chính xác, quyền người xuất hiện và điều kiện phê duyệt | Không được tự mở nhận diện sinh trắc học G4-03-F006 |
| G4-GATE-B04 | Chất lượng corpus transcript, mô hình index/vector, phân quyền snippet, retention và KPI relevance | G4-04 semantic search |
| G4-GATE-B05 | Phạm vi ML recommendation hay rule-based nâng cao; khả năng render highlights/shorts từ media provider | G4-05, không xây model riêng nếu chưa cần |
| G4-GATE-C01 | Cấp membership, ad-free, chất lượng cao, nguồn thu; điều khoản billing và tương thích entitlement G2 | G4-06, cần chốt trước khi hiện bán gói |
| G4-GATE-C02 | Đối tác nào được self-service, cách cấp role và chuyển dữ liệu/lead/finance đúng mục đích | G4-07, yêu cầu bảo mật tenant/scope |
| G4-GATE-C03 | Có cần Partner API/webhook thật, số hệ tích hợp, quota, trách nhiệm API và sandbox | Chỉ khi bật G4-07-F008/F009 |
| G4-GATE-D01 | Use cases và số lượng dữ liệu/thời gian giữ/cost/throughput; xác nhận nhu cầu warehouse so với G2 analytics | G4-08; không cài hạ tầng dữ liệu lớn vô căn cứ |
| G4-GATE-D02 | Consent, chia sẻ dữ liệu, pseudonymization, retention/delete và quyền đối tác | G4-05/08, quyền riêng tư xuyên giai đoạn |
| G4-GATE-D03 | Chứng cứ quyền cấp phép lại cho bên thứ ba: footage, nhạc, nhân vật, lãnh thổ, thời hạn, mục đích | G4-09; tài sản DAM có thể được phép phát nhưng không được phép bán license |
| G4-GATE-D04 | Bảng giá/hợp đồng, bên cấp phép/nhận tiền, thẩm quyền phê duyệt, hình thức bàn giao bản gốc và thu hồi | G4-09, không mặc định triển khai thanh toán/billing ở bước đầu |

## 3. Kiểu công nghệ phải so sánh, không chốt trước

- **AI:** API theo phút xử lý, dịch vụ managed hoặc tự vận hành GPU/model; tính tổng chi phí ASR, dịch, vision, embedding, render, lưu trữ bản phát sinh, egress, tái xử lý và giám sát chất lượng.
- **Ứng dụng:** triển khai cross-platform hay native theo yêu cầu/SDK thực tế; Smart TV phân riêng từng hệ điều hành/thiết bị.
- **Tìm kiếm:** mở rộng engine G2 hoặc dùng vector/hybrid service; kiểm chứng search relevance và quyền truy cập, không triển khai vector DB chuyên dụng chỉ theo trào lưu.
- **Data:** lựa chọn Postgres/analytics hiện có hay kho cột/lakehouse theo kết quả đo; tính hạ tầng, backup, retention, security riêng.
- **Content licensing:** quản lý bằng hồ sơ số/hợp đồng được duyệt, chỉ bổ sung delivery protection/licensing transaction khi có khách hàng và legal gate.

## 4. Trình tự nghiệp vụ khuyến nghị, không phải ngày triển khai

Đối với AI, **G4-03 → G4-04**, sau đó G4-05 tận dụng transcript. Đối với giao dịch, **GĐ2 entitlement và GĐ3 commercial data phải có thật trước khi mở membership/partner commerce tương ứng**. Archive Licensing có thể làm thử ở quy trình xin cấp phép thủ công trước khi tích hợp thanh toán.

[Danh mục GĐ4](G4-DANH-MUC-TINH-NANG.md) · [Thành phần dùng chung](G4-THANH-PHAN-DUNG-CHUNG.md) · [E2E](G4-TIEU-CHI-NGHIEM-THU.md).
