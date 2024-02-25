#!/bin/bash

# Define variables
userlist_file="userlist.txt"  # File containing list of usernames

# Check if the user executing the script is root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" 
    exit 1
fi

# Check if the userlist file exists
if [ ! -f "$userlist_file" ]; then
    echo "Userlist file '$userlist_file' not found in the current directory."
    exit 1
fi

# Read the userlist file line by line and remove users
while IFS= read -r username; do
    # Check if the username is empty or starts with a comment symbol "#"
    if [[ -z "$username" || "$username" =~ ^# ]]; then
        continue
    fi

    # Check if the user exists
    if id "$username" &>/dev/null; then
        # Remove the user
        userdel -r "$username"
        echo "User '$username' removed successfully."
    else
        echo "User '$username' does not exist. Skipping removal..."
    fi
done < "$userlist_file"

echo "Bulk user removal completed."
