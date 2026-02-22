#!/bin/bash
# Test script to validate Agent Skills structure and installation

set -e

echo "🧪 Testing Agent Skills Structure"
echo "=================================="
echo ""

SKILLS_DIR="./skills"
ERRORS=0

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check skills directory exists
if [ ! -d "$SKILLS_DIR" ]; then
    echo -e "${RED}❌ Skills directory not found${NC}"
    exit 1
fi

echo "📁 Found skills directory"
echo ""

# Find all SKILL.md files
SKILLS=$(find "$SKILLS_DIR" -name "SKILL.md" | sort)
SKILL_COUNT=$(echo "$SKILLS" | wc -l)

echo "Found $SKILL_COUNT skills:"
echo ""

# Test each skill
for SKILL_FILE in $SKILLS; do
    SKILL_DIR=$(dirname "$SKILL_FILE")
    SKILL_NAME=$(basename "$SKILL_DIR")

    echo "Testing: $SKILL_NAME"
    echo "  File: $SKILL_FILE"

    # Check SKILL.md exists and is readable
    if [ ! -r "$SKILL_FILE" ]; then
        echo -e "  ${RED}❌ SKILL.md not readable${NC}"
        ((ERRORS++))
        continue
    fi

    # Check for YAML frontmatter
    if ! grep -q "^---" "$SKILL_FILE"; then
        echo -e "  ${YELLOW}⚠️  No YAML frontmatter found${NC}"
    else
        echo -e "  ${GREEN}✓${NC} Has YAML frontmatter"
    fi

    # Check for 'name' field
    if grep -q "^name:" "$SKILL_FILE"; then
        NAME=$(grep "^name:" "$SKILL_FILE" | head -1 | cut -d ':' -f 2 | xargs)
        echo -e "  ${GREEN}✓${NC} Name: $NAME"
    else
        echo -e "  ${YELLOW}⚠️  No 'name' field (will use directory name)${NC}"
    fi

    # Check for 'description' field
    if grep -q "^description:" "$SKILL_FILE"; then
        echo -e "  ${GREEN}✓${NC} Has description"
    else
        echo -e "  ${YELLOW}⚠️  No description field${NC}"
    fi

    # Check for 'allowed-tools' field
    if grep -q "^allowed-tools:" "$SKILL_FILE"; then
        TOOLS=$(grep "^allowed-tools:" "$SKILL_FILE" | cut -d ':' -f 2 | xargs)
        echo -e "  ${GREEN}✓${NC} Allowed tools: $TOOLS"
    fi

    # Check file size (should have actual content)
    FILE_SIZE=$(wc -c < "$SKILL_FILE")
    if [ "$FILE_SIZE" -lt 100 ]; then
        echo -e "  ${RED}❌ File too small ($FILE_SIZE bytes)${NC}"
        ((ERRORS++))
    else
        echo -e "  ${GREEN}✓${NC} File size: $FILE_SIZE bytes"
    fi

    echo ""
done

echo "=================================="
echo "Test Summary"
echo "=================================="
echo "Total skills: $SKILL_COUNT"
echo -e "Errors: ${RED}$ERRORS${NC}"
echo ""

if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ All skills passed validation!${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Install skills: cp -r skills/* ~/.claude/skills/"
    echo "  2. Open Claude Code"
    echo "  3. Ask: 'What Git skills are available?'"
    exit 0
else
    echo -e "${RED}❌ Some skills have errors${NC}"
    exit 1
fi
