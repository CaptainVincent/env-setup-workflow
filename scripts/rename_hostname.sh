#!/bin/bash
# Proper header for a Bash script.

# Example.
# sudo ./rename_host_name.sh 'Vincent@SecondState' 'Vincent-SecondState'
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  if [[ $# -eq 2 ]]; then
    scutil --set ComputerName $1
    scutil --set HostName $2
    scutil --set LocalHostName $2
  else
    echo 'wrong number of parameters, only support 2'
    exit 1
  fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  if [[ $# -ge 1 && $# -le 2 ]]; then
    hostnamectl set-hostname $1
  else
    echo 'wrong number of parameters, only support 1<= and <=2'
    exit 1
  fi
fi