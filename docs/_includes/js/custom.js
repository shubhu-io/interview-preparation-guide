jtd.onReady(function () {
  // ---------- Theme toggle ----------
  var toggle = document.getElementById('theme-toggle');
  if (toggle) {
    var cssBase = '{{ "/assets/css/just-the-docs-" | relative_url }}';
    var metaTheme = document.querySelector('meta[name="theme-color"]');
    var themeColors = { dark: '#0b1020', light: '#f8fafc' };

    function currentTheme() {
      var href = document.querySelector('link[rel="stylesheet"]').getAttribute('href');
      if (href.indexOf('just-the-docs-light') !== -1) return 'light';
      if (href.indexOf('just-the-docs-dark') !== -1) return 'dark';
      return 'dark'; // compiled from color_scheme
    }

    function applyTheme(theme) {
      var link = document.querySelector('link[rel="stylesheet"]');
      var name = theme === 'light' ? 'light' : 'dark';
      link.setAttribute('href', cssBase + name + '.css');
      try { localStorage.setItem('jtd-theme', name); } catch (e) {}
      if (metaTheme) { metaTheme.setAttribute('content', themeColors[name]); }
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
  }

  // ---------- Topic Library live filter ----------
  var input = document.getElementById('topic-filter');
  if (input) {
    var cards = Array.prototype.slice.call(document.querySelectorAll('#topic-library .card'));
    var count = document.getElementById('topic-count');
    var categoryHeadings = Array.prototype.slice.call(document.querySelectorAll('#topic-library h3'));

    function topicVisible(card) {
      return card.getAttribute('data-filter-hidden') !== '1';
    }

    function sectionVisible(heading) {
      var grid = heading.nextElementSibling;
      if (!grid || grid.tagName !== 'DIV' || !grid.classList.contains('card-grid')) return true;
      var anyVisible = Array.prototype.some.call(grid.querySelectorAll('.card'), topicVisible);
      return anyVisible;
    }

    function applyFilter() {
      var q = (input.value || '').trim().toLowerCase();
      var visible = 0;

      cards.forEach(function (card) {
        var match = q === '' || (card.textContent || '').toLowerCase().indexOf(q) !== -1;
        card.setAttribute('data-filter-hidden', match ? '0' : '1');
        if (match) visible++;
      });

      categoryHeadings.forEach(function (heading) {
        heading.style.display = sectionVisible(heading) ? '' : 'none';
      });

      if (count) {
        count.textContent = q === '' ? visible + ' topics' : visible + ' of ' + cards.length + ' topics';
      }
    }

    // Use attribute-based filtering so the layout keeps its grid shape
    // even when cards are hidden (grid tracks remain intact).
    input.addEventListener('input', applyFilter);
    applyFilter();
  }

  // ---------- Reading progress bar ----------
  var progress = document.createElement('div');
  progress.className = 'reading-progress';
  progress.setAttribute('aria-hidden', 'true');
  document.body.appendChild(progress);

  var scrollTimer = null;
  function updateProgress() {
    var doc = document.documentElement;
    var scrollTop = window.pageYOffset || doc.scrollTop || 0;
    var max = doc.scrollHeight - window.innerHeight;
    var pct = max > 0 ? Math.min(100, Math.round((scrollTop / max) * 1000) / 10) : 0;
    progress.style.transform = 'scaleX(' + (pct / 100) + ')';
    progress.style.opacity = pct > 0.5 ? '1' : '0';

    // Back-to-top: show once the user has scrolled a bit
    var btt = document.getElementById('back-to-top');
    if (btt) { btt.classList.toggle('is-visible', scrollTop > 320); }
  }
  window.addEventListener('scroll', function () {
    if (scrollTimer) return;
    scrollTimer = requestAnimationFrame(function () {
      scrollTimer = null;
      updateProgress();
    });
  }, { passive: true });
  updateProgress();

  // ---------- Surprise me: jump to a random topic ----------
  var surprise = document.getElementById('surprise-me');
  if (surprise) {
    surprise.addEventListener('click', function () {
      var links = Array.prototype.slice.call(document.querySelectorAll('#topic-library .card'));
      links = links.filter(function (link) { return link.getAttribute('data-filter-hidden') !== '1'; });
      if (!links.length) links = Array.prototype.slice.call(document.querySelectorAll('#topic-library .card'));
      if (!links.length) return;
      var target = links[Math.floor(Math.random() * links.length)];
      window.location.href = target.getAttribute('href');
    });
  }
});