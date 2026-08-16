<#
.SYNOPSIS
  Regenerates the "Topic Library" Jekyll pages under docs/14-topic-library/
  from every numbered folder's README.md in the repository root.

.DESCRIPTION
  For each folder (01-121), this script:
    - reads the folder README.md
    - derives a page title / nav order / category from the folder name
    - rewrites relative internal links so they resolve on the built site
    - writes docs/14-topic-library/NN-Name.md

  It also writes:
    - index.md            -> Topic Library landing (card grid, grouped by category)
    - _categories/NN-*.md -> category hub pages (has_children) for nav nesting

  Run from the repository root:  pwsh scripts/generate-topic-library.ps1
#>

param(
    [string]$Root = (Get-Location).Path,
    [string]$OutDir = "docs/14-topic-library"
)

$ErrorActionPreference = "Stop"

function Get-Number { param([string]$name) if ($name -match '^(\d{2,3})-') { return [int]$Matches[1] } return 999 }
function Get-Slug { param([string]$name) { return $name } }

# ---------- category mapping (by folder number) ----------
$cats = @(
    @{ Start = 1;  End = 6;   Slug = "resume-job-search";       Title = "Resume & Job Search";              Icon = "&#128196;" },
    @{ Start = 7;  End = 16;  Slug = "assessments-aptitude";    Title = "Online Assessments & Aptitude";    Icon = "&#129504;" },
    @{ Start = 17; End = 25;  Slug = "coding-dsa";              Title = "Coding & DSA";                     Icon = "&#128187;" },
    @{ Start = 26; End = 30;  Slug = "programming-languages";   Title = "Programming Languages";            Icon = "&#128220;" },
    @{ Start = 31; End = 41;  Slug = "core-cs";                 Title = "Core Computer Science";            Icon = "&#9881;&#65039;" },
    @{ Start = 42; End = 48;  Slug = "system-design-cloud";     Title = "System Design & Cloud";            Icon = "&#127959;&#65039;" },
    @{ Start = 49; End = 58;  Slug = "devops-ops";              Title = "DevOps & Operations";              Icon = "&#128736;" },
    @{ Start = 59; End = 69;  Slug = "ai-ml-genai";             Title = "AI, ML & Generative AI";           Icon = "&#129302;" },
    @{ Start = 70; End = 74;  Slug = "data-analytics";          Title = "Data & Analytics";                 Icon = "&#128200;" },
    @{ Start = 75; End = 79;  Slug = "security-testing";        Title = "Security, Testing & Networking";   Icon = "&#128274;" },
    @{ Start = 80; End = 84;  Slug = "development";             Title = "Development";                      Icon = "&#128295;" },
    @{ Start = 85; End = 105; Slug = "interview-rounds";        Title = "Interview Rounds";                 Icon = "&#127919;" },
    @{ Start = 106; End = 120; Slug = "preparation-tools";      Title = "Preparation & Tools";              Icon = "&#128218;" },
    @{ Start = 121; End = 121; Slug = "universal-guide";        Title = "Universal Tech Interview Guide";   Icon = "&#127891;" }
)

function Get-Category {
    param([int]$num)
    foreach ($c in $cats) { if ($num -ge $c.Start -and $num -le $c.End) { return $c } }
    return $cats[0]
}

