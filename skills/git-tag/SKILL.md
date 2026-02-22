---
name: git-tag
description: Create and manage Git tags for marking releases and important commits. Use when creating releases, marking milestones, or when the user asks to "tag a release", "create version tag", or "mark milestone".
allowed-tools: Bash(git *)
---

# Git Tagging

Mark important commits with tags, typically for releases and milestones.

## Types of Tags

### Lightweight Tags
Simple pointers to commits:
```bash
git tag v1.0.0
```

### Annotated Tags (Recommended)
Include tagger info, date, message:
```bash
git tag -a v1.0.0 -m "Release version 1.0.0"
```

## Common Operations

### Create tag
```bash
git tag -a v1.0.0 -m "First major release"
```

### List tags
```bash
git tag
git tag -l "v1.*"  # Pattern matching
```

### Show tag info
```bash
git show v1.0.0
```

### Push tags to remote
```bash
git push origin v1.0.0      # Push one tag
git push --tags             # Push all tags
```

### Delete tag
```bash
git tag -d v1.0.0                    # Delete locally
git push origin --delete v1.0.0     # Delete from remote
```

## Semantic Versioning

Follow SemVer (MAJOR.MINOR.PATCH):
- `v1.0.0` - Major release (breaking changes)
- `v1.1.0` - Minor release (new features, backward compatible)
- `v1.1.1` - Patch release (bug fixes)

## Best Practices

1. **Use annotated tags for releases**
2. **Follow semantic versioning**
3. **Write descriptive tag messages**
4. **Tag stable commits only**
5. **Push tags after pushing commits**
