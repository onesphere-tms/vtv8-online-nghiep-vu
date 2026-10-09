#!/usr/bin/env bash
# Đưa đúng file gốc VTV8 và file template Excel vào Git mà không biến đổi nội dung.
# Usage:
#   bash scripts/import-original-documents.sh "/path/Template Báo giá Dự án.xlsx" "/path/Đề xuất hợp tác VTV8 - IIEL_VTV8 note(1).docx"
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Cú pháp: bash scripts/import-original-documents.sh <template.xlsx> <de-xuat.docx>" >&2
  exit 2
fi

template_source="$1"
proposal_source="$2"
[[ -f "$template_source" ]] || { echo "Không tìm thấy: $template_source" >&2; exit 1; }
[[ -f "$proposal_source" ]] || { echo "Không tìm thấy: $proposal_source" >&2; exit 1; }

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"
template_target="bao-gia/templates/Template Báo giá Dự án.xlsx"
proposal_target="tai-lieu-nguon/Đề xuất hợp tác VTV8 - IIEL_VTV8 note.docx"
mkdir -p "$(dirname "$template_target")" "$(dirname "$proposal_target")"
cp "$template_source" "$template_target"
cp "$proposal_source" "$proposal_target"

echo "Kiểm tra checksum trước/sau copy:"
sha256sum "$template_source" "$template_target" "$proposal_source" "$proposal_target"
cmp -s "$template_source" "$template_target"
cmp -s "$proposal_source" "$proposal_target"
git add -- "$template_target" "$proposal_target"
if git diff --cached --quiet -- "$template_target" "$proposal_target"; then
  echo "Hai tệp gốc đã có trên Git, không có thay đổi."
  exit 0
fi
git commit -m "docs: add original VTV8 proposal and quotation template" -- "$template_target" "$proposal_target"
git push origin "$(git branch --show-current)"
echo "Đã đẩy 2 tệp nguyên bản. Kiểm tra trên GitHub."
