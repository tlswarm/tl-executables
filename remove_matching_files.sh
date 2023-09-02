#!/bin/bash

current_dir="$(pwd)"

# Move to /usr/bin/ directory
cd /usr/bin/

# Loop through each file in /usr/bin/
for file in *; do
  # Check if the file exists in the current directory
  if [[ -e "$current_dir/$file" ]]; then
    echo "Removing /usr/bin/$file"
    sudo rm "$file"
  fi
done
