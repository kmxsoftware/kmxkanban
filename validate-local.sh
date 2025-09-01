#!/bin/bash

# Local validation script for KMX Kanban release
# Test everything before pushing to GitHub

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${GREEN}==================================${NC}"
echo -e "${GREEN}Local Release Validation${NC}"
echo -e "${GREEN}==================================${NC}"
echo ""

# 1. Check all required files exist
echo -e "${YELLOW}Checking required files...${NC}"
REQUIRED_FILES=(
    "README.md"
    "CHANGELOG.md"
    "RELEASE_NOTES_v1.0.0.md"
    "RELEASE_TEMPLATE.md"
    "create-release.sh"
    ".gitignore"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "✓ $file"
    else
        echo "✗ Missing: $file"
        exit 1
    fi
done
echo ""

# 2. Validate Markdown syntax
echo -e "${YELLOW}Validating Markdown files...${NC}"
if command -v markdown-cli &> /dev/null; then
    for file in *.md; do
        markdown-cli "$file" &> /dev/null && echo "✓ $file valid" || echo "✗ $file has issues"
    done
else
    echo "ℹ markdown-cli not installed, skipping validation"
    echo "  Install with: npm install -g markdown-cli"
fi
echo ""

# 3. Check for placeholder text
echo -e "${YELLOW}Checking for placeholders...${NC}"
PLACEHOLDERS=(
    "TO BE ADDED"
    "XXXX"
    "TODO"
    "FIXME"
    "\[HASH\]"
)

for placeholder in "${PLACEHOLDERS[@]}"; do
    echo "Checking for: $placeholder"
    grep -r "$placeholder" *.md 2>/dev/null || echo "  ✓ None found"
done
echo ""

# 4. Preview README in terminal
echo -e "${YELLOW}README Preview (first 50 lines):${NC}"
echo -e "${BLUE}==================================${NC}"
head -n 50 README.md
echo -e "${BLUE}==================================${NC}"
echo ""

# 5. Create test binary (dummy file for testing)
echo -e "${YELLOW}Creating test binary for validation...${NC}"
TEST_BINARY="kmxkanban-v1.0.0-linux-amd64"
if [ ! -f "$TEST_BINARY" ]; then
    echo "Creating dummy test binary..."
    echo "#!/bin/bash" > "$TEST_BINARY"
    echo "echo 'Test binary for validation'" >> "$TEST_BINARY"
    chmod +x "$TEST_BINARY"
    echo "✓ Test binary created"
else
    echo "✓ Binary exists"
fi
echo ""

# 6. Test release script (dry run)
echo -e "${YELLOW}Testing release script (dry run)...${NC}"
if [ -f "create-release.sh" ]; then
    # Check syntax
    bash -n create-release.sh && echo "✓ Script syntax valid" || echo "✗ Script has syntax errors"
    
    # Check if gh CLI is available
    if command -v gh &> /dev/null; then
        echo "✓ GitHub CLI installed"
    else
        echo "ℹ GitHub CLI not installed (needed for actual release)"
        echo "  Install with: sudo apt install gh"
    fi
fi
echo ""

# 7. Generate local HTML preview
echo -e "${YELLOW}Generating HTML preview...${NC}"
if command -v pandoc &> /dev/null; then
    pandoc README.md -o /tmp/kmxkanban-readme.html
    echo "✓ HTML preview generated: /tmp/kmxkanban-readme.html"
    echo "  Open with: xdg-open /tmp/kmxkanban-readme.html"
elif command -v grip &> /dev/null; then
    echo "You can preview with grip:"
    echo "  grip README.md"
else
    echo "ℹ Install pandoc or grip for HTML preview"
    echo "  pandoc: sudo apt install pandoc"
    echo "  grip: pip install grip"
fi
echo ""

# 8. Check file sizes
echo -e "${YELLOW}File sizes:${NC}"
ls -lh *.md *.sh 2>/dev/null | awk '{print $5 "\t" $9}'
echo ""

# 9. Git status (if in git repo)
if [ -d .git ]; then
    echo -e "${YELLOW}Git status:${NC}"
    git status --short
    echo ""
fi

# 10. Summary
echo -e "${GREEN}==================================${NC}"
echo -e "${GREEN}Validation Complete!${NC}"
echo -e "${GREEN}==================================${NC}"
echo ""
echo "Next steps to test locally:"
echo "1. Preview README: grip README.md (then open http://localhost:6419)"
echo "2. Test with real binary: copy your actual built binary here"
echo "3. Simulate release: ./create-release.sh (will create draft)"
echo "4. Check GitHub without pushing: gh repo view"
echo ""
echo "To view README in terminal with formatting:"
echo "  glow README.md    (install: sudo snap install glow)"
echo "  mdcat README.md   (install: cargo install mdcat)"
echo ""
echo "To start local web server for preview:"
echo "  python3 -m http.server 8000"
echo "  Then open: http://localhost:8000"