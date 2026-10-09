# G0-01 – Khảo sát nghiệp vụ và xác định phạm vi sản phẩm

> **Giai đoạn:** GĐ0 – Khảo sát và thiết kế tổng thể  
> **Danh sách công việc cấp dưới:** **11/11 đã chốt nội bộ ngày 09/10/2026**  
> **Đặc tả sâu, khối lượng, nghiệm thu và dự toán:** CHƯA CHỐT  
> **Căn cứ:** Tài liệu đề xuất VTV8–IIEL; phân rã `SOURCE + PROPOSED` phục vụ khảo sát và lập báo giá.  
> **Phạm vi phê duyệt:** Việc chốt tại đây là quyết định làm việc của nhóm phân tích, **không phải** xác nhận đã khảo sát hoặc phê duyệt của VTV8.

## 1. Mục tiêu

Xác định hiện trạng và định hướng nghiệp vụ của VTV8Online: ai sử dụng, các quy trình hiện tại (AS-IS), quy trình đề xuất (TO-BE), nhóm chức năng và phạm vi triển khai GĐ1–GĐ4.

Đây là **module khảo sát và phân tích**, không phải module phát triển phần mềm. Mã `G0-01-Fxxx` biểu thị **hạng mục công việc khảo sát/đầu ra phân tích**, không phải một tính năng phải code.

## 2. Danh sách 11 hạng mục đã chốt

| Mã | Hạng mục | Nội dung chính | Sản phẩm bàn giao dự kiến | Căn cứ |
|---|---|---|---|---|
| G0-01-F001 | Khảo sát các bên liên quan | Xác định bộ phận, người sử dụng, người phê duyệt và trách nhiệm cung cấp thông tin | Stakeholder Matrix | PROPOSED |
| G0-01-F002 | Nghiệp vụ sản xuất và biên tập tin bài | Quy trình tạo bài, biên tập, duyệt, xuất bản và sửa/gỡ bài | Editorial Workflow | SOURCE + PROPOSED |
| G0-01-F003 | Nghiệp vụ quản lý chương trình và video | Quản lý chương trình, tập, video, tư liệu; các bước sản xuất và xuất bản | Media Business Workflow | SOURCE + PROPOSED |
| G0-01-F004 | Nghiệp vụ livestream | Lập lịch, chuẩn bị nguồn phát, phát trực tiếp, kết thúc, lưu và phát lại | Livestream Business Workflow | SOURCE + PROPOSED |
| G0-01-F005 | Nghiệp vụ thống kê và nhuận bút | Lượt xem, số tin bài, báo cáo; quy trình tính, kiểm tra và xác nhận nhuận bút | Reporting & Royalty Requirements | SOURCE + PROPOSED |
| G0-01-F006 | Nghiệp vụ người xem và Media Platform | Tài khoản, lịch sử xem, theo dõi chương trình, nội dung trả phí | Audience Requirements | SOURCE + PROPOSED |
| G0-01-F007 | Nghiệp vụ kinh doanh và Content Commerce | Nội dung tài trợ, quảng cáo, lead, affiliate, booking, TMĐT | Commerce Requirements | SOURCE + PROPOSED |
| G0-01-F008 | Phân tích vai trò và quyền nghiệp vụ | Nhóm người sử dụng, trách nhiệm, các quyền thao tác và phê duyệt | Role & Permission Matrix | SOURCE + PROPOSED |
| G0-01-F009 | Phân tích quy trình hiện tại và tương lai | Tổng hợp AS-IS, TO-BE, quy tắc nghiệp vụ, tình huống ngoại lệ | Business Process Specification | PROPOSED |
| G0-01-F010 | Xây dựng danh mục yêu cầu chức năng | Tổng hợp, phân loại và liên kết yêu cầu với module/giai đoạn | Functional Requirements Backlog | PROPOSED |
| G0-01-F011 | Rà soát và xác nhận kết quả khảo sát | Đối chiếu yêu cầu, ghi nhận xung đột, điểm chưa rõ, phản hồi của các bên | Requirement Review & Open Issues | PROPOSED |

