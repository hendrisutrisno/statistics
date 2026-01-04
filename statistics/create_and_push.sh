#!/usr/bin/env bash
set -euo pipefail

BRANCH="add-gh-pages"
COMMIT_MSG="Add docs site and GitHub Pages workflow; per-section resource folders"

# Ensure we're in a git repository
if [ ! -d ".git" ]; then
  echo "Error: this script must be run from the root of a git repository."
  exit 1
fi

# Create branch
git checkout -b "$BRANCH"

# Create directories
mkdir -p .github/workflows
mkdir -p docs/assets
mkdir -p docs/content/getting-started
mkdir -p docs/content/foundations
mkdir -p docs/content/applied-topics
mkdir -p docs/content/tools-resources
mkdir -p docs/content/getting-started/images
mkdir -p docs/content/foundations/images
mkdir -p docs/content/applied-topics/images
mkdir -p docs/content/tools-resources/images

# Write files
cat > .github/workflows/pages.yml <<'EOF'
# Deploy docs/ to GitHub Pages on push to main using the official Pages actions
on:
  push:
    branches:
      - main

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Upload pages artifact
        uses: actions/upload-pages-artifact@v1
        with:
          path: 'docs'

  deploy:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - name: Deploy to GitHub Pages
        uses: actions/deploy-pages@v1
EOF

cat > README.md <<'EOF'
# learning-statistics

A small, ReadTheDocs-like static site to store learning resources on statistics.

You can preview locally by starting a simple HTTP server from the repository root:

  $ python -m http.server 8000
  # then open http://localhost:8000 in your browser

Or use any static hosting (GitHub Pages, Netlify, etc.).

Content structure is defined in `content/structure.json`. Markdown pages live in `content/`.

Sections
1. Introduction
2. Demos
3. Probability basics
4. Random variables & distributions
5. Statistical inference
6. Regression & GLMs
7. Time series
8. Bayesian methods
9. Resampling & bootstrapping
10. Hypothesis testing
11. Experimental design
12. Data visualization
13. Multivariate analysis
14. Machine learning
15. Resources

This project uses a tiny client-side app and [marked](https://github.com/markedjs/marked) to render markdown.
EOF

cat > docs/.nojekyll <<'EOF'
# Prevent GitHub Pages from processing files with Jekyll (leave empty)
EOF

cat > docs/index.html <<'EOF'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Learning — Statistics</title>
  <link rel="stylesheet" href="assets/style.css">
  <!-- marked: client-side markdown parser -->
  <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
</head>
<body>
  <header class="site-header">
    <div class="container">
      <h1 class="logo"><a href="/">learning-statistics</a></h1>
      <input id="search" placeholder="Search topics..." aria-label="Search topics">
    </div>
  </header>

  <div class="layout">
    <nav id="sidebar" class="sidebar" aria-label="Documentation">
      <!-- navigation is populated by app.js -->
    </nav>

    <main id="content" class="content" tabindex="0">
      <article id="page">
        <h2>Welcome</h2>
        <p>Loading content…</p>
      </article>
    </main>
  </div>

  <footer class="site-footer">
    <div class="container">
      <small>Built with a tiny static site inspired by ReadTheDocs</small>
    </div>
  </footer>

  <script src="assets/app.js"></script>
</body>
</html>
EOF

cat > docs/assets/style.css <<'EOF'
/* Minimal ReadTheDocs-like styles */
:root{
  --sidebar-width: 260px;
  --accent: #2b6cb0;
  --bg: #f7fafc;
  --text: #222;
  --muted: #6b6f76;
  --max-width: 900px;
  --monospace: ui-monospace, SFMono-Regular, Menlo, Monaco, "Roboto Mono", "Segoe UI Mono", "Helvetica Neue", monospace;
}

*{box-sizing:border-box}
body{
  margin:0;
  font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
  color:var(--text);
  background:var(--bg);
  line-height:1.5;
  font-size:16px;
}
.container{max-width:1200px;margin:0 auto;padding:0 16px}
.site-header{
  background:#fff;
  border-bottom:1px solid #e6edf3;
  position:sticky;
  top:0;
  z-index:10;
}
.site-header .container{
  display:flex;
  align-items:center;
  gap:16px;
  padding:12px 16px;
}
.logo{margin:0;font-size:1.1rem}
.logo a{text-decoration:none;color:var(--accent)}
#search{
  margin-left:auto;
  padding:8px 10px;
  border-radius:6px;
  border:1px solid #dfe7ee;
  width:220px;
}

