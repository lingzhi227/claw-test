---
name: git-cherry-pick
description: Apply specific commits from one branch to another. Use when backporting fixes, selectively merging changes, or when the user asks to "cherry-pick commit", "apply specific commit", or "port fix to another branch".
allowed-tools: Bash(git *)
---

# Git Cherry-Pick

Apply specific commits from one branch to another without merging entire branches.

## Basic Usage

### Cherry-pick single commit
```bash
git cherry-pick <commit-hash>
```

### Cherry-pick multiple commits
```bash
git cherry-pick commit1 commit2 commit3
```

### Cherry-pick range of commits
```bash
git cherry-pick commit1^..commit2
```

## Common Workflows

### Backport fix to release branch

```bash
# Fix was made on main
git checkout release-1.0
git cherry-pick <fix-commit-hash>
git push
```

### Apply feature commit to different branch

```bash
git checkout target-branch
git log source-branch  # Find commit hash
git cherry-pick abc123
```

## Handling Conflicts

If conflicts occur:

```bash
# Resolve conflicts in files
git add <resolved-files>
git cherry-pick --continue
```

Abort cherry-pick:
```bash
git cherry-pick --abort
```

## Options

### Without committing
```bash
git cherry-pick -n <commit>
# or
git cherry-pick --no-commit <commit>
```

### Edit commit message
```bash
git cherry-pick -e <commit>
```

### Signoff
```bash
git cherry-pick -s <commit>
```

## Best Practices

1. **Cherry-pick completed commits** - Not work-in-progress
2. **Use for hotfixes** - Backport critical fixes
3. **Avoid for large features** - Use merge instead
4. **Track original commit** - Note source in commit message
5. **Test after cherry-picking** - Changes may behave differently

## Example

```bash
# Made fix on main, need it in v1.0 release
$ git log main --oneline | grep "fix"
abc123 fix: resolve memory leak

$ git checkout release-v1.0
$ git cherry-pick abc123
$ git push origin release-v1.0
```
