# G4-05 – Gợi ý cá nhân hóa và tái sử dụng video bằng AI

> **GĐ4 – DRAFT phân tích nghiệp vụ 09/10/2026; chưa được VTV8 phê duyệt hoặc dự toán FE/BE.** Đây là nhóm năng lực dài hạn, CORE là nền tảng **khi nhóm được chọn kích hoạt**, không có nghĩa cả GĐ4 phải đồng thời phát triển.

## Mục tiêu
Nâng recommendation có từ GĐ2 bằng tín hiệu/học máy có kiểm soát; đồng thời hỗ trợ biên tập viên chọn highlight và cắt video ngắn phục vụ phân phối đa nền tảng.

## Phân kỳ và kế thừa
- **Nhóm:** B – AI Recommendation & Repurposing.
- **Tái sử dụng:** G2-05 recommendation rule-based/fallback, G2-03 watch history, G2-11 events, G1-05/06 DAM/player, G4-03 transcript và G1-03 workflow. Không lập hệ thống analytics, xuất bản hoặc media transcoder thứ hai.
- Chỉ làm CONDITIONAL/OPTION sau khi xác định điều kiện liên quan ở [release gates](G4-RELEASE-GATES.md).

## Danh mục tính năng (9)

| Mã | Tính năng | Actor | Nghiệp vụ/đầu ra | FE mới | BE/Integration mới | Nghiệm thu sơ bộ | Phạm vi | Căn cứ | Gate/giả định |
|---|---|---|---|---|---|---|---|---|---|
| G4-05-F001 | **Hồ sơ tín hiệu cho gợi ý nâng cao** | Người xem; dữ liệu | Tổng hợp tín hiệu follow/yêu thích/xem từ G2, áp dụng consent/mục đích xử lý, không lập audience ID riêng. | Không có form tracking mới, dùng privacy settings G2 | Feature input pipeline theo permissions, không sao chép lịch sử xem ngoài scope | Hồ sơ tín hiệu bị giới hạn theo consent, có fallback nếu người dùng từ chối. | CORE | TAI | PRIVACY_POLICY |
| G4-05-F002 | **Xếp hạng gợi ý nâng cao theo nội dung/người xem** | Người xem | Xếp hạng candidate kết hợp metadata và sở thích; không bắt buộc phải triển khai mô hình huấn luyện riêng khi rule-based đủ. | Khối đề xuất tái dùng UI G2-05 | Ranker/API có thể dùng model provider hoặc heuristics, rights filter | Các tài khoản khác nhau có thể thấy thứ tự gợi ý khác, không gợi ý media thiếu quyền. | CORE | TAI | RANKER_MODEL |
| G4-05-F003 | **Fallback và kiểm soát đề xuất cho người mới** | Người xem; biên tập | Tiếp tục sử dụng nội dung nổi bật, gợi ý editor và điều kiện quyền khi thiếu tín hiệu; không tính thành dịch vụ độc lập đã có G2. | Tái dùng recommendation component G2-05 | Chỉ mở rộng ranking/fallback rules nếu logic G2 chưa đáp ứng | Người mới/người từ chối tracking vẫn có feed hợp lệ, không trả danh sách rỗng. | CORE | P | G2_REUSE |
| G4-05-F004 | **Đo chất lượng recommendation trong analytics chung** | Biên tập; phân tích | Gắn source/rank và kiểm tra engagement/coverage qua G2-11, không tạo dashboard analytics hoàn toàn mới. | Bộ lọc nhóm gợi ý trên dashboard sẵn có | Event source enrichment, aggregate kiểm tra coverage/consent | Không tính trùng view; KPI và dữ liệu theo chính sách được đối soát. | CORE | P | ANALYTICS |
| G4-05-F005 | **Đề xuất phân đoạn highlight từ transcript/video** | Biên tập viên | Gợi ý đoạn nổi bật kèm timecode và confidence; chỉ làm khi media và AI provider hỗ trợ, không tự xuất bản. | Highlight suggestions/timeline review | Highlight candidate extraction, transcript/timecode alignment | Gợi ý có vị trí phát lại đúng và có thể từ chối/điều chỉnh. | CONDITIONAL | TAI | HIGHLIGHT_VENDOR |
| G4-05-F006 | **Tạo video ngắn từ đoạn đã chọn** | Biên tập viên | Cắt đoạn được duyệt thành short video theo tỷ lệ/kích thước đã chọn, bảo toàn quyền footage/âm nhạc và watermark nếu quy định. | Clip selection/crop/preview and export status | Render/transcode via media provider or controlled worker, job states | Video ngắn đúng time range, metadata nguồn/giấy phép và lỗi render được báo. | CONDITIONAL | TAI | RENDER_INFRA |
| G4-05-F007 | **Tạo phụ đề/bố cục cho clip ngắn** | Biên tập viên | Dùng bản phụ đề đã duyệt G4-03, áp template tỷ lệ dọc/ngang, kiểm tra text overflow; không tự tạo giọng người thật. | Templates/caption/crop editor | Render overlays/presets, track binding và versioning | Xuất bản clip rõ phụ đề và giữ nguyên metadata nguồn, có thể chỉnh trước phát hành. | CONDITIONAL | P | MEDIA_RIGHTS |
| G4-05-F008 | **Kiểm duyệt, lưu nguồn và phát hành video tái sử dụng** | Biên tập; người duyệt | Phê duyệt clip ngắn, kiểm tra hạn quyền media, gắn phiên bản nguồn, đưa vào DAM/CMS GĐ1; phát sang mạng xã hội chỉ khi có tích hợp riêng. | Approve/reject và publish action dùng workflow chung | DAM derivative references, rights checks, CMS publish adapter | Không công khai clip chưa duyệt; khi quyền nguồn hết hạn có thể truy vết clip liên quan. | CONDITIONAL | P | EDITORIAL_RIGHTS |
| G4-05-F009 | **Thử nghiệm mô hình recommendation nâng cao/A-B** | Phân tích; kỹ thuật | So sánh các phiên bản mô hình, kiểm soát guardrails và rollback, phục vụ dữ liệu lớn khi thật sự cần. | Experiments dashboard/toggle | Model registry, evaluation/serve variants và rollback | Phân biệt được các phiên bản và có thể trở về ranker ổn định. | OPTION | P | MODEL_EVAL |

**Căn cứ:** `T4` = nhóm định hướng trong GĐ4 hoặc Membership trong mô hình kinh doanh; `TAI` = AI và ví dụ trang 11–12; `P` = chi tiết bổ sung để vận hành/kiểm thử. Chủ đề có nguồn **không có nghĩa từng thao tác chi tiết đã được VTV8 xác nhận**.

[Danh mục GĐ4](G4-DANH-MUC-TINH-NANG.md) · [Gates](G4-RELEASE-GATES.md).
