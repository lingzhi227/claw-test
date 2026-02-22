#!/bin/bash
# Git Skill #5: Tagging
# Description: Create, list, and manage tags

set -e

echo "=== Git Skill: Tagging ==="

# Create lightweight tag
create_lightweight_tag() {
    echo "→ Creating lightweight tag..."
    git tag v0.1.0
    echo "✓ Lightweight tag created"
}

# Create annotated tag
create_annotated_tag() {
    echo "→ Creating annotated tag..."
    git tag -a v0.2.0 -m "Release version 0.2.0"
    echo "✓ Annotated tag created"
}

# List all tags
list_tags() {
    echo "→ Listing all tags..."
    git tag
    echo "✓ Tags listed"
}

# Show tag information
show_tag_info() {
    echo "→ Showing tag information..."
    git show v0.2.0
    echo "✓ Tag information displayed"
}

# Delete a tag
delete_tag() {
    echo "→ Deleting tag..."
    git tag -d v0.1.0
    echo "✓ Tag deleted"
}

# Main execution
main() {
    create_lightweight_tag
    create_annotated_tag
    list_tags
    show_tag_info
    delete_tag
    echo "✅ Tagging skill completed successfully!"
}

main "$@"
