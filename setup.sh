#!/bin/bash
# Proper header for a Bash script.

BASEDIR=$(dirname "$0")

mackup_config_content="[storage]
engine = file_system
path = Dropbox"

# A utility function for check command exist
command_exists () {
  ! loc="$(type -p "$1")" || [[ -z $loc ]]
}

# Install zsh
if command_exists zsh &> /dev/null
then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    echo -e "\n- No zsh on mac, it should not be happened!! (EXIT)"
    exit 1
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    echo -e "\n- No zsh on linux, auto apt install it."
    sudo apt update
    sudo apt install zsh -y
  fi
fi

# Set up zsh as default
# if [[ "$SHELL" != */zsh && $(grep -q '$USER' /etc/passwd) ]]; then
if [[ "$SHELL" != */zsh ]]; then
  echo "Default shell is not zsh, auto change it."
  password_status=$(sudo passwd -S $USER | awk '{print $2}')
  if [ "$password_status" = "NP" ]; then
    sudo passwd $USER
  fi
  whoami | xargs -I {} sudo chsh -s $(which zsh) {}
fi

# VPS only
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Setup swapspace
  echo -e "\n- Setup swapspace for vps"
  sudo "$BASEDIR/setupSwap/setupSwap.sh"

  # Inject a warning message before login
  echo -e "\n- Inject a warning message before login"
  echo -n "Skip this time? (y/n): "; read option
  if [ "$option" != "y" ]; then
    cp $BASEDIR/warning.net ~/.warning.net
    sudo sed -i "s@#Banner none@Banner ${HOME}/.warning.net@g" /etc/ssh/sshd_config
    sudo systemctl restart sshd
  fi
fi

# # Install homebrew | linuxbrew
if [ -f "$HOME/.zprofile" ]; then
  source "$HOME/.zprofile"
fi
if command_exists brew &> /dev/null
then
  echo -e "\n- Homebrew not found, install it"
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    sudo apt install build-essential git -y
    git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
    mkdir ~/.linuxbrew/bin
    ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
    eval $(~/.linuxbrew/bin/brew shellenv)
    export PKG_CONFIG_PATH=$HOME/.linuxbrew/lib/pkgconfig:$PKG_CONFIG_PATH
  fi
fi

# Install homebrew packages
echo -e "\n- Brew bundle install packages"
if [[ "$OSTYPE" == "darwin"* ]]; then
  brew bundle --file=$BASEDIR/Brewfile
  echo -n "Brew bundle install option packages? (y/n): "; read option
  if [ "$option" == "y" ]; then
    brew bundle --file=$BASEDIR/BrewfileOption
  fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  brew bundle --file=$BASEDIR/BrewfileVPS
fi

# Restore dotfile and setting
echo -e "\n- Restore dotfile and setting"
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo -n "Dropbox ready? (y/n): "; read option
  if [ "$option" == "y" ]; then
    if [[ -d "$HOME/Dropbox" ]]; then
      echo "$mackup_config_content" > ~/.mackup.cfg
      mackup restore
    else
      echo "Dropbox folder not found in $HOME"
      exit 1
    fi
  else
    echo "Unfinished, see u next time"
    exit 0
  fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  chezmoi init --apply CaptainVincent --force
  chezmoi update --force
  rsync -a -v $HOME/Dropbox/Mackup/ $HOME
  rm -rf $HOME/Dropbox
fi

# Install python packages/tools globally through pipx
echo -e "\n- Install globally python tools"
$BASEDIR/install_python_global.sh

# To install vim-plug (vim plugins manager)
echo -e "\n- Install vim plugin manager: vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install vim plugins
echo "Install vim plugins"
vim +'PlugInstall --sync' +qa

# Install tpm
echo -e "\n- Install tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Install tmux plugins"
~/.tmux/plugins/tpm/bin/install_plugins
# tmux source ~/.tmux.conf && tmux run-shell ~/.tmux/plugins/tpm/bin/install_plugins

# To install useful key bindings and fuzzy completion after fzf installed
echo -e "\n- Install fzf keybinding"
echo -n "Skip this time? (y/n): "; read option
if [ "$option" != "y" ]; then
  $(brew --prefix)/opt/fzf/install
fi

# Install nnn file manager plugins
echo -e "\n- Install nnn plugins"
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"

echo ""
# Fix perl: warning: Setting locale failed.
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8
cowsay -f dragon "Setup is complete!! congratulations!!"
