#!/bin/bash
# Git Skill #8: Cherry-Pick
# Description: Apply specific commits from one branch to another

set -e

echo "=== Git Skill: Cherry-Pick ==="

# Create a feature branch with commits
create_feature_branch() {
    echo "→ Creating feature branch..."
    git checkout -b feature/cherry-pick-test
    echo "Feature A" > feature-a.txt
    git add feature-a.txt
    git commit -m "Add feature A"

    echo "Feature B" > feature-b.txt
    git add feature-b.txt
    git commit -m "Add feature B"

    CHERRY_COMMIT=$(git rev-parse HEAD)
    echo "✓ Feature branch created with commits"
}

# Switch back to main
switch_to_main() {
    echo "→ Switching to main..."
    git checkout main 2>/dev/null || git checkout master
    echo "✓ Switched to main"
}

# Cherry-pick specific commit
cherry_pick_commit() {
    echo "→ Cherry-picking commit..."
    git cherry-pick $CHERRY_COMMIT
    echo "✓ Commit cherry-picked"
}

# Verify cherry-pick
verify_cherry_pick() {
    echo "→ Verifying cherry-pick..."
    ls -la *.txt
    git log --oneline -3
    echo "✓ Cherry-pick verified"
}

# Cleanup
cleanup() {
    echo "→ Cleaning up test branch..."
    git branch -D feature/cherry-pick-test
    echo "✓ Cleanup completed"
}

# Main execution
main() {
    create_feature_branch
    switch_to_main
    cherry_pick_commit
    verify_cherry_pick
    cleanup
    echo "✅ Cherry-Pick skill completed successfully!"
}

main "$@"
