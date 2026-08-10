jtd.onReady(function () {
  var toggle = document.getElementById('theme-toggle');
  if (!toggle) return;

  var cssBase = '{{ "/assets/css/just-the-docs-" | relative_url }}';

  function currentTheme() {
    var href = document.querySelector('link[rel="stylesheet"]').getAttribute('href');
    if (href.indexOf('just-the-docs-light') !== -1) return 'light';
    if (href.indexOf('just-the-docs-dark') !== -1) return 'dark';
    return 'default'; // compiled from color_scheme
  }

  function applyTheme(theme) {
    var link = document.querySelector('link[rel="stylesheet"]');
    var name = theme === 'light' ? 'light' : 'dark';
    link.setAttribute('href', cssBase + name + '.css');
    try { localStorage.setItem('jtd-theme', name); } catch (e) {}
    updateIcon(name);
  }

  function updateIcon(theme) {
    var moon = document.getElementById('icon-moon');
    var sun = document.getElementById('icon-sun');
    if (moon) moon.hidden = theme !== 'dark';
    if (sun) sun.hidden = theme !== 'light';
    toggle.setAttribute('aria-label', theme === 'dark' ? 'Switch to light mode' : 'Switch to dark mode');
  }

  updateIcon(currentTheme());

  toggle.addEventListener('click', function () {
    applyTheme(currentTheme() === 'light' ? 'dark' : 'light');
  });
});
