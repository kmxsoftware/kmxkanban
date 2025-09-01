#!/bin/bash

# GitHub Release Creation Script for KMX Kanban
# This script helps create proper GitHub releases with the binary

set -e

# Configuration
REPO_OWNER="kmxsoftware"
REPO_NAME="kmxkanban-builds"
VERSION="v1.0.0"
BINARY_NAME="kmxkanban-${VERSION}-linux-amd64"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}==================================${NC}"
echo -e "${GREEN}KMX Kanban Release Creator${NC}"
echo -e "${GREEN}==================================${NC}"
echo ""

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo -e "${RED}Error: GitHub CLI (gh) is not installed.${NC}"
    echo "Install it with: sudo apt install gh"
    exit 1
fi

# Check if we're in the right directory
if [ ! -f "README.md" ] || [ ! -f "CHANGELOG.md" ]; then
    echo -e "${RED}Error: Not in the kmxkanban-build-github directory${NC}"
    exit 1
fi

# Check if binary exists
if [ ! -f "$BINARY_NAME" ]; then
    echo -e "${YELLOW}Warning: Binary $BINARY_NAME not found in current directory${NC}"
    echo "Please copy the built binary here first."
    exit 1
fi

# Generate checksums
echo -e "${YELLOW}Generating checksums...${NC}"
SHA256=$(sha256sum "$BINARY_NAME" | cut -d' ' -f1)
MD5=$(md5sum "$BINARY_NAME" | cut -d' ' -f1)

echo "SHA256: $SHA256"
echo "MD5: $MD5"

# Update release notes with checksums
echo -e "${YELLOW}Updating release notes with checksums...${NC}"
sed -i "s/SHA256: \[TO BE ADDED AFTER BUILD\]/SHA256: $SHA256/" RELEASE_NOTES_${VERSION}.md
sed -i "s/MD5: \[TO BE ADDED AFTER BUILD\]/MD5: $MD5/" RELEASE_NOTES_${VERSION}.md

# Create checksums file
echo -e "${YELLOW}Creating checksums file...${NC}"
cat > "${BINARY_NAME}.checksums.txt" << EOF
SHA256: $SHA256  $BINARY_NAME
MD5: $MD5  $BINARY_NAME
EOF

# Compress binary (optional)
echo -e "${YELLOW}Compressing binary...${NC}"
tar -czf "${BINARY_NAME}.tar.gz" "$BINARY_NAME"

# Check if we're logged into GitHub
echo -e "${YELLOW}Checking GitHub authentication...${NC}"
if ! gh auth status &> /dev/null; then
    echo -e "${RED}Not logged into GitHub. Running 'gh auth login'...${NC}"
    gh auth login
fi

# Create the release
echo -e "${GREEN}Creating GitHub release $VERSION...${NC}"
gh release create "$VERSION" \
    --repo "$REPO_OWNER/$REPO_NAME" \
    --title "KMX Kanban $VERSION" \
    --notes-file "RELEASE_NOTES_${VERSION}.md" \
    --draft \
    "$BINARY_NAME" \
    "${BINARY_NAME}.tar.gz" \
    "${BINARY_NAME}.checksums.txt"

echo ""
echo -e "${GREEN}==================================${NC}"
echo -e "${GREEN}Release Draft Created Successfully!${NC}"
echo -e "${GREEN}==================================${NC}"
echo ""
echo "Next steps:"
echo "1. Go to https://github.com/$REPO_OWNER/$REPO_NAME/releases"
echo "2. Review the draft release"
echo "3. Edit if needed"
echo "4. Click 'Publish release' when ready"
echo ""
echo "The release includes:"
echo "  - $BINARY_NAME (main binary)"
echo "  - ${BINARY_NAME}.tar.gz (compressed)"
echo "  - ${BINARY_NAME}.checksums.txt (checksums)"