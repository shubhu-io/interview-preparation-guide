jtd.onReady(function () {
  // ---------- Theme toggle ----------
  var toggle = document.getElementById('theme-toggle');
  if (toggle) {
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
});
