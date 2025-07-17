#!/bin/bash

# This script automatically links dotfiles to their proper places in the filesystem
# and includes error handling, backup functionality, and directory creation

set -e  # Exit on error

CURRENT_DIR=$(pwd)
BACKUP_DIR="${HOME}/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"
FORCE=0

# Print usage information
usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -f, --force     Override existing files/links"
    echo "  -b, --backup    Backup existing files before linking"
    echo "  -h, --help      Show this help message"
    echo "  -u, --uninstall Remove all symlinks"
}

# Process command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--force) FORCE=1 ;;
        -b|--backup) BACKUP=1 ;;
        -h|--help) usage; exit 0 ;;
        -u|--uninstall) UNINSTALL=1 ;;
        *) echo "Unknown option: $1"; usage; exit 1 ;;
    esac
    shift
done

# Function to create backup of existing file
backup_file() {
    local file=$1
    if [[ -e "$file" && ! -L "$file" ]]; then
        mkdir -p "$BACKUP_DIR"
        echo "Backing up $file to $BACKUP_DIR/"
        mv "$file" "$BACKUP_DIR/"
    fi
}

# Function to safely create symlink
create_link() {
    local src=$1
    local dest=$2
    local destdir=$(dirname "$dest")

    # Check if source exists
    if [[ ! -e "$src" ]]; then
        echo "Error: Source file $src does not exist"
        return 1
    }

    # Create destination directory if it doesn't exist
    mkdir -p "$destdir"

    # Handle existing destination
    if [[ -e "$dest" ]]; then
        if [[ $FORCE -eq 1 ]]; then
            [[ $BACKUP -eq 1 ]] && backup_file "$dest"
            rm -rf "$dest"
        else
            echo "Error: $dest already exists. Use --force to override"
            return 1
        fi
    fi

    # Create symlink
    echo "Linking $src to $dest"
    ln -s "$src" "$dest"
}

# Function to remove symlink
remove_link() {
    local link=$1
    if [[ -L "$link" ]]; then
        echo "Removing symlink: $link"
        rm "$link"
    fi
}

# Uninstall if requested
if [[ $UNINSTALL -eq 1 ]]; then
    echo "Removing symlinks..."
    remove_link "${HOME}/.zshrc"
    remove_link "${HOME}/.config/kitty/dracula.conf"
    remove_link "${HOME}/.config/kitty/kitty.conf"
    remove_link "${HOME}/.config/nnn/plugins"
    remove_link "${HOME}/.config/nvim"
    remove_link "${HOME}/.tmux.conf"
    remove_link "${HOME}/.gitconfig"
    remove_link "${HOME}/.git_extras"
    remove_link "${HOME}/.config/gitui/key_bindings.ron"
    remove_link "${HOME}/.config/gitui/theme.ron"
    echo "Uninstall complete"
    exit 0
fi

# Create symlinks
echo "Setting up dotfiles..."

echo "zsh: linking config & plugins"
create_link "${CURRENT_DIR}/zsh/zshrc" "${HOME}/.zshrc"

echo "kitty: linking config & theme"
create_link "${CURRENT_DIR}/kitty/dracula.conf" "${HOME}/.config/kitty/dracula.conf"
create_link "${CURRENT_DIR}/kitty/kitty.conf" "${HOME}/.config/kitty/kitty.conf"

echo "nnn: linking plugins"
create_link "${CURRENT_DIR}/nnn/plugins" "${HOME}/.config/nnn/plugins"

echo "nvim: linking config"
create_link "${CURRENT_DIR}/nvim" "${HOME}/.config/nvim"

echo "tmux: linking config"
create_link "${CURRENT_DIR}/tmux/tmux.conf" "${HOME}/.tmux.conf"

echo "git: linking config"
create_link "${CURRENT_DIR}/git/gitconfig" "${HOME}/.gitconfig"

echo "git-extras: linking config"
create_link "${CURRENT_DIR}/git_extras" "${HOME}/.git_extras"

echo "gitui: linking theme & keybindings"
create_link "${CURRENT_DIR}/gitui/key_bindings.ron" "${HOME}/.config/gitui/key_bindings.ron"
create_link "${CURRENT_DIR}/gitui/theme.ron" "${HOME}/.config/gitui/theme.ron"

echo "Setup complete!"
