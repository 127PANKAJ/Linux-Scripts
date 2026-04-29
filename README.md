# Linux-Scripts
Here are the scripts I have made in learing scripting in linux.

CSV User Creation Script
Creates Linux users from a CSV file and optionally grants sudo access.

Usage
bash
sudo ./create_users.sh users.csv
CSV Format
text
username,password,sudo_access
alice,Pass123,yes
bob,Pass456,no
Notes
Skips users that already exist.

sudo_access should be yes to grant sudo.

Use with care, since sudo access gives full admin rights.
