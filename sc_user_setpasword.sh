#!/bin/bash
###################################################################
#Script Name	:Set Password                                                                                             
#Description	:
#Notes          :file: userlist.txt"                                                                                
#Author       	:krimsoda                                               
###################################################################

# Check if the userlist file exists
if [ ! -f "userlist.txt" ]; then
    echo "Userlist file 'userlist.txt' not found in the current directory."
    exit 1
fi

# Read the userlist file line by line and set password
while IFS= read -r username; do
    # Check if the username is empty or starts with a comment symbol "#"
    if [[ -z "$username" || "$username" =~ ^# ]]; then
        continue
    fi

    # Check if the user exists
    if id "$username" &>/dev/null; then
        # Set password for the user
        echo "$username:password1" | chpasswd
        echo "Password set successfully for user '$username'."
    else
        echo "User '$username' not found. Skipping password setting..."
    fi
done < "userlist.txt"

echo "Password setting completed."
