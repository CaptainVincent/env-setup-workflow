#!/usr/bin/env bash
# ---------------------------------------------------------------------------
#
# This script will create swap file if the swap file does not exist.
# It will disable the swap file and re-create it if it does exist.
#
# Re-create the swap to adjust the size when you change AWS instance types.
#
# Based on advice from:
# https://aws.amazon.com/premiumsupport/knowledge-center/ec2-memory-swap-file/
#
# USE THIS SCRIPT AT YOUR OWN RISK AND STUDY THE CODE CAREFULLY.
#
# For usage, login as root, run "./setupSwap.sh"
#
# Note the following assumptions:
# - you have enough disk-space for the new swap
#   - less than 2 Gb RAM - swap size: 2x the amount of RAM
#   - more than 2 GB RAM, but less than 32 GB - swap size: 4 GB + (RAM – 2 GB)
#   - 32 GB of RAM or more - swap size: 1x the amount of RAM
# - you are running as root user
# - your swap file is called: swapfile
#
# Revision history:
# 2019-04-15 Created (v0.1)
# 2019-04-15 Read total physical memory using /proc/meminfo instead
#
# Tested on:
# - Ubuntu Server 18.04 (On-Premise and Cloud (AWS)) - 2019-04-15
# - Amazon Linux 2 Cloud (AWS) - 2019-04-15
#
# DISCLAIMER:
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License at <http://www.gnu.org/licenses/> for
# more details.

#main start

#check permissions
if [[ $EUID -ne 0 ]]; then
    echo ""
    echo "This script must be run as root! Login as root, sudo or su."
    echo ""
    exit 1;
fi

BASEDIR=$(dirname "$0")
force=false
mark="$BASEDIR/executed.txt"

#support option -f
while getopts ":f" opt; do
  case $opt in
    f)
      force=true
      ;;
    \?)
      echo "invalid option：-$OPTARG" >&2
      exit 1
      ;;
  esac
done

#check executed or not
if [ -f $mark ] && ! $force ; then
  echo "Already done before"
  exit 0
fi

#load code functions
source $BASEDIR/setupSwap.main.sh

#setup permissions for functions
chmod 500 $BASEDIR/setupSwap.main.sh

echo ""
echo "--------------------------------------------------------------------------"
echo "setupSwap - creates swap space on your server based on AWS guidelines"
echo "--------------------------------------------------------------------------"
echo ""
echo "This will remove an existing swap file and then create a new one. "
echo "Please read the disclaimer and review the code before proceeding."
echo ""

echo -n " ¿Do you want to proceed? (y/n): "; read proceed
if [ "$proceed" == "y" ]; then
    echo ""

    setupSwapMain
    touch $mark

else

    echo ""
    echo "You chose to exit. Bye!"

fi

exit 0