---
layout: default
title: Pair Programming
parent: Coding
---

# Pair Programming

{: .note }
Communication is the #1 skill in pair programming — technical skills are important, but collaboration is what's primarily tested.

---

## Introduction

Pair programming is a collaborative coding practice where two developers work together on the same codebase in real-time. In interviews, it involves working with an interviewer (or another candidate) to solve a coding problem, simulating real-world collaboration. One person "drives" (writes code) while the other "navigates" (reviews and guides).

Companies like Pivotal, GitHub, Shopify, and many startups use pair programming interviews because they closely simulate actual work environments.

---

## Roles

### The Driver
- Writes the code and focuses on implementation
- Explains what they're coding as they go
- Listens to navigator's suggestions
- Handles the keyboard confidently

### The Navigator
- Reviews code in real-time
- Thinks about the big picture and edge cases
- Identifies bugs and suggests improvements
- Keeps track of overall direction and time

---

## Key Concepts

### Communication Techniques

| Technique | Description | Example |
|-----------|-------------|---------|
| Active Listening | Give full attention, don't interrupt | Paraphrase: "So you're saying..." |
| Clear Explanation | Explain reasoning, not just actions | "I'm creating a hash map because..." |
| Constructive Feedback | Specific, respectful, solution-oriented | "Have you considered..." not "You should..." |
| Asking Questions | Regular check-ins | "What do you think about this approach?" |

### Remote Pair Programming Tools

| Tool | Features | Best For |
|------|---------|----------|
| VS Code Live Share | Real-time collab, shared terminal | Most interviews |
| CodeTogether | IntelliJ/VS Code extension | JetBrains users |
| Tuple | Screen sharing + control | Mac users |
| CoderPad | Online IDE | Standard interviews |

### Interviewer Expectations

| Expectation | What They're Looking For |
|------------|------------------------|
| Collaboration | You work WITH the interviewer, not against them |
| Communication | You explain thinking clearly and listen to input |
| Code Quality | You write readable, maintainable code |
| Flexibility | You adapt your approach based on feedback |
| Professionalism | You handle disagreement gracefully |

---

## FAQ

### Q1: What is the difference between pair programming and a regular coding interview?
In a regular coding interview, you code alone while the interviewer watches. In pair programming, the interviewer actively participates — navigating, suggesting, or even driving. It's more collaborative.

### Q2: Should I always be the driver?
No. Be willing to switch roles. Offer: "Would you like to try driving for the next part?" Some interviewers want to see if you can navigate as well as drive.

### Q3: How do I give feedback on the interviewer's code?
Be respectful and specific. "I notice this function could handle empty input. Should we add a check?" Focus on the code, not the person.

### Q4: What if I disagree with the interviewer's suggestion?
Acknowledge their input, then explain your reasoning: "That's a good point. I was thinking about [alternative] because [reason]. What do you think?"

### Q5: What if the navigator points out a bug I don't see?
Thank them and investigate: "Let me look at that. Can you walk me through what you're seeing?" Trust their observation.

### Q6: What if we run out of time?
Communicate: "We have 5 minutes left. Let me make sure the core functionality works." Prioritize: working code > edge cases > optimization.

### Q7: How do I demonstrate leadership?
Take initiative on structure: "Let's start by understanding the requirements." Suggest approaches. Keep the session organized. But remain collaborative.

### Q8: What if the interviewer doesn't participate much?
Continue coding and communicating your thoughts. Keep them engaged: "What do you think about this approach?" Don't let their silence make you nervous.

### Q9: How do I handle unfamiliar technology?
Acknowledge it: "I haven't used this specific framework, but I can learn quickly." Focus on fundamentals — logic and problem-solving remain the same.

### Q10: What's the most important skill?
Communication. Clear, respectful, continuous communication is the single most important factor.

---

## Common Mistakes

| Mistake | How to Avoid |
|---------|--------------|
| Being too dominant | Share control, listen to navigator |
| Being too passive | Actively participate even as navigator |
| Ignoring feedback | Acknowledge and try suggestions |
| Poor communication | Think aloud constantly |
| Being defensive | Accept feedback gracefully |
| Not asking questions | Ask for navigator's input regularly |
| Rushing | Balance speed with quality |
| Code readability | Use meaningful names and structure |

---

## Best Practices

1. **Communicate constantly** — Verbalize your thought process
2. **Listen actively** — Give full attention when navigator speaks
3. **Be open to feedback** — Accept suggestions gracefully
4. **Ask questions** — "What do you think about this approach?"
5. **Share control** — Don't hog the keyboard
6. **Write readable code** — Others need to understand it in real-time
7. **Test as you go** — Don't write 100 lines before testing
8. **Stay positive** — Pair programming should be enjoyable
9. **Give constructive feedback** — Specific, respectful, solution-oriented
10. **Review together** — After solving, review for improvements

---

## Quick Reference

```
ROLES
Driver: Writes code, implements logic, handles keyboard
Navigator: Reviews code, thinks big picture, catches bugs

COMMUNICATION
- Explain what you're coding and why
- Ask "What do you think about this approach?"
- Acknowledge feedback: "Good point, let me fix that"
- Use questions, not commands: "What about..." not "Do..."

GIVING FEEDBACK
- Be specific: "This loop might miss index 0"
- Be respectful: "Have you considered..."
- Be timely: Don't let errors accumulate
- Be solution-oriented: Suggest alternatives

BEST PRACTICES
1. Communicate constantly
2. Listen actively
3. Be open to feedback
4. Write readable code
5. Test as you go
6. Stay positive
7. Share control
8. Respect time
```

---

*Last Updated: July 2026*
