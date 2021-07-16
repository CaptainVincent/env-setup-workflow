tap "beeftornado/rmtree"
tap "buo/cask-upgrade"               if /darwin/ =~ RUBY_PLATFORM # mac only
tap "homebrew/bundle"
tap "homebrew/cask"                  if /darwin/ =~ RUBY_PLATFORM # mac only
tap "homebrew/cask-fonts"            if /darwin/ =~ RUBY_PLATFORM # mac only
tap "homebrew/cask-versions"         if /darwin/ =~ RUBY_PLATFORM # mac only
tap "homebrew/command-not-found"
tap "homebrew/core"
tap "universal-ctags/universal-ctags"

## Productivity
# GNU File, Shell, and Text utilities
brew "coreutils"                     if /darwin/ =~ RUBY_PLATFORM # mac only
# Perl-powered file rename script with many helpful built-ins (conflict with util-linux)
brew "rename"                        if /darwin/ =~ RUBY_PLATFORM # mac only
# Simple, fast and user-friendly alternative to find
brew "fd"
# Search tool like grep and The Silver Searcher
brew "ripgrep"
# Command-line fuzzy finder written in Go
brew "fzf"
# Add code completions to all your code editors
cask "kite"                          if /darwin/ =~ RUBY_PLATFORM # mac only
# Swiss-army knife of markup format conversion (build head exa dependency)
brew "pandoc"
# Safe, concurrent, practical language (build head exa dependency)
brew "rust"
# Modern replacement for 'ls'
brew "exa" #, args: ["HEAD"]
# Clone of cat(1) with syntax highlighting and Git integration
brew "bat"
# More intuitive version of du in rust
brew "dust"
# Modern replacement for ps written by Rust
brew "procs"
# Lightweight and flexible command-line JSON processor
brew "jq"
# Monitor data's progress through a pipe
brew "pv"
# Create and view interactive cheat sheets for *nix commands
brew "cheat"
# Readline wrapper: adds readline support to tools that lack it (cht.sh shell need)
brew "rlwrap"
# Programmatically correct mistyped console commands
brew "thefuck"
# Application launcher and productivity software
cask "alfred3"                       if /darwin/ =~ RUBY_PLATFORM # mac only
# Move and resize windows with ease
cask "spectacle"                     if /darwin/ =~ RUBY_PLATFORM # mac only
# Desktop password and login vault
cask "bitwarden"                     if /darwin/ =~ RUBY_PLATFORM # mac only
# Utility to hide menu bar items
cask "hiddenbar"                     if /darwin/ =~ RUBY_PLATFORM # mac only

## Utility
# Keep your Mac's application settings in sync
brew "mackup"
# Manage your dotfiles across multiple diverse machines, securely
brew "chezmoi"
# Improved top (interactive process viewer)
brew "htop"
# Generate ASCII art with terminal, shell, and OS info
brew "screenfetch", args: ["HEAD"]
# Command-line interface for https://speedtest.net bandwidth tests
brew "speedtest-cli"
# GNU Pretty Good Privacy (PGP) package
brew "gnupg"
# Play, record, convert, and stream audio and video
brew "ffmpeg"
# Website copier/offline browser
brew "httrack"
# Internet file retriever
brew "wget"
# Download with resuming and segmented downloading
brew "aria2"
# Command-line client for Mega.co.nz
brew "megatools"
# Download YouTube videos from the command-line
brew "youtube-dl"
# Status monitoring, (alternative can check app state)
cask "eul"                           if /darwin/ =~ RUBY_PLATFORM # mac only

