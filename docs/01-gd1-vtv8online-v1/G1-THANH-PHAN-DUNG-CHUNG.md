# GĐ1 – Thành phần dùng chung và nguyên tắc không tính trùng giờ

> **Phân rã nội bộ cập nhật 09/10/2026.** Áp dụng cho danh sách tính năng GĐ1 V1 (82 feature) và WBS H01/H02. Không có tính năng mạng xã hội; không đổi kiến trúc thành 11 microservice.

| Thành phần / logic dùng chung | Chủ sở hữu tính giờ chính | Tính năng tiêu thụ/tích hợp (chỉ tính phần bổ sung) | Quy tắc phân định |
|---|---|---|---|
| Xác thực, phiên và RBAC | G1-02-F001/F004 | G1-03, G1-04, G1-05, G1-06, G1-07, G1-09, G1-10 | Permission middleware tính một lần; từng module chỉ tính hành động gắn quyền đặc thù |
| Rich-text editor, preview renderer | G1-03-F001 và G1-01-F004 | G1-03-F005/F010, G1-01-F009 | Editor/renderer dùng lại; preview chỉ bổ sung bảo vệ nháp, trang tĩnh dùng cùng khối editor |
| Workflow, trạng thái duyệt và nhật ký tác nghiệp | G1-03-F003/F004/F006 | G1-06-F002, G1-10 và G1-03-F010 | G1-02 phân quyền; G1-03 sở hữu workflow xuất bản. Luồng phê duyệt nhuận bút riêng thuộc G1-10-F007 nếu chốt |
| Taxonomy, tag, liên kết thực thể | G1-04-F001/F009 | G1-03-F001, G1-05-F007, G1-06, G1-01 | Một nguồn taxonomy và relation API, form/picker dùng lại; không tạo bảng tag/CRUD thứ hai |
| Hồ sơ tác giả/người sản xuất | G1-04-F002 | G1-03 và G1-10-F001 | Contributor profile chỉ lưu một lần; G1-10 quản lý vai trò đóng góp của mỗi sản phẩm |
| Media rights metadata và chặn công khai | G1-05-F004 | G1-03-F006, G1-06-F002/F006 | DAM xác nhận trạng thái quyền đã nhập; bài/video gọi cùng một publish-eligibility check |
| Player FE và trạng thái lỗi | G1-06-F003/F005 | G1-07-F005/F008, G1-08-F004 | Một player FE dùng chung VOD/live; G1-08 chỉ playback adapter và nguồn media |
| Trang chương trình, series và tập | G1-01-F005, G1-04-F003/F004 | G1-06-F004 | Metadata, public template và video detail khác nhau; không xây trang chương trình thứ hai |
| Bản ghi livestream chuyển thành VOD | G1-08-F007, G1-07-F007, G1-06-F006 | DAM và CMS | G1-08 nhận recording; G1-07 liên kết phiên; G1-06 kiểm duyệt, xuất bản và phát lại |
| Thống kê lượt xem | G1-09-F003/F005 | G1-01, G1-06, G1-07, G1-10 | G1-09 định nghĩa view, tổng hợp theo bài/chuyên mục/thời gian; G1-10 chỉ áp dụng số liệu được xác nhận nếu quy chế cần |
| Redirect URL cũ | G1-11-F003 (mapping), G1-01-F008 (thực thi redirect) | H02-W003/W010 | Migration tạo mapping; website xử lý redirect; H02 điều phối cutover, không xây lại redirect |
| Performance test hạ tầng Streaming | H02-W007 | G1-08 và nhà cung cấp | Không phải dòng tính năng coding, không áp dụng QA tiêu chuẩn lần hai |
| CDN và monitoring | G1-08-F006/F008 (media), H01 (application) | G1-06/G1-07 | H01 chỉ app/web, G1-08 chỉ media/live, phí nhà cung cấp tính riêng |

**Quy tắc ước tính:** Nếu một feature dùng component chung thì chỉ nhập giờ phát triển mới cho feature đó, **không** thêm lại toàn bộ giờ component. Khi thay đổi quyết định owner phải cập nhật đồng thời hai phía.

## Những thành phần CHƯA mặc định tự xây trong V1

Media Server, hệ thống transcoding, origin shield, CDN riêng, hệ thống DRM/premium, ClickHouse/công cụ BI, OpenSearch, page builder, hệ thống quản trị nhân sự/lương đầy đủ, AI, booking và tích hợp mạng xã hội. Với video/live: kiểm chứng sự tồn tại và trách nhiệm cung cấp các năng lực streaming cần thiết qua G0-06 và H02-W011.

## Rủi ro phải khóa trước dự toán cố định

Quy chế nhuận bút; số cấp duyệt; ma trận quyền sử dụng media; kích thước video lớn nhất; số nguồn và khối lượng dữ liệu cũ; khả năng ingest/recording/playback/CDN/QoE của vendor; phân biệt website CCU với viewer đồng thời.
