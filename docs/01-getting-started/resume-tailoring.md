---
layout: default
title: Resume Tailoring to Job Description
parent: Getting Started
---

# How to Tailor Your Resume to a Job Description (JD)

Sending the same resume to every job is the #1 reason applications die in the ATS. Tailoring raises your match score, gets more interview calls, and gives you stories to tell in interviews.

## Why Tailoring Works

| What Companies Do | What It Means for You |
|-------------------|-----------------------|
| ATS ranks resumes by keyword match | Your resume must mirror the JD's language |
| Recruiters spend 6-7 seconds scanning | The most relevant bullets must be at the top |
| Hiring managers look for specific experience | Your bullets must map to the role, not general skills |

## The 5-Step Tailoring Process

### Step 1: Read the JD Three Times
- **Pass 1**: What is the role actually doing day-to-day?
- **Pass 2**: Highlight every required skill, tool, and certification.
- **Pass 3**: Note the *exact phrases* used (e.g., "RTL design", "FPGA prototyping", "data pipelines").

### Step 2: Build a Keyword Map

| JD Requirement (exact phrase) | My Matching Experience | Evidence/Number |
|-------------------------------|------------------------|-----------------|
| "Verilog and SystemVerilog" | RTL blocks written in SystemVerilog | 6 modules for a RISC-V core |
| "PCB design in Altium" | Designed 4-layer boards | 12"×10" sensor board, 4 layer |
| "AWS Lambda / serverless" | Deployed Python microservices | 3 services, 99.9% uptime |

Include the **exact phrase** from the JD at least once, then add the plural/synonym once more (ATS indexes both).

### Step 3: Rewrite the Professional Summary
Mirror 3-4 highest-priority keywords from the JD.

- **Before:** *"Software engineer with strong programming skills."*
- **After (JD mentions Python, distributed systems, microservices):** *"Software engineer with 4+ years building distributed systems in Python. Designed and deployed microservices handling 2M+ daily requests at 99.9% uptime. Expert in AWS, Docker, and Kafka."*

### Step 4: Reorder & Rewrite Bullets by Relevance
- Move the most relevant bullet of each job to the **top**.
- Use the JD's verbs. If the JD says "designed", don't write "made".
- **Formula:** `[JD verb] + [what you did] + [quantified result mapped to JD]`

| JD phrase | Weak bullet | Tailored bullet |
|-----------|-------------|-----------------|
| "optimize performance" | "Worked on app speed" | "Optimized API performance, cutting p95 latency from 900ms to 150ms" |
| "conduct verification" | "Did testing" | "Conducted UVM verification, achieving 98% functional coverage" |

### Step 5: Clean Up
- Delete irrelevant experience for the target role (keep just 1 line if needed).
- Add a "Relevant Skills" section that lists JD skills in their words.
- Keep it ATS-safe: single column, .docx or text PDF (see [Resume & ATS](resume-ats)).

## Before/After Example

**JD keywords:** RTL Design, SystemVerilog, UVM, AXI, FPGA, STA, CDC.

- **Before (generic):** *"Developed digital systems using Verilog. Worked on verification and helped with timing."*
- **After (tailored):** *"Designed RTL blocks in SystemVerilog implementing AXI interfaces for a [product]. Built UVM testbenches achieving 98% functional coverage. Ran STA and CDC checks, closing timing at 400MHz on FPGA prototypes."*

## Quick Tailoring Checklist

- [ ] Summary rewritten with JD's top keywords
- [ ] Every hard-skill keyword from JD appears at least once
- [ ] Bullets reordered so the most relevant is first per job
- [ ] JD's exact verbs used
- [ ] Irrelevant sections trimmed
- [ ] ATS formatting intact (no tables/images/multi-columns)
- [ ] Saved as `FirstName_LastName_TargetRole.docx`
- [ ] Tested with a free ATS checker (Jobscan, Resume Worded)

## Common Mistake: Keyword Stuffing
Use each keyword 2-3 times naturally. Copying a 30-keyword blob into your skills section reads as spam to both ATS and recruiters.

## Related

- [Resume & ATS Optimization](resume-ats)
- [Job Search Strategy](job-search-strategy)
- [Company Research](company-research)