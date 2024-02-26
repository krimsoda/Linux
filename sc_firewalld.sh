#!/bin/bash

# Predefined variables for ports and services
PORTS=("8080" "8443")  # Example ports to add
SERVICES=("http" "https")  # Example services to add

# Check if firewalld service is running
if systemctl is-active --quiet firewalld; then
    echo "firewalld service is running."
else
    echo "firewalld service is not running."
    exit 1
fi

# Display current firewalld configuration
echo "Current firewalld configuration:"
firewall-cmd --list-all

# Prompt user to select network interface card (NIC)
read -p "Enter the network interface card (NIC) to configure (default is 'public'): " NIC

# Set default NIC if user input is empty
if [ -z "$NIC" ]; then
    NIC="public"
fi

# Add predefined ports
for port in "${PORTS[@]}"; do
    firewall-cmd --zone=$NIC --add-port=$port/tcp --permanent
done

# Add predefined services
for service in "${SERVICES[@]}"; do
    firewall-cmd --zone=$NIC --add-service=$service --permanent
done

# Reload firewall settings
firewall-cmd --reload

echo "Ports and services added to firewall configuration for network interface card '$NIC'."
