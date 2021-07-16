## Develop
# Formatting tools for C, C++, Obj-C, Java, JavaScript, TypeScript
brew "clang-format"
# GNU debugger
brew "gdb"
# Cross-platform make
brew "cmake"
# Run your GitHub Actions locally 🚀
brew "act"
# Configurable static site generator
brew "hugo"
tap "ethereum/ethereum"
# Official Go implementation of the Ethereum protocol
brew "ethereum"
# Package manager for the web
brew "bower"
# Repository tool for Android development
brew "repo"
# Apple Ecosystem Utility
mas "Xcode", id: 497799835           if /darwin/ =~ RUBY_PLATFORM # mac only

## Filesystem
### osxfuse out of homebrewcore, these packages will disable by default
### ex. Error: sshfs has been disabled because it requires FUSE!
# Read-write NTFS driver for FUSE
brew "ntfs-3g"                       if /darwin/ =~ RUBY_PLATFORM # mac only
# File system integration
cask "osxfuse"                       if /darwin/ =~ RUBY_PLATFORM # mac only
# File system client based on SSH File Transfer Protocol
brew "sshfs"

## Utility
# Adds an OCR text layer to scanned PDF files
brew "ocrmypdf"
# Enables extra languages support for Tesseract (Base on ocrmypdf options)
brew "tesseract-lang"
# Web browser
cask "google-chrome"                 if /darwin/ =~ RUBY_PLATFORM # mac only
# Open-source keystroke visualizer
cask "keycastr"                      if /darwin/ =~ RUBY_PLATFORM # mac only
# Video chat, voice call and instant messaging application
cask "skype"                         if /darwin/ =~ RUBY_PLATFORM # mac only

# Application
# Open-source code editor
cask "visual-studio-code"
# Combined interface for various messaging platforms
cask "all-in-one-messenger"
# Screen capture tool with mark up and sharing features
cask "skitch"
mas "iMovie", id: 408981434
