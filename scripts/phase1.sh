#!/bin/bash
# Proper header for a Bash script.

BASEDIR=$(readlink -f "$0" | xargs dirname)

# A utility function for check command exist
command_exists () {
  ! loc="$(type -p "$1")" || [[ -z $loc ]]
}

# Install zsh
if command_exists zsh &> /dev/null
then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    echo "No zsh on mac, it should not be happened!! (EXIT)"
    exit 1
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    echo "No zsh on linux, auto apt install it."
    sudo apt update
    sudo apt install zsh -y
  fi
fi

# Set up zsh as default
# if [[ "$SHELL" != */zsh && $(grep -q '$USER' /etc/passwd) ]]; then
if [[ "$SHELL" != */zsh ]]; then
  echo "Default shell is not zsh, auto change it."
  chsh -s $(which zsh)
  exec zsh
fi

# Install zinit
if command_exists zinit &> /dev/null
then
  echo "zinit not found, install it"
  sh -c "$(curl -fsSL https://git.io/zinit-install)"
fi

# Install homebrew | linuxbrew
if command_exists brew &> /dev/null
then
  echo "homebrew not found, install it"
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    sudo apt install build-essential -y
    git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
    mkdir ~/.linuxbrew/bin
    ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
    eval $(~/.linuxbrew/bin/brew shellenv)
    export PATH=$PATH:$HOME/.linuxbrew/bin
  fi
fi

# Install homebrew packages
echo "brew bundle install packages"
brew bundle --file=../Brewfiles/BrewfileBasic.rb

# Install linuxbrew not suppoted packages
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  echo "install packages that linuxbrew not suppoted"

  # Install kite
  bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"

  # Install unar
  if command_exists unar &> /dev/null
  then
    echo "apt install unar"
    sudo apt install unar -y
  fi

  # # Install system python
  # sudo apt install python3-venv python3-pip

  # # Install dropbox and start sync
  # # After considering the situation not always setup my VPS,
  # # linux base choose dotfiles manager `chezmoi`.
  #
  # if command_exists dropbox &> /dev/null
  # then
  #   echo "dropbox not found in linux, install it"
  #   sudo wget -O /usr/local/bin/dropbox "https://www.dropbox.com/download?dl=packages/dropbox.py"
  #   sudo chmod +x /usr/local/bin/dropbox
  #   sudo apt-get install libc6
  #   sudo apt-get install libglapi-mesa
  #   sudo apt-get install libxdamage1
  #   sudo apt-get install libxfixes3
  #   sudo apt-get install libxcb-glx0
  #   sudo apt-get install libxcb-dri2-0
  #   sudo apt-get install libxcb-dri3-0
  #   sudo apt-get install libxcb-present0
  #   sudo apt-get install libxcb-sync1
  #   sudo apt-get install libxshmfence1
  #   sudo apt-get install libxxf86vm1
  #   dropbox start -i
  #   dropbox start
  #   ( cd ~/Dropbox ; dropbox exclude add Utilities Env )
  # fi

  # # Follow Security Tips for Linux
  # # https://www.tecmint.com/linux-server-hardening-security-tips/

  # ## Install SELinux and enable it
  # if [ ! -f /.autorelabel ]; then
  #   sudo apt install policycoreutils selinux-utils selinux-basics
  #   sudo selinux-activate
  #   sudo touch /.autorelabel
  # fi

  ## Unless we add allowed user to /etc/cron.allow, default will denied crontab for all users
  if [ ! -f /etc/cron.deny ]; then
    sudo bash -c 'echo "ALL" >> /etc/cron.deny'
  fi

  ## Inject a warning message before login
  sudo sed -i "s@#Banner none@Banner ${BASEDIR}/../warning.net/@g" /etc/ssh/sshd_config
  sudo systemctl restart sshd
fi

# To install useful key bindings and fuzzy completion after fzf installed
$(brew --prefix)/opt/fzf/install

# To install vim-plug (vim plugins manager)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# To install cheat.sh
curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
sudo chmod +x /usr/local/bin/cht.sh
