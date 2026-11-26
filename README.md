# llakterian.github.io

Leonard Sambu's portfolio site **and** CV, in one place. Live at https://llakterian.github.io

## Everyday commands (run from this folder)

| Command | What it does |
|---|---|
| `make serve` | Preview the site at http://localhost:8000 (Ctrl+C to stop) |
| `make cv` | Build both CVs from `cv/cv_modern.tex` and put them on the site |
| `make check` | Catch broken fonts, missing files and out-of-date CVs |
| `make publish MSG="what changed"` | Build, check, commit and push. Live in about a minute |

## Where things are

| Path | What |
|---|---|
| `index.html`, `styles.css`, `script.js`, `privacy.html`, `terms.html` | The website |
| `cv/cv_modern.tex` | CV source. Edit the CV here |
| `cv/Sambu_Leonard_CV.md` | Plain-text copy of the CV |
| `Sambu_Leonard_CV.pdf` | Built CV, light (job portals, printing) |
| `Sambu_Leonard_CV_dark.pdf` | Built CV, dark (reading on screen) |
| `*.pdf` at the root | Certificates linked from the site and the CV |
| `cv/build_cv.sh`, `tools/check_site.sh` | Scripts behind `make cv` / `make check` |

`cv/`, `tools/`, `Makefile` and this README are kept off the public site by `_config.yml`.
