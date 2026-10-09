# G4-09 – Kho tư liệu di sản số và khai thác bản quyền nội dung

> **GĐ4 Digital Ecosystem – DRAFT phân tích nghiệp vụ ngày 09/10/2026.** Nguồn chỉ định hướng dài hạn, chưa có yêu cầu cấp phép triển khai hoặc ngân sách được phê duyệt. CORE là phần cơ sở của **nhóm được chọn**, không có nghĩa toàn GĐ4 cùng mở.

## Mục tiêu
Khai thác kho nội dung văn hóa–di sản dài hạn và bán quyền sử dụng tư liệu cho khách hàng B2B theo chứng cứ bản quyền. Tách kho khai thác bản quyền khỏi Data Platform phân tích.

## Phân kỳ và kế thừa
- **Nhóm phát hành:** D+ – Archive & Content Licensing.
- **Không tính trùng:** G1-05 DAM/provenance/storage tiers, G1-03 workflow biên tập, G2-10 entitlement/DRM nếu áp dụng, G3-10 B2B contracts và G4-03/04 transcript/semantic search. Không xây một kho media hoặc công cụ chuyển mã video thứ hai.
- Các nội dung CONDITIONAL/OPTION cần xác nhận tại [G4-RELEASE-GATES.md](G4-RELEASE-GATES.md) trước khi cam kết nghiệm thu.

## Danh mục tính năng (9)

| Mã | Tính năng | Actor | Nghiệp vụ/đầu ra | FE mới | BE/Integration mới | Nghiệm thu sơ bộ | Phạm vi | Căn cứ | Gate/giả định |
|---|---|---|---|---|---|---|---|---|---|
| G4-09-F001 | **Tra cứu bộ sưu tập di sản/tư liệu phục vụ cấp phép** | Biên tập; quản lý tư liệu | Lập bộ sưu tập thematic/archive từ các asset DAM có hồ sơ quyền, người xuất hiện và mốc lịch sử, tìm theo nguồn/chủ đề/thời gian. | Archive collection search/explore và preview theo quyền | Saved archive collections, DAM references, metadata eligibility | Tra được nguồn file và quyền sở hữu; không copy media sang kho sở hữu mới. | CORE | T4 | DAM_ARCHIVE |
| G4-09-F002 | **Ma trận quyền khai thác và hạn sử dụng theo mục đích** | Pháp lý; quản lý media | Phân biệt quyền phát VTV8, cấp phép bên thứ ba, quyền hình ảnh/âm nhạc/footage, lãnh thổ, thời hạn và mục đích; bổ sung vào DAM rights G1-05. | Rights matrix/versioning, legal review states | License eligibility rules atop DAM, evidence/document refs và audit | Không chào bán tài sản thiếu quyền cấp lại; thay đổi quyền có ảnh hưởng tới license offer. | CORE | T4 | RIGHTS_LEGAL |
| G4-09-F003 | **Danh mục gói khai thác tư liệu** | Kinh doanh B2B | Giới thiệu tư liệu/đoạn trích có thể xin cấp phép với các loại mục đích, thời hạn, phương thức nhận báo giá; không công khai file gốc chất lượng cao. | Licensable catalog, preview/watermark theo quyền | License offer schema linking DAM eligibility, restrictions | Chỉ tài sản đủ quyền mới được giới thiệu; preview không thay file được cấp quyền. | CORE | TBIZ | LICENSING_MODEL |
| G4-09-F004 | **Tiếp nhận yêu cầu cấp phép sử dụng nội dung** | Doanh nghiệp; tổ chức | Gửi nội dung mong muốn, mục đích sử dụng, phạm vi, thời hạn, liên hệ; có tình trạng tiếp nhận, khác lead tour G3 nhưng có thể tái dùng inbox/workflow. | B2B license request form/tracking | Licensing inquiry record and links DAM/organization, safe PII handling | Mỗi yêu cầu xác định tài sản và mục đích, không tự cấp quyền khi mới gửi form. | CORE | TBIZ | B2B_POLICY |
| G4-09-F005 | **Báo giá, kiểm tra và duyệt yêu cầu license** | Kinh doanh; pháp lý | Tạo báo giá/điều khoản hạn dùng, xác minh quyền sở hữu và người duyệt, lưu revision trước khi bên mua chấp thuận. | Quote and approval checklist, versions | License quote policy, approval/history, rights preflight | Không phát hành license khi còn thiếu sự phê duyệt pháp lý và chứng cứ quyền. | CONDITIONAL | P | LICENSING_LEGAL |
| G4-09-F006 | **Theo dõi hợp đồng/giấy phép và hiệu lực sử dụng** | Pháp lý; tài chính | Lưu phạm vi giấy phép, đối tác, thời gian, lãnh thổ, sản phẩm sử dụng và trạng thái; có thể liên kết hợp đồng ngoài hệ, không mặc định ký điện tử. | License agreement registry and state | License grants/expiry/revoke, audit, partner refs | Có thể tra biết đã cấp quyền gì, cho ai, đến bao giờ và điều kiện thu hồi. | CONDITIONAL | TBIZ | CONTRACT_SCOPE |
| G4-09-F007 | **Bàn giao file chất lượng gốc có kiểm soát** | Quản lý tư liệu; khách hàng | Chỉ sau duyệt/hợp đồng đủ điều kiện, tạo gói xuất và link an toàn giới hạn tải, watermark khi cần; không mặc định có DRM download. | Asset selection/download package/progress | Secure delivery/expiring signed URLs, log và DRM gating nếu provider hỗ trợ | Khách chưa được cấp phép không lấy được bản gốc; link hết hạn theo chính sách. | CONDITIONAL | P | SECURE_DELIVERY |
| G4-09-F008 | **Ghi nhận phí khai thác và đối soát cấp phép** | Tài chính; kinh doanh | Liên kết tình trạng báo giá/hợp đồng với chứng cứ thanh toán và doanh thu bản quyền; chỉ tích hợp payment khi được VTV8 quyết định. | Invoice/payment status reference and reports | License commercial transaction refs, reconciliation adapter nếu có | Không gọi yêu cầu cấp phép thành doanh thu khi chưa có hợp đồng/giao dịch xác nhận. | CONDITIONAL | TBIZ | LICENSING_PAYMENT |
| G4-09-F009 | **Gia hạn, thu hồi và báo cáo khai thác bản quyền** | Quản lý tư liệu; kinh doanh | Nhắc hạn sử dụng, ghi yêu cầu gia hạn/thu hồi, báo cáo số cấp phép/tài sản theo kỳ và log phân phối khi có nguồn dữ liệu. | License renew/report console | Expiry scheduler, renewal requests, license usage metrics | Hồ sơ quyền hết hạn được cảnh báo; không tuyên bố đã thu hồi bản sao ngoài hệ thống khi không kiểm soát. | OPTION | P | LICENSE_LIFECYCLE |

**Nhãn căn cứ:** `T4` = App/AI/Membership/Partner/Data hoặc archive dài hạn trong lộ trình GĐ4; `TBIZ` = mô hình kinh doanh Content Licensing/Archive Licensing trang 12–13; `P` = phân rã bổ sung. Ngay cả khi chủ đề có nguồn, các thao tác chi tiết và chính sách vẫn cần VTV8 xác nhận.

[Danh mục GĐ4](G4-DANH-MUC-TINH-NANG.md) · [Phân kỳ và gate](G4-RELEASE-GATES.md).
