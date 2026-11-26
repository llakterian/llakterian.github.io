#!/usr/bin/env bash
# Safety checks for the portfolio before it goes live (`make check`).
#
#   1. Every Google Fonts link in the HTML actually loads (HTTP 200).
#      A text edit once turned "9..144" into "9.144" and the whole site
#      quietly lost its fonts.
#   2. Every local file the HTML links to (href/src) exists in the repo.
#   3. The CV PDFs exist and match the latest build (cv/build_cv.sh --check).
set -uo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO" || exit 1
FAIL=0

echo "==> Google Fonts links"
while read -r url; do
  url="${url//&amp;/&}"
  code=$(curl -s -o /dev/null -w '%{http_code}' --max-time 15 "$url")
  if [[ "$code" == "200" ]]; then
    echo "    ok   $code  ${url:0:90}..."
  elif [[ "$code" == "000" ]]; then
    echo "    skip (offline) ${url:0:90}..."
  else
    echo "    FAIL $code  $url"; FAIL=1
  fi
done < <(grep -ohE 'https://fonts\.googleapis\.com/css2\?[^"]+' *.html | sort -u)

echo "==> local links"
missing=0
while read -r ref; do
  path="${ref%%[?#]*}"
  [[ -z "$path" ]] && continue
  if [[ ! -e "$path" ]]; then
    echo "    MISSING $path"; missing=1
  fi
done < <(grep -ohE '(href|src)="[^"]+"' *.html | sed -E 's/^(href|src)="//; s/"$//' \
         | grep -vE '^(https?:|mailto:|tel:|#|data:|javascript:|//)' | sort -u)
if (( missing )); then FAIL=1; else echo "    all local links resolve"; fi

echo "==> CV"
cv/build_cv.sh --check || FAIL=1

if (( FAIL )); then echo "CHECK FAILED"; else echo "ALL CHECKS PASSED"; fi
exit $FAIL
