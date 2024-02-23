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

# Read the userlist file line by line and create users
while IFS= read -r username; do
    # Check if the username is empty or starts with a comment symbol "#"
    if [[ -z "$username" || "$username" =~ ^# ]]; then
        continue
    fi

    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists. Skipping..."
    else
        # Create the user with default settings
        useradd -m "$username"
        echo "User '$username' created successfully."
    fi
done < "userlist.txt"

echo "Bulk user creation completed."
