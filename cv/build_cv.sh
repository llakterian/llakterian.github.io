#!/usr/bin/env bash
# Build the CV (light + dark) and keep every copy byte-identical.
#
# Lives in the portfolio repo: the source is cv/cv_modern.tex, the build runs
# in cv/build/ (ignored by git), and the finished PDFs are copied to the repo
# root, which is what llakterian.github.io serves:
#   /Sambu_Leonard_CV.pdf        light: job portals, ATS, printing
#   /Sambu_Leonard_CV_dark.pdf   dark: the site's look, for reading on screen
# The FLUX application copy is kept in sync too, if it exists.
#
# Usage (normally via the Makefile: `make cv`):
#   cv/build_cv.sh                 # build, sync, verify locally
#   cv/build_cv.sh --check         # verify only, do not build
#   cv/build_cv.sh --verify-live   # also check what the live site serves
set -uo pipefail

CV_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO="$(dirname "$CV_DIR")"
BUILD="$CV_DIR/build"
FLUX_COPY="/home/c0bw3b/work/flux/CV_for_FLUX.pdf"
LIGHT="$REPO/Sambu_Leonard_CV.pdf"
DARK="$REPO/Sambu_Leonard_CV_dark.pdf"

CHECK_ONLY=0
CHECK_LIVE=0
for arg in "$@"; do
  case "$arg" in
    --check)       CHECK_ONLY=1 ;;
    --verify-live) CHECK_LIVE=1 ;;
    *) echo "unknown arg: $arg"; exit 2 ;;
  esac
done

# build <jobname> <tex prelude>: two pdflatex passes so the outline and links are right
build() {
  local job="$1" prelude="$2" log="$BUILD/$1.build.log"
  for pass in 1 2; do
    pdflatex -interaction=nonstopmode -halt-on-error -output-directory="$BUILD" \
      -jobname="$job" "${prelude}\input{$CV_DIR/cv_modern.tex}" >"$log" 2>&1 \
      || { echo "ERROR: $job pass $pass failed, see $log"; tail -20 "$log"; exit 1; }
  done
  local pages
  pages=$(pdfinfo "$BUILD/$job.pdf" | awk '/^Pages/{print $2}')
  if [[ "$pages" != "2" ]]; then
    echo "ERROR: $job must be 2 pages, it came out as $pages"; exit 1
  fi
  # A dash in the rendered PDF is what the no-dash style rule exists to stop.
  if pdftotext "$BUILD/$job.pdf" - 2>/dev/null | grep -q '—\|–'; then
    echo "ERROR: $job still contains an em dash or an en dash"; exit 1
  fi
  echo "==> built $job: 2 pages, no dashes"
}

if (( ! CHECK_ONLY )); then
  command -v pdflatex >/dev/null || { echo "ERROR: pdflatex not installed"; exit 1; }
  mkdir -p "$BUILD"

  # The build has to be byte reproducible. Without a pinned clock, pdfTeX
  # writes the current time into the PDF, so two builds of the same source
  # produce different bytes and every copy drifts apart.
  export SOURCE_DATE_EPOCH=1795669284
  export FORCE_SOURCE_DATE=1

  build Sambu_Leonard_CV ""
  build Sambu_Leonard_CV_dark '\def\darkmode{1}'

  # --- sync every copy from the one build ----------------------------------
  cp "$BUILD/Sambu_Leonard_CV.pdf" "$LIGHT"
  cp "$BUILD/Sambu_Leonard_CV_dark.pdf" "$DARK"
  if [[ -f "$FLUX_COPY" ]]; then cp "$LIGHT" "$FLUX_COPY"; fi
fi

# --- verify -----------------------------------------------------------------
FAIL=0
for f in "$LIGHT" "$DARK"; do
  [[ -f "$f" ]] || { echo "ERROR: missing $f (run make cv)"; FAIL=1; }
done
if [[ -f "$FLUX_COPY" ]] && ! cmp -s "$LIGHT" "$FLUX_COPY"; then
  echo "ERROR: FLUX copy differs from the site CV ($FLUX_COPY)"; FAIL=1
fi
if [[ -d "$BUILD" ]]; then
  for job in Sambu_Leonard_CV Sambu_Leonard_CV_dark; do
    if [[ -f "$BUILD/$job.pdf" ]] && ! cmp -s "$BUILD/$job.pdf" "$REPO/$job.pdf"; then
      echo "ERROR: $job.pdf at the repo root is not the latest build"; FAIL=1
    fi
  done
fi
(( FAIL )) || echo "==> CV copies OK"

if (( CHECK_LIVE )); then
  for job in Sambu_Leonard_CV Sambu_Leonard_CV_dark; do
    TMP="$(mktemp)"
    curl -sL "https://llakterian.github.io/$job.pdf?ts=$(date +%s)" -o "$TMP"
    if cmp -s "$TMP" "$REPO/$job.pdf"; then
      echo "==> live $job.pdf matches the local build"
    else
      echo "ERROR: live site still serves an old $job.pdf (GitHub Pages can take a minute)"
      FAIL=1
    fi
    rm -f "$TMP"
  done
fi

exit $FAIL
