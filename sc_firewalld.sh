#!/bin/bash

# Define variables
PORTS=(80 443)          # Predefined ports to open
SERVICES=("http" "https")  # Predefined services to allow
ZONE="public"           # Default firewall zone

# Check if firewalld service is running
if ! systemctl is-active --quiet firewalld; then
    echo "Firewalld service is not running. Please start the service and try again."
    exit 1
fi

# Display current firewall configuration
echo "Current firewall configuration:"
firewall-cmd --list-all

# Prompt the user to select a network interface
echo "Available network interfaces:"
ip -o link show | awk -F': ' '{print $2}'
read -p "Enter the network interface (e.g., eth0): " INTERFACE

# Validate selected interface
if ! ip link show $INTERFACE &> /dev/null; then
    echo "Invalid network interface. Please select a valid interface."
    exit 1
fi

# Add predefined ports and services to the selected interface
echo "Adding predefined ports and services to interface $INTERFACE..."
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
