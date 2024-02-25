#!/bin/bash

# Define variables
userlist_file="userlist.txt"  # File containing list of usernames
default_directory="/home"     # Default directory for new users
default_shell="/bin/bash"     # Default shell for new users

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

# Read the userlist file line by line and add users
while IFS= read -r username; do
    # Check if the username is empty or starts with a comment symbol "#"
    if [[ -z "$username" || "$username" =~ ^# ]]; then
        continue
    fi

    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists. Skipping..."
    else
        # Add the user with predefined directory and shell
        useradd -m -d "$default_directory/$username" -s "$default_shell" "$username"
        echo "User '$username' created successfully with directory '$default_directory/$username' and shell '$default_shell'."
    fi
done < "$userlist_file"

echo "Bulk user creation completed."
