# G4-H01 – Hạ tầng, tích hợp và vận hành Digital Ecosystem (DRAFT)

> **Nhóm WBS hỗ trợ, không phải tính năng sản phẩm và chưa ước tính giờ.** Cần bóc khối lượng hạ tầng/DevOps độc lập với Coding FE/BE của 9 module. Chỉ tính phần tăng thêm chưa có ở GĐ1–GĐ3.

| WBS | Công việc | Đầu ra cần nghiệm thu | Điều kiện/không tính trùng |
|---|---|---|---|
| G4-H01-W001 | Build, phát hành và giám sát Mobile App | Signing/secrets, CI/CD, beta/test releases, crash/performance metrics, rollback | Cần tài khoản phát hành OS và thiết bị thật; UI/app logic ở G4-01 |
| G4-H01-W002 | Build/publish Smart TV theo OS | Packaging, device labs, remote/player compatibility tests | Chỉ khi chọn TV OS; không tính như Mobile App thứ ba |
| G4-H01-W003 | Môi trường AI media và job queue | Provider credentials/region, queue/worker autoscale, upload/download security và quota | AI pipeline nghiệp vụ ở G4-03; phí AI/GPU tách riêng |
| G4-H01-W004 | Giám sát chi phí AI và render | Metering phút/audio/video/tokens, cảnh báo quota/cost, retry và failure rates | Không tự hứa ước lượng chi phí nếu thiếu video minutes/provider |
| G4-H01-W005 | Vector index/search vận hành | Index backup/rebuild, latency, quota, ACL enforcement test và rollback | Chỉ nếu chọn semantic search G4-04; keyword G2-04 giữ nguyên |
| G4-H01-W006 | Bảo mật membership/partner API | Tenant isolation, key rotation, permission audit, endpoint abuse monitoring | IAM/entitlement nghiệp vụ G2 và partner roles G4-07 không tính lại |
| G4-H01-W007 | Kho phân tích khi có workload | Capacity benchmark, ingestion/retention, observability, backup/recovery, cost budgets | Không mặc định chọn ClickHouse/lakehouse nếu hạ tầng G2 đủ |
| G4-H01-W008 | Kho archive, lifecycle và tệp cấp phép | Storage hot/warm/archive policies, secured downloads, checksum/backup/retrieval tests | DAM core G1-05, grant/license domain ở G4-09; egress/provider fees tách |
| G4-H01-W009 | Vận hành bảo mật và quyền riêng tư xuyên giai đoạn | IAM/secrets, consent/retention enforcement monitoring, backup restore drills và incident response | Không xây thêm một privacy portal hoặc database audience |
| G4-H01-W010 | Thử tải và quan sát hệ sinh thái | Mobile/TV/API/media/search/data SLO monitoring, failure drills, vendor SLA validation | Mục tiêu 120K CCU là vấn đề kiến trúc xuyên giai đoạn; không tính thành một tính năng GĐ4 hay coi đã chứng minh |

**Không bao gồm trong phần coding FE/BE:** phí store developer, TV vendor certificates, AI provider/GPU, API traffic, transcript/translation/render minutes, storage/egress, media/CDN/DRM, warehouse compute, security review, legal/license, và nhân sự vận hành.

[Điều kiện phát hành](G4-RELEASE-GATES.md) · [Hồ sơ tính năng](G4-DANH-MUC-TINH-NANG.md).
