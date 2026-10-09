# G1-H01 – Hạ tầng, bảo mật và vận hành ứng dụng

> **Nhóm công việc hỗ trợ GĐ1, không phải module sản phẩm.** Cần bóc tách DevOps/infrastructure/license/vendor khác với giờ FE/BE feature. Các hạng mục chỉ chốt sau phương án GĐ0.

| Mã | Hạng mục | Đầu ra kiểm tra được | Phân loại dự toán |
|---|---|---|---|
| G1-H01-W001 | Thiết lập môi trường dev/staging/production | Môi trường vận hành riêng, quản lý secret và biến cấu hình, quyền truy cập | DevOps effort + hosting |
| G1-H01-W002 | Cơ sở dữ liệu và storage ứng dụng | DB, object storage, cấu hình quyền và lifecycle file; không trùng origin của G1-08 | DevOps effort + storage |
| G1-H01-W003 | Pipeline build/deploy và release | CI/CD, môi trường kiểm thử, phương án rollback bản ứng dụng | DevOps effort |
| G1-H01-W004 | Bảo mật cơ bản và bảo vệ website/CMS | TLS, rate limits, phân vùng mạng, cấu hình WAF nếu cần, kiểm soát secret | DevOps/security effort + vendor |
| G1-H01-W005 | Backup, restore và ứng cứu sự cố | Chính sách sao lưu DB/files, diễn tập khôi phục tối thiểu, runbook sự cố | DevOps effort + storage |
| G1-H01-W006 | Monitoring/logging ứng dụng và cảnh báo | Healthchecks, app error metrics, log retention, giám sát tài nguyên web/API | DevOps effort + monitoring service |
| G1-H01-W007 | Hiệu năng ứng dụng và triển khai công khai | Cache/CDN cho nội dung tĩnh, kiểm tra web/API mục tiêu, cấu hình cân bằng tải nếu cần | DevOps effort + CDN app |

**Ranh giới sau QA:** Go-live website/ứng dụng thuộc H02-W003; data cutover thuộc H02-W010; chỉ deploy/backup/cache/monitor ứng dụng ở H01. Không lập hai lần phần công sức chuyển dữ liệu, CDN media hoặc performance test.

**Không trùng G1-08:** ingest, transcoding, ABR, Origin Shield, CDN video, QoE và bài kiểm thử viewer video thuộc nhóm Streaming/provider, không tính lặp ở đây. **Chưa có số giờ, đơn giá và chi phí dịch vụ.**
