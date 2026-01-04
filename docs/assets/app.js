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
    const initial = location.hash ? location.hash.slice(1) : (structure.sections[0].pages[0].file);
    await loadPage(initial);
    setActiveLink(initial);
    history.replaceState({file: initial}, '', `#${initial}`);
  }catch(err){
    SIDEBAR.innerHTML = '<p>Failed to load structure.json</p>';
    CONTENT.innerHTML = `<p>${err.message}</p>`;
  }
}

function search(q){
  q = (q||'').trim().toLowerCase();
  const allLinks = SIDEBAR.querySelectorAll('a');
  allLinks.forEach(a => {
    const show = a.textContent.toLowerCase().includes(q);
    a.parentElement.style.display = show ? '' : 'none';
  });
  const sections = SIDEBAR.querySelectorAll('.nav-section');
  sections.forEach(sec => {
    const any = Array.from(sec.querySelectorAll('li')).some(li => li.style.display !== 'none');
    sec.style.display = any ? '' : 'none';
  });
}

SEARCH.addEventListener('input', e => search(e.target.value));

window.addEventListener('popstate', ev => {
  const file = ev.state && ev.state.file ? ev.state.file : (location.hash ? location.hash.slice(1) : null);
  if(file) loadPage(file).then(()=>setActiveLink(file));
});

loadStructure();