- **Danh sách và tên 11 hạng mục:** đã thống nhất nội bộ.
- **Phạm vi chi tiết và đầu ra:** được ghi dưới đây làm cơ sở phân tích tiếp; mức độ hoàn thiện, khối lượng và tiêu chí nghiệm thu cần tiếp tục xác định khi thực hiện.
- **Nguồn:** `SOURCE` nghĩa là nghiệp vụ chủ đề có trong tài liệu VTV8; `PROPOSED` là việc tách hạng mục, quy trình hoặc sản phẩm bàn giao do nhóm phân tích đề xuất. Không suy diễn rằng từng chi tiết là yêu cầu đã được VTV8 phê duyệt.

## 3. Nội dung cần làm rõ theo từng hạng mục

### G0-01-F001 – Khảo sát các bên liên quan

**Căn cứ:** PROPOSED  
**Phạm vi cần khảo sát/phân tích:**

- Nhóm lãnh đạo/quản lý sản phẩm, tòa soạn/biên tập, sản xuất video, kỹ thuật, kinh doanh, tài chính và pháp lý cần tham vấn.
- Vai trò ra quyết định và trách nhiệm cung cấp/xác nhận yêu cầu của từng nhóm.
- Hình thức và tài liệu đầu vào cho việc khảo sát.

**Đầu ra dự kiến:** Danh sách stakeholder, vai trò tham gia và ma trận trách nhiệm xác nhận yêu cầu.

### G0-01-F002 – Nghiệp vụ sản xuất và biên tập tin bài

**Căn cứ:** SOURCE + PROPOSED  
**Phạm vi cần khảo sát/phân tích:**

- Quy trình tạo nội dung, chỉnh sửa, kiểm duyệt, xuất bản và lưu lịch sử.
- Số cấp duyệt, điều kiện trả lại bài, chỉnh sửa/gỡ nội dung sau xuất bản.
- Nhu cầu phân công bài viết, theo dõi trạng thái nếu hiện có.

**Đầu ra dự kiến:** Sơ đồ luồng biên tập, trạng thái và quy tắc/ngoại lệ nghiệp vụ.

### G0-01-F003 – Nghiệp vụ quản lý chương trình và video

**Căn cứ:** SOURCE + PROPOSED  
**Phạm vi cần khảo sát/phân tích:**

- Cách tổ chức chương trình, series, tập, video và tư liệu liên quan.
- Quy trình tiếp nhận, duyệt, xuất bản, thay thế và tái sử dụng video.
- Trách nhiệm quản lý file gốc, phiên bản phát hành và thông tin nội dung.

**Đầu ra dự kiến:** Quy trình nghiệp vụ quản lý chương trình/video và quy tắc liên kết nội dung.

### G0-01-F004 – Nghiệp vụ livestream

**Căn cứ:** SOURCE + PROPOSED  
**Phạm vi cần khảo sát/phân tích:**

- Các loại chương trình trực tiếp và người chịu trách nhiệm lập/duyệt lịch.
- Các bước trước, trong và sau sự kiện phát; xử lý sự cố ở góc độ vận hành.
- Quyết định lưu và phát lại nội dung sau livestream.

**Đầu ra dự kiến:** Quy trình vận hành livestream theo nghiệp vụ và các trạng thái chính.

### G0-01-F005 – Nghiệp vụ thống kê và nhuận bút

**Căn cứ:** SOURCE + PROPOSED  
**Phạm vi cần khảo sát/phân tích:**

- Các chỉ số báo cáo bài viết, lượt xem theo chuyên mục/thời gian và đối tượng sử dụng báo cáo.
- Nguyên tắc/hệ số, kỳ tính nhuận bút và nhóm người được hưởng.
- Quy trình kiểm tra, điều chỉnh, phê duyệt và xuất kết quả.

**Đầu ra dự kiến:** Danh mục báo cáo, quy tắc tính nhuận bút cần xác minh và quy trình chốt kỳ.

### G0-01-F006 – Nghiệp vụ người xem và Media Platform

**Căn cứ:** SOURCE + PROPOSED  
**Phạm vi cần khảo sát/phân tích:**

- Nhu cầu sử dụng của khách chưa đăng nhập so với người dùng có tài khoản.
- Theo dõi, yêu thích, lịch sử xem và danh sách phát ở cấp nghiệp vụ.
- Định hướng phân quyền nội dung và mô hình nội dung trả phí.

