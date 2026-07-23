---
---
/* Interview Preparation Guide - Bootstrap 5.3 compatible JS */

(function() {
  document.addEventListener('DOMContentLoaded', function() {
    initProgressBar();
    initBackToTop();
    initSmoothScroll();
  });

  function initProgressBar() {
    window.addEventListener('scroll', function() {
      var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
      var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
      var scrolled = (winScroll / height) * 100;
      var bar = document.getElementById('scroll-progress');
      if (bar) bar.style.width = scrolled + '%';
    });
  }

  function initBackToTop() {
    var btn = document.createElement('button');
    btn.id = 'back-to-top';
    btn.innerHTML = '<i class="bi bi-arrow-up"></i>';
    btn.className = 'btn btn-primary position-fixed';
    btn.style.cssText = 'bottom:2rem;right:2rem;display:none;z-index:9999;width:44px;height:44px;border-radius:50%;background:linear-gradient(135deg,#667eea,#764ba2);border:none;box-shadow:0 4px 12px rgba(102,126,234,0.4);';
    document.body.appendChild(btn);

    window.addEventListener('scroll', function() {
      if (window.scrollY > 300) {
        btn.style.display = 'flex';
        btn.style.alignItems = 'center';
        btn.style.justifyContent = 'center';
      } else {
        btn.style.display = 'none';
      }
    });

    btn.addEventListener('click', function() {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }

  function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(function(anchor) {
      anchor.addEventListener('click', function(e) {
        var target = document.querySelector(this.getAttribute('href'));
        if (target) {
          e.preventDefault();
          target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
      });
    });
  }

})();
