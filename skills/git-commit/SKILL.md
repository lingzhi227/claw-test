---
name: git-commit
description: Create commits with best practices following conventional commit format. Use when saving work, documenting changes, or when the user asks to "commit changes", "save work", or "create a commit". IMPORTANT - only create commits when explicitly requested.
allowed-tools: Bash(git *)
disable-model-invocation: true
---

# Git Commit Best Practices

Create meaningful, well-structured commits that clearly communicate changes.

## When to use this skill

- User explicitly asks to commit changes
- Completing a logical unit of work
- Need to save progress with proper documentation
- Creating a checkpoint before trying something risky

**IMPORTANT**: Never commit automatically. Only create commits when the user explicitly requests it.

## Commit Message Format

Follow Conventional Commits specification:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, no logic change)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks
- `perf`: Performance improvements

### Examples

**Simple commit**:
```bash
git commit -m "feat: add user authentication"
```

**Detailed commit**:
```bash
git commit -m "feat(auth): add JWT-based authentication

- Implement login/logout endpoints
- Add JWT token generation and validation
- Create authentication middleware
- Update API documentation

Closes #123"
```

## Workflow

### 1. Check what's changed

```bash
git status
git diff
```

### 2. Stage relevant files

Stage specific files:
```bash
git add path/to/file1 path/to/file2
```

Stage all changes in directory:
```bash
git add directory/
```

Stage all changes (use cautiously):
```bash
git add .
```

### 3. Review staged changes

```bash
git diff --staged
```

### 4. Create the commit

With message:
```bash
git commit -m "type(scope): description"
```

With detailed message (opens editor):
```bash
git commit
```

Using heredoc for multi-line:
```bash
git commit -m "$(cat <<'EOF'
feat(api): add rate limiting

- Implement token bucket algorithm
- Add rate limit middleware
- Configure limits per endpoint tier
- Add rate limit headers to responses

Closes #456
EOF
)"
```

### 5. Verify the commit

```bash
git log -1
git show HEAD
```

## Best Practices

1. **Atomic commits** - Each commit = one logical change
2. **Present tense** - "Add feature" not "Added feature"
3. **Descriptive subjects** - Under 50 characters
4. **Detailed body** - Explain the WHY, not the WHAT
5. **Reference issues** - Include issue numbers when relevant
6. **Never commit secrets** - Check for API keys, passwords, tokens

## Advanced Techniques

### Amend last commit

Fix the most recent commit:
```bash
git commit --amend
```

Add forgotten files to last commit:
```bash
git add forgotten-file.js
git commit --amend --no-edit
```

### Commit parts of files

Interactively stage hunks:
```bash
git add -p
```

Then commit only those hunks.

### Empty commit (for triggering CI)

```bash
git commit --allow-empty -m "chore: trigger CI rebuild"
```

## Pre-Commit Checks

Before committing, verify:

1. **Tests pass**:
   ```bash
   npm test  # or your test command
   ```

2. **Linting passes**:
   ```bash
   npm run lint
   ```

3. **No debug code**:
   ```bash
   git diff --staged | grep -i "console.log\|debugger\|TODO"
   ```

4. **No sensitive data**:
   ```bash
   git diff --staged | grep -i "password\|api_key\|secret"
   ```

## Commit Message Templates

### Feature commit:
```
feat(module): add new capability

- Implement core functionality
- Add unit tests
- Update documentation

Relates to #issue-number
```

### Bug fix commit:
```
fix(component): resolve issue description

The bug occurred when [scenario].

Changes:
- Fix root cause
- Add regression test
- Update error handling

Fixes #issue-number
```

### Refactoring commit:
```
refactor(service): improve code structure

No functional changes.

- Extract helper functions
- Improve naming
- Reduce complexity
```

## Common Mistakes to Avoid

❌ **Don't**:
- Commit unrelated changes together
- Use vague messages like "fix", "update", "changes"
- Commit commented-out code
- Commit generated files (build outputs)
- Skip commit messages (`-m ""`)

✅ **Do**:
- Keep commits focused
- Write clear, specific messages
- Review before committing
- Use conventional commit format
- Test before committing

## Example Workflow

```bash
# Make changes to files
# ...

# Review changes
$ git status
$ git diff

# Stage relevant files
$ git add src/auth/login.js src/auth/middleware.js

# Review staged changes
$ git diff --staged

# Create commit
$ git commit -m "feat(auth): add login endpoint

- Implement email/password authentication
- Add JWT token generation
- Include refresh token logic
- Add input validation

Closes #42"

# Verify
$ git log -1 --stat
```

## Co-authoring

When pair programming or incorporating others' work:

```bash
git commit -m "feat: add feature

Co-authored-by: Name <email@example.com>
Co-authored-by: Another <another@example.com>"
```

## Signing Commits

For verified commits:

```bash
git commit -S -m "message"
```

Requires GPG key setup.
