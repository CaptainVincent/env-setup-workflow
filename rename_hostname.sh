#!/bin/bash
# Proper header for a Bash script.

# Example.
# sudo ./rename_host_name.sh 'SecondState Vincent-SecondState' 'Vincent@SecondState'
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  if [[ $# -eq 3 ]]; then
    scutil --set HostName $1
    scutil --set LocalHostName $2
    scutil --set ComputerName $3
  else
    echo 'wrong number of parameters, only support 3'
    exit 1
  fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  if [[ $# -eq 1 ]]; then
    hostnamectl set-hostname $1
  else
    echo 'wrong number of parameters, only support 1'
    exit 1
  fi
fi