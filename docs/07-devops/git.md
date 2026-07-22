---
layout: default
title: Git
parent: DevOps & Cloud
---

# Git
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Introduction

Git is a distributed version control system designed to handle everything from small to very large projects with speed and efficiency. Created by Linus Torvalds in 2005 for Linux kernel development, Git has become the industry standard for version control.

Git tracks changes in source code during software development, enabling multiple developers to collaborate efficiently. It provides features like branching, merging, stashing, and distributed history that make it indispensable for modern software development.

---

## Key Concepts

### Three Areas of Git

1. **Working Directory**: Where you edit files
2. **Staging Area (Index)**: Files marked for next commit
3. **Git Repository**: Project history and metadata

```
Working Directory → git add → Staging Area → git commit → Git Repository
```

### Git Object Model

- **Blob**: File content (no filename)
- **Tree**: Directory structure (filenames → blobs/trees)
- **Commit**: Snapshot with metadata (author, message, parents)
- **Tag**: Named reference to a commit

### Merge Strategies

1. **Fast-Forward**: No divergence, pointer moves forward
2. **Three-Way Merge**: Creates merge commit when branches diverge
3. **Squash Merge**: Combines all commits into single commit
4. **Rebase**: Rewrites history to linearize commits

### Key References

- **HEAD**: Points to current branch or commit
- **Branch**: Points to latest commit in branch
- **Remote Branch**: Tracks remote repository state
- **Tag**: Named pointer to specific commit

---

## FAQ (Top 10)

### Q1: What is the difference between git pull and git fetch?
**A:** git fetch downloads remote changes without modifying working directory. git pull fetches and immediately merges into current branch. fetch is safer for review before merging.

### Q2: What is the difference between git merge and git rebase?
**A:** Merge creates a merge commit preserving history. Rebase rewrites history to create linear sequence. Merge preserves context; rebase creates cleaner history.

### Q3: What is a merge conflict?
**A:** Occurs when Git can't automatically merge changes from different branches. Requires manual resolution by editing files and choosing which changes to keep.

### Q4: What is git stash?
**A:** Temporarily stores modified tracked files to clean working directory. Useful for switching contexts. Stash can be applied or popped later.

### Q5: What is the difference between git reset and git revert?
**A:** reset moves HEAD and optionally modifies staging/working directory. revert creates new commit that undoes changes. revert is safer for shared branches.

### Q6: What is git cherry-pick?
**A:** Applies a specific commit from one branch to another. Useful for hotfixes or applying specific changes without merging entire branch.

### Q7: What is interactive rebase?
**A:** git rebase -i allows editing, reordering, squashing, or removing commits. Powerful for cleaning up history before sharing.

### Q8: What is git bisect?
**A:** Binary search through commit history to find commit that introduced a bug. Start with good/bad commits; Git finds the introducing commit.

### Q9: What are Git hooks?
**A:** Scripts that run automatically on Git events (pre-commit, commit-msg, post-commit). Used for code validation, commit message enforcement, and automation.

### Q10: What is the difference between git clone and git fork?
**A:** clone creates local copy of repository. fork creates server-side copy (GitHub/GitLab) under your account. Fork is for contributing to others' projects.

---

## Common Mistakes

1. **Committing secrets** - Storing API keys, passwords, or certificates in Git
2. **Force pushing shared branches** - Rewriting history on branches others use
3. **Large commits** - Making many unrelated changes in single commit
4. **Poor commit messages** - Vague or non-descriptive commit messages
5. **Ignoring .gitignore** - Not excluding build artifacts and dependencies
6. **Merge conflicts from large PRs** - Not breaking work into smaller pieces
7. **Not pulling before push** - Missing remote changes and causing conflicts
8. **Using git add . blindly** - Staging unwanted files including secrets
9. **Detached HEAD** - Checking out commit instead of branch, losing work
10. **Not backing up** - Not pushing to remote or having backup strategy

---

## Best Practices

### Commit Messages
- Use imperative mood ("Add feature" not "Added feature")
- Keep subject line under 72 characters
- Use body for detailed explanation
- Reference issue numbers

### Branching
- Use meaningful branch names (feature/, bugfix/, hotfix/)
- Keep branches short-lived
- Delete merged branches
- Use feature flags instead of long-lived branches

### Code Review
- Use pull/merge requests
- Review before merging
- Require approvals
- Run CI checks before merge

### Safety
- Never force push shared branches
- Use git stash for temporary changes
- Test after merge conflicts
- Keep history clean with rebase

---

## Quick Reference

### Essential Commands
```bash
# Setup
git config --global user.name "Name"
git config --global user.email "email@example.com"

# Initialize
git init                    # New repository
git clone url               # Clone remote

# Stage and Commit
git add file               # Stage file
git add .                  # Stage all
git commit -m "message"    # Commit

# Branch
git branch name            # Create branch
git switch name            # Switch branch
git switch -c name         # Create and switch
git branch -d name         # Delete branch

# Remote
git remote add origin url  # Add remote
git push origin branch     # Push
git pull origin branch     # Pull

# History
git log --oneline          # Compact history
git log --graph --all      # Visual graph

# Undo
git restore file           # Discard changes
git restore --staged file  # Unstage
git commit --amend         # Amend commit
git revert commit          # Revert commit
git reset --hard commit    # Reset to commit

# Inspection
git blame file             # Who changed each line
git diff                   # Show changes
git diff --staged          # Staged changes
```

### Useful Aliases
```bash
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.lg "log --oneline --graph --all"
git config --global alias.last "log -1 HEAD"
```

### Reset Modes
```bash
git reset --soft HEAD~1   # Keep changes staged
git reset --mixed HEAD~1  # Keep changes unstaged
git reset --hard HEAD~1   # Discard all changes
```

### Pre-commit Hook
```bash
#!/bin/bash
# .git/hooks/pre-commit
npm run lint || exit 1
npm test || exit 1

if git diff --cached --name-only | xargs grep -l "password\|secret\|api_key" 2>/dev/null; then
    echo "Potential secrets detected."
    exit 1
fi
exit 0
```
