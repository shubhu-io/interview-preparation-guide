# 95 - Engineering Manager Round

## Introduction

The Engineering Manager (EM) round evaluates your ability to lead engineering teams, deliver projects, manage people, and make technical decisions at scale. EMs bridge technical execution and people leadership — they're responsible for team health, project delivery, hiring, and technical direction. This round is critical for EM roles and senior IC roles where leadership is expected.

This guide covers technical leadership, people management, project delivery, cross-team collaboration, hiring and onboarding, performance reviews, tech debt management, and architecture decisions.

---

## Theory Notes

### EM Responsibilities
1. **People Management**: Hiring, onboarding, feedback, growth, retention
2. **Project Delivery**: Planning, execution, risk management, delivery
3. **Technical Direction**: Architecture, standards, tech debt, innovation
4. **Team Health**: Culture, morale, collaboration, psychological safety
5. **Stakeholder Management**: Cross-team coordination, leadership communication

### People Management Framework

#### 1:1 Meetings
- Weekly, 30-60 minutes
- Employee-driven agenda
- Cover: wins, challenges, feedback, growth, blockers
- Manager's job: listen, support, remove obstacles

#### Feedback Model (SBI + Growth)
- **Situation**: Specific context
- **Behavior**: Observable action
- **Impact**: Effect on team/project
- **Growth**: How to improve

#### Career Development
- Understand each person's goals
- Create development plans
- Provide stretch opportunities
- Connect daily work to growth goals
- Regular career conversations

### Project Delivery

#### Planning
- Define scope with stakeholders
- Break down into milestones
- Identify risks and dependencies
- Allocate resources appropriately
- Set realistic timelines

#### Execution
- Daily standups (keep them short)
- Sprint retrospectives
- Demo working software regularly
- Address blockers immediately
- Communicate progress proactively

#### Delivery
- Quality gates before release
- Rollback plans
- Post-mortem for incidents
- Measure impact post-launch
- Document learnings

### Tech Debt Management

#### Framework
1. **Track**: Maintain a tech debt backlog
2. **Categorize**: By impact (velocity, reliability, security)
3. **Prioritize**: Based on business impact
4. **Allocate**: Reserve sprint capacity (e.g., 20%)
5. **Communicate**: Explain business case for investment

### Architecture Decisions

#### Architecture Decision Records (ADR)
```
Title: [Decision]
Status: [Proposed/Accepted/Deprecated]
Context: [What's the situation?]
Decision: [What did we decide?]
Consequences: [What are the trade-offs?]
```

---

## Key Concepts

### Technical Leadership
- Set and maintain technical standards
- Guide architecture decisions
- Drive technical debt reduction
- Evaluate and adopt new technologies
- Balance innovation with reliability
- Mentor engineers on best practices

### Cross-Team Collaboration
- Establish clear interfaces between teams
- Regular cross-team syncs
- Shared technical standards
- Collaborative planning for dependencies
- Conflict resolution between teams

### Hiring & Onboarding
- Define role requirements clearly
- Structured interviews with consistent rubrics
- Diverse candidate pipelines
- Thorough onboarding with clear 30-60-90 day plans
- Buddy/mentor assignment

---

## FAQ (20+ Q&A)

### Q1: How do you balance technical debt and feature work?
**A:** Allocate a fixed percentage of each sprint (20-30%) to tech debt. Prioritize based on impact on velocity and reliability. Communicate the business case: "Investing X hours now saves Y hours per quarter."

### Q2: How do you handle a team member who consistently misses deadlines?
**A:** Understand root cause (estimation, scope, blockers?), provide support, set clearer expectations, pair with experienced estimators, and follow up regularly. If persistent, address as a performance issue.

### Q3: How do you make architecture decisions?
**A:** Gather input from the team, evaluate trade-offs (cost, time, risk, scalability), document the decision (ADR), consider long-term implications, and communicate the rationale.

### Q4: How do you handle a conflict between two senior engineers?
**A:** Listen to both privately, facilitate a mediated discussion, focus on technical merits not personalities, and help find common ground. If needed, make the final call.

### Q5: How do you protect your team from organizational chaos?
**A:** Shield from unnecessary meetings, filter and prioritize requests, communicate context for changes, and advocate for the team's needs with leadership.

