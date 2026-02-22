# Installation Guide

## Install Git Skills for Claude Code

These skills extend Claude Code with Git workflow capabilities following the Agent Skills open standard.

### Method 1: Install to Personal Skills (Recommended)

Install skills globally for all your projects:

```bash
# Clone the repository
git clone https://github.com/lingzhi227/claw-test.git

# Copy skills to your personal skills directory
cp -r claw-test/skills/* ~/.claude/skills/

# Verify installation
ls ~/.claude/skills/
```

You should see:
```
git-branch-merge/
git-cherry-pick/
git-commit/
git-diff/
git-init-commit/
git-rebase/
git-stash/
git-tag/
```

### Method 2: Install to Project

Install skills for a specific project only:

```bash
cd your-project

# Create skills directory if it doesn't exist
mkdir -p .claude/skills

# Copy skills
cp -r /path/to/claw-test/skills/* .claude/skills/

# Verify
ls .claude/skills/
```

### Method 3: Symlink (For Development)

Link skills for easy updates:

```bash
# Clone repository
git clone https://github.com/lingzhi227/claw-test.git ~/claw-test

# Create symlinks
cd ~/.claude/skills
ln -s ~/claw-test/skills/* .
```

## Verify Installation

### Check Skills are Loaded

Open Claude Code and ask:

```
What Git skills are available?
```

Claude should list all 8 Git skills:
- `git-init-commit` - Initialize repository and first commit
- `git-branch-merge` - Branching and merging workflows
- `git-stash` - Temporarily save uncommitted changes
- `git-commit` - Create commits with best practices
- `git-tag` - Create and manage release tags
- `git-diff` - View differences between commits
- `git-cherry-pick` - Apply specific commits across branches
- `git-rebase` - Rewrite commit history

### Test a Skill

Create a test directory and try initializing Git:

```bash
mkdir ~/test-git-skills
cd ~/test-git-skills
```

In Claude Code:
```
Initialize a Git repository in this directory
```

Claude should use the `git-init-commit` skill to properly initialize Git with best practices.

## Using the Skills

### Automatic Invocation

Claude automatically uses these skills when relevant:

```
User: "Create a feature branch for user authentication"
Claude: *uses git-branch-merge skill*

User: "I need to switch branches but have uncommitted changes"
Claude: *uses git-stash skill*
```

### Manual Invocation

Invoke skills directly with slash commands:

```
/git-init-commit
/git-branch-merge
/git-stash
/git-commit
/git-tag
/git-diff
/git-cherry-pick
/git-rebase
```

### With Arguments

Pass arguments to skills:

```
/git-commit "Add user authentication feature"
/git-tag v1.0.0
/git-cherry-pick abc123
```

## Configuration

### Grant Git Permissions

For Claude to execute Git commands automatically, allow Bash(git *) in permissions:

Create or edit `~/.claude/permissions.json`:

```json
{
  "allow": [
    "Bash(git *)"
  ]
}
```

Or allow on a per-session basis when Claude requests.

### Customize Skills

Edit skill files to match your workflow:

```bash
# Edit a skill
code ~/.claude/skills/git-commit/SKILL.md
```

Changes take effect immediately - Claude loads skills dynamically.

## Troubleshooting

### Skills Not Showing Up

**Issue**: Claude doesn't see the skills

**Solutions**:
1. Check skills are in correct location: `ls ~/.claude/skills/`
2. Each skill needs `SKILL.md` file
3. Restart Claude Code
4. Ask Claude: "What skills are available?"

### Skills Not Executing Git Commands

**Issue**: Claude shows skill but doesn't run Git commands

**Solutions**:
1. Grant `Bash(git *)` permission
2. Ensure Git is installed: `git --version`
3. Check you're in a suitable directory

### Permission Denied

**Issue**: Can't copy files to `~/.claude/skills/`

**Solution**: Create directory first:
```bash
mkdir -p ~/.claude/skills
chmod 755 ~/.claude/skills
```

## Uninstallation

### Remove All Git Skills

```bash
rm -rf ~/.claude/skills/git-*
```

### Remove Specific Skill

```bash
rm -rf ~/.claude/skills/git-commit
```

## Updating Skills

### Pull Latest Changes

If installed via symlink:

```bash
cd ~/claw-test
git pull
```

If copied directly:

```bash
cd ~/claw-test
git pull
cp -r skills/* ~/.claude/skills/
```

## Next Steps

- See [USAGE.md](USAGE.md) for detailed usage examples
- See [SKILL.md](skills/*/SKILL.md) files for individual skill documentation
- Create your own custom Git skills following the same pattern

## Support

- **Repository**: https://github.com/lingzhi227/claw-test
- **Issues**: https://github.com/lingzhi227/claw-test/issues
- **Documentation**: https://code.claude.com/docs/en/skills
