#!/bin/bash

# Define the password
PASSWORD="password1"

# Check if userlist.txt exists
if [ ! -f "userlist.txt" ]; then
    echo "Error: userlist.txt not found in the current directory."
    exit 1
fi

# Read each username from userlist.txt and set password
while IFS= read -r username; do
    # Check if the username is not empty
    if [ -n "$username" ]; then
        # Set password for the user
        echo "$username:$PASSWORD" | chpasswd

        # Force user to change password on first login
        chage -d 0 "$username"

        echo "Password set successfully for $username."
    fi
done < "userlist.txt"

echo "Password setting complete."
