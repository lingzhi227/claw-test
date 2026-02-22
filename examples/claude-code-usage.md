# Claude Code Usage Examples

## Configuration

### Grant Full Bypass Permissions

In your Claude Code configuration:

```json
{
  "dangerouslyBypassPermissions": true,
  "autoApproveGitCommands": true
}
```

## Example Sessions

### Session 1: Run All Tests

**User:**
```
Test all Git skills in the claw-test repository
```

**Claude Code:**
```bash
cd claw-test
npm test
```

**Expected Output:**
```
🚀 Git Skills Test Suite
Testing all Git skills for Claude Code

Found 8 skill scripts to test

[... test execution ...]

============================================================
TEST SUMMARY
============================================================
Total Skills: 8
Passed: 8
Failed: 0

🎉 ALL TESTS PASSED! 🎉
```

### Session 2: Test Individual Skill

**User:**
```
Test the branching and merging skill
```

**Claude Code:**
```bash
cd claw-test
mkdir -p test-workspace
cd test-workspace
bash ../skills/02-branching-merging.sh
```

### Session 3: Validate Git Operations

**User:**
```
Validate all Git operations are working correctly
```

**Claude Code:**
```bash
cd claw-test
npm test

# If all tests pass:
echo "✅ All Git operations validated successfully"

# Check for any failures:
if [ $? -eq 0 ]; then
  echo "Ready for production use"
fi
```

### Session 4: Learn Specific Git Skill

**User:**
```
Show me how to use git stash
```

**Claude Code:**
```bash
cd claw-test
cat skills/04-stash-operations.sh

# Run the skill to demonstrate
mkdir -p demo
cd demo
bash ../skills/04-stash-operations.sh
```

## Integration with CI/CD

### GitHub Actions Example

```yaml
name: Test Git Skills

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v2
        with:
          node-version: '14'
      - run: npm install
      - run: npm test
```

### GitLab CI Example

```yaml
test-git-skills:
  image: node:14
  script:
    - npm install
    - npm test
```

## Advanced Usage

### Custom Test Scenarios

```bash
# Test only basic skills
bash skills/01-basic-operations.sh

# Test only advanced skills
bash skills/06-reset-revert.sh
bash skills/07-diff-operations.sh
bash skills/08-cherry-pick.sh

# Chain multiple skills
for skill in skills/{01,02,03}-*.sh; do
  bash "$skill"
done
```

### Debugging Failed Tests

```bash
# Run with verbose output
set -x
bash skills/XX-skill-name.sh
set +x

# Check Git status after test
cd test-workspace
git status
git log --oneline
```

## Tips for Claude Code

1. **Always use bypass permissions** for automated testing
2. **Run tests in isolated workspace** to avoid conflicts
3. **Check exit codes** to validate success
4. **Use color output** for better readability
5. **Clean up test workspace** after testing

## Troubleshooting

### Issue: Permission Denied

```bash
# Make scripts executable
chmod +x skills/*.sh
```

### Issue: Git Not Configured

```bash
# Configure Git for testing
git config --global user.name "Claude Test"
git config --global user.email "claude@test.com"
```

### Issue: Test Workspace Exists

```bash
# Clean up before testing
rm -rf test-workspace
mkdir test-workspace
```
