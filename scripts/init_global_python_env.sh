#!/bin/bash
# Proper header for a Bash script.

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  sudo apt install python3-venv python3-pip
fi

mkdir -p ~/.local/bin ~/.local/venvs
python3 -m venv ~/.local/venvs/global

~/.local/venvs/global/bin/pip install pipenv
ln -sf ~/.local/venvs/global/bin/pipenv ~/.local/bin

# ~/.local/venvs/global/bin/pip install img2pdf
# ln -sf ~/.local/venvs/global/bin/img2pdf ~/.local/bin

# temp solution fix pipy decide shutdown search service
# ~/.local/venvs/global/bin/pip install pip-search
# ln -sf ~/.local/venvs/global/bin/pip_search ~/.local/bin