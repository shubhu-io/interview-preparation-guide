# PowerShell script to convert README.md files to Chirpy Jekyll posts

$baseSourcePath = "D:\Ai generator\opencode_workspace\interview"
$baseOutputPath = "D:\Ai generator\opencode_workspace\interview\_posts"

# Create output directory if it doesn't exist
if (-not (Test-Path -LiteralPath $baseOutputPath)) {
    New-Item -ItemType Directory -Path $baseOutputPath -Force | Out-Null
}

# Define the mapping: folder -> {filename, title, category}
$mapping = @(
    @{ folder="01-Resume-ATS"; filename="2024-01-01-resume-ats.md"; title="Resume & ATS (Applicant Tracking System)"; category="Getting Started" }
    @{ folder="02-Company-Research"; filename="2024-01-02-company-research.md"; title="Company Research for Interview Success"; category="Getting Started" }
    @{ folder="03-Resume-Screening"; filename="2024-01-03-resume-screening.md"; title="Resume Screening & Shortlisting"; category="Getting Started" }
    @{ folder="04-Portfolio"; filename="2024-01-04-portfolio.md"; title="Portfolio & Project Showcase"; category="Getting Started" }
    @{ folder="05-LinkedIn"; filename="2024-01-05-linkedin.md"; title="LinkedIn Profile Optimization"; category="Getting Started" }
    @{ folder="06-Cover-Letter"; filename="2024-01-06-cover-letter.md"; title="Cover Letter Writing"; category="Getting Started" }
    @{ folder="07-Online-Assessment"; filename="2024-01-07-online-assessment.md"; title="Online Assessment Tests"; category="Aptitude" }
    @{ folder="08-Aptitude"; filename="2024-01-08-aptitude.md"; title="Aptitude Test Preparation"; category="Aptitude" }
    @{ folder="09-Quantitative-Aptitude"; filename="2024-01-09-quantitative-aptitude.md"; title="Quantitative Aptitude"; category="Aptitude" }
    @{ folder="10-Logical-Reasoning"; filename="2024-01-10-logical-reasoning.md"; title="Logical Reasoning"; category="Aptitude" }
    @{ folder="11-Verbal-Ability"; filename="2024-01-11-verbal-ability.md"; title="Verbal Ability"; category="Aptitude" }
    @{ folder="12-English-Grammar"; filename="2024-01-12-english-grammar.md"; title="English Grammar for Interviews"; category="Aptitude" }
    @{ folder="13-Reading-Comprehension"; filename="2024-01-13-reading-comprehension.md"; title="Reading Comprehension"; category="Aptitude" }
    @{ folder="14-Data-Interpretation"; filename="2024-01-14-data-interpretation.md"; title="Data Interpretation"; category="Aptitude" }
    @{ folder="15-Puzzle-Solving"; filename="2024-01-15-puzzle-solving.md"; title="Puzzle Solving & Brain Teasers"; category="Aptitude" }
    @{ folder="16-Psychometric-Test"; filename="2024-01-16-psychometric-test.md"; title="Psychometric Test Preparation"; category="Aptitude" }
    @{ folder="17-Coding-Rounds"; filename="2024-01-17-coding-rounds.md"; title="Coding Rounds & Technical Interviews"; category="Coding" }
    @{ folder="18-Live-Coding"; filename="2024-01-18-live-coding.md"; title="Live Coding Challenges"; category="Coding" }
    @{ folder="19-Pair-Programming"; filename="2024-01-19-pair-programming.md"; title="Pair Programming Interviews"; category="Coding" }
    @{ folder="20-Machine-Coding"; filename="2024-01-20-machine-coding.md"; title="Machine Coding Rounds"; category="Coding" }
    @{ folder="21-Whiteboard-Coding"; filename="2024-01-21-whiteboard-coding.md"; title="Whiteboard Coding"; category="Coding" }
    @{ folder="22-Debugging"; filename="2024-01-22-debugging.md"; title="Debugging & Problem Solving"; category="Coding" }
    @{ folder="23-Code-Review"; filename="2024-01-23-code-review.md"; title="Code Review Interviews"; category="Coding" }
    @{ folder="24-Competitive-Programming"; filename="2024-01-24-competitive-programming.md"; title="Competitive Programming"; category="Coding" }
    @{ folder="25-DSA"; filename="2024-01-25-dsa.md"; title="Data Structures & Algorithms"; category="Programming" }
    @{ folder="26-SQL"; filename="2024-01-26-sql.md"; title="SQL Interview Preparation"; category="Programming" }
    @{ folder="27-Python"; filename="2024-01-27-python.md"; title="Python Interview Preparation"; category="Programming" }
    @{ folder="28-Java"; filename="2024-01-28-java.md"; title="Java Interview Preparation"; category="Programming" }
    @{ folder="29-JavaScript"; filename="2024-01-29-javascript.md"; title="JavaScript Interview Preparation"; category="Programming" }
    @{ folder="30-CPP"; filename="2024-01-30-cpp.md"; title="C++ Interview Preparation"; category="Programming" }
)

foreach ($item in $mapping) {
    $sourceFile = Join-Path -Path $baseSourcePath -ChildPath $item.folder | Join-Path -ChildPath "README.md"
    $outputFile = Join-Path -Path $baseOutputPath -ChildPath $item.filename
    
    if (-not (Test-Path -LiteralPath $sourceFile)) {
        Write-Warning "Source file not found: $sourceFile"
        continue
    }
    
    # Read the source file
    $content = Get-Content -LiteralPath $sourceFile -Raw -Encoding UTF8
    
    # Find the first H1 heading and skip it
    $lines = $content -split "`n"
    $startLine = 0
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match "^#\s+") {
            $startLine = $i + 1
            break
        }
    }
    
    # Get content after the first H1
    $bodyContent = ($lines[$startLine..($lines.Count - 1)] -join "`n").TrimStart()
    
    # Generate tags based on the title and folder name
    $tags = @()
    $words = $item.folder -replace "^\d+-", "" -replace "-", " "
    $tags += $words.Split(" ") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }
    $tags += "Interview Preparation"
    
    # Create front matter
    $frontMatter = @"
---
layout: post
title: $($item.title)
categories: $($item.category)
tags: [$($tags -join ', ')]
date: $($item.filename.Substring(0, 10))
toc: true
---

"@
    
    # Write the output file
    $output = $frontMatter + "`n" + $bodyContent
    Set-Content -LiteralPath $outputFile -Value $output -Encoding UTF8
    
    Write-Host "Created: $($item.filename)" -ForegroundColor Green
}

Write-Host "`nAll posts created successfully!" -ForegroundColor Cyan
