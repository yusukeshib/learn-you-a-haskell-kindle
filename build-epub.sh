#!/usr/bin/env bash
# Build an EPUB from the existing OPF / pages / images.
# The resulting EPUB can be sent directly to a modern Kindle via
# Send-to-Kindle, or converted to MOBI/AZW3 with calibre / Kindle Previewer.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="$ROOT/learn-you-a-haskell-ja.epub"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

mkdir -p "$TMP/META-INF"

# mimetype must be the first entry, stored uncompressed.
printf 'application/epub+zip' > "$TMP/mimetype"

cat > "$TMP/META-INF/container.xml" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
  <rootfiles>
    <rootfile full-path="content.opf" media-type="application/oebps-package+xml"/>
  </rootfiles>
</container>
EOF

cp "$ROOT/book.opf" "$TMP/content.opf"
cp "$ROOT/toc.ncx" "$TMP/toc.ncx"
cp -R "$ROOT/pages" "$TMP/pages"
cp -R "$ROOT/css"   "$TMP/css"
cp -R "$ROOT/images" "$TMP/images"

# Spec requires mimetype to be stored uncompressed and first.
rm -f "$OUT"
( cd "$TMP" && zip -X0 "$OUT" mimetype >/dev/null )
( cd "$TMP" && zip -Xr9D "$OUT" META-INF content.opf toc.ncx pages css images >/dev/null )

echo "Built: $OUT"
