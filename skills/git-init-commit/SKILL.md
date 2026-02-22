---
name: git-init-commit
description: Initialize a new Git repository and create the first commit. Use when starting a new project, converting an existing directory to a Git repository, or when the user asks to "initialize git" or "create first commit".
allowed-tools: Bash(git *)
---

# Git Init & First Commit

Initialize a Git repository and create your first commit following best practices.

## When to use this skill

- Starting a new project that needs version control
- Converting an existing directory into a Git repository
- User explicitly asks to initialize Git or setup version control

## Instructions

When this skill is invoked, follow these steps:

### 1. Initialize the repository

```bash
git init
```

Configure the repository with appropriate user information:

```bash
git config user.name "Project Author"
git config user.email "author@example.com"
```

### 2. Set the default branch to main

Modern Git uses `main` instead of `master`:

```bash
git branch -m main
```

### 3. Check current status

Before committing, show what files exist:

```bash
git status
```

### 4. Stage files appropriately

- Review the files in the directory
- Add appropriate files (exclude build artifacts, dependencies, etc.)
- If a `.gitignore` exists, respect it

```bash
git add <files>
```

### 5. Create the initial commit

Write a clear, descriptive commit message:

```bash
git commit -m "Initial commit: <brief description of project>

<optional detailed description>
"
```

## Best Practices

1. **Always configure user info** before committing
2. **Use 'main' as default branch** (modern standard)
3. **Review files before staging** - don't blindly `git add .`
4. **Write meaningful commit messages** - describe what the project is
5. **Verify success** with `git log` and `git status`

## Example Output

After running this skill, you should see:

```
Initialized empty Git repository in /path/to/project/.git/
[main (root-commit) abc123] Initial commit: Add project structure
 5 files changed, 150 insertions(+)
 create mode 100644 README.md
 create mode 100644 package.json
 ...
```

## Common Issues

**Problem**: "Please tell me who you are"
**Solution**: Run git config commands to set user.name and user.email

**Problem**: Files I don't want are being tracked
**Solution**: Create or update .gitignore before running git add