### Q6: How do you scale a team?
**A:** Hire deliberately (don't rush), establish clear processes, create sub-teams with ownership areas, maintain culture through growth, and document tribal knowledge.

### Q7: How do you handle a reorg?
**A:** Communicate openly, focus on what you can control, support team members through transition, and maintain team stability and delivery.

### Q8: How do you foster innovation?
**A:** Allocate time for exploration, encourage experimentation, celebrate learning from failures, stay curious, and bring new ideas to the team.

### Q9: How do you run effective retrospectives?
**A:** Create psychological safety, focus on process not blame, limit to 3 action items, follow up on previous actions, and rotate facilitators.

### Q10: How do you handle underperformance?
**A:** Have a private conversation, set clear expectations, provide support and resources, document progress, and escalate if no improvement.

### Q11: How do you manage up effectively?
**A:** Lead with conclusions, provide options not problems, be transparent about risks, proactively share progress, and respect their time.

### Q12: How do you maintain team morale during crunch?
**A:** Acknowledge the extra effort, provide support (meals, flexibility), set a clear end date, celebrate delivery, and ensure recovery time.

### Q13: How do you handle hiring in a competitive market?
**A:** Offer competitive compensation, emphasize growth opportunities, streamline the interview process, leverage employee referrals, and sell the team's mission.

### Q14: How do you onboard new engineers effectively?
**A:** 30-60-90 day plan, assign a buddy, set small-win goals, schedule regular check-ins, and gradually increase responsibility.

### Q15: How do you handle a team member who wants to switch to management?
**A:** Provide mentoring opportunities, let them lead small projects, discuss the differences between IC and management tracks, and support their growth.

### Q16: How do you balance autonomy and alignment?
**A:** Set clear goals and boundaries, let teams decide how to achieve them, provide context for decisions, and align through regular syncs.

### Q17: How do you handle cross-team dependencies?
**A:** Identify dependencies early, establish clear interfaces, regular cross-team syncs, shared planning, and clear ownership.

### Q18: How do you measure team health?
**A:** Team satisfaction surveys, delivery metrics, retention rates, code quality, and regular retrospectives.

### Q19: How do you handle a team member who disagrees with a decision?
**A:** Listen to their reasoning, share your rationale, present data, and explain "disagree and commit."

### Q20: How do you stay technical as an EM?
**A:** Code reviews, architecture discussions, hands-on prototypes, stay current through reading and courses, and delegate operational tasks.

---

## Best Practices

### For People Management
- Hold regular 1:1s (weekly, employee-driven)
- Give feedback frequently (not just reviews)
- Understand each person's career goals
- Create development plans
- Address issues early

### For Project Delivery
- Define clear success criteria
- Break work into milestones
- Track risks and dependencies
- Communicate progress proactively
- Conduct retrospectives

### For Technical Leadership
- Set clear technical standards
- Drive tech debt reduction
- Guide architecture decisions
- Mentor engineers
- Stay technically current

---

## Cheat Sheet

### EM Meeting Cadence
```
Daily:    Standup (15 min)
Weekly:   1:1s with each report (30-60 min)
Bi-weekly: Sprint planning and retro
Monthly:  Team health check
Quarterly: Career development conversations
```

### ADR Template
```
Title: [Decision]
Status: [Proposed/Accepted/Deprecated]
Context: [What's the situation?]
Decision: [What did we decide?]
Consequences: [What are the trade-offs?]
```

---

## Flash Cards (20)

### Card 1
**Q:** What are an EM's core responsibilities?
**A:** People management, project delivery, technical direction, team health, and stakeholder management. Bridge between technical execution and people leadership.

### Card 2
**Q:** How do you balance tech debt and features?
**A:** Allocate sprint capacity (20-30%), prioritize by impact, communicate business case, and track debt items.

### Card 3
**Q:** How do you handle underperformance?
**A:** Private conversation → understand root cause → set expectations → provide support → follow up → escalate if needed.

### Card 4
**Q:** What is an Architecture Decision Record?
**A:** A document capturing: Title, Status, Context, Decision, and Consequences. Creates transparency and historical record.

### Card 5
**Q:** How do you run effective 1:1s?
**A:** Weekly, 30-60 min, employee-driven agenda, cover wins/challenges/feedback/growth. Manager's job: listen and remove obstacles.

### Card 6
**Q:** How do you foster innovation?
**A:** Time for exploration, encourage experimentation, celebrate learning from failures, stay curious.

### Card 7
**Q:** How do you protect your team from chaos?
**A:** Shield from unnecessary meetings, filter requests, communicate context, advocate for team needs.

### Card 8
**Q:** How do you onboard new engineers?
**A:** 30-60-90 day plan, buddy assignment, small-win goals, regular check-ins, gradual responsibility increase.

### Card 9
**Q:** How do you handle cross-team dependencies?
**A:** Identify early, establish interfaces, regular syncs, shared planning, clear ownership.

### Card 10
**Q:** How do you measure team health?
**A:** Satisfaction surveys, delivery metrics, retention, code quality, retrospectives.

### Card 11
**Q:** How do you stay technical as an EM?
**A:** Code reviews, architecture discussions, hands-on prototypes, delegate operational tasks.

### Card 12
**Q:** How do you handle a team disagreement?
**A:** Listen to both sides, focus on technical merits, find common ground, make final call if needed.

### Card 13
**Q:** How do you manage up?
**A:** Lead with conclusions, provide options, be transparent about risks, proactively share progress.

### Card 14
**Q:** How do you scale a team?
**A:** Hire deliberately, establish processes, create sub-teams, maintain culture, document knowledge.

### Card 15
**Q:** How do you balance autonomy and alignment?
**A:** Set clear goals/boundaries, let teams decide how, provide context, align through regular syncs.

### Card 16
**Q:** How do you handle crunch time?
**A:** Acknowledge effort, provide support, set clear end date, celebrate delivery, ensure recovery.

### Card 17
**Q:** How do you handle a reorg?
**A:** Communicate openly, focus on what you can control, support team, maintain stability.

### Card 18
**Q:** How do you hire effectively?
**A:** Clear requirements, structured interviews, diverse pipelines, competitive offers, fast process.

### Card 19
**Q:** How do you handle someone wanting to switch to management?
**A:** Provide mentoring, let them lead projects, discuss IC vs management differences, support growth.

### Card 20
**Q:** What makes a great EM?
**A:** People-first mindset, technical credibility, clear communication, decisive action, and genuine care for team growth.

---

## Advanced EM Scenarios

### Scenario 1: Building a Team from Scratch

**Context:** You've been hired to build a new engineering team.

**Approach:**
1. **First 30 days**: Understand business goals, meet stakeholders, define team charter
2. **Days 30-60**: Hire first 2-3 engineers, establish processes, set initial roadmap
3. **Days 60-90**: Hire remaining members, refine processes, deliver first milestone
4. **Ongoing**: Iterate on culture, scale processes, develop leaders

**Key considerations:**
- Hire for foundational skills and culture, not just resumes
- Establish engineering standards early
- Document decisions and processes from day one
- Build relationships with cross-functional partners
- Set realistic expectations with leadership

### Scenario 2: Managing a Low Performer

**Framework:**
1. **Identify**: Is it a performance issue or an engagement issue?
2. **Data**: Gather specific examples (not feelings)
3. **Conversation**: Private, direct, supportive
4. **Plan**: Clear expectations, support, timeline
5. **Follow-up**: Regular check-ins on progress
6. **Decision**: Improve, reassign, or exit

**Script example:**
"I want to talk about some observations I've made. Over the past month, I've noticed [specific examples]. I want to understand what's going on and how I can help. Let's discuss what's happening and create a plan together."

### Scenario 3: Handling a Reorg

**Your responsibilities as EM:**
- Communicate openly with the team (even when you don't have all answers)
- Focus on what you can control
- Maintain team morale and delivery
- Support individuals through uncertainty
- Protect the team from organizational chaos
- Document and preserve team culture

**What NOT to do:**
- Don't speculate about reasons
- Don't make promises you can't keep
- Don't ignore the elephant in the room
- Don't let delivery slip during transition

### Scenario 4: Running an Effective Retrospective

**Pre-retro:**
- Gather data (velocity, incidents, satisfaction scores)
- Set up anonymous input mechanism
- Prepare facilitation guide

**During retro:**
1. Set the stage (5 min): Safety reminder, purpose
2. Gather data (10 min): What happened? (facts only)
3. Generate insights (15 min): Why did it happen?
4. Decide what to do (10 min): Specific action items
5. Close (5 min): Appreciation, meta-retro

**Post-retro:**
- Share notes within 24 hours
- Track action items publicly
- Follow up on progress at next retro
- Rotate facilitators

### Scenario 5: Technical Debt Prioritization

**Framework for presenting tech debt to leadership:**

```
Tech Debt Item: [Name]
Impact on velocity: [X hours/week lost]
Risk: [What could go wrong?]
Proposed solution: [Approach]
Effort: [Time/resources needed]
ROI: [Hours saved per quarter / hours invested]
Priority: [Critical/High/Medium/Low]
```

**Communication example:**
"We're losing approximately 20 engineering hours per week to workarounds caused by our legacy authentication system. I'd like to propose a 3-week project to replace it. This would save roughly 80 hours per quarter and reduce our security surface. The risk of not doing it is a potential security breach."

### Scenario 6: Hiring Mistake Recovery

**When you realize you made a bad hire:**
1. Don't panic — assess objectively
2. Is it a ramp-up issue or a fundamental fit issue?
3. If ramp-up: extend timeline, provide more support
4. If fit: have an honest conversation
5. Explore options: reassignment, managed exit
6. Blameless post-mortem on the hiring process
7. Update interview criteria to prevent recurrence

---

---

## Difficulty Rating

| Topic | Difficulty | Interview Frequency |
|-------|-----------|-------------------|
| People Management | ★★★☆☆ | Very High |
| Project Delivery | ★★★☆☆ | Very High |
| Technical Leadership | ★★★★☆ | High |
| Cross-Team Collaboration | ★★★☆☆ | High |
| Hiring & Onboarding | ★★★☆☆ | High |
| Tech Debt Management | ★★★☆☆ | Medium |
| Architecture Decisions | ★★★★☆ | High |

---

## Code Examples

### EM Interview Question Bank
```markdown
# Engineering Manager Interview Questions

## People Management
1. Tell me about a time you had to give difficult feedback
2. How do you handle an underperforming team member?
3. Describe your approach to 1:1 meetings
4. How do you support career growth for your reports?
5. Tell me about a time you had to let someone go

## Project Delivery
6. How do you handle a project that's behind schedule?
7. Describe your sprint planning process
8. How do you manage competing priorities across teams?
9. Tell me about a time you had to cut scope to meet a deadline
10. How do you ensure quality while maintaining velocity?

## Technical Leadership
11. How do you make architecture decisions?
12. How do you balance tech debt and feature work?
13. Describe your approach to code reviews
14. How do you evaluate new technologies for adoption?
15. How do you stay technical as a manager?

## Team Health
16. How do you build psychological safety?
17. How do you handle team conflict?
18. How do you maintain morale during crunch?
19. How do you foster innovation?
20. How do you run effective retrospectives?

## Hiring & Onboarding
21. How do you define role requirements?
22. How do you structure interviews?
23. How do you onboard new engineers?
24. How do you handle a hiring mistake?
25. How do you build a diverse team?
```

### 1:1 Notes Template
```markdown
# 1:1 Notes — [Report Name] — [Date]

## Their Agenda
- [Topic 1]
- [Topic 2]

## My Notes
- [Observation 1]
- [Observation 2]

## Feedback Given
- Positive: [Specific example]
- Growth area: [Specific suggestion]

## Feedback Received
- [What they shared]

## Career Discussion
- [Goals discussed]
- [Support needed]

## Action Items
- [ ] [Action] — [Owner] — [Due]
- [ ] [Action] — [Owner] — [Due]
```

### Team Retrospective Template
```markdown
# Sprint Retrospective — [Sprint #] — [Date]

## What went well?
1. [Thing 1]
2. [Thing 2]
3. [Thing 3]

## What could be improved?
1. [Thing 1]
2. [Thing 2]
3. [Thing 3]

## Action Items from last retro
- [x] [Completed action]
- [ ] [Still pending]

## New Action Items
1. [Action] — Owner: [Name] — Due: [Date]
2. [Action] — Owner: [Name] — Due: [Date]

## Kudos
- [Name] for [specific contribution]
- [Name] for [specific contribution]
```

### Hiring Scorecard
```markdown
# Interview Scorecard — [Candidate]

## Interviewer: [Your Name]

### Technical Assessment (1-5)
- System design: ___
- Coding: ___
- Problem solving: ___
- Technical communication: ___

### Behavioral Assessment (1-5)
- Leadership: ___
- Teamwork: ___
- Conflict resolution: ___
- Learning mindset: ___

### Culture Fit (1-5)
- Values alignment: ___
- Communication style: ___
- Growth potential: ___

### Overall: Strong Hire / Hire / No Hire / Strong No Hire

### Strengths
1. [Strength]
2. [Strength]

### Concerns
1. [Concern]

### Recommendation
[Detailed recommendation]
```

---

## EM Interview Deep Dive Questions

### People Management Deep Questions

**Q: How would you handle a situation where two of your best engineers want to work on different projects and you only have one opening?**
**A:** Assess both engineers' growth goals, project impact, and team needs. Discuss transparently with both. Consider: who grows more from this project? Who has other growth opportunities? Can one contribute part-time? Document the decision rationale and ensure the "other" engineer gets the next opportunity.

**Q: Tell me about a time you had to let someone go.**
**A:** "An engineer on my team wasn't meeting expectations despite clear feedback and support over 3 months. I provided specific examples, created a performance improvement plan with weekly check-ins, and offered additional mentoring. When there was no improvement, I worked with HR on a compassionate exit. I learned the importance of early, specific feedback and not waiting too long to address issues."

**Q: How do you build psychological safety on your team?**
**A:** Model vulnerability (admit your own mistakes), celebrate learning from failures, encourage questions, create anonymous feedback channels, respond constructively to bad news, and ensure no one is punished for honest communication.

### Technical Leadership Deep Questions

**Q: How do you decide when to rewrite vs refactor?**
**A:** Consider: Is the fundamental architecture wrong? Is the codebase maintainable? What's the estimated rewrite cost vs ongoing maintenance cost? Can we incrementally improve? I prefer incremental refactoring unless the architecture is fundamentally flawed. Rewrites carry enormous risk of introducing new bugs.

**Q: How do you keep the team technically sharp?**
**A:** Tech talks (weekly/bi-weekly), code review standards, hack days for experimentation, conference attendance, learning budgets, pairing sessions, and challenging projects that push growth boundaries.

**Q: Describe your approach to technical debt.**
**A:** I maintain a visible tech debt backlog, categorize by impact (velocity, reliability, security), allocate 20% of sprint capacity to debt reduction, and communicate the business case for investment. I also prevent new debt through code review standards and architectural guidelines.

### Project Delivery Deep Questions

**Q: How do you handle a project that's at risk of missing a deadline?**
**A:** 1) Identify the specific blockers, 2) Communicate early with stakeholders (don't wait until the deadline), 3) Present options: reduce scope, extend timeline, add resources, 4) Make a recommendation based on impact analysis, 5) Adjust plans and communicate the new timeline, 6) Prevent recurrence through better estimation.

**Q: How do you manage dependencies across multiple teams?**
**A:** Identify dependencies early in planning, establish clear APIs and contracts, regular cross-team syncs, shared dashboards for visibility, and escalation paths for blocked items. I also ensure we're not over-optimizing for one team at the expense of another.

---
- *The Manager's Path* by Camille Fournier
- *High Output Management* by Andrew Grove
- *An Elegant Puzzle* by Will Larson
- *Staff Engineer* by Will Larson
- *Accelerate* by Nicole Forsgren

### Online
- [Rands Leadership Blog](https://randsinrepose.com)
- [Will Larson Blog](https://lethain.com)
- [The Pragmatic Engineer](https://blog.pragmaticengineer.com)
- [Engineering Manager Resources](https://github.com/ryanburgess/manager)

---

## Projects

### Project 1: Team Charter
- Create a team charter defining values, norms, and working agreements
- Include communication protocols, decision-making processes, and conflict resolution
- Share with team and iterate based on feedback
- **Skills**: Team building, culture setting

### Project 2: Hiring Process Design
- Design a complete hiring process for your team
- Include job descriptions, interview questions, scorecards, and evaluation criteria
- Run through a mock hiring cycle
- **Skills**: Hiring, process design

### Project 3: 1:1 Effectiveness Review
- Track your 1:1 meeting effectiveness over 4 weeks
- Survey your reports on meeting quality
- Iterate based on feedback
- Document lessons learned
- **Skills**: People management, self-improvement

### Project 4: Engineering Metrics Dashboard
- Design a dashboard tracking key engineering metrics
- Include: velocity, cycle time, defect rate, team satisfaction
- Define goals and thresholds for each metric
- Create a review cadence
- **Skills**: Data-driven management, measurement

### Project 5: Incident Response Plan
- Create a comprehensive incident response plan
- Include: severity levels, escalation paths, communication templates
- Define on-call rotation and compensation
- Create post-mortem templates
- **Skills**: Operations management, reliability

### Project 6: Career Ladder Design
- Design an engineering career ladder for your team
- Define levels, expectations, and evaluation criteria
- Include both IC and management tracks
- Create promotion guidelines
- **Skills**: Talent development, organizational design

---

## Resources

### Books
- *The Manager's Path* by Camille Fournier
- *High Output Management* by Andrew Grove
- *An Elegant Puzzle* by Will Larson
- *Staff Engineer* by Will Larson
- *Accelerate* by Nicole Forsgren
- *Team Topologies* by Matthew Skelton
- *The Five Dysfunctions of a Team* by Patrick Lencioni

### Online
- [Rands Leadership Blog](https://randsinrepose.com)
- [Will Larson Blog](https://lethain.com)
- [The Pragmatic Engineer](https://blog.pragmaticengineer.com)
- [Engineering Manager Resources](https://github.com/ryanburgess/manager)
- [LeadDev](https://leaddev.com)
- [CTO Craft](https://ctocraft.com)

### Communities
- [Rands Leadership Slack](https://randsinrepose.com/rands-in-repose-slack/)
- [Engineering Managers Slack](https://engineeringmanagers.dev)
- [Software Lead Weekly](https://softwareleadweekly.com)

---

## EM Interview Red Flags to Avoid

### Red Flags Interviewers Watch For
1. **"I" vs "We" imbalance**: Never saying "I" means you can't own outcomes; always saying "I" means you don't share credit
2. **No specific examples**: Speaking in generalities without concrete stories
3. **Blaming others**: "My team wasn't good enough" or "My previous manager was terrible"
4. **Ignoring people side**: Focusing only on technical delivery without mentioning team impact
5. **No learning**: "I've always done it this way" shows lack of growth mindset
6. **Micromanagement indicators**: "I review every PR" or "I make all technical decisions"
7. **Avoiding hard conversations**: "I don't like conflict" or "I let HR handle it"
8. **No metrics**: Unable to quantify impact or results

### What Great EM Candidates Do
1. Lead with people impact, not just technical achievements
2. Show genuine care for team members' growth
3. Demonstrate both technical depth and leadership breadth
4. Give credit to the team while owning outcomes
5. Show examples of difficult decisions and their reasoning
6. Discuss failures and what was learned
7. Ask thoughtful questions about the team and culture
8. Demonstrate systems thinking about engineering org

---

## Summary

The EM round evaluates your ability to lead people and deliver projects. Key takeaways:

1. **People first** — great teams deliver great results
2. **Clear expectations** — everyone knows what success looks like
3. **Regular feedback** — don't wait for formal reviews
4. **Technical credibility** — stay close to technical decisions
5. **Shield your team** — protect from unnecessary chaos
6. **Deliver reliably** — plan well, execute consistently
7. **Hire deliberately** — don't rush to fill seats
8. **Manage tech debt** — allocate capacity, prioritize by impact
9. **Communicate proactively** — don't wait for stakeholders to ask
10. **Develop your people** — invest in their growth and careers
