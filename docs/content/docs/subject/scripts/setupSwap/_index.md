---
title: setupSwap
type: docs
weight: 12
---

# The Setup Swap Bash script does the following

- Remove the existing swap file (if it exists).
- Determine the available memory on the Linux instance and calculate the correct swap size.
  - Rules
    - less than 2 Gb RAM – swap size: 2 x the amount of RAM
    - more than 2 GB RAM, but less than 32 GB – swap size: 4 GB + (RAM – 2 GB)
    - 32 GB of RAM or more – swap size: 1 x the amount of RAM
- Create the new swap file.

> Source code : https://anto.online/code/bash-script-to-create-a-swap-file-in-linux/
