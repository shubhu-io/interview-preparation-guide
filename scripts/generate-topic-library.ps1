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
$topDir = Join-Path $Root "docs"
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

    # Some topic folders ship a Master-Prompt.md alongside the README.
    # Publish it as a page and rewrite the README links (differently for
    # each copy, since the two topic pages live at different depths).
    $bodyLib = $body
    $bodyTop = $body
    $masterPrompt = Join-Path $d.FullName "Master-Prompt.md"
    if (Test-Path -LiteralPath $masterPrompt) {
        $mp = Get-Content -Raw -LiteralPath $masterPrompt
        $mp = $mp.TrimEnd() + "`n"
        $mp = "{% raw %}`n$mp`n{% endraw %}`n"
        $mpDir = Join-Path $topDir $slug
        New-Item -ItemType Directory -Path $mpDir -Force | Out-Null
        $mpFm = @"
---
layout: default
title: "Master Prompt"
permalink: /$slug/master-prompt/
nav_exclude: true
search_exclude: true
---

<div class="topic-meta">
  <span class="topic-badge">Master Prompt</span>
  <a class="topic-cat" href="../">&#128279; Back to $title</a>
</div>

$mp
"@
        Set-Content -LiteralPath (Join-Path $mpDir "master-prompt.md") -Value $mpFm -Encoding UTF8
        $bodyLib = $bodyLib -replace '\]\(Master-Prompt\.md\)', ("](../../" + $slug + "/master-prompt/)")
        $bodyTop = $bodyTop -replace '\]\(Master-Prompt\.md\)', "](master-prompt/)"
    }

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

$bodyLib
"@
    $outFile = Join-Path $lib "$slug.md"
    Set-Content -LiteralPath $outFile -Value $fm -Encoding UTF8
    $built += [pscustomobject]@{ Num = $num; Slug = $slug; Cat = $cat.Slug; Title = $title }

    # Also write a top-level copy so each topic is reachable at its own
    # folder URL (e.g. /25-DSA/) in addition to /14-topic-library/25-DSA/.
    # Excluded from nav + search so it does not duplicate sidebar entries.
    $topFm = @"
---
layout: default
title: "$title"
permalink: /$slug/
nav_exclude: true
search_exclude: true
---

<div class="topic-meta">
  <span class="topic-badge">Topic #$num</span>
  <a class="topic-cat" href="../14-topic-library/">&#128279; Back to Topic Library</a>
</div>

$bodyTop
"@
    Set-Content -LiteralPath (Join-Path $topDir "$slug.md") -Value $topFm -Encoding UTF8
}

# ---------- category hub pages ----------
$catsUsed = $built | Group-Object Cat
$catIndex = 1
foreach ($c in $cats) {
    $members = $built | Where-Object { $_.Cat -eq $c.Slug } | Sort-Object Num
    if ($members.Count -eq 0) { continue }
    $cards = ($members | ForEach-Object {
        '<a class="row" data-cat="' + $c.Slug + '" href="../' + $_.Slug + '/">' +
            '<span class="row-icon">' + $c.Icon + '</span>' +
            '<span class="row-body"><span class="row-title">' + $_.Num + ' &middot; ' + $_.Title + '</span></span>' +
            '<span class="row-meta">Read topic <span class="arrow">&#8594;</span></span></a>'
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

<div class="topic-list">
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
        '<a class="row" data-cat="' + $c.Slug + '" href="' + $_.Slug + '/">' +
            '<span class="row-icon">' + $c.Icon + '</span>' +
            '<span class="row-body"><span class="row-title">' + $_.Num + ' &middot; ' + $t + '</span></span>' +
            '<span class="row-meta">Read topic <span class="arrow">&#8594;</span></span></a>'
    }) -join "`n"
    @"

### $($c.Title)

<div class="topic-list">
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

# ---------- 404 page: fully connected, no dead ends ----------
$catCards = ($byCat | ForEach-Object {
    '<a class="row" href="14-topic-library/categories/' + $_.Slug + '/">' +
        '<span class="row-icon">' + $_.Icon + '</span>' +
        '<span class="row-body"><span class="row-title">' + $_.Title + '</span></span>' +
        '<span class="row-meta">Open category <span class="arrow">&#8594;</span></span></a>'
}) -join "`n"
$surpriseLinks = ($built | Sort-Object Num | ForEach-Object {
    '<li><a href="' + $_.Slug + '/">' + $_.Num + ' &middot; ' + $_.Title + '</a></li>'
}) -join "`n"

$notFoundFm = @"
---
layout: default
title: 404
permalink: /404.html
nav_exclude: true
search_exclude: true
---

<div class="page-hero" style="text-align: center;">
  <h1 class="page-title" style="font-size: 4rem;">404</h1>
  <p class="page-subtitle" style="margin-inline: auto;">
    That page doesn't exist or has moved. Good news: everything you need is a click away.
    Try the search bar above, or jump straight into any of the $($built.Count) topics below.
  </p>
  <div class="chip-row" style="justify-content: center;">
    <a class="chip" href="./">&#127968; Back to homepage</a>
    <a class="chip" href="14-topic-library/">&#128218; Browse the topic library</a>
    <button type="button" id="surprise-me" class="chip chip--surprise" title="Open a random topic">&#127922; Surprise me</button>
  </div>
</div>

<h2>Browse by category</h2>

<div class="topic-list">
$catCards
</div>

<ul id="surprise-links" style="display: none;">
$surpriseLinks
</ul>
"@
Set-Content -LiteralPath (Join-Path $topDir "404.md") -Value $notFoundFm -Encoding UTF8

Write-Output "Generated $($built.Count) topic pages in $OutDir"
