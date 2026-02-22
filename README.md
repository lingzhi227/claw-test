# 🧠 Git Skills Suite for Claude Code

**Professional Git workflow skills following the Agent Skills open standard**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Agent Skills](https://img.shields.io/badge/Agent-Skills-blue.svg)](https://agentskills.io)
[![Claude Code](https://img.shields.io/badge/Claude-Code-purple.svg)](https://code.claude.com)

## 🎯 Overview

A comprehensive collection of 8 Git workflow skills that extend Claude Code with expert Git capabilities. Each skill follows the Agent Skills open standard and can be invoked automatically by Claude or manually by you.

### What are Agent Skills?

Agent Skills are modular capabilities that extend AI agents like Claude. Each skill packages instructions and best practices that Claude uses automatically when relevant. These skills follow the [Agent Skills open standard](https://agentskills.io) and work across Claude Code, Codex CLI, and ChatGPT.

## ✨ Features

- 📦 **8 Professional Git Skills** - From basics to advanced workflows
- 🤖 **Auto-invocation** - Claude uses skills automatically when needed
- ⌨️ **Slash Commands** - Invoke skills directly (`/git-commit`, `/git-stash`, etc.)
- 🔧 **Best Practices Built-in** - Follow industry standards automatically
- 📚 **Comprehensive Documentation** - Each skill includes detailed guidelines
- 🔄 **Open Standard** - Compatible with multiple AI platforms

## 📦 Available Skills

| Skill | Slash Command | Description |
|-------|--------------|-------------|
| **Git Init** | `/git-init-commit` | Initialize repository and create first commit with best practices |
| **Branch & Merge** | `/git-branch-merge` | Create, switch, and merge branches following Git Flow |
| **Stash** | `/git-stash` | Temporarily save and restore uncommitted changes |
| **Commit** | `/git-commit` | Create commits following Conventional Commits format |
| **Tag** | `/git-tag` | Create and manage release tags with semantic versioning |
| **Diff** | `/git-diff` | Compare changes across commits, branches, and files |
| **Cherry-Pick** | `/git-cherry-pick` | Apply specific commits across branches |
| **Rebase** | `/git-rebase` | Rewrite history for cleaner, linear timeline |

## 🚀 Quick Start

### Installation

**Option 1: Install Globally (Recommended)**

Install for all your projects:

```bash
git clone https://github.com/lingzhi227/claw-test.git
cp -r claw-test/skills/* ~/.claude/skills/
```

**Option 2: Install Per-Project**

Install for a specific project:

```bash
cd your-project
mkdir -p .claude/skills
cp -r /path/to/claw-test/skills/* .claude/skills/
```

**Option 3: Symlink for Development**

```bash
git clone https://github.com/lingzhi227/claw-test.git ~/claw-test
cd ~/.claude/skills
ln -s ~/claw-test/skills/* .
```

### Verification

Open Claude Code and ask:
```
What Git skills are available?
```

You should see all 8 Git skills listed!

## 💡 Usage

### Automatic Invocation

Claude automatically uses skills when relevant:

```
You: "Create a feature branch for user authentication"
Claude: *uses git-branch-merge skill*

You: "I need to commit these changes"
Claude: *uses git-commit skill with Conventional Commits format*

You: "Switch branches but I have uncommitted work"
Claude: *uses git-stash skill*
```

### Manual Invocation

Invoke skills directly with slash commands:

```
/git-init-commit
/git-branch-merge
/git-commit "Add authentication feature"
/git-tag v1.0.0
```

### Example Workflows

**Starting a New Project**:
```
You: Initialize Git in this directory

Claude uses /git-init-commit:
- Initializes repository
- Configures user info
- Sets default branch to main
- Reviews files to stage
- Creates meaningful first commit
```

**Feature Development**:
```
You: Create a branch for the login feature

Claude uses /git-branch-merge:
- Creates feature/login branch
- Switches to new branch
- Explains workflow for committing and merging
```

**Release Tagging**:
```
You: Tag this as version 1.0.0

Claude uses /git-tag:
- Creates annotated tag
- Follows semantic versioning
- Includes release notes
- Shows how to push tag
```

## 📖 Documentation

- **[INSTALLATION.md](INSTALLATION.md)** - Detailed installation guide
- **[Skills Documentation](skills/)** - Individual skill SKILL.md files
- **Skill Features**:
  - YAML frontmatter configuration
  - Allowed tools specification
  - Best practices and examples
  - Common issue troubleshooting

## 🛠️ Configuration

### Grant Git Permissions

Allow Claude to run Git commands automatically:

Create `~/.claude/permissions.json`:

```json
{
  "allow": [
    "Bash(git *)"
  ]
}
```

### Customize Skills

Edit any skill to match your workflow:

```bash
code ~/.claude/skills/git-commit/SKILL.md
```

Changes take effect immediately!

## 🎨 Skill Features

Each skill includes:

- **✅ YAML Frontmatter** - Metadata and configuration
- **✅ Clear Description** - When and how to use
- **✅ Best Practices** - Industry-standard workflows
- **✅ Examples** - Real-world usage scenarios
- **✅ Troubleshooting** - Common issues and solutions
- **✅ Tool Permissions** - Scoped Bash(git *) access

## 🏗️ Project Structure

```
claw-test/
├── skills/                       # Agent Skills
│   ├── git-init-commit/
│   │   └── SKILL.md             # Initialize repo skill
│   ├── git-branch-merge/
│   │   └── SKILL.md             # Branching workflow
│   ├── git-stash/
│   │   └── SKILL.md             # Stash operations
│   ├── git-commit/
│   │   └── SKILL.md             # Commit best practices
│   ├── git-tag/
│   │   └── SKILL.md             # Release tagging
│   ├── git-diff/
│   │   └── SKILL.md             # Diff operations
│   ├── git-cherry-pick/
│   │   └── SKILL.md             # Cherry-pick commits
│   └── git-rebase/
│       └── SKILL.md             # Rebase operations
├── INSTALLATION.md              # Installation guide
├── README.md                    # This file
├── LICENSE                      # MIT License
└── test-skills.sh              # Validation script
```

## 🧪 Testing

Validate skill structure:

```bash
./test-skills.sh
```

Expected output:
```
✅ All skills passed validation!

Total skills: 8
Errors: 0
```

## 🤝 Contributing

Contributions welcome! To add a new skill:

1. Create skill directory: `skills/your-skill/`
2. Add `SKILL.md` with YAML frontmatter
3. Follow existing skill patterns
4. Run `./test-skills.sh` to validate
5. Submit a pull request

## 📝 Skill Template

```yaml
---
name: skill-name
description: What this skill does and when to use it
allowed-tools: Bash(git *)
---

# Skill Name

Detailed instructions and best practices...

## When to use
## Instructions
## Best Practices
## Examples
```

## 🏷️ Version

**Current Version:** 2.0.0

### What's New in 2.0

- ✨ Complete rewrite as Agent Skills
- 🎯 Follow Agent Skills open standard
- 🤖 Auto-invocation by Claude
- ⌨️ Slash command support
- 📚 Enhanced documentation
- 🧪 Validation framework

### Migration from 1.x

Version 1.x used shell scripts. Version 2.x uses Agent Skills (SKILL.md format).

**To upgrade**:
1. Remove old shell scripts
2. Install new skills from `skills/` directory
3. Skills are now invoked by Claude automatically

## 📚 Resources

- **[Claude Code Skills Documentation](https://code.claude.com/docs/en/skills)**
- **[Agent Skills Standard](https://agentskills.io)**
- **[Anthropic Skills Repository](https://github.com/anthropics/skills)**
- **[Git Documentation](https://git-scm.com/doc)**

## Sources

Research and implementation based on:
- [Extend Claude with skills - Claude Code Docs](https://code.claude.com/docs/en/skills)
- [Agent Skills - Claude API Docs](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)
- [GitHub - anthropics/skills](https://github.com/anthropics/skills)
- [Skills explained: How Skills compares to prompts, Projects, MCP, and subagents | Claude](https://claude.com/blog/skills-explained)

## 📧 Support

- **Issues**: [GitHub Issues](https://github.com/lingzhi227/claw-test/issues)
- **Documentation**: [Installation Guide](INSTALLATION.md)
- **Skills**: Browse `skills/*/SKILL.md` for individual documentation

## 📄 License

MIT License - see [LICENSE](LICENSE) file

## 🌟 Acknowledgments

- Built following [Agent Skills](https://agentskills.io) open standard
- Designed for [Claude Code](https://code.claude.com)
- Compatible with Codex CLI and ChatGPT
- Inspired by professional Git workflows

---

**Made with ❤️ for Claude Code**

*Extend your AI with professional Git workflows*
