#!/bin/bash
# Git Skill #2: Branching and Merging
# Description: Create branches, switch between them, merge changes

set -e

echo "=== Git Skill: Branching and Merging ==="

# Create and switch to new branch
create_branch() {
    echo "→ Creating feature branch..."
    git checkout -b feature/test-feature
    echo "✓ Switched to feature/test-feature"
}

# Make changes on feature branch
make_feature_changes() {
    echo "→ Making changes on feature branch..."
    echo "Feature content" > feature.txt
    git add feature.txt
    git commit -m "Add feature.txt"
    echo "✓ Feature changes committed"
}

# Switch back to main/master
switch_to_main() {
    echo "→ Switching to main branch..."
    git checkout main 2>/dev/null || git checkout master
    echo "✓ Switched to main branch"
}

# Merge feature branch
merge_feature() {
    echo "→ Merging feature branch..."
    git merge feature/test-feature -m "Merge feature branch"
    echo "✓ Feature branch merged"
}

# List all branches
list_branches() {
    echo "→ Listing all branches..."
    git branch -a
    echo "✓ Branches listed"
}

# Delete feature branch
delete_branch() {
    echo "→ Deleting feature branch..."
    git branch -d feature/test-feature
    echo "✓ Feature branch deleted"
}

# Main execution
main() {
    create_branch
    make_feature_changes
    switch_to_main
    merge_feature
    list_branches
    delete_branch
    echo "✅ Branching and Merging skill completed successfully!"
}

main "$@"
