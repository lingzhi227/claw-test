#!/bin/bash
# Git Skill #1: Basic Operations
# Description: Initialize repo, add files, commit changes

set -e

echo "=== Git Skill: Basic Operations ==="

# Initialize repository
git_init() {
    echo "→ Initializing Git repository..."
    git init
    git config user.name "Claw Test"
    git config user.email "claw@test.com"
    echo "✓ Repository initialized"
}

# Add and commit files
git_add_commit() {
    echo "→ Creating test file..."
    echo "Hello World" > test.txt

    echo "→ Staging file..."
    git add test.txt

    echo "→ Committing changes..."
    git commit -m "Initial commit: Add test.txt"
    echo "✓ File committed successfully"
}

# Check status
git_status_check() {
    echo "→ Checking repository status..."
    git status
    echo "✓ Status checked"
}

# View commit history
git_log_check() {
    echo "→ Viewing commit history..."
    git log --oneline
    echo "✓ Log displayed"
}

# Main execution
main() {
    git_init
    git_add_commit
    git_status_check
    git_log_check
    echo "✅ Basic Operations skill completed successfully!"
}

main "$@"
