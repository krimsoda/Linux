#!/bin/bash
###################################################################
#Script Name	:Useradd                                                                                             
#Description	:
#Notes          :file: userlist.txt"                                                                    
#Author       	:krimsoda                                               
###################################################################
# Check if the userlist file exists
if [ ! -f "userlist.txt" ]; then
    echo "Userlist file 'userlist.txt' not found in the current directory."
    exit 1
fi

# Read the userlist file line by line and add users to the wheel group
while IFS= read -r username; do
    # Check if the username is empty or starts with a comment symbol "#"
    if [[ -z "$username" || "$username" =~ ^# ]]; then
        continue
    fi

    # Check if the user exists
    if id "$username" &>/dev/null; then
        # Add the user to the wheel group
        usermod -aG wheel "$username"
        echo "User '$username' added to the wheel group."
    else
        echo "User '$username' not found. Skipping adding to the wheel group..."
    fi
done < "userlist.txt"

echo "Adding users to the wheel group completed."