## Develop
# Maintained ctags implementation
brew "universal-ctags/universal-ctags/universal-ctags", args: ["HEAD"]
# Vi 'workalike' with many additional features, (used because need feature conceal)
brew "vim"
# Python version management
brew "pyenv"
# Node version management
brew "n"
# Pack, ship and run any application as a lightweight container
brew "docker", link: false           if /darwin/ =~ RUBY_PLATFORM # mac only
# App to build and share containerized applications and microservices
cask "docker"                        if /darwin/ =~ RUBY_PLATFORM # mac only
# Automated testing of webapps for Google Chrome
cask "chromedriver"                  if /darwin/ =~ RUBY_PLATFORM # mac only
# Intercept, modify, replay, save HTTP/S traffic
brew "mitmproxy"
# Terminal emulator as alternative to Apple's Terminal app
cask "iterm2"                        if /darwin/ =~ RUBY_PLATFORM # mac only
# Text editor for code, markup and prose
cask "sublime-text"                  if /darwin/ =~ RUBY_PLATFORM # mac only
# Text interface for Git repositories
brew "tig"
# GIT client
cask "fork"                          if /darwin/ =~ RUBY_PLATFORM # mac only

## Data compression software
# LZMA-based compression program similar to gzip or bzip2
brew "lzip"
# 7-Zip (high compression file archiver) implementation
brew "p7zip"
# Command-line unarchiving tools supporting multiple formats (In linux will build fail)
brew "unar"                          if /darwin/ =~ RUBY_PLATFORM # mac only

## Application
# Web browser focusing on privacy
cask "brave-browser"                 if /darwin/ =~ RUBY_PLATFORM # mac only
# Web browser focusing on security
cask "tor-browser"                   if /darwin/ =~ RUBY_PLATFORM # mac only
# No description, bbs terminal
cask "welly"                         if /darwin/ =~ RUBY_PLATFORM # mac only
# Download accelerator and organizer
cask "free-download-manager"         if /darwin/ =~ RUBY_PLATFORM # mac only
# Free and open-source media player
cask "iina"                          if /darwin/ =~ RUBY_PLATFORM # mac only
# Music streaming service
cask "spotify"                       if /darwin/ =~ RUBY_PLATFORM # mac only
# Tool for sending personal documents to Kindles from Macs
cask "send-to-kindle"                if /darwin/ =~ RUBY_PLATFORM # mac only
# App to write, plan, collaborate, and get organized
cask "notion"                        if /darwin/ =~ RUBY_PLATFORM # mac only
# Knowledge base that works on top of a local folder of plain text Markdown files
cask "obsidian"                      if /darwin/ =~ RUBY_PLATFORM # mac only
# Team communication and collaboration software
cask "slack"                         if /darwin/ =~ RUBY_PLATFORM # mac only
# Messaging app with a focus on speed and security
cask "telegram"                      if /darwin/ =~ RUBY_PLATFORM # mac only
# Server and cloud storage browser
cask "cyberduck"                     if /darwin/ =~ RUBY_PLATFORM # mac only
# Client for the Dropbox cloud storage service
cask "dropbox"                       if /darwin/ =~ RUBY_PLATFORM # mac only
# Collect, organize, cite, and share research sources
cask "zotero"                        if /darwin/ =~ RUBY_PLATFORM # mac only

## Apple Store
# Mac App Store command-line interface
brew "mas"                           if /darwin/ =~ RUBY_PLATFORM # mac only
mas "Simplenote", id: 692867256      if /darwin/ =~ RUBY_PLATFORM # mac only
mas "LINE", id: 539883307            if /darwin/ =~ RUBY_PLATFORM # mac only
mas "Spark", id: 1176895641          if /darwin/ =~ RUBY_PLATFORM # mac only
mas "Coin Tick", id: 1141688067      if /darwin/ =~ RUBY_PLATFORM # mac only
mas "Gas Now", id: 1532358105        if /darwin/ =~ RUBY_PLATFORM # mac only
# Use eul alternative below items
# mas "CPULed", id: 448189857          if /darwin/ =~ RUBY_PLATFORM # mac only
# mas "Battery Monitor", id: 836505650 if /darwin/ =~ RUBY_PLATFORM # mac only
