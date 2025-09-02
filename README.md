# KMX Kanban - AI-Powered Development Environment

<div align="center">
  <img src="https://img.shields.io/badge/version-1.0.1-blue.svg" alt="Version">
  <img src="https://img.shields.io/badge/license-Commercial-green.svg" alt="License">
  <img src="https://img.shields.io/badge/platform-Linux-orange.svg" alt="Platform">
</div>

## Overview

KMX Kanban is a desktop application that combines project management with development tools, designed specifically for AI-assisted programming workflows. It integrates a Kanban board, VS Code editor, terminal emulator, and web browser into a single application.

## Key Features

- **Kanban Board** - Visual task management with drag-and-drop
- **Easy Remote Programming** - Programming remotely on a PC using laptop or mobile device
- **LOCAL based** - everything is happening on your local machine, no cloud = no security issues = safe codebase
- **Agents Manager** - create your AI team easily, train them in specialized tasks
- **Talk to AI** - option to talk to the AI engine instead of typing
- **Prompt Manager** - prepend or append text to every prompt, save favourites prompts
- **Git Manager** - review easily using side to side Monaco diff
- **Use any AI Engine** - Claude Code, Cursor, Local LLM, everything is possible because it's terminal based
- **Integrated VS Code Editor** - Full Monaco editor with syntax highlighting
- **Multi-Terminal Support** - Multiple terminal sessions with PTY support
- **Embedded Web Browser** - Built-in Chromium-based browser
- **Multi-Project Management** - Switch between different project contexts
- **Rich Text Descriptions** - Format task descriptions with Quill editor
- **Performance Monitoring** - Real-time CPU, memory, and FPS tracking

## AI Programming Focus

KMX Kanban is optimized for working with AI assistants:

- **Structured Tasks** - Rich text formatting for clear AI prompts
- **Context Management** - Maintain separate contexts per project
- **Copy-Paste Workflow** - Easy task copying to AI chat interfaces
- **Terminal Integration** - AI can see command outputs and errors

## System Requirements

### Supported Operating Systems

- **Ubuntu 22.04 LTS** (Jammy Jellyfish)
- **Ubuntu 24.04 LTS** (Noble Numbat)
- Other Linux distributions with compatible dependencies
- Windows 10/11 (via WSL2)

## Installation

### 🐧 Linux

#### 🟠 Ubuntu 22.04 LTS (Jammy Jellyfish)

```bash
# Download KMX Kanban for Ubuntu 22.04
wget https://github.com/kmxsoftware/kmxkanban/releases/download/v1.0.1/kmxkanban-v1.0.1-ubuntu-2204-amd64

# Make executable
chmod +x kmxkanban-v1.0.1-ubuntu-2204-amd64

# Run the application
./kmxkanban-v1.0.1-ubuntu-2204-amd64
```

#### 🟣 Ubuntu 24.04 LTS (Noble Numbat)

```bash
# Download KMX Kanban for Ubuntu 24.04
wget https://github.com/kmxsoftware/kmxkanban/releases/download/v1.0.1/kmxkanban-v1.0.1-ubuntu-2404-amd64

# Make executable
chmod +x kmxkanban-v1.0.1-ubuntu-2404-amd64

# Run the application
./kmxkanban-v1.0.1-ubuntu-2404-amd64
```

### 🪟 Windows

Run inside WSL2 (Windows Subsystem for Linux):

#### 🟠 WSL2 with Ubuntu 22.04 LTS

```bash
# Download KMX Kanban for WSL2 Ubuntu 22.04
wget https://github.com/kmxsoftware/kmxkanban/releases/download/v1.0.1/kmxkanban-v1.0.1-ubuntu-2204-amd64

# Make executable
chmod +x kmxkanban-v1.0.1-ubuntu-2204-amd64

# Run the application
./kmxkanban-v1.0.1-ubuntu-2204-amd64
```

#### 🟣 WSL2 with Ubuntu 24.04 LTS

```bash
# Download KMX Kanban for WSL2 Ubuntu 24.04
wget https://github.com/kmxsoftware/kmxkanban/releases/download/v1.0.1/kmxkanban-v1.0.1-ubuntu-2404-amd64

# Make executable
chmod +x kmxkanban-v1.0.1-ubuntu-2404-amd64

# Run the application
./kmxkanban-v1.0.1-ubuntu-2404-amd64
```

**Note**: For GUI support in WSL2, you need WSLg (Windows 11) or an X server (Windows 10).

### 🍎 macOS

Coming soon.

### Initial Setup

- Enter your license key when prompted
- Set up application password
- Create your first project

## Usage

### Basic Workflow

1. **Create Project** - Set up a new project with working directory
2. **Add Tasks** - Create tasks with detailed descriptions
3. **Open Terminals** - Launch terminal sessions in project directory
4. **Edit Code** - Use integrated VS Code editor
5. **Test in Browser** - Preview your application
6. **Track Progress** - Move tasks across Kanban columns

### Working with AI

1. Select and copy task descriptions
2. Paste into your AI assistant (Claude, GPT-4, etc.)
3. Implement solutions in the integrated editor
4. Test using integrated terminals
5. Mark tasks as complete

## File Structure

The application stores data in `~/.kmxkanban/`:
- `license.enc` - Encrypted license file
- `.env` - Application settings
- `data/` - Project and task data

## License

KMX Kanban requires a valid commercial license to run. The license is hardware-locked to your machine.

Buy at: https://kmxsoftware.com

Contact: info@kmxsoftware.com

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.

## Support

For issues and questions: info@kmxsoftware.com

---

© 2025 KMX Software. All rights reserved.