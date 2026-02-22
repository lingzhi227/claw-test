---
name: git-stash
description: Temporarily save uncommitted changes without committing them. Use when switching branches with uncommitted work, pulling updates with local changes, or when the user asks to "save changes temporarily", "stash work", or "clean working directory".
allowed-tools: Bash(git *)
---

# Git Stash

Temporarily store uncommitted changes and restore them later.

## When to use this skill

- Need to switch branches but have uncommitted changes
- Want to pull updates but have local modifications
- Need a clean working directory temporarily
- Experimenting with code but want to save current state

## Core Stash Operations

### 1. Stash current changes

Stash all changes (staged and unstaged):

```bash
git stash
```

Stash with a descriptive message:

```bash
git stash save "WIP: working on feature X"
```

Stash including untracked files:

```bash
git stash -u
```

### 2. List all stashes

```bash
git stash list
```

Output shows:
```
stash@{0}: WIP: working on feature X
stash@{1}: WIP: previous work
```

### 3. View stash contents

Show what's in the latest stash:

```bash
git stash show
```

Show detailed diff:

```bash
git stash show -p
```

Show specific stash:

```bash
git stash show stash@{1} -p
```

### 4. Apply stashed changes

Apply latest stash (keeps it in stash list):

```bash
git stash apply
```

Apply and remove from stash list (pop):

```bash
git stash pop
```

Apply specific stash:

```bash
git stash apply stash@{1}
```

### 5. Delete stashes

Delete specific stash:

```bash
git stash drop stash@{0}
```

Delete all stashes:

```bash
git stash clear
```

## Common Workflows

### Workflow 1: Switch branches with uncommitted changes

```bash
# You're on feature-a with uncommitted changes
git stash save "WIP: feature A progress"

# Switch to another branch
git checkout feature-b

# Work on feature-b...

# Return to feature-a
git checkout feature-a
git stash pop
```

### Workflow 2: Pull updates with local changes

```bash
# You have local uncommitted changes
git stash

# Pull updates
git pull

# Restore your changes
git stash pop
```

### Workflow 3: Try experimental changes

```bash
# Stash current work
git stash

# Try experimental changes
# ... make changes ...

# If you like them, commit
git add .
git commit -m "Add experimental feature"

# If you don't like them
git reset --hard HEAD
git stash pop  # Restore original work
```

## Advanced Usage

### Stash only specific files

```bash
git stash push -m "message" path/to/file
```

### Create branch from stash

```bash
git stash branch new-branch-name stash@{0}
```

This creates a new branch, checks it out, applies the stash, and drops it.

### Stash with keeping index

Stash changes but keep staged files staged:

```bash
git stash --keep-index
```

## Best Practices

1. **Use descriptive messages** - `git stash save "message"` not just `git stash`
2. **Don't accumulate stashes** - Apply or delete them regularly
3. **Check stash list** - Know what's stashed before applying
4. **Use stash for temp storage** - Not for long-term storage (use branches)
5. **Pop after applying** - Clean up stashes you've used

## Common Issues

**Problem**: Stash apply causes conflicts
**Solution**: Resolve conflicts, stage resolved files, then drop the stash manually

**Problem**: Lost track of what's in a stash
**Solution**: Always use `git stash save "descriptive message"`

**Problem**: Accidentally stashed but wanted to commit
**Solution**: `git stash pop`, then commit properly

## Example Session

```bash
# Working on feature, need to switch branches
$ git status
# Modified: file1.js, file2.js

$ git stash save "WIP: half-done user auth"
Saved working directory and index state On main: WIP: half-done user auth

$ git checkout -b hotfix
# Fix the bug, commit
$ git commit -m "Fix critical bug"

$ git checkout main
$ git stash pop
# Continue working on user auth
```

## Verification

After using stash, verify with:

```bash
git status          # Check working directory state
git stash list      # Check remaining stashes
git log --oneline   # Verify commit history unchanged
```
