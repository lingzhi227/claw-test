# 🧪 Claw Test - Git Skills Suite

A comprehensive Git skills testing framework designed for Claude Code automation and AI-assisted development workflows.

## 🎯 Overview

This repository contains a complete suite of Git skills that can be used to:
- **Test Claude Code's Git capabilities** with full automation
- **Teach AI assistants** advanced Git workflows
- **Validate Git operations** in CI/CD pipelines
- **Learn Git** through practical, executable examples

## 📦 Features

✅ **8 Comprehensive Git Skills:**
1. Basic Operations (init, add, commit, status, log)
2. Branching and Merging (create, switch, merge, delete branches)
3. Remote Operations (add, list, show, rename, remove remotes)
4. Stash Operations (save, list, show, apply stashed changes)
5. Tagging (lightweight tags, annotated tags, list, show, delete)
6. Reset and Revert (undo changes, revert commits)
7. Diff Operations (view changes, compare commits)
8. Cherry-Pick (apply specific commits across branches)

✅ **Automated Testing Framework:**
- Single-command test execution
- Isolated test workspace
- Detailed pass/fail reporting
- Color-coded output

✅ **Claude Code Ready:**
- Full bypass permissions configuration
- Automated test scripts
- Clear skill documentation
- Ready for AI integration

## 🚀 Quick Start

### Installation

```bash
git clone https://github.com/YOUR_USERNAME/claw-test.git
cd claw-test
npm install
```

### Run All Tests

```bash
npm test
```

### Run Individual Skills

```bash
# Make scripts executable
chmod +x skills/*.sh

# Run a specific skill
cd test-workspace
bash ../skills/01-basic-operations.sh
```

## 📚 Skill Details

### Skill 1: Basic Operations
**File:** `skills/01-basic-operations.sh`

Learn fundamental Git operations:
- Initialize a repository
- Add and commit files
- Check repository status
- View commit history

**Usage:**
```bash
bash skills/01-basic-operations.sh
```

### Skill 2: Branching and Merging
**File:** `skills/02-branching-merging.sh`

Master branch management:
- Create new branches
- Switch between branches
- Merge branches
- Delete branches

**Usage:**
```bash
bash skills/02-branching-merging.sh
```

### Skill 3: Remote Operations
**File:** `skills/03-remote-operations.sh`

Handle remote repositories:
- Add remote repositories
- List and show remotes
- Rename remotes
- Remove remotes

**Usage:**
```bash
bash skills/03-remote-operations.sh
```

### Skill 4: Stash Operations
**File:** `skills/04-stash-operations.sh`

Manage temporary work:
- Stash uncommitted changes
- List stashes
- Apply stashed changes
- Pop stashes

**Usage:**
```bash
bash skills/04-stash-operations.sh
```

### Skill 5: Tagging
**File:** `skills/05-tagging.sh`

Create and manage tags:
- Create lightweight tags
- Create annotated tags
- List tags
- Delete tags

**Usage:**
```bash
bash skills/05-tagging.sh
```

### Skill 6: Reset and Revert
**File:** `skills/06-reset-revert.sh`

Undo changes safely:
- Revert commits
- Soft reset
- Hard reset
- Amend commits

**Usage:**
```bash
bash skills/06-reset-revert.sh
```

### Skill 7: Diff Operations
**File:** `skills/07-diff-operations.sh`

Compare changes:
- View unstaged changes
- View staged changes
- Compare commits
- Show diff statistics

**Usage:**
```bash
bash skills/07-diff-operations.sh
```

### Skill 8: Cherry-Pick
**File:** `skills/08-cherry-pick.sh`

Apply specific commits:
- Cherry-pick commits across branches
- Verify cherry-picked changes
- Handle conflicts

**Usage:**
```bash
bash skills/08-cherry-pick.sh
```

## 🤖 Using with Claude Code

### Grant Full Permissions

To test with Claude Code using bypass permissions:

```json
{
  "dangerouslyBypassPermissions": true
}
```

### Example Claude Code Session

```
User: "Test all Git skills in claw-test repo"

Claude: *runs npm test*
- ✅ All 8 skills passed
- 📊 100% success rate
- 🎉 Git operations validated
```

### Integration Examples

**Example 1: Automated Testing**
```bash
# Claude Code can run this automatically
npm test && echo "All Git skills verified!"
```

**Example 2: Skill-by-Skill Validation**
```bash
# Test each skill individually
for skill in skills/*.sh; do
    echo "Testing $skill..."
    bash "$skill" && echo "✅ Passed"
done
```

## 🧪 Testing

### Run All Tests
```bash
npm test
```

### Run Specific Test Categories
```bash
npm run test:basic      # Basic Git operations
npm run test:branching  # Branching and merging
npm run test:advanced   # Advanced operations
```

### Test Output

```
🚀 Git Skills Test Suite
Testing all Git skills for Claude Code

Found 8 skill scripts to test

============================================================
Testing: 01-basic-operations
============================================================
=== Git Skill: Basic Operations ===
→ Initializing Git repository...
✓ Repository initialized
→ Creating test file...
→ Staging file...
→ Committing changes...
✓ File committed successfully
✅ Basic Operations skill completed successfully!

✅ 01-basic-operations PASSED

[... more tests ...]

============================================================
TEST SUMMARY
============================================================
Total Skills: 8
Passed: 8
Failed: 0

============================================================
🎉 ALL TESTS PASSED! 🎉
```

## 📁 Project Structure

```
claw-test/
├── skills/                    # Git skill scripts
│   ├── 01-basic-operations.sh
│   ├── 02-branching-merging.sh
│   ├── 03-remote-operations.sh
│   ├── 04-stash-operations.sh
│   ├── 05-tagging.sh
│   ├── 06-reset-revert.sh
│   ├── 07-diff-operations.sh
│   └── 08-cherry-pick.sh
├── test/                      # Test framework
│   └── run-all-tests.js
├── examples/                  # Usage examples
├── package.json
├── README.md
└── LICENSE
```

## 🎯 Use Cases

1. **AI Development Testing**: Validate Claude Code's Git capabilities
2. **Learning Git**: Interactive, executable Git tutorials
3. **CI/CD Validation**: Automated Git workflow testing
4. **Development Onboarding**: Quick Git skill verification
5. **Integration Testing**: Test Git automation tools

## 🛠️ Requirements

- **Git**: 2.0 or higher
- **Node.js**: 14.0 or higher (for test runner)
- **Bash**: 4.0 or higher

## 📝 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions welcome! Please feel free to submit a Pull Request.

### Adding New Skills

1. Create a new script in `skills/` directory
2. Follow the naming convention: `XX-skill-name.sh`
3. Include clear documentation and comments
4. Add test validation
5. Update README.md

## 🏷️ Version

**Current Version:** 0.1.0

## 📧 Contact

Created by Claw AI Assistant

## 🌟 Acknowledgments

- Designed for Claude Code testing
- Built with automation in mind
- Inspired by real-world Git workflows

---

**Happy Git-ing! 🚀**
