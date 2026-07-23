---
layout: default
title: "Progress"
description: "Track your interview preparation progress across all 120 topics"
---

<div class="container py-5">
  <h1 class="mb-4 text-center">Track Your Progress</h1>
  <p class="text-center text-muted mb-4">Check off topics as you complete them. Your progress is saved in your browser.</p>

  <div class="text-center mb-4">
    <svg width="140" height="140" id="progress-ring-svg">
      <circle cx="70" cy="70" r="60" fill="none" stroke="#e9ecef" stroke-width="8"/>
      <circle cx="70" cy="70" r="60" fill="none" stroke="url(#progressGradientProg)" stroke-width="8" stroke-dasharray="377" stroke-dashoffset="377" stroke-linecap="round" transform="rotate(-90 70 70)" id="progress-ring-circle"/>
      <defs>
        <linearGradient id="progressGradientProg" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" style="stop-color:#667eea"/>
          <stop offset="100%" style="stop-color:#764ba2"/>
        </linearGradient>
      </defs>
      <text x="70" y="70" text-anchor="middle" dominant-baseline="central" class="display-6 fw-bold" fill="#333" id="progress-ring-text">0%</text>
    </svg>
  </div>

  <div id="progress-list"></div>

  <div class="text-center mt-4">
    <button class="btn btn-outline-danger btn-sm" onclick="if(confirm('Reset all progress?')){localStorage.removeItem('ipg_progress');location.reload();}">Reset All Progress</button>
  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const topics = [
    {cat: "Getting Started", items: ["Resume & ATS","Company Research","Resume Screening","Portfolio","LinkedIn","Cover Letter"]},
    {cat: "Aptitude & Reasoning", items: ["Online Assessment","General Aptitude","Quantitative Aptitude","Logical Reasoning","Verbal Ability","English Grammar","Reading Comprehension","Data Interpretation","Puzzle Solving","Psychometric Tests"]},
    {cat: "Coding", items: ["Coding Rounds","Live Coding","Pair Programming","Machine Coding","Whiteboard Coding","Debugging","Code Review","Competitive Programming"]},
    {cat: "Programming Languages", items: ["DSA","SQL","Python","Java","JavaScript","C++","CS Fundamentals"]},
    {cat: "Core CS", items: ["Operating System","DBMS","Computer Networks","OOP","Software Engineering","Compiler Design","Digital Logic","Computer Architecture","Linux","Databases"]},
    {cat: "System Design", items: ["System Design","API Design","Distributed Systems","Cloud Computing","AWS","Azure","Google Cloud"]},
    {cat: "DevOps & Cloud", items: ["DevOps","Docker","Kubernetes","Terraform","Jenkins","Git","GitHub","CI/CD","Monitoring","Security"]},
    {cat: "AI & ML", items: ["Artificial Intelligence","Machine Learning","Deep Learning","NLP","Computer Vision","Generative AI","LLM","RAG","Prompt Engineering","AI Agents","MLOps"]},
    {cat: "Data & Analytics", items: ["Data Analytics","Excel","Power BI","Tableau","Statistics","Cybersecurity","Networking","SRE","QA Automation","Testing"]},
    {cat: "Development", items: ["Mobile Development","Web Development","Backend","Frontend","Full Stack"]},
    {cat: "Interview Rounds", items: ["HR Interview","Behavioral Interview","STAR Method","Leadership","Communication","Group Discussion","Presentation","Client Round","Managerial Round","Hiring Manager","Eng Manager","Director Round","VP Round","CTO Round","CEO Round","Bar Raiser"]},
    {cat: "Preparation", items: ["Culture Fit","Team Fit","Salary Negotiation","Offer Discussion","Joining Prep","Mock Interviews","Interview Experiences","Projects","Certifications","Notes","Cheat Sheets","Flash Cards","Daily Revision","Weekly Revision","Monthly Revision","Final Revision","Previous Year Qs","Company-wise Prep","Practice Websites","Resources"]}
  ];

  const progress = JSON.parse(localStorage.getItem('ipg_progress') || '{}');
  const list = document.getElementById('progress-list');

  topics.forEach(group => {
    const completed = group.items.filter(i => progress[i]).length;
    const pct = Math.round((completed / group.items.length) * 100);
    let html = '<div class="card border-0 shadow-sm mb-3"><div class="card-header bg-transparent d-flex justify-content-between align-items-center" data-bs-toggle="collapse" data-bs-target="#cat-' + group.cat.replace(/[^a-z0-9]/gi, '') + '">';
    html += '<h6 class="mb-0 fw-semibold">' + group.cat + '</h6>';
    html += '<span class="badge bg-secondary">' + completed + '/' + group.items.length + '</span>';
    html += '</div><div class="collapse show" id="cat-' + group.cat.replace(/[^a-z0-9]/gi, '') + '"><div class="card-body pt-0"><div class="progress mb-3" style="height:6px"><div class="progress-bar" style="width:' + pct + '%;background:linear-gradient(135deg,#667eea,#764ba2)"></div></div>';
    group.items.forEach(item => {
      html += '<div class="form-check py-1"><input class="form-check-input progress-check" type="checkbox" data-topic="' + item + '"' + (progress[item] ? ' checked' : '') + '><label class="form-check-label">' + item + '</label></div>';
    });
    html += '</div></div></div>';
    list.innerHTML += html;
  });

  document.querySelectorAll('.progress-check').forEach(cb => {
    cb.addEventListener('change', function() {
      const p = JSON.parse(localStorage.getItem('ipg_progress') || '{}');
      if (this.checked) p[this.dataset.topic] = true; else delete p[this.dataset.topic];
      localStorage.setItem('ipg_progress', JSON.stringify(p));
      updateProgress();
    });
  });

  function updateProgress() {
    const p = JSON.parse(localStorage.getItem('ipg_progress') || '{}');
    const total = 120;
    const done = Object.keys(p).length;
    const pct = Math.round((done / total) * 100);
    const circle = document.getElementById('progress-ring-circle');
    if (circle) {
      const circumference = 2 * Math.PI * 60;
      circle.style.strokeDashoffset = circumference - (pct / 100) * circumference;
    }
    const text = document.getElementById('progress-ring-text');
    if (text) text.textContent = pct + '%';
  }

  updateProgress();
});
</script>
