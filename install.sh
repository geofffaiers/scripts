#!/bin/bash

# Installation script for personal scripts
# This script sets up symlinks to make scripts available in PATH

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/scripts"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Create target directory if it doesn't exist
create_target_dir() {
    if [[ ! -d "$TARGET_DIR" ]]; then
        log_info "Creating $TARGET_DIR directory..."
        mkdir -p "$TARGET_DIR"
        log_success "Created $TARGET_DIR"
    else
        log_info "$TARGET_DIR already exists"
    fi
}

# Install a script via symlink
install_script() {
    local script_path="$1"
    local script_name="$2"

    if [[ ! -f "$script_path" ]]; then
        log_error "Script not found: $script_path"
        return 1
    fi

    local target_path="$TARGET_DIR/$script_name"

    # Remove existing symlink/file if it exists
    if [[ -L "$target_path" ]]; then
        log_info "Removing existing symlink: $target_path"
        rm "$target_path"
    elif [[ -f "$target_path" ]]; then
        log_warning "File exists at $target_path - backing up as ${target_path}.backup"
        mv "$target_path" "${target_path}.backup"
    fi

    # Create symlink
    log_info "Installing $script_name..."
    ln -sf "$script_path" "$target_path"

    # Make executable
    chmod +x "$script_path"

    log_success "Installed $script_name"
}

# Check if directory is in PATH
check_path() {
    if [[ ":$PATH:" != *":$TARGET_DIR:"* ]]; then
        log_warning "$TARGET_DIR is not in your PATH"
        log_info "Add the following line to your ~/.bashrc or ~/.zshrc:"
        echo -e "${YELLOW}export PATH=\"\$HOME/scripts:\$PATH\"${NC}"
        log_info "Then run: source ~/.bashrc (or restart your terminal)"
    else
        log_success "$TARGET_DIR is already in your PATH"
    fi
}

main() {
    log_info "Installing personal scripts..."
    echo

    # Create target directory
    create_target_dir
    echo

    # Install scripts
    log_info "Installing scripts..."
    install_script "$SCRIPT_DIR/gflow" "gflow"
    install_script "$SCRIPT_DIR/update-docker-desktop" "update-docker-desktop"
    echo

    # Check PATH
    check_path
    echo

    log_success "Installation completed!"
    log_info "Available commands:"
    echo "  - gflow          : Git workflow automation"
    echo "  - update-docker-desktop : Docker Desktop updater"
}

main "$@"