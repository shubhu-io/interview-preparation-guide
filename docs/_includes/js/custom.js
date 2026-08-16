jtd.onReady(function () {
  // ---------- Topic Library live filter ----------
  var input = document.getElementById('topic-filter');
  if (input) {
    var items = Array.prototype.slice.call(document.querySelectorAll('#topic-library .row'));
    var count = document.getElementById('topic-count');
    var categoryHeadings = Array.prototype.slice.call(document.querySelectorAll('#topic-library h3'));

    function itemVisible(item) {
      return item.getAttribute('data-filter-hidden') !== '1';
    }

    function sectionVisible(heading) {
      var list = heading.nextElementSibling;
      if (!list || !list.classList || !list.classList.contains('topic-list')) return true;
      var anyVisible = Array.prototype.some.call(list.querySelectorAll('.row'), itemVisible);
      return anyVisible;
    }

    function applyFilter() {
      var q = (input.value || '').trim().toLowerCase();
      var visible = 0;

      items.forEach(function (item) {
        var match = q === '' || (item.textContent || '').toLowerCase().indexOf(q) !== -1;
        item.setAttribute('data-filter-hidden', match ? '0' : '1');
        if (match) visible++;
      });

      categoryHeadings.forEach(function (heading) {
        heading.style.display = sectionVisible(heading) ? '' : 'none';
      });

      if (count) {
        count.textContent = q === '' ? visible + ' topics' : visible + ' of ' + items.length + ' topics';
      }
    }

    input.addEventListener('input', applyFilter);
    applyFilter();
  }

  // ---------- Surprise me: jump to a random topic ----------
  var surprise = document.getElementById('surprise-me');
  if (surprise) {
    surprise.addEventListener('click', function () {
      var links = Array.prototype.slice.call(document.querySelectorAll('#topic-library .row'));
      links = links.filter(function (link) { return link.getAttribute('data-filter-hidden') !== '1'; });
      if (!links.length) {
        links = Array.prototype.slice.call(document.querySelectorAll('#topic-library .row'));
      }
      if (!links.length) {
        links = Array.prototype.slice.call(document.querySelectorAll('#surprise-links a'));
      }
      if (!links.length) return;
      var target = links[Math.floor(Math.random() * links.length)];
      window.location.href = target.getAttribute('href');
    });
  }
});