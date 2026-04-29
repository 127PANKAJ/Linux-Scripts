#!/bin/bash

# Takes first argument as csv file
CSV=$1

# Checks if the file exit
[ ! -f "$CSV" ] && { echo "No CSV file!"; exit 1; }

while IFS=, read -r user pass sudo_access; do
  [ -z "$user" ] && continue	# checks for empty space and skips
  id "$user" &>/dev/null && { echo "$user exists"; continue; }
  sudo useradd -m "$user"
  echo "$user:$pass" | sudo chpasswd

# Grant sudo if specified
  if [[ "$sudo_access" == "yes" ]]; then
    echo "$user ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/"$user"
    sudo chmod 440 /etc/sudoers.d/"$user"
    echo "Added $user with sudo access"
  else
    echo "Added $user (no sudo)"
  fi
done < "$CSV"
