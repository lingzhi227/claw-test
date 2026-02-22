#!/bin/bash
# Git Skill #7: Diff Operations
# Description: View differences between commits, branches, files

set -e

echo "=== Git Skill: Diff Operations ==="

# Create changes for diffing
create_changes() {
    echo "→ Creating changes for diff..."
    echo "Line 1" >> test.txt
    echo "Line 2" >> test.txt
    echo "✓ Changes created"
}

# Show unstaged changes
show_unstaged_diff() {
    echo "→ Showing unstaged changes..."
    git diff test.txt
    echo "✓ Unstaged diff displayed"
}

# Stage and show staged changes
show_staged_diff() {
    echo "→ Staging changes..."
    git add test.txt
    echo "→ Showing staged changes..."
    git diff --cached test.txt
    echo "✓ Staged diff displayed"
}

# Commit and show diff between commits
commit_and_diff() {
    echo "→ Committing changes..."
    git commit -m "Add lines to test.txt"
    echo "→ Showing diff between last two commits..."
    git diff HEAD~1 HEAD
    echo "✓ Commit diff displayed"
}

# Show diff stats
show_diff_stats() {
    echo "→ Showing diff statistics..."
    git diff --stat HEAD~1 HEAD
    echo "✓ Diff stats displayed"
}

# Main execution
main() {
    create_changes
    show_unstaged_diff
    show_staged_diff
    commit_and_diff
    show_diff_stats
    echo "✅ Diff Operations skill completed successfully!"
}

main "$@"
