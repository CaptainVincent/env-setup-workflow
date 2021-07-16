---
title: relink_chezmoi2mackup.sh
type: docs
weight: 11
---

# Usage

> Reference to [**Dotfiles Repo**](https://github.com/CaptainVincent/dotfiles/)

According my dotfiles are used by mackup, too. And mackup will make them as symbolic links in $HOME path, so I can't directly add them into `chezmoi`.

> My workaround is add symbolic link and physical file both into **chezmoi**, and recover all symbolic links on apply target machine.

**First, add symbolic link and physical file both into chezmoi**

For example:
```bash
chezmoi add ~/.zshrc $(readlink ~/.zshrc)
```

**And then I sed all symbolic link paths from absolute path to relative path follow below command**
> This step is because the symbolic links be joined chezmoi could be point different $HOME path every machine even we use the same username (ex. Linux and Mac use different path)

```bash
chezmoi cd
find . -name 'symlink*' -print0 | xargs -0 sed -i "" "s|${HOME//\//\\/}|\$HOME|g"
```

**Finally, use this script `relink_chezmoi2mackup.sh` relink to the real home path on apply target**
> Because chezmoi not support `$HOME` env variable as I think, so I need relink it.

```bash
#!/bin/bash
# Proper header for a Bash script.
for filename in $(find . -type l ! -exec test -e {} \; -print) ; do
  path=$(ls -l $filename | sed "s/.*>\ \(.*\)/\1/")
  new=$(echo $path | sed "s|\$HOME|${HOME}|g")
  ln -sf $new $filename
done
```