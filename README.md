# Statistics

Sphinx-based documentation project for statistics materials.

## Repository structure

- `source/` — Sphinx source files (reStructuredText/Markdown and `conf.py`)
- `requirements.txt` — Python dependencies for building the docs
- `Makefile` / `make.bat` — build helpers for macOS/Linux and Windows
- `.github/workflows/` — CI workflow(s) (e.g., auto-deployment)

## Prerequisites

- Python 3.9+ recommended
- `pip` (Python package manager)

## Local development

### 1) Clone the repository

```bash
git clone https://github.com/hendrisutrisno/statistics.git
cd statistics
```

2) Create a virtual environment

macOS / Linux
```
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
```

Windows (PowerShell)
```
py -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
```

3) Install dependencies
```
pip install -r requirements.txt
```

4) Build HTML documentation
macOS / Linux
```
make html
```
Windows
```
.\make.bat html
```

If make is not available, build directly with Sphinx:
```
sphinx-build -b html source build/html
```

5) Preview the docs
Open:
```
build/html/index.html
```
Or serve locally:
```
python -m http.server 8000 --directory build/html
```

Then visit http://localhost:8000.
