#!/bin/bash
# Git Skill #4: Stash Operations
# Description: Save work temporarily, apply stashed changes

set -e

echo "=== Git Skill: Stash Operations ==="

# Create uncommitted changes
create_uncommitted_changes() {
    echo "→ Creating uncommitted changes..."
    echo "Work in progress" > wip.txt
    git add wip.txt
    echo "Modified content" >> test.txt
    echo "✓ Uncommitted changes created"
}

# Stash changes
stash_changes() {
    echo "→ Stashing changes..."
    git stash save "WIP: Testing stash functionality"
    echo "✓ Changes stashed"
}

# List stashes
list_stashes() {
    echo "→ Listing stashes..."
    git stash list
    echo "✓ Stashes listed"
}

# Show stash content
show_stash() {
    echo "→ Showing stash content..."
    git stash show
    echo "✓ Stash content displayed"
}

# Apply stash
apply_stash() {
    echo "→ Applying stash..."
    git stash pop
    echo "✓ Stash applied and removed"
}

# Commit the changes
commit_changes() {
    echo "→ Committing previously stashed changes..."
    git add .
    git commit -m "Add WIP changes from stash"
    echo "✓ Changes committed"
}

# Main execution
main() {
    create_uncommitted_changes
    stash_changes
    list_stashes
    show_stash
    apply_stash
    commit_changes
    echo "✅ Stash Operations skill completed successfully!"
}

main "$@"
