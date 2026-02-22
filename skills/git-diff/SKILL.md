---
name: git-diff
description: View differences between commits, branches, and working directory. Use when reviewing changes, comparing versions, or when the user asks to "show changes", "diff files", or "compare commits".
allowed-tools: Bash(git *)
---

# Git Diff

Compare changes across commits, branches, and working directory.

## Basic Diff Operations

### Show unstaged changes
```bash
git diff
```

### Show staged changes
```bash
git diff --staged
# or
git diff --cached
```

### Diff specific file
```bash
git diff path/to/file
```

## Compare Commits

### Between commits
```bash
git diff commit1 commit2
```

### Last commit vs working directory
```bash
git diff HEAD
```

### Between branches
```bash
git diff main..feature-branch
```

## Useful Options

### Stats only
```bash
git diff --stat
```

### Word-level diff
```bash
git diff --word-diff
```

### Show function names
```bash
git diff --function-context
```

### Ignore whitespace
```bash
git diff -w
```

## Best Practices

1. **Review before committing** - Always `git diff --staged`
2. **Use stats for overview** - `--stat` for quick summary
3. **Compare branches before merging**
4. **Check specific files** when debugging
