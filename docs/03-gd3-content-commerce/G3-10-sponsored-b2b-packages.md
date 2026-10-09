# G3-10 – Gói truyền thông tài trợ và dịch vụ B2B

> **GĐ3 – đã chuẩn hóa nội bộ 09/10/2026, chưa được VTV8 phê duyệt và chưa ước tính FE/BE.** Thương mại và B2B theo gate/hợp đồng thực tế, không mặc định mở toàn bộ.

## Mục tiêu
Hỗ trợ mô hình quảng bá địa phương/di sản/đặc sản, truyền thông doanh nghiệp và chương trình tài trợ đã được nêu trong phần mô hình kinh doanh chung của đề xuất.

## Phạm vi và ranh giới
- **Nhóm phân kỳ:** B2B – cơ hội kinh doanh bổ sung, chưa mặc định thuộc 3 bước GĐ3.
- **Chủ sở hữu:** B2B Sales & Sponsored Content.
- **Kế thừa:** G1-03 workflow biên tập, G1-04 nội dung, G3-03 partner, G3-02 lead source; không thay thế bán quảng cáo/programmatic ad-server, licensing archive sâu thuộc GĐ4.
- Đối với marketplace, toàn bộ phần core commerce được đặt `CONDITIONAL` cho đến khi có [điều kiện TMĐT và trách nhiệm giao dịch](G3-RELEASE-GATES.md). Không mặc định VTV8 có nghĩa vụ pháp lý của seller/merchant trước khi mô hình được quyết định.

## Tính năng độc lập (6)

| Mã | Tính năng | Actor | Nghiệp vụ sau QA | FE mới | BE mới | Nghiệm thu sơ bộ | Phạm vi | Nguồn | Ranh giới/điều kiện QA |
|---|---|---|---|---|---|---|---|---|---|
| G3-10-F001 | **Danh mục gói dịch vụ truyền thông B2B** | Kinh doanh | OPTION theo mô hình B2B trong đề xuất kinh doanh tổng thể; gói tài trợ/truyền thông chỉ đưa vào GĐ3 nếu VTV8 chọn, không coi là bước thứ tư mặc định. | Package list/form back-office | B2B offer metadata, effective dates, terms | Gói có phạm vi bàn giao và trách nhiệm rõ, không là SKU vật lý marketplace | OPTION | T | Gói B2B nêu trong mô hình kinh doanh chung, không bắt buộc trong ba bước GĐ3 |
| G3-10-F002 | **Tiếp nhận yêu cầu quảng bá hoặc tài trợ** | Doanh nghiệp/địa phương; kinh doanh | Form yêu cầu truyền thông B2B dùng lead service G3-02, chỉ thêm trường ngành/đầu mối doanh nghiệp theo mục đích đã chốt. | B2B inquiry form dùng lại lead UI | Tái dùng lead service G3-02 với category và phân quyền, không tạo cơ sở dữ liệu lead B2B thứ hai | Yêu cầu có đủ contact/nội dung và được chuyển đúng bộ phận | OPTION | B | Dùng lại hạ tầng lead G3-02 cho nhu cầu B2B |
| G3-10-F003 | **Lập và phê duyệt đề xuất truyền thông** | Kinh doanh; quản lý VTV8 | Nếu chọn B2B: tạo/phê duyệt đề xuất theo người phụ trách và phiên bản, không tự xây ERP, hợp đồng điện tử. | Proposal draft/approval và PDF nếu cần | Proposal records, workflow/audit, template export | Có lịch sử bản đề xuất, trạng thái nội bộ và người chịu trách nhiệm | OPTION | B | Đề xuất dịch vụ chỉ làm khi đã duyệt mô hình B2B |
| G3-10-F004 | **Liên kết nội dung tài trợ và nhãn hợp tác** | Biên tập; quản trị | Liên kết chiến dịch tài trợ và nội dung CMS G1, dùng lại nhãn disclosure G3-01-F004; chỉ bổ sung quan hệ campaign/contract. | CMS selector/nhãn hợp tác dùng lại | Campaign–content relation, rights/approval guard | Không đăng nội dung tài trợ thiếu trạng thái duyệt hoặc nhãn bắt buộc | OPTION | T | Dùng lại nhãn tài trợ G3-01, chỉ thêm liên kết chiến dịch |
| G3-10-F005 | **Theo dõi bàn giao nội dung, chương trình và báo cáo** | Quản lý tài trợ | Bảng công việc/bàn giao theo hợp đồng B2B, lấy metrics từ G1-09/G2-11; không tự cam kết chỉ số quảng cáo không đo được. | Delivery checklist/report per campaign | Deliverables relation, measured metrics references | Đếm được đầu ra, chưa nghiệm thu không tự coi đã bàn giao | OPTION | B | Báo cáo bàn giao dùng dữ liệu CMS và analytics sẵn có |
| G3-10-F006 | **Bảng quản lý khách hàng và hợp đồng B2B tối thiểu** | Kinh doanh; tài chính | Hồ sơ khách hàng B2B phải liên kết cùng pháp nhân partner G3-03 khi trùng tổ chức, không tạo master doanh nghiệp thứ hai. | B2B account list, contract metadata | Customer/contract references + audit, không nhân đôi partner G3-03 nếu cùng đơn vị | Có thể tra cứu đối tác và hợp đồng đang hiệu lực, phân quyền thông tin | OPTION | B | Hồ sơ pháp nhân chung, không nhân bản đối tác G3-03 |

**Nhãn nguồn:** `T` = nhóm/ví dụ có trong nguồn VTV8, không đồng nghĩa chi tiết được chốt; `B` = suy luận nghiệp vụ. Nhãn CORE/CONDITIONAL/OPTION là phân kỳ nội bộ; xem [64 tính năng](G3-DANH-MUC-TINH-NANG.md), [70→64](G3-MAPPING-70-64.md) và [release gates](G3-RELEASE-GATES.md).

[Trở lại GĐ3](README.md).
