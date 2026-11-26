# Portfolio + CV: run everything from this folder.
#
#   make serve     preview the site at http://localhost:8000
#   make cv        build both CVs (light + dark) and put them on the site
#   make check     catch broken fonts, missing files and stale CVs
#   make publish   build, check, commit and push (goes live in ~1 minute)
#                  optional message: make publish MSG="Update projects"

PORT ?= 8000
MSG  ?= Update portfolio and CV

.PHONY: serve cv check publish verify-live help

help:
	@sed -n '1,8p' Makefile | sed 's/^# \{0,1\}//'

serve:
	@echo "Site running at http://localhost:$(PORT)  (Ctrl+C to stop)"
	@python3 -m http.server $(PORT) --bind 127.0.0.1

cv:
	@cv/build_cv.sh

check:
	@tools/check_site.sh

publish: cv check
	@git add -A
	@git diff --cached --quiet && echo "Nothing new to publish." || \
	  (git commit -m "$(MSG)" && git push origin main && \
	   echo "Pushed. Live at https://llakterian.github.io in about a minute.")

verify-live:
	@cv/build_cv.sh --check --verify-live
