#!/bin/bash
###################################################################
#Script Name	:addgroup                                                                                             
#Description	:add group sudo RedHat: wheel Debian: sudo
#Notes          :file: userlist.txt" change group sudo RedHat: wheel Debian: sudo                                                                
#Author       	:krimsoda                                               
###################################################################
# Check if the userlist file exists
if [ ! -f "userlist.txt" ]; then
    echo "Userlist file 'userlist.txt' not found in the current directory."
    exit 1
fi

# Check if the sudo group exists
if grep -q '^sudo:' /etc/group; then
    sudo_group="sudo"
else
    sudo_group="wheel"
fi

# Read the userlist file line by line and add users to the appropriate group
while IFS= read -r username; do
    # Check if the username is empty or starts with a comment symbol "#"
    if [[ -z "$username" || "$username" =~ ^# ]]; then
        continue
    fi

    # Check if the user exists
    if id "$username" &>/dev/null; then
        # Add the user to the appropriate group
        usermod -aG "$sudo_group" "$username"
        echo "User '$username' added to the '$sudo_group' group."
    else
        echo "User '$username' not found. Skipping adding to the '$sudo_group' group..."
    fi
done < "userlist.txt"

echo "Adding users to the '$sudo_group' group completed."
