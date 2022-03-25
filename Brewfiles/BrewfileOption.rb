## Crypto
# Official Go implementation of the Ethereum protocol
tap "ethereum/ethereum"
brew "ethereum"
# Desktop version of Remix web IDE used for Ethereum smart contract development
cask "remix-ide"                     if /darwin/ =~ RUBY_PLATFORM # mac only
# Crypto price menubar Utility
mas "Coin Tick", id: 1141688067      if /darwin/ =~ RUBY_PLATFORM # mac only

## Advanced Develop
# Application for inspecting installer packages
cask "suspicious-package"            if /darwin/ =~ RUBY_PLATFORM # mac only
# Reverse engineering platform powered by Rizin
cask "cutter"                        if /darwin/ =~ RUBY_PLATFORM # mac only
# Cross platform SQL editor and database management app
cask "beekeeper-studio"              if /darwin/ =~ RUBY_PLATFORM # mac only
# HTTP and GraphQL Client
cask "insomnia"                      if /darwin/ =~ RUBY_PLATFORM # mac only
# Web development companion
cask "prepros"                       if /darwin/ =~ RUBY_PLATFORM # mac only
# # Open-source code editor
# cask "visual-studio-code"            if /darwin/ =~ RUBY_PLATFORM # mac only
# # Apple Ecosystem Utility
# mas "Xcode", id: 497799835           if /darwin/ =~ RUBY_PLATFORM # mac only

## C-family Develop
# # Formatting tools for C, C++, Obj-C, Java, JavaScript, TypeScript
# brew "clang-format"
# # Next-gen compiler infrastructure
# brew "llvm"
# # GNU debugger
# brew "gdb"
# # Cross-platform make
# brew "cmake"
# # Tool to analyze #includes in C and C++ source files
# brew "include-what-you-use"

## Other Develop
# # Package manager for the web
# brew "bower"
# # Repository tool for Android development
# brew "repo"
# # GNU internationalization (i18n) and localization (l10n) library
# brew "gettext"

## Filesystem
## osxfuse out of homebrewcore, these packages will disable by default
## ex. Error: sshfs has been disabled because it requires FUSE!
# # Read-write NTFS driver for FUSE
# brew "ntfs-3g"                       if /darwin/ =~ RUBY_PLATFORM # mac only
# # File system integration
# cask "osxfuse"                       if /darwin/ =~ RUBY_PLATFORM # mac only
# # File system client based on SSH File Transfer Protocol
# brew "sshfs"

## Utility
# # Adds an OCR text layer to scanned PDF files
# brew "ocrmypdf"
# # Enables extra languages support for Tesseract (Base on ocrmypdf options)
# brew "tesseract-lang"
# # View output from scripts in the menu bar
# cask "xbar"
# # Open-source keystroke visualizer
# cask "keycastr"                      if /darwin/ =~ RUBY_PLATFORM # mac only
# # Screen capture tool with mark up and sharing features
# cask "skitch"
# # Trading application
# cask "futubull"
# # Desktop virtualization software
# cask "parallels"
# cask "parallels16"

## Funny
# # Configurable talking characters in ASCII art
# brew "cowsay"
# # Rainbows and unicorns in your console!
# brew "lolcat"
