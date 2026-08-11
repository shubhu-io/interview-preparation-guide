---
layout: default
title: Software Testing & QA
parent: Specialized Domains
---

# Software Testing & QA Automation

## Introduction

QA (Quality Assurance) ensures software works correctly before users see it. Roles: Manual QA, QA Automation Engineer, SDET (Software Development Engineer in Test), Test Lead/Manager, Performance Tester. Modern QA is highly automated and code-heavy.

## What the Role Does

- Write and execute test cases; log and track bugs.
- Build automated test frameworks (Selenium, Playwright, Cypress, Appium).
- Run functional, regression, integration, and end-to-end (E2E) tests.
- Do API testing (Postman, REST Assured) and performance testing (JMeter, k6).
- Design CI/CD quality gates; test on real devices/browsers.
- Shift-left: work with developers during development, not after.

## Hiring Companies

Every software company. Especially strong QA teams: Cognizant, TCS, Infosys, Wipro, Capgemini, Accenture, EPAM, ThoughtWorks, Zoho, Freshworks, BrowserStack, LambdaTest, and all product/startup firms.

## Core Topics

| Topic | What to Know |
|-------|--------------|
| SDLC & STLC | Phases, bug life cycle, test levels, test plan writing |
| Testing Types | Functional, regression, smoke, sanity, UAT, exploratory ([79-Testing](../../79-Testing/)) |
| Automation | Selenium WebDriver, Playwright, Cypress, Appium, TestNG/Pytest/JUnit |
| Page Object Model | Maintainable automation architecture |
| API Testing | Postman, REST Assured, HTTP methods/status codes |
| Performance | JMeter, k6, load/soak/spike tests |
| CI/CD Integration | GitHub Actions, Jenkins, nightly test runs ([56-CICD](../../56-CICD/)) |
| Languages | Java, Python, JS/TS for test scripting |
| Databases | SQL for test-data setup and validation ([26-SQL](../../26-SQL/)) |
| Tools & Pipeline | BrowserStack, LambdaTest, Allure reports, defect trackers (Jira) |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   Manual testing fundamentals, test case design, bug life cycle
Weeks 3-4:   Learn a language (Java or Python) + Selenium basics
Weeks 5-6:   Build a Selenium/Playwright framework with POM
Weeks 7-8:   API testing (Postman + REST Assured) + database validation
Weeks 9-10:  Performance testing basics + CI/CD integration
Weeks 11-12: Mock QA rounds + a polished automation portfolio
```

## Sample Interview Questions

- What is the difference between regression and smoke testing?
- How do you prioritize which test cases to automate first?
- Explain the Page Object Model. Why is it used?
- Write a Selenium test that logs into a page and verifies a dashboard element.
- How do you handle flaky tests?
- What is an API test and how is it different from a UI test?
- How would you load-test an e-commerce checkout flow?

## Projects for Portfolio

- Build a Selenium/Playwright automation framework from scratch (with POM) and run it in CI.
- Create an API test suite for a public API with Postman/REST Assured.
- Write a data-driven test suite using CSV/Excel/JSON test data.
- End-to-end test flow for a web app including screenshots and Allure reports.

## Tools to Learn

- Web: Selenium, Playwright, Cypress
- Mobile: Appium, Detox
- API: Postman, REST Assured, Newman
- Perf: JMeter, k6
- CI: GitHub Actions, Jenkins, GitLab CI
- Reporting: Allure, ExtentReports; tracking: Jira, TestRail

## Key Links

- QA folders: [78-QA-Automation](../../78-QA-Automation/), [79-Testing](../../79-Testing/)
- CI/CD: [56-CICD](../../56-CICD/), [53-Jenkins](../../53-Jenkins/)
- Languages: [27-Python](../../27-Python/), [28-Java](../../28-Java/), [29-JavaScript](../../29-JavaScript/)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Only knowing manual testing when the role asks for automation.
2. Copying sample frameworks without understanding the code.
3. Neglecting API and database testing — modern QA is not just UI clicks.
4. Not being able to explain *why* a test failed (the debug skill).
5. Ignoring CI/CD — tests must run automatically to add value.