**Đầu ra dự kiến:** Khung yêu cầu nghiệp vụ người xem, phục vụ phân tích sâu ở GĐ2.

### G0-01-F007 – Nghiệp vụ kinh doanh và Content Commerce

**Căn cứ:** SOURCE + PROPOSED  
**Phạm vi cần khảo sát/phân tích:**

- Quảng cáo, tài trợ, truyền thông địa phương và các cơ hội kinh doanh B2B.
- Liên kết nội dung với sản phẩm/dịch vụ, tiếp nhận lead và quan hệ đối tác.
- Các cấp độ thương mại hóa: referral, affiliate/booking và sàn TMĐT theo định hướng dài hạn.

**Đầu ra dự kiến:** Danh mục nghiệp vụ thương mại và các phương án cần đánh giá ở GĐ3.

### G0-01-F008 – Phân tích vai trò và quyền nghiệp vụ

**Căn cứ:** SOURCE + PROPOSED  
**Phạm vi cần khảo sát/phân tích:**

- Các vai trò nội bộ: quản trị, biên tập, duyệt/xuất bản, media, thống kê/nhuận bút.
- Các nhóm ngoài hệ thống nội bộ: người xem, đối tác theo từng giai đoạn.
- Quyền nghiệp vụ tạo, sửa, duyệt, xuất bản, xem báo cáo và quản lý tài sản.

**Đầu ra dự kiến:** Ma trận vai trò – thao tác nghiệp vụ, làm đầu vào phân quyền kỹ thuật.

### G0-01-F009 – Phân tích quy trình hiện tại và tương lai

**Căn cứ:** PROPOSED  
**Phạm vi cần khảo sát/phân tích:**

- Chuẩn hóa kết quả F002–F007 thành sơ đồ quy trình hiện trạng và quy trình đề xuất.
- Phân biệt điểm đau hiện tại, thay đổi đề xuất và các ngoại lệ.
- Ghi rõ điểm chờ xác nhận từ VTV8.

**Đầu ra dự kiến:** Bộ sơ đồ AS-IS/TO-BE; KHÔNG tổ chức khảo sát trùng với F002–F007.

### G0-01-F010 – Xây dựng danh mục yêu cầu chức năng

**Căn cứ:** PROPOSED  
**Phạm vi cần khảo sát/phân tích:**

- Định danh, mô tả, actor, nguồn căn cứ, độ ưu tiên của yêu cầu.
- Gắn yêu cầu vào giai đoạn/module GĐ1–GĐ4 và xác định phụ thuộc.
- Đánh dấu yêu cầu chưa được VTV8 xác nhận, chưa đủ điều kiện đưa vào giá cố định.

**Đầu ra dự kiến:** Backlog yêu cầu chức năng có mã, nguồn gốc, độ ưu tiên, phụ thuộc và trạng thái.

### G0-01-F011 – Rà soát và xác nhận kết quả khảo sát

**Căn cứ:** PROPOSED  
**Phạm vi cần khảo sát/phân tích:**

- Kiểm tra tính đầy đủ/nhất quán giữa các kết quả F001–F010.
- Ghi nhận yêu cầu mâu thuẫn hoặc thiếu dữ liệu và chủ thể cần phản hồi.
- Quản lý phiên bản tài liệu, biên bản họp rà soát và bằng chứng xác nhận khi có.

**Đầu ra dự kiến:** Biên bản rà soát và danh sách vấn đề mở; chỉ coi là VTV8 duyệt khi có bằng chứng phê duyệt.

## 4. Phân định để tránh trùng lặp

