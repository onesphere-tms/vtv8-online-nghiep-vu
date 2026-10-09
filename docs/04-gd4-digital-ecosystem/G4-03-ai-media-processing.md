# G4-03 – AI xử lý và làm giàu kho media

> **GĐ4 – DRAFT phân tích nghiệp vụ ngày 09/10/2026, chưa được VTV8 phê duyệt và chưa có dự toán FE/BE.** GĐ4 là định hướng dài hạn; CORE ở đây là phần cơ sở **nếu chọn kích hoạt nhóm năng lực tương ứng**, không phải yêu cầu triển khai đồng thời toàn GĐ4.

## Mục tiêu
Biến video VTV8 thành transcript, phụ đề, bản dịch và metadata giàu ngữ cảnh để biên tập viên duyệt và dùng cho tìm kiếm/khai thác, không tự xuất bản nội dung AI chưa kiểm tra.

## Phân kỳ và kế thừa
- **Nhóm triển khai:** B – AI Content Intelligence.
- **Không tính trùng:** G1-05 DAM provenance/rights, G1-06 video, G1-04 taxonomy/nhân vật/địa danh, G1-03 editorial workflow; G4-08 Data Platform chỉ tiêu thụ metadata đã duyệt, không thay DAM.
- **Gate:** tham chiếu [G4-RELEASE-GATES.md](G4-RELEASE-GATES.md) cho các mục CONDITIONAL và các ràng buộc phát hành. Chi tiết UI/API là phân rã đề xuất, chưa được xác nhận trong nguồn.

## Danh mục tính năng (9)

| Mã | Tính năng | Actor | Nghiệp vụ/đầu ra | FE mới | BE/Integration mới | Nghiệm thu sơ bộ | Phạm vi | Căn cứ | Gate/giả định |
|---|---|---|---|---|---|---|---|---|---|
| G4-03-F001 | **Pipeline yêu cầu và theo dõi job AI media** | Biên tập viên; kỹ thuật | Chọn video/đoạn media có quyền xử lý, chọn loại tác vụ, đưa vào queue, xem trạng thái, lỗi và quota. | AI job console/submit/progress | Job orchestration, provider adapter, audit, retry và budget guards | Một asset có lịch sử tác vụ, lỗi có thể xử lý lại, không nhân đôi file gốc. | CORE | TAI | AI_VENDOR |
| G4-03-F002 | **Speech-to-text và transcript có mốc thời gian** | Biên tập viên | Chuyển lời nói video thành transcript có timestamp và ngôn ngữ, hỗ trợ chỉnh sửa trước sử dụng. | Transcript editor/viewer với timecode | STT job/provider, timed segments, versioning và DAM association | Có thể tìm câu, phát đoạn tương ứng, lưu bản đã duyệt khác bản máy tạo. | CORE | TAI | STT_PROVIDER |
| G4-03-F003 | **Tạo và đồng bộ phụ đề từ transcript** | Biên tập viên | Tạo subtitle timed tracks và cập nhật sau khi chỉnh bản chép lời, kế thừa player G1/G2. | Subtitle timeline preview và chỉnh sửa | Timed cue export/import VTT/SRT, track association và version | Phụ đề đồng bộ mốc video, không tự xuất bản khi chưa duyệt. | CORE | TAI | SUBTITLE_RIGHTS |
| G4-03-F004 | **Biên tập, thẩm định và xuất bản kết quả AI** | Biên tập; người duyệt | Review transcript/subtitle/tags có nguồn AI, so sánh phiên bản, duyệt/không duyệt và xuất bản metadata vào DAM/CMS. | Review queue, side-by-side diff và approve/reject | Provenance, approval workflow, immutable source refs, audit | Chỉ phiên bản đã duyệt được dùng trong tìm kiếm công khai và cấp phép. | CORE | P | EDITORIAL_POLICY |
| G4-03-F005 | **Dịch transcript và phụ đề đa ngôn ngữ** | Biên tập viên | Tạo bản dịch theo ngôn ngữ đã chọn, ghi nguồn và người duyệt; không mặc định dịch mọi nội dung hoặc đảm bảo chất lượng tự động. | Language selector, translation review, translated track UX | Translation provider adapter, language/rights policy, versioning | Bản dịch sai có thể sửa/thu hồi, hiển thị rõ ngôn ngữ và trạng thái duyệt. | CONDITIONAL | TAI | TRANSLATION_RIGHTS |
| G4-03-F006 | **Gợi ý nhân vật xuất hiện trong video** | Biên tập; pháp lý | Đề xuất person tags theo thông tin/metadata được VTV8 cho phép; đối sánh danh tính khuôn mặt hoặc nhận diện sinh trắc học chỉ khi qua đánh giá pháp lý và dữ liệu. | Suggestion review và xác nhận thủ công | Person recognition provider nếu được chấp thuận; confidence, audit và opt-out theo policy | Không tự công khai danh tính chưa xác minh; tính năng có thể tắt hoàn toàn. | CONDITIONAL | TAI | BIOMETRIC_LEGAL |
| G4-03-F007 | **Nhận diện/đề xuất địa điểm và địa danh** | Biên tập viên | AI gợi ý địa danh dựa lời nói/hình ảnh khi provider hỗ trợ, map về taxonomy/địa danh G1-04, người biên tập xác nhận. | Place suggestion picker theo địa danh đã có | NER/vision/location tagging adapter + taxonomy match | Không tạo địa danh sai hoặc công khai location thiếu độ tin cậy; có thể sửa gợi ý. | CONDITIONAL | TAI | VISION_MODEL |
| G4-03-F008 | **Gắn nhãn chủ đề/di sản theo taxonomy** | Biên tập viên | Đề xuất tag chủ đề/di sản từ transcript/metadata và map về taxonomy G1-04; áp quy trình duyệt chung. | Topic suggestion & taxonomy picker | Text classification/rules, confidence và mapping vào CMS tags | Chủ đề gợi ý có bằng chứng/mốc đoạn và chỉ được public khi duyệt. | CORE | TAI | MODEL_QUALITY |
| G4-03-F009 | **Xử lý lại phiên bản và giám sát chất lượng AI** | Kỹ thuật; biên tập | Tái chạy khi video được thay thế/mô hình đổi, so sánh độ chính xác mẫu và chi phí theo phút; giữ trace phiên bản cũ. | Job history, reprocess và quality sample dashboard mức gọn | Idempotent reprocessing, metering, provider version labels và retention | Không ghi đè bản biên tập đã duyệt; có thể giải thích model/chi phí của từng lượt. | OPTION | P | AI_METERING |

**Nguồn:** `T4` = hướng App/AI/Membership/Partner/Data được nêu tại lộ trình GĐ4; `TAI` = khả năng nêu ở mục VII AI (trang 11–12); `AKT` = Smart TV/Web/Mobile trong kiến trúc (trang 8); `P` = chi tiết phân tích bổ sung, không có yêu cầu chức năng trực tiếp trong nguồn. **Nhãn T4/TAI/AKT chỉ xác nhận chủ đề, không xác nhận từng thao tác.**

[Danh mục GĐ4](G4-DANH-MUC-TINH-NANG.md) · [Phân kỳ và release gates](G4-RELEASE-GATES.md).
