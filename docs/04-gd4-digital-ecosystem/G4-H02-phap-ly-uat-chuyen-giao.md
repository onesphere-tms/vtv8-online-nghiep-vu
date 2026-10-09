# G4-H02 – Pháp lý, thẩm định AI, UAT và chuyển giao (DRAFT)

> **Nhóm WBS nghiệp vụ/kiểm thử chuyên sâu, không trùng QA tiêu chuẩn từng feature.** Chưa được VTV8 chốt nhà cung cấp hay phương án vận hành.

| WBS | Công việc | Đầu ra | Ranh giới |
|---|---|---|---|
| G4-H02-W001 | Xác định chiến lược app và thiết bị | Ma trận iOS/Android/TV OS, phiên bản, UX accessibility, các kênh phân phối và trách nhiệm support | TV là hướng tương lai theo kiến trúc, không cam kết cùng Mobile |
| G4-H02-W002 | Xác minh quyền sử dụng nội dung cho AI | Quy định quyền đưa media sang provider, vùng xử lý, chính sách lưu dữ liệu, quyền giọng nói/hình ảnh và nhãn AI | Quyền phát G1 không mặc nhiên cho phép chuyển dữ liệu sang AI bên ngoài |
| G4-H02-W003 | Kiểm soát nhận diện nhân vật và dữ liệu nhạy cảm | Đánh giá điều kiện pháp lý, tập dữ liệu tham chiếu, consent/cơ sở xử lý, false-positive handling | Không tự mở nhận diện sinh trắc học khi chưa có cơ sở rõ |
| G4-H02-W004 | Bộ kiểm thử chất lượng STT/dịch/tag/semantic search | Test corpus theo loại phát âm/nội dung, sai thời gian, nguồn trích dẫn, hallucination và rights visibility | AI output phải có human editorial review trong phạm vi phát hành |
| G4-H02-W005 | Bộ thử nghiệm đa thiết bị và phân phối | App store/TV certification, UX playback/entitlement/DRM/notification và QoE theo thiết bị | Phí account/device/vendor nằm ngoài QA từng form |
| G4-H02-W006 | Chốt chính sách hội viên và phân phối | Gói/benefits/ad-free/2K-8K, in-app purchasing, hủy/đổi giá/hoàn tiền và quyền sử dụng nội dung | Không gọi membership là hệ payment mới |
| G4-H02-W007 | Quy trình hợp tác và bảo mật Partner Platform | Thỏa thuận data sharing, tenant roles, lead/financial visibility, partner onboarding và API/SLA | Partner Portal chỉ bật domain thực tế ở G3 |
| G4-H02-W008 | Governance Data Platform | Chủ sở hữu dữ liệu, consent/retention, data contracts, reconciliation/KPI, danh mục dữ liệu được phép chia sẻ | Không đồng nhất cần data với cần xây data warehouse mới |
| G4-H02-W009 | Thẩm định bản quyền archive licensing | Chuỗi chứng cứ quyền sở hữu/tác giả/âm nhạc/nhân vật/lãnh thổ/thời hạn, quyền tái cấp phép và phê duyệt giao dịch | Điều kiện cấp lại khác quyền phát media nội bộ |
| G4-H02-W010 | UAT tích hợp và chuyển giao theo từng gói | Đủ kịch bản E2E được chọn, hướng dẫn vận hành, incident/rollback, đào tạo người phụ trách biên tập/pháp lý/đối tác | Không nghiệm thu toàn GĐ4 chỉ vì một module hoạt động |

**Chưa lập giá/giờ:** Với GĐ4 dài hạn, dự toán H01/H02 chỉ được bóc theo gói thực sự chọn; không cộng một con số dự phòng chung cho toàn bộ 78 tính năng chưa chốt.

[13 luồng nghiệm thu đề xuất](G4-TIEU-CHI-NGHIEM-THU.md) · [Gates](G4-RELEASE-GATES.md).
