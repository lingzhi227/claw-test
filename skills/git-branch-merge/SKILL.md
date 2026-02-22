---
name: git-branch-merge
description: Create feature branches, switch between them, and merge changes safely. Use when implementing new features, working on separate concerns, or when the user asks to "create a branch", "merge branches", or "work on a feature".
allowed-tools: Bash(git *)
---

# Git Branching & Merging

Master Git branching workflows for clean, isolated feature development.

## When to use this skill

- Starting work on a new feature or bugfix
- Need to isolate changes from main codebase
- Working on multiple features simultaneously
- User asks about branches, merging, or feature development

## Core Branching Workflow

### 1. Create and switch to a new branch

For a new feature:

```bash
git checkout -b feature/descriptive-name
```

For a bugfix:

```bash
git checkout -b fix/issue-description
```

**Naming conventions**:
- `feature/` - New functionality
- `fix/` - Bug fixes
- `refactor/` - Code improvements
- `docs/` - Documentation changes
- `test/` - Test additions/modifications

### 2. Make changes on the feature branch

Work normally - add files, make commits:

```bash
# Make changes to files
git add <files>
git commit -m "Descriptive commit message"
```

You can make multiple commits on a feature branch.

### 3. View all branches

List local branches:

```bash
git branch
```

List all branches including remotes:

```bash
git branch -a
```

### 4. Switch between branches

Return to main branch:

```bash
git checkout main
```

Switch to another branch:

```bash
git checkout <branch-name>
```

### 5. Merge a feature branch

First, switch to the target branch (usually main):

```bash
git checkout main
```

Then merge the feature branch:

```bash
git merge feature/descriptive-name
```

With a merge commit message:

```bash
git merge feature/descriptive-name -m "Merge feature: description"
```

### 6. Delete merged branches

After successful merge, clean up:

```bash
git branch -d feature/descriptive-name
```

Force delete if needed (use cautiously):

```bash
git branch -D branch-name
```

## Advanced Patterns

### Check for conflicts before merging

```bash
git merge --no-commit --no-ff feature/name
```

Review changes, then:
- If good: `git commit`
- If issues: `git merge --abort`

### Rebase instead of merge (for linear history)

```bash
git checkout feature/name
git rebase main
```

Then fast-forward merge on main:

```bash
git checkout main
git merge feature/name
```

### View branch relationships

```bash
git log --oneline --graph --all
```

## Best Practices

1. **Keep branches focused** - One feature or fix per branch
2. **Update from main regularly** - Stay current with main branch
3. **Use descriptive names** - `feature/user-authentication` not `temp` or `test`
4. **Delete merged branches** - Keep branch list clean
5. **Merge frequently** - Don't let branches diverge too much

## Merge Conflict Resolution

When conflicts occur:

1. Git marks conflicted files:
   ```
   <<<<<<< HEAD
   Current branch content
   =======
   Incoming branch content
   >>>>>>> feature/name
   ```

2. Edit files to resolve conflicts

3. Stage resolved files:
   ```bash
   git add <resolved-files>
   ```

4. Complete the merge:
   ```bash
   git commit
   ```

## Example Workflow

```bash
# Start new feature
git checkout -b feature/add-search

# Make changes
echo "search functionality" > search.js
git add search.js
git commit -m "Add search functionality"

# More commits...
git add .
git commit -m "Add search tests"

# Ready to merge
git checkout main
git merge feature/add-search

# Clean up
git branch -d feature/add-search
```

## Common Issues

**Problem**: "Cannot delete branch - not fully merged"
**Solution**: Either merge it first, or use `git branch -D` to force delete

**Problem**: Merge conflicts
**Solution**: Follow conflict resolution steps above

**Problem**: Accidentally committed to main instead of feature branch
**Solution**: Create branch from current HEAD: `git branch feature/name` then reset main: `git reset --hard origin/main`