/* Layout */
.layout{display:flex;align-items:flex-start;gap:24px;padding:24px;}
.sidebar{
  width:var(--sidebar-width);
  max-height:calc(100vh - 88px);
  overflow:auto;
  background:#fff;
  border:1px solid #e6edf3;
  border-radius:6px;
  padding:12px;
}
.sidebar h3{margin:8px 0 6px;font-size:0.95rem;color:var(--muted)}
.nav-section{margin-bottom:12px}
.nav-section ul{list-style:none;padding:0;margin:0}
.nav-section li a{
  display:block;padding:6px 8px;border-radius:4px;color:var(--text);text-decoration:none;
}
.nav-section li a:hover{background:#eef6ff;color:var(--accent)}
.nav-section li a.active{background:#e6f2ff;color:var(--accent);font-weight:600}

.content{
  flex:1;
  max-width:var(--max-width);
  background:#fff;
  border:1px solid #e6edf3;
  border-radius:6px;
  padding:28px;
}
.content h1,h2,h3{color:var(--accent)}
.content pre{background:#0d1117;color:#d6deeb;padding:12px;border-radius:6px;overflow:auto;font-family:var(--monospace)}
.content code{background:#f2f6f9;padding:2px 6px;border-radius:4px;font-family:var(--monospace)}
.content ul{margin-left:1.1rem}
.site-footer{padding:16px 0;text-align:center;color:var(--muted)}
/* Responsive */
@media (max-width:900px){
  .layout{flex-direction:column;padding:12px}
  .sidebar{width:100%;max-height:none}
  #search{width:140px}
}
EOF

cat > docs/assets/app.js <<'EOF'
// Minimal client-side app: loads content/structure.json and renders markdown pages using marked.
const SIDEBAR = document.getElementById('sidebar');
const CONTENT = document.getElementById('page');
const SEARCH = document.getElementById('search');

let structure = [];

function createSidebar(sections){
  SIDEBAR.innerHTML = '';
  sections.forEach(sec => {
    const secEl = document.createElement('div');
    secEl.className = 'nav-section';
    const h = document.createElement('h3');
    h.textContent = sec.title;
    secEl.appendChild(h);
    const ul = document.createElement('ul');
    (sec.pages||[]).forEach(p => {
      const li = document.createElement('li');
      const a = document.createElement('a');
      a.textContent = p.title;
      a.href = `#${p.file}`;
      a.dataset.file = p.file;
      a.addEventListener('click', ev => {
        ev.preventDefault();
        loadPage(p.file);
        history.pushState({file:p.file}, '', `#${p.file}`);
        setActiveLink(p.file);
      });
      li.appendChild(a);
      ul.appendChild(li);
    });
    secEl.appendChild(ul);
    SIDEBAR.appendChild(secEl);
  });
  setActiveLinkFromHash();
}

function setActiveLink(file){
  const links = SIDEBAR.querySelectorAll('a');
  links.forEach(a => a.classList.toggle('active', a.dataset.file === file));
}

function setActiveLinkFromHash(){
  const f = location.hash ? location.hash.slice(1) : null;
  if(f) setActiveLink(f);
}

async function loadPage(file){
  try{
    const res = await fetch(`content/${file}`);
    if(!res.ok) throw new Error('Page not found');
    const md = await res.text();
    CONTENT.innerHTML = marked.parse(md);
    CONTENT.scrollTop = 0;
  }catch(err){
    CONTENT.innerHTML = `<h2>Error</h2><p>${err.message}</p>`;
  }
}

async function loadStructure(){
  try{
    const res = await fetch('content/structure.json');
    structure = await res.json();
    createSidebar(structure.sections);
    // load default page (first page) or hash
    const initial = location.hash ? location.hash.slice(1) : (structure.sections[0].pages[0].file);
    await loadPage(initial);
    setActiveLink(initial);
    history.replaceState({file: initial}, '', `#${initial}`);
  }catch(err){
    SIDEBAR.innerHTML = '<p>Failed to load structure.json</p>';
    CONTENT.innerHTML = `<p>${err.message}</p>`;
  }
}

// simple search: filter page links by title and section
function search(q){
  q = (q||'').trim().toLowerCase();
  const allLinks = SIDEBAR.querySelectorAll('a');
  allLinks.forEach(a => {
    const show = a.textContent.toLowerCase().includes(q);
    a.parentElement.style.display = show ? '' : 'none';
  });
  // hide empty sections
  const sections = SIDEBAR.querySelectorAll('.nav-section');
  sections.forEach(sec => {
    const any = Array.from(sec.querySelectorAll('li')).some(li => li.style.display !== 'none');
    sec.style.display = any ? '' : 'none';
  });
}

SEARCH.addEventListener('input', e => search(e.target.value));

// handle back/forward
window.addEventListener('popstate', ev => {
  const file = ev.state && ev.state.file ? ev.state.file : (location.hash ? location.hash.slice(1) : null);
  if(file) loadPage(file).then(()=>setActiveLink(file));
});

loadStructure();
EOF

cat > docs/content/structure.json <<'EOF'
{
  "sections": [
    {
      "title": "Getting started",
      "pages": [
        { "title": "Introduction", "file": "getting-started/introduction.md" },
        { "title": "Demos", "file": "getting-started/demos.md" }
      ]
    },
    {
      "title": "Foundations",
      "pages": [
        { "title": "Probability basics", "file": "foundations/probability-basics.md" },
        { "title": "Random variables & distributions", "file": "foundations/distributions.md" },
        { "title": "Statistical inference", "file": "foundations/inference.md" }
      ]
    },
    {
      "title": "Applied topics",
      "pages": [
        { "title": "Regression & GLMs", "file": "applied-topics/regression.md" },
        { "title": "Time series", "file": "applied-topics/time-series.md" },
        { "title": "Bayesian methods", "file": "applied-topics/bayesian.md" },
        { "title": "Resampling & bootstrap", "file": "applied-topics/resampling.md" }
      ]
    },
    {
      "title": "Tools & resources",
      "pages": [
        { "title": "Visualization", "file": "tools-resources/visualization.md" },
        { "title": "Multivariate analysis", "file": "tools-resources/multivariate.md" },
        { "title": "Machine learning", "file": "tools-resources/ml.md" },
        { "title": "Resources", "file": "tools-resources/resources.md" }
      ]
    }
  ]
}
EOF

cat > docs/content/getting-started/introduction.md <<'EOF'
# Introduction

Welcome to *learning-statistics* — a personal collection of notes, demos, and curated resources for learning statistics.

This small site is designed to be:
- Simple: write content as markdown files inside `content/`
- Lightweight: static files + a small JS loader
- Portable: serve with any static host (GitHub Pages, Netlify, local http.server)

How to add content
1. Add a markdown file in `content/<section>/` (for example `content/foundations/my-topic.md`)
2. Add an entry for it in `content/structure.json` under the section you want
3. Open the site and click the new page in the sidebar

Example of what to include in a page:
- short explanation
- code snippets (R, Python, Julia)
- links to papers, blog posts, and videos
- small reproducible demos

Place images for this section inside `content/getting-started/images/`.

Happy learning!
EOF

cat > docs/content/getting-started/demos.md <<'EOF'
# Demos

This page collects short interactive demos and notebooks.

- Probability experiment simulations (coin flips, dice)
- Bootstrapping examples (resampling)
- Linear regression demos with diagnostics
- Visualizations for distributions and sampling variability

Example commands to include in your page:

```python
# simulate coin flips
import random
trials = 1000
flips = [random.choice([0,1]) for _ in range(trials)]
print(sum(flips)/trials)
