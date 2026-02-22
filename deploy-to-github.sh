#!/bin/bash
# Quick deployment script for claw-test repository
# This script helps deploy to GitHub

set -e

echo "🚀 Claw Test - GitHub Deployment Script"
echo "========================================"
echo ""

# Check if we're in the right directory
if [ ! -f "package.json" ] || [ ! -d "skills" ]; then
    echo "❌ Error: Please run this script from the claw-test directory"
    exit 1
fi

# Check if git is configured
if ! git config user.name > /dev/null 2>&1; then
    echo "⚠️  Git user not configured. Configuring now..."
    git config user.name "Claw AI"
    git config user.email "claw@ai.assistant"
fi

# Get GitHub username
echo "Please enter your GitHub username:"
read GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ Error: GitHub username is required"
    exit 1
fi

echo ""
echo "📝 Deployment Plan:"
echo "  Repository: https://github.com/$GITHUB_USERNAME/claw-test"
echo "  Branch: main"
echo "  Tag: v0.1.0"
echo ""
echo "Press Enter to continue, or Ctrl+C to cancel..."
read

# Update README with actual username
echo "→ Updating README with GitHub username..."
sed -i "s/YOUR_USERNAME/$GITHUB_USERNAME/g" README.md
sed -i "s/YOUR_USERNAME/$GITHUB_USERNAME/g" examples/claude-code-usage.md

# Commit the changes
git add README.md examples/claude-code-usage.md
git commit -m "docs: Update README with GitHub username" || echo "No changes to commit"

# Add remote
echo "→ Adding GitHub remote..."
git remote add origin "https://github.com/$GITHUB_USERNAME/claw-test.git" 2>/dev/null || \
    echo "Remote already exists, updating URL..."
git remote set-url origin "https://github.com/$GITHUB_USERNAME/claw-test.git"

echo ""
echo "✅ Repository configured!"
echo ""
echo "Next steps:"
echo ""
echo "1. Create the repository on GitHub:"
echo "   Visit: https://github.com/new"
echo "   - Repository name: claw-test"
echo "   - Description: Comprehensive Git Skills Suite for Claude Code Testing"
echo "   - Make it public"
echo "   - Do NOT initialize with README"
echo ""
echo "2. After creating the repository, run:"
echo "   git push -u origin main"
echo "   git push --tags"
echo ""
echo "3. Create a release on GitHub:"
echo "   - Go to: https://github.com/$GITHUB_USERNAME/claw-test/releases/new"
echo "   - Tag: v0.1.0"
echo "   - Title: Release v0.1.0 - Git Skills Suite"
echo "   - Copy description from DEPLOYMENT.md"
echo ""
echo "Or, if you have GitHub CLI installed:"
echo "   gh repo create claw-test --public --source=. --remote=origin --push"
echo "   gh release create v0.1.0 --title 'Release v0.1.0' --notes-file DEPLOYMENT.md"
echo ""
