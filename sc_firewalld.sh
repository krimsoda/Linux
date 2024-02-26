#!/bin/bash

# Define variables
PORTS=(80 443)          # Predefined ports to open
SERVICES=("http" "https")  # Predefined services to allow

# Check if firewalld service is running
if ! systemctl is-active --quiet firewalld; then
    echo "Firewalld service is not running. Please start the service and try again."
    exit 1
fi

# Get the list of currently active network interfaces
ACTIVE_INTERFACES=$(ip -o link show | awk -F': ' '{print $2}')

# Display current firewall configuration
echo "Current firewall configuration:"
firewall-cmd --list-all

# Prompt the user to select a firewall zone or use the current default zone
echo "Available firewall zones:"
firewall-cmd --get-zones
read -p "Enter the firewall zone (press Enter for default): " SELECTED_ZONE

# Use the current default zone if no input is provided
if [ -z "$SELECTED_ZONE" ]; then
    ZONE=$(firewall-cmd --get-default-zone)
else
    ZONE="$SELECTED_ZONE"
fi

# Prompt the user to select a network interface or use the current default interface
echo "Available network interfaces:"
echo "$ACTIVE_INTERFACES"
read -p "Enter the network interface (press Enter for default): " INTERFACE

# Use the current default interface if no input is provided
if [ -z "$INTERFACE" ]; then
    INTERFACE=$(ip -o route get 1 | grep -oP 'dev \K\S+')
fi

# Validate selected interface
if ! echo "$ACTIVE_INTERFACES" | grep -q "$INTERFACE"; then
    echo "Invalid network interface. Please select a valid interface."
    exit 1
fi

# Add predefined ports and services to the selected interface in the specified zone
echo "Adding predefined ports and services to interface $INTERFACE in zone $ZONE..."
for port in "${PORTS[@]}"; do
    firewall-cmd --zone=$ZONE --add-port=$port/tcp --permanent
done

for service in "${SERVICES[@]}"; do
    firewall-cmd --zone=$ZONE --add-service=$service --permanent
done

# Reload firewall settings
echo "Reloading firewall settings..."
firewall-cmd --reload

# Display updated firewall configuration
echo "Updated firewall configuration:"
firewall-cmd --list-all

echo "Firewall configuration updated successfully."