# ---------- link rewriting ----------
# READMEs live at <root>/NN-Name/README.md. Generated pages live at
# docs/14-topic-library/NN-Name.md (URL: /14-topic-library/NN-Name/).
# So a link "../NN-Name/README.md" -> "../NN-Name/" and "../docs/X/" -> "../X/".
function Rewrite-Links {
    param([string]$content)
    $content = [regex]::Replace($content, '\]\(\.\./readme\.md\)', '](/)', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    $content = [regex]::Replace($content, '\]\(\.\./docs/([^)\s#]+)(#[^)\s]*)?\)', '](../$1$2)')
    # ../NN-Name/README.md  ->  ../NN-Name/
    $content = [regex]::Replace($content, '\]\(\.\./(\d{2,3}-[A-Za-z0-9-]+)/README\.md(#?[^)\s]*)?\)', '](../$1/$2)')
    # ../NN-Name/           ->  ../NN-Name/
    $content = [regex]::Replace($content, '\]\(\.\./(\d{2,3}-[A-Za-z0-9-]+)(/[^)\s]*)?\)', '](../$1$2)')
    return $content
}

# ---------- helpers for titles ----------
function Get-Title {
    param([string]$name)
    if ($name -match '^(\d{2,3})-(.+)$') {
        $n = $Matches[2] -replace '-', ' '
        return $n
    }
    return $name
}

# ---------- build ----------
$allDirs = Get-ChildItem -LiteralPath $Root -Directory |
    Where-Object { $_.Name -match '^\d{2,3}-' } |
    Sort-Object { Get-Number $_.Name }

if ($allDirs.Count -eq 0) { Write-Error "No numbered folders found under $Root" }

$lib = Join-Path $Root $OutDir
$catDir = Join-Path $lib "categories"
New-Item -ItemType Directory -Path $catDir -Force | Out-Null

$built = @()
foreach ($d in $allDirs) {
    $num = Get-Number $d.Name
    $slug = $d.Name
    $readme = Join-Path $d.FullName "README.md"
    if (-not (Test-Path -LiteralPath $readme)) { Write-Warning "Missing README: $($d.Name)"; continue }

    $cat = Get-Category $num
    $title = Get-Title $d.Name
    $raw = Get-Content -Raw -LiteralPath $readme
    $body = Rewrite-Links $raw
    # ensure content ends with newline
    $body = $body.TrimEnd() + "`n"
    # READMEs contain Liquid syntax ({{ }}) that must not be parsed by Jekyll
    $body = "{% raw %}`n$body`n{% endraw %}`n"

    $fm = @"
---
layout: default
title: "$title"
parent: "$($cat.Title)"
nav_order: $num
permalink: /14-topic-library/$slug/
---

<div class="topic-meta">
  <span class="topic-badge">Topic #$num</span>
  <span class="topic-cat">$($cat.Icon) &nbsp; $($cat.Title)</span>
</div>

$body
"@
    $outFile = Join-Path $lib "$slug.md"
    Set-Content -LiteralPath $outFile -Value $fm -Encoding UTF8
    $built += [pscustomobject]@{ Num = $num; Slug = $slug; Cat = $cat.Slug; Title = $title }
}

# ---------- category hub pages ----------
$catsUsed = $built | Group-Object Cat
$catIndex = 1
foreach ($c in $cats) {
    $members = $built | Where-Object { $_.Cat -eq $c.Slug } | Sort-Object Num
    if ($members.Count -eq 0) { continue }
    $cards = ($members | ForEach-Object {
        '<a class="card" data-cat="' + $c.Slug + '" href="../' + $_.Slug + '/">' +
            '<div class="card-head"><span class="card-icon">' + $c.Icon + '</span><span class="card-title">' + $_.Num + ' &middot; ' + $_.Title + '</span></div>' +
            '<div class="card-meta">Read topic <span class="arrow">&#8594;</span></div></a>'
    }) -join "`n"

    $fm = @"
---
layout: default
title: "$($c.Title)"
parent: "Topic Library"
has_children: true
nav_order: $catIndex
permalink: /14-topic-library/categories/$($c.Slug)/
---

# $($c.Title)

Browse the $($members.Count) topic(s) in this category.

<div class="card-grid topic-grid">
$cards
</div>
"@
    Set-Content -LiteralPath (Join-Path $catDir "$($c.Slug).md") -Value $fm -Encoding UTF8
    $catIndex++
}

# ---------- index landing ----------
$byCat = $cats | Where-Object { $built | Where-Object Cat -eq $_.Slug }
$blocks = foreach ($c in $byCat) {
    $members = $built | Where-Object { $_.Cat -eq $c.Slug } | Sort-Object Num
    $cards = ($members | ForEach-Object {
        $t = $_.Title
        '<a class="card" data-cat="' + $c.Slug + '" href="' + $_.Slug + '/">' +
            '<div class="card-head"><span class="card-icon">' + $c.Icon + '</span><span class="card-title">' + $_.Num + ' &middot; ' + $t + '</span></div>' +
            '<div class="card-meta">Read topic <span class="arrow">&#8594;</span></div></a>'
    }) -join "`n"
    @"

### $($c.Title)

<div class="card-grid topic-grid">
$cards
</div>
"@
}
$blockText = $blocks -join "`n"

$indexFm = @"
---
layout: default
title: "Topic Library"
has_children: true
nav_order: 14
---

<div class="page-hero">
  <h1 class="page-title">Topic Library</h1>
  <p class="page-subtitle">
    The complete library of every topic folder in this repository, organised by category.
    Browse all $($built.Count) topics — from resume &amp; job search to AI and universal interview preparation.
  </p>
</div>

<div class="stats-row">
  <div class="stat"><div class="stat-value">$($built.Count)</div><div class="stat-label">Topics</div></div>
  <div class="stat"><div class="stat-value">$($byCat.Count)</div><div class="stat-label">Categories</div></div>
  <div class="stat"><div class="stat-value">4.5MB</div><div class="stat-label">Study content</div></div>
  <div class="stat"><div class="stat-value">100%</div><div class="stat-label">Free &amp; open</div></div>
</div>

<div class="filter-bar">
  <input type="search" id="topic-filter" class="filter-input" placeholder="Filter topics by name or number..." aria-label="Filter topics" autocomplete="off" />
  <span class="filter-count" id="topic-count">$($built.Count) topics</span>
  <button type="button" id="surprise-me" class="chip chip--surprise" title="Open a random topic">&#127922; Surprise me</button>
</div>

<div id="topic-library">
$blockText
</div>
"@
Set-Content -LiteralPath (Join-Path $lib "index.md") -Value $indexFm -Encoding UTF8

Write-Output "Generated $($built.Count) topic pages in $OutDir"
