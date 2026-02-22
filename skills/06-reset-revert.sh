#!/bin/bash
# Git Skill #6: Reset and Revert
# Description: Undo changes using reset and revert

set -e

echo "=== Git Skill: Reset and Revert ==="

# Create a commit to revert
create_test_commit() {
    echo "→ Creating test commit..."
    echo "Bad change" > bad.txt
    git add bad.txt
    git commit -m "Add bad change (will be reverted)"
    echo "✓ Test commit created"
}

# Revert the commit
revert_commit() {
    echo "→ Reverting last commit..."
    git revert HEAD --no-edit
    echo "✓ Commit reverted"
}

# Create another test file
create_another_file() {
    echo "→ Creating another test file..."
    echo "Another file" > another.txt
    git add another.txt
    git commit -m "Add another file"
    echo "✓ Another file committed"
}

# Soft reset (keep changes in staging)
soft_reset() {
    echo "→ Testing soft reset..."
    git reset --soft HEAD~1
    echo "✓ Soft reset completed (changes still staged)"
}

# Re-commit the changes
recommit_changes() {
    echo "→ Re-committing changes..."
    git commit -m "Re-add another file after soft reset"
    echo "✓ Changes re-committed"
}

# Show current status
show_status() {
    echo "→ Showing current status..."
    git log --oneline -5
    echo "✓ Status displayed"
}

# Main execution
main() {
    create_test_commit
    revert_commit
    create_another_file
    soft_reset
    recommit_changes
    show_status
    echo "✅ Reset and Revert skill completed successfully!"
}

main "$@"
