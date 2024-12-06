#!/bin/bash

# Read server list from a file (servers.txt)
servers=()
while IFS= read -r line; do
    servers+=("$line")
done < servers.txt

# Display the list of servers to the user
echo "Select a server to connect to:"
for i in "${!servers[@]}"; do
    echo "$((i + 1)). ${servers[$i]}"
done

# Prompt user to select a server
read -p "Enter the number of the server you want to connect to: " server_number

# Check if the input is valid
if [[ ! "$server_number" =~ ^[0-9]+$ ]] || [ "$server_number" -lt 1 ] || [ "$server_number" -gt "${#servers[@]}" ]; then
    echo "Invalid selection. Exiting..."
    exit 1
fi

# Get the selected server
selected_server="${servers[$((server_number - 1))]}"

# Prompt user to enter the username manually
read -p "Enter the username for $selected_server: " username

# Connect to the selected server via SSH
echo "Connecting to $username@$selected_server..."
ssh "$username@$selected_server"
