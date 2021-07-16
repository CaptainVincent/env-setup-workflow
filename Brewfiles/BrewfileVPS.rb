tap "beeftornado/rmtree"
tap "homebrew/bundle"
tap "homebrew/command-not-found"
tap "homebrew/core"

## Productivity
# Simple, fast and user-friendly alternative to find
brew "fd"
# Search tool like grep and The Silver Searcher
brew "ripgrep"
# Command-line fuzzy finder written in Go
brew "fzf"
# Clone of cat(1) with syntax highlighting and Git integration
brew "bat"
# More intuitive version of du in rust
brew "dust"
# Modern replacement for 'ls'
brew "exa"

## Utility
# Manage your dotfiles across multiple diverse machines, securely
brew "chezmoi"
# Generate ASCII art with terminal, shell, and OS info
brew "screenfetch", args: ["HEAD"]
# Improved top (interactive process viewer)
brew "htop"
# Modern replacement for ps written by Rust
brew "procs"
# Monitor data's progress through a pipe
brew "pv"
# Command-line interface for https://speedtest.net bandwidth tests
brew "speedtest-cli"
# Internet file retriever
brew "wget"
# Download with resuming and segmented downloading
brew "aria2"

## Develop
# Maintained ctags implementation
tap "universal-ctags/universal-ctags"
brew "universal-ctags/universal-ctags/universal-ctags", args: ["HEAD"]
# Vi 'workalike' with many additional features, (used because need feature conceal)
brew "vim"
# Execute binaries from Python packages in isolated environments
brew "pipx"
# Python version management
brew "pyenv"
# Lightweight and flexible command-line JSON processor
brew "jq"
# Node version management
brew "n"
# Run your GitHub Actions locally 🚀
brew "act"
# Text interface for Git repositories
brew "tig"

## Data compression software
# LZMA-based compression program similar to gzip or bzip2
brew "lzip"
# 7-Zip (high compression file archiver) implementation
brew "p7zip"
