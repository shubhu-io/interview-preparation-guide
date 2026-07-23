---
---
(function() {
  'use strict';

  var STORAGE_KEY = 'ipg_progress';
  var ALL_TOPICS = [
    'resume-ats','company-research','resume-screening','portfolio','linkedin','cover-letter',
    'online-assessment','aptitude','quantitative-aptitude','logical-reasoning','verbal-ability',
    'english-grammar','reading-comprehension','data-interpretation','puzzle-solving','psychometric-tests',
    'coding-rounds','live-coding','pair-programming','machine-coding','whiteboard-coding',
    'debugging','code-review','competitive-programming',
    'dsa','sql','python','java','javascript','cpp','cs-fundamentals',
    'operating-system','dbms','computer-networks','oop','software-engineering',
    'compiler-design','digital-logic','computer-architecture','linux','databases',
    'system-design','api-design','distributed-systems','cloud-computing','aws','azure','google-cloud',
    'devops','docker','kubernetes','terraform','jenkins','git','github','cicd','monitoring','security',
    'ai','machine-learning','deep-learning','nlp','computer-vision','generative-ai',
    'llm','rag','prompt-engineering','ai-agents','mlops',
    'data-analytics','excel','power-bi','tableau','statistics','cybersecurity','networking','sre','qa-automation','testing',
    'mobile-development','web-development','backend','frontend','full-stack',
    'hr-interview','behavioral-interview','star-method','leadership','communication',
    'group-discussion','presentation','client-round','managerial-round','hiring-manager-round',
    'engineering-manager-round','director-round','vp-round','cto-round','ceo-round','bar-raiser-round',
    'culture-fit','team-fit','salary-negotiation','offer-discussion','joining-preparation',
    'mock-interviews','interview-experiences','projects','certifications','notes',
    'cheat-sheets','flash-cards','daily-revision','weekly-revision','monthly-revision',
    'final-revision','previous-year-questions','company-wise-preparation','practice-websites','resources'
  ];

  var CATEGORIES = {
    'Getting Started': { topics: ['resume-ats','company-research','resume-screening','portfolio','linkedin','cover-letter'], icon: '\uD83D\uDE80', color: '#667eea' },
    'Aptitude & Reasoning': { topics: ['online-assessment','aptitude','quantitative-aptitude','logical-reasoning','verbal-ability','english-grammar','reading-comprehension','data-interpretation','puzzle-solving','psychometric-tests'], icon: '\uD83E\uDDEE', color: '#f093fb' },
    'Coding': { topics: ['coding-rounds','live-coding','pair-programming','machine-coding','whiteboard-coding','debugging','code-review','competitive-programming'], icon: '\uD83D\uDCBB', color: '#4facfe' },
    'Programming Languages': { topics: ['dsa','sql','python','java','javascript','cpp','cs-fundamentals'], icon: '\u2328\uFE0F', color: '#43e97b' },
    'Core CS': { topics: ['operating-system','dbms','computer-networks','oop','software-engineering','compiler-design','digital-logic','computer-architecture','linux','databases'], icon: '\uD83D\uDD27', color: '#fa709a' },
    'System Design': { topics: ['system-design','api-design','distributed-systems','cloud-computing','aws','azure','google-cloud'], icon: '\uD83C\uDFD7\uFE0F', color: '#a18cd1' },
    'DevOps & Cloud': { topics: ['devops','docker','kubernetes','terraform','jenkins','git','github','cicd','monitoring','security'], icon: '\u2601\uFE0F', color: '#fbc2eb' },
    'AI & ML': { topics: ['ai','machine-learning','deep-learning','nlp','computer-vision','generative-ai','llm','rag','prompt-engineering','ai-agents','mlops'], icon: '\uD83E\uDD16', color: '#ff9a9e' },
    'Data & Analytics': { topics: ['data-analytics','excel','power-bi','tableau','statistics','cybersecurity','networking','sre','qa-automation','testing'], icon: '\uD83D\uDCCA', color: '#a1c4fd' },
    'Development': { topics: ['mobile-development','web-development','backend','frontend','full-stack'], icon: '\uD83D\uDEE0\uFE0F', color: '#d4fc79' },
    'Interview Rounds': { topics: ['hr-interview','behavioral-interview','star-method','leadership','communication','group-discussion','presentation','client-round','managerial-round','hiring-manager-round','engineering-manager-round','director-round','vp-round','cto-round','ceo-round','bar-raiser-round'], icon: '\uD83C\uDFAF', color: '#96e6a1' },
    'Preparation': { topics: ['culture-fit','team-fit','salary-negotiation','offer-discussion','joining-preparation','mock-interviews','interview-experiences','projects','certifications','notes','cheat-sheets','flash-cards','daily-revision','weekly-revision','monthly-revision','final-revision','previous-year-questions','company-wise-preparation','practice-websites','resources'], icon: '\uD83D\uDCCB', color: '#fccb90' }
  };

  function getProgress() {
    try { return JSON.parse(localStorage.getItem(STORAGE_KEY)) || {}; }
    catch(e) { return {}; }
  }

  function saveProgress(progress) {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(progress));
  }

  function markTopic(slug, completed) {
    var progress = getProgress();
    if (completed) { progress[slug] = { done: true, date: new Date().toISOString() }; }
    else { delete progress[slug]; }
    saveProgress(progress);
    updateAllUI();
  }

  function getCompletedCount() { return Object.keys(getProgress()).length; }

  function getCategoryProgress(categoryName) {
    var cat = CATEGORIES[categoryName];
    if (!cat) return { done: 0, total: 0, pct: 0 };
    var progress = getProgress();
    var done = cat.topics.filter(function(t) { return progress[t]; }).length;
    return { done: done, total: cat.topics.length, pct: Math.round((done / cat.topics.length) * 100) };
  }

  window.IPG = {
    markTopic: markTopic,
    getProgress: getProgress,
    getCompletedCount: getCompletedCount,
    getCategoryProgress: getCategoryProgress,
    ALL_TOPICS: ALL_TOPICS,
    CATEGORIES: CATEGORIES
  };

  function updateAllUI() {
    var completed = getCompletedCount();
    var pct = ALL_TOPICS.length > 0 ? Math.round((completed / ALL_TOPICS.length) * 100) : 0;

    document.querySelectorAll('[data-stat-completed]').forEach(function(el) { el.textContent = completed; });
    document.querySelectorAll('[data-stat-remaining]').forEach(function(el) { el.textContent = ALL_TOPICS.length - completed; });
    document.querySelectorAll('[data-stat-pct]').forEach(function(el) { el.textContent = pct + '%'; });

    document.querySelectorAll('[data-progress-category]').forEach(function(el) {
      var cat = el.getAttribute('data-progress-category');
      var p = getCategoryProgress(cat);
      var bar = el.querySelector('.progress-fill');
      var text = el.querySelector('.progress-text');
      if (bar) bar.style.width = p.pct + '%';
      if (text) text.textContent = p.done + '/' + p.total;
    });

    var circle = document.querySelector('.progress-ring-circle');
    if (circle) {
      var circumference = 2 * Math.PI * 54;
      circle.style.strokeDashoffset = circumference - (pct / 100) * circumference;
    }

    document.querySelectorAll('[data-topic-slug]').forEach(function(cb) {
      var slug = cb.getAttribute('data-topic-slug');
      var progress = getProgress();
      cb.checked = !!progress[slug];
      var item = cb.closest('.topic-item') || cb.closest('li');
      if (item) item.classList.toggle('completed', !!progress[slug]);
    });
  }

  function calcReadingTime() {
    var article = document.querySelector('.post-content, article, .markdown-body');
    if (!article) return;
    var words = (article.textContent || '').trim().split(/\s+/).length;
    var minutes = Math.max(1, Math.ceil(words / 200));
    var display = document.getElementById('reading-time');
    if (display) display.textContent = minutes + ' min read';
  }

  function initReadingProgressBar() {
    var bar = document.createElement('div');
    bar.id = 'reading-progress-bar';
    bar.innerHTML = '<div class="reading-progress-fill"></div>';
    document.body.prepend(bar);
    window.addEventListener('scroll', function() {
      var scrollTop = window.scrollY;
      var docHeight = document.documentElement.scrollHeight - window.innerHeight;
      var pct = docHeight > 0 ? (scrollTop / docHeight) * 100 : 0;
      var fill = bar.querySelector('.reading-progress-fill');
      if (fill) fill.style.width = pct + '%';
    }, { passive: true });
  }

  function initBackToTop() {
    var btn = document.createElement('button');
    btn.id = 'back-to-top';
    btn.innerHTML = '\u2191';
    btn.title = 'Back to top';
    btn.style.display = 'none';
    document.body.appendChild(btn);
    window.addEventListener('scroll', function() {
      btn.style.display = window.scrollY > 400 ? 'flex' : 'none';
    }, { passive: true });
    btn.addEventListener('click', function() {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }

  function initSmoothScroll() {
    document.addEventListener('click', function(e) {
      var link = e.target.closest('a[href^="#"]');
      if (!link) return;
      var href = link.getAttribute('href');
      if (href === '#' || href.length < 2) return;
      var target = document.querySelector(href);
      if (target) {
        e.preventDefault();
        target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        history.pushState(null, '', href);
      }
    });
  }

  function initCollapsibles() {
    document.querySelectorAll('.collapsible-trigger').forEach(function(trigger) {
      trigger.addEventListener('click', function() {
        var target = this.nextElementSibling;
        if (!target) return;
        var isHidden = target.classList.contains('collapsed-content');
        if (isHidden) {
          target.classList.remove('collapsed-content');
          this.classList.remove('active');
        } else {
          target.classList.add('collapsed-content');
          this.classList.add('active');
        }
      });
    });
  }

  function initCategoryFilter() {
    var container = document.getElementById('category-filter-container');
    if (!container) return;

    var filterBar = document.createElement('div');
    filterBar.className = 'filter-bar';
    var input = document.createElement('input');
    input.type = 'text';
    input.id = 'cat-filter';
    input.placeholder = 'Search all 120+ topics...';
    input.className = 'filter-input';
    var chips = document.createElement('div');
    chips.className = 'filter-chips';
    chips.id = 'filter-chips';
    filterBar.appendChild(input);
    filterBar.appendChild(chips);
    container.prepend(filterBar);

    Object.keys(CATEGORIES).forEach(function(cat) {
      var chip = document.createElement('button');
      chip.className = 'filter-chip';
      chip.textContent = CATEGORIES[cat].icon + ' ' + cat;
      chip.dataset.category = cat;
      chip.addEventListener('click', function() {
        var isActive = this.classList.contains('active');
        chips.querySelectorAll('.filter-chip').forEach(function(c) { c.classList.remove('active'); });
        if (!isActive) this.classList.add('active');
        filterTopics(input.value, isActive ? '' : cat);
      });
      chips.appendChild(chip);
    });

    input.addEventListener('input', function() {
      var activeChip = chips.querySelector('.filter-chip.active');
      var activeCat = activeChip ? activeChip.dataset.category : '';
      filterTopics(this.value, activeCat);
    });
  }

  function filterTopics(query, category) {
    query = (query || '').toLowerCase().trim();
    document.querySelectorAll('#all-topics-list .topic-entry').forEach(function(entry) {
      var text = entry.textContent.toLowerCase();
      var entryCat = entry.getAttribute('data-category') || '';
      var matchQuery = !query || text.indexOf(query) !== -1;
      var matchCat = !category || entryCat === category;
      entry.style.display = (matchQuery && matchCat) ? '' : 'none';
    });
  }

  function initPostTopicCheckbox() {
    var postMeta = document.querySelector('.post-meta, .post-header');
    if (!postMeta) return;
    var path = window.location.pathname;
    var slug = path.replace(/.*\/posts\//, '').replace(/\/$/, '');
    if (!slug) return;
    var wrapper = document.createElement('div');
    wrapper.className = 'topic-progress-toggle';
    var cb = document.createElement('input');
    cb.type = 'checkbox';
    cb.id = 'topic-done-cb';
    var progress = getProgress();
    cb.checked = !!progress[slug];
    var label = document.createElement('label');
    label.htmlFor = 'topic-done-cb';
    label.textContent = ' Mark as completed';
    cb.addEventListener('change', function() { markTopic(slug, this.checked); });
    wrapper.appendChild(cb);
    wrapper.appendChild(label);
    postMeta.parentNode.insertBefore(wrapper, postMeta.nextSibling);
  }

  function init() {
    initReadingProgressBar();
    initBackToTop();
    initSmoothScroll();
    initCollapsibles();
    initCategoryFilter();
    calcReadingTime();
    initPostTopicCheckbox();
    updateAllUI();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
