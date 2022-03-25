#!/bin/bash
# Proper header for a Bash script.

BASEDIR=$(readlink -f "$0" | xargs dirname)

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  mackup restore
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
  chezmoi init --apply CaptainVincent
  chezmoi update
  /bin/bash -c "${BASEDIR}/relink_chezmoi2mackup.sh"
fi

# Install vim plugins
vim +'PlugInstall --sync' +qa

# Install python packages/tools globally through pipx
./install_python_global.sh
