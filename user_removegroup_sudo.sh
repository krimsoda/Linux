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

# Read the userlist file line by line and remove users from the appropriate group
while IFS= read -r username; do
    # Check if the username is empty or starts with a comment symbol "#"
    if [[ -z "$username" || "$username" =~ ^# ]]; then
        continue
    fi

    # Check if the user exists
    if id "$username" &>/dev/null; then
        # Remove the user from the appropriate group
        gpasswd -d "$username" "$sudo_group"
        echo "User '$username' removed from the '$sudo_group' group."
    else
        echo "User '$username' not found. Skipping removal from the '$sudo_group' group..."
    fi
done < "userlist.txt"

echo "Removing users from the '$sudo_group' group completed."
