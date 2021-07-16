#!/bin/bash
# Proper header for a Bash script.

BASEDIR=$(dirname "$0")

if ! command_exists zsh &> /dev/null
then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    mackup restore
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    chezmoi init --apply CaptainVincent
    /bin/bash -c "${BASEDIR}/relink-chezmoi2mackup.sh"
fi

# Install vim plugins
vim +'PlugInstall --sync' +qa