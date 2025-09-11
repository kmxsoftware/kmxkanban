# Changelog

All notable changes to KMX Kanban will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2025-01-12

### Added
- **Prompt Manager Enhancements** - New buttons to send commands directly to terminal from saved prompts
- **Improved Prompt UI** - Moved saved prompts create/edit functionality to popup modal for better UX
- **Git Manager Updates** - Streamlined interface with changes tab as default, removed duplicate refresh icon
- **Draggable Modals** - Non-blocking modal windows that can be moved around without interrupting workflow

### Changed
- Git Manager interface now prioritizes changes tab for faster workflow
- Prompt management moved to modal-based interface for cleaner UI
- Modal windows are now draggable and non-blocking

### Improved
- Better workflow efficiency with direct terminal command execution from prompts
- Enhanced user experience with non-blocking, movable modal dialogs
- Cleaner Git Manager interface without redundant controls

## [1.0.0] - 2024-12-23

### 🎉 Initial Release

#### Added
- **AI-Native Kanban Board** - Visual task management designed for AI collaboration
- **Integrated Development Environment** - Full VS Code editor with Monaco
- **Multi-Terminal Support** - Manage multiple terminal sessions with PTY support
- **Embedded Web Browser** - Built-in browser for testing and preview
- **Project Management** - Multi-project support with isolated workspaces
- **Rich Text Editor** - Quill-based task descriptions with formatting
- **Real-time Performance Monitoring** - CPU, memory, and FPS tracking
- **Dark/Light Theme** - Complete theme support across all components
- **Hardware-Locked Licensing** - Enterprise-grade license management
- **Binary Integrity Checking** - Anti-tampering protection
- **Encrypted Storage** - AES-256 encryption for sensitive data
- **Calendar View** - Visual timeline for task scheduling
- **Subtask Management** - Break down complex tasks
- **Comment System** - Discussion threads on tasks
- **File Explorer** - Browse and edit project files
- **Export/Import** - Backup and restore project data
- **Keyboard Shortcuts** - Productivity-focused navigation
- **Password Protection** - Application-level security
- **Offline Mode** - 7-day grace period for license validation

#### Security
- Hardware fingerprinting for license enforcement
- AES-256-GCM encryption for stored licenses
- Binary obfuscation with garble
- Anti-debugging detection
- Periodic license revalidation
- Machine-specific encryption keys

#### Performance
- React 19 with concurrent features
- Optimized rendering pipeline
- Lazy loading for components
- Binary screenshot streaming
- Web worker support for Monaco
- Efficient WebSocket communication

#### Platform Support
- Linux x64 (Ubuntu 20.04+, Debian 11+, Fedora 35+)
- Native Wails v2 application
- No Electron dependency

### Known Issues
- Terminal may have issues with complex TUI applications
- Browser screenshot streaming requires stable network connection
- First launch requires terminal for license input

### Migration from Pre-Release
- This is the first stable release
- Beta testers should request new production licenses
- Configuration from beta versions is not compatible

---

## Release Types

- **Major (X.0.0)**: Breaking changes, major features, architectural changes
- **Minor (1.X.0)**: New features, enhancements, backward compatible
- **Patch (1.0.X)**: Bug fixes, security updates, performance improvements

## Support Policy

- **Current Version (1.0.x)**: Full support with updates
- **Previous Minor (N/A)**: Security updates only
- **Older Versions**: Best-effort community support

For detailed release notes, see [GitHub Releases](https://github.com/kmxsoftware/kmxkanban-builds/releases)