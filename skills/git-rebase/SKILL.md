---
name: git-rebase
description: Rewrite commit history for a cleaner, linear project history. Use when cleaning up feature branches, updating with latest changes, or when the user asks to "rebase", "update branch", or "clean up commits".
allowed-tools: Bash(git *)
---

# Git Rebase

Rewrite commit history to create a cleaner, linear project timeline.

## Basic Rebase

### Rebase current branch onto main
```bash
git checkout feature-branch
git rebase main
```

### Rebase with specific branch
```bash
git rebase <base-branch>
```

## Interactive Rebase

Edit, squash, or reorder commits:

```bash
git rebase -i HEAD~3  # Last 3 commits
git rebase -i <commit-hash>  # Since specific commit
```

### Interactive commands:
- `pick` - Keep commit as-is
- `reword` - Change commit message
- `edit` - Modify commit
- `squash` - Combine with previous commit
- `fixup` - Like squash, but discard message
- `drop` - Remove commit

## Common Workflows

### Update feature branch with latest main

```bash
git checkout feature-branch
git rebase main
```

### Squash multiple commits into one

```bash
git rebase -i HEAD~3
# Change 'pick' to 'squash' for commits to combine
```

### Clean up commit history before merge

```bash
git rebase -i HEAD~5
# Reorder, squash, or edit commits
```

## Handling Conflicts

When conflicts occur:

```bash
# Resolve conflicts in files
git add <resolved-files>
git rebase --continue
```

Skip problematic commit:
```bash
git rebase --skip
```

Abort rebase:
```bash
git rebase --abort
```

## Rebase vs Merge

**Use Rebase when:**
- Cleaning up local commits before pushing
- Updating feature branch with main changes
- Want linear history

**Use Merge when:**
- Integrating finished features
- Working on public/shared branches
- Want to preserve branching history

## Best Practices

1. **Never rebase public history** - Only rebase local commits
2. **Rebase before merging** - Clean history before PR
3. **Test after rebasing** - Conflicts may introduce bugs
4. **Use interactive rebase** - Clean up commit messages
5. **Keep backups** - `git branch backup-branch` before rebasing

## Example: Clean Feature Branch

```bash
# Feature has messy commits, update from main
$ git checkout feature/user-auth
$ git rebase -i main

# Interactive editor opens:
pick a1b2c3d feat: add login
squash d4e5f6g fix typo
squash g7h8i9j fix linting
pick j1k2l3m feat: add logout

# Result: 2 clean commits instead of 4
```

## Force Push After Rebase

After rebasing pushed commits:

```bash
git push --force-with-lease
```

**Warning**: Only force push on your own feature branches!

## Advanced: Rebase onto Different Base

```bash
git rebase --onto new-base old-base feature-branch
```

This is useful for moving a branch to a different starting point.