| Nhóm việc | Hạng mục phụ trách | Không làm lại trong G0-01 |
|---|---|---|
| Thu thập thông tin từng luồng nghiệp vụ | F002–F007 | F009 chỉ tổng hợp và chuẩn hóa, không khảo sát lại |
| Xác định actor và quyền nghiệp vụ | F001, F008 | F001 xác định stakeholder; F008 lập ma trận quyền |
| Phân loại yêu cầu/chọn giai đoạn | F010 | F011 chỉ rà soát nhất quán và trạng thái xác nhận |
| Khảo sát hệ thống, tài sản/dung lượng dữ liệu | G0-02 | Không kiểm kê kỹ thuật tại F003 |
| Quyền khai thác và pháp lý | G0-03 | F003/F004 chỉ ghi nhận quy trình nghiệp vụ |
| Sitemap, taxonomy, wireframe, prototype | G0-04 | Không thiết kế UI chi tiết ở F010 |
| Kiến trúc, data model kỹ thuật, bảo mật | G0-05 | F008 chỉ là quyền nghiệp vụ |
| Video streaming/CDN/SLA, 120.000 CCU | G0-06 | F004 chỉ là quy trình livestream |
| Data mapping và chiến lược migration | G0-07 | Không thiết kế pipeline dữ liệu tại F003 |
| WBS, timeline, báo giá, nghiệm thu tổng thể | G0-08 | F010 chỉ lập backlog yêu cầu; F011 chỉ rà soát khảo sát |

## 5. Liên hệ với tài liệu nguồn

- Đề xuất hợp tác VTV8–IIEL, phần **Giai đoạn 0 – Thiết kế tổng thể**: yêu cầu kiểm kê, khảo sát, thiết kế UX/UI, kiến trúc, bản quyền và kế hoạch.
- Phần **Giai đoạn 1/CMS**: các nghiệp vụ quản lý bài viết, chương trình, video, người dùng CMS, phân quyền, duyệt/xuất bản, thống kê và nhuận bút.
- Phần **Giai đoạn 1/Livestream**, **Giai đoạn 2/Media Platform** và **Giai đoạn 3/Content Commerce**: chủ đề cần khảo sát định hướng.
- File gốc: [Đề xuất hợp tác VTV8 – IIEL (.docx)](../../tai-lieu-nguon/Đề%20xuất%20hợp%20tác%20VTV8%20-%20IIEL_VTV8%20note.docx).

## 6. Đầu vào còn cần làm rõ khi bắt đầu ước tính GĐ0

- Số bộ phận và stakeholder tham gia; số buổi phỏng vấn/workshop; quyền tiếp cận tài liệu.
- Số quy trình nghiệp vụ cần vẽ AS-IS/TO-BE; mức độ phức tạp và số vòng rà soát.
- Mức chi tiết BRD/backlog và cấu trúc hồ sơ bàn giao.
- Số vòng xác nhận và ai đại diện VTV8 có thẩm quyền phê duyệt.
- Những hạng mục khảo sát nào đã được thực hiện, tài liệu nào đã có sẵn để không tính trùng.

## 7. Nguyên tắc dự toán

- **Chưa điền FE/BE hours, MD hoặc chi phí**; người dùng đã thống nhất thứ tự: chốt module → chốt danh sách hạng mục/tính năng → phân tích đủ chi tiết → mới ước tính.
- GĐ0 chủ yếu là dịch vụ khảo sát và thiết kế, cần xác định effort phù hợp theo công việc/đầu ra.
- Quy tắc **giờ code Middle Developer** và BA/Design/QA tính từ coding áp dụng cho tính năng phát triển phần mềm (thường từ GĐ1), không sử dụng để suy ra effort khảo sát GĐ0 khi không có coding.
- Phải phân biệt chi phí/tài liệu GĐ0 đã bàn giao với BA/Design tính theo công thức ở GĐ1 để tránh báo giá trùng.

## 8. Nhật ký chốt phạm vi

| Ngày | Nội dung | Trạng thái |
|---|---|---|
| 09/10/2026 | Thống nhất nội bộ 8 hạng mục cấp module cho GĐ0 | Danh mục module đã chốt |
| 09/10/2026 | Thống nhất nội bộ **11 hạng mục F001–F011** của G0-01 theo danh sách đề xuất | Danh mục công việc G0-01 đã chốt |
| Chưa có | Xác nhận khảo sát, kết quả tài liệu, đầu ra chi tiết và nghiệm thu bởi VTV8 | Chưa thực hiện |
| Chưa có | Ước tính khối lượng, giờ công và báo giá | Chưa thực hiện |

**Bước tiếp theo theo quy trình:** lựa chọn giữa (a) đi sâu xác định khối lượng/đầu ra và cách ước tính của từng hạng mục G0-01; (b) tiếp tục thống nhất danh mục G0-02. Không tự bổ sung tính năng hay giờ code khi chưa thực hiện bước tương ứng.
