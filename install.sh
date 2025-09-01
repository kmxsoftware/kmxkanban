#!/bin/bash

# KMX Kanban Installation Script
# This script installs dependencies and downloads KMX Kanban

set -e

echo "========================================="
echo "   KMX Kanban Installer"
echo "========================================="
echo ""

# Detect Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    VER=$VERSION_ID
else
    echo "Cannot detect Linux distribution"
    exit 1
fi

# Install dependencies based on distribution
echo "Installing required dependencies..."

case $OS in
    ubuntu|debian|linuxmint|pop)
        echo "Detected: $OS"
        sudo apt update
        sudo apt install -y libgtk-3-0 libwebkit2gtk-4.0-37 libnotify4 wget
        ;;
    
    fedora|rhel|centos)
        echo "Detected: $OS"
        sudo dnf install -y gtk3 webkit2gtk3 libnotify wget
        ;;
    
    arch|manjaro)
        echo "Detected: $OS"
        sudo pacman -S --noconfirm gtk3 webkit2gtk libnotify wget
        ;;
    
    opensuse*)
        echo "Detected: $OS"
        sudo zypper install -y gtk3 libwebkit2gtk-4_0-37 libnotify4 wget
        ;;
    
    *)
        echo "Unsupported distribution: $OS"
        echo "Please install manually:"
        echo "  - GTK3"
        echo "  - WebKit2GTK 4.0"
        echo "  - libnotify"
        exit 1
        ;;
esac

echo "✓ Dependencies installed"
echo ""

# Download KMX Kanban
echo "Downloading KMX Kanban v1.0.0..."
wget -q --show-progress https://github.com/kmxsoftware/kmxkanban/releases/download/v1.0.0/kmxkanban-v1.0.0-linux-amd64

# Make executable
chmod +x kmxkanban-v1.0.0-linux-amd64

echo "✓ Download complete"
echo ""

# Optional: Create desktop entry
read -p "Create desktop shortcut? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    cat > ~/.local/share/applications/kmxkanban.desktop << EOF
[Desktop Entry]
Name=KMX Kanban
Comment=AI-Powered Development Environment
Exec=$PWD/kmxkanban-v1.0.0-linux-amd64
Icon=$PWD/kmxkanban-icon.png
Type=Application
Categories=Development;IDE;
Terminal=false
EOF
    echo "✓ Desktop shortcut created"
fi

echo ""
echo "========================================="
echo "   Installation Complete!"
echo "========================================="
echo ""
echo "To run KMX Kanban:"
echo "  ./kmxkanban-v1.0.0-linux-amd64"
echo ""
echo "First run setup:"
echo "  1. Enter your license key"
echo "  2. Set application password"
echo "  3. Create your first project"
echo ""