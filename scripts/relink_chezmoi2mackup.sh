#!/bin/bash
# Proper header for a Bash script.

for filename in $(find ~/ -type l -not -path '*/.linuxbrew*' ! -exec test -e {} \; -print) ; do
  echo 'relink' $filename
  path=$(ls -l $filename | sed "s/.*>\ \(.*\)/\1/")
  new=$(echo $path | sed "s|\$HOME|${HOME}|g")
  ln -sf $new $filename
done

