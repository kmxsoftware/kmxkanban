# Release Creation Guide

## Version Numbering

Follow Semantic Versioning (https://semver.org/):
- **Major (X.0.0)**: Breaking changes
- **Minor (1.X.0)**: New features, backward compatible
- **Patch (1.0.X)**: Bug fixes, security updates

## Release Process

### 1. Prepare the Build
```bash
# In main kmxkanban directory
cd /home/karol/www/kmxkanban

# Build with garble for security
./build-secure.sh

# Or standard Wails build
wails build -platform linux/amd64
```

### 2. Copy Binary to Release Directory
```bash
# Copy built binary
cp build/bin/kmxkanban /home/karol/www/kmxkanban-build-github/kmxkanban-vX.Y.Z-linux-amd64
cd /home/karol/www/kmxkanban-build-github
```

### 3. Update Documentation

#### Update CHANGELOG.md
Add new version section:
```markdown
## [X.Y.Z] - YYYY-MM-DD

### Added
- New features

### Changed
- Changes to existing features

### Fixed
- Bug fixes


#### Create Release Notes
Copy template:
```bash
cp RELEASE_NOTES_v1.0.0.md RELEASE_NOTES_vX.Y.Z.md
```

Edit with version-specific information.

### 4. Update Version References

Update version in:
- README.md (version badge and download links)
- create-release.sh (VERSION variable)

### 5. Create GitHub Release

#### Option A: Using Script
```bash
./create-release.sh
```

#### Option B: Manual with gh CLI
```bash
# Generate checksums
sha256sum kmxkanban-vX.Y.Z-linux-amd64 > checksums.txt
md5sum kmxkanban-vX.Y.Z-linux-amd64 >> checksums.txt

# Create release
gh release create vX.Y.Z \
  --title "KMX Kanban vX.Y.Z" \
  --notes-file RELEASE_NOTES_vX.Y.Z.md \
  --draft \
  kmxkanban-vX.Y.Z-linux-amd64 \
  checksums.txt
```

#### Option C: GitHub Web Interface
1. Go to https://github.com/kmxsoftware/kmxkanban-builds/releases/new
2. Choose tag: vX.Y.Z (create new)
3. Release title: KMX Kanban vX.Y.Z
4. Copy content from RELEASE_NOTES_vX.Y.Z.md
5. Attach binary files
6. Check "This is a pre-release" if beta
7. Publish or save draft

### 6. Post-Release

After publishing:
1. Test download link
2. Verify checksums
3. Update any external documentation
4. Announce release (if applicable)

## Release Note Template

```markdown
# KMX Kanban vX.Y.Z

[Brief description of release focus]

## What's New

### Features
- Feature 1
- Feature 2

### Improvements
- Improvement 1
- Improvement 2

### Bug Fixes
- Fix 1
- Fix 2

## Breaking Changes
[Only for major versions]

## Migration Guide
[If needed]

## Installation
[Standard installation instructions]

## Known Issues
- Issue 1
- Issue 2

## Checksums
```
SHA256: [HASH]
MD5: [HASH]
```
```

## Binary Naming Convention

Always use format: `kmxkanban-vX.Y.Z-platform-arch`

Examples:
- kmxkanban-v1.0.0-linux-amd64
- kmxkanban-v1.1.0-darwin-amd64
- kmxkanban-v1.2.0-windows-amd64

## Tags

Always prefix with 'v': v1.0.0, v1.1.0, etc.