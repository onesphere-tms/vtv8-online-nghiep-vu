# Kiến trúc và yêu cầu phi chức năng xuyên giai đoạn

**Trạng thái:** DRAFT; chưa chọn công nghệ/nhà cung cấp chính thức.

## Các nguyên tắc
1. Phân tách rõ miền nghiệp vụ: Content/CMS, DAM, Video/Live, IAM, Analytics, Commerce, AI.
2. GĐ1 ưu tiên ít thành phần vận hành, tổ chức code theo module; việc dùng microservices là quyết định kỹ thuật **cần đánh giá**, không mặc định.
3. Xây API và mô hình dữ liệu có khả năng mở rộng, có migration, versioning và tracing.
4. Video/audio/media lưu object storage; dữ liệu nghiệp vụ và sự kiện phân tích có đặc tính tải khác nhau.
5. Bảo mật, sao lưu, giám sát, performance testing cần đưa vào WBS.

## Mục tiêu nguồn cần khảo sát
- Website khoảng 5.000 lượt truy cập/ngày; 70 nội dung mới/ngày; 20GB video gốc/ngày.
- Lưu lượng thường khoảng 2.000–3.000 CCU; có thời điểm khoảng 80.000 CCU; **mục tiêu 120.000 CCU** – phải xác minh đây là viewer livestream hay traffic website.
- SLA giai đoạn V1 ≥99,9%; Media Platform hướng tới ≥99,95%.
- Pipeline đề xuất: RTMP/SRT → media server → transcoding → ABR → HLS/DASH → origin → CDN.
- Hạ tầng VTVcab/VTVprime là một phương án **cần kiểm thử thực tế**, không phải năng lực đã được xác nhận.

## Công nghệ tham chiếu từ tài liệu
- PostgreSQL cho nghiệp vụ cốt lõi; Redis cache/session/rate limit.
- OpenSearch/Elasticsearch khi cần full-text riêng; storage S3-compatible cho media.
- ClickHouse cho analytics quy mô lớn khi có nhu cầu; MongoDB chỉ khi phù hợp schema metadata; Cassandra không ưu tiên cho V1.

## ADR cần lập trước khi chốt giá
- ADR-0001: kế thừa website/CMS hay xây mới.
- ADR-0002: thuê/tích hợp streaming hay tự xây media infrastructure.
- ADR-0003: CDN, cấp bitrate, khu vực phục vụ và kịch bản 120k CCU.
- ADR-0004: mô hình lưu trữ/retention/backup và quyền media.
- ADR-0005: IAM/SSO, payment, DRM cho GĐ2.
- ADR-0006: mô hình booking/commerce và trách nhiệm giao dịch.
- ADR-0007: AI tích hợp API bên ngoài hay self-host.
