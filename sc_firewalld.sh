#!/bin/bash

# Define variables
DEFAULT_INTERFACE=$(ip route get 8.8.8.8 | awk '{print $5}')  # Default network interface
DEFAULT_ZONE=$(firewall-cmd --get-default-zone)              # Default firewall zone
PORTS=("8080/tcp" "8443/tcp")                                # Predefined ports to add
SERVICES=("http" "https")                                    # Predefined services to add

# Function to display firewall configuration
display_configuration() {
    echo "Firewalld Service Status:"
    systemctl status firewalld
    echo "--------------------------------"
    echo "Current Configuration:"
    firewall-cmd --list-all
    echo "--------------------------------"
}

# Function to add ports and services
add_ports_services() {
    local interface=$1
    for port in "${PORTS[@]}"; do
        firewall-cmd --zone=$DEFAULT_ZONE --add-port=$port --permanent
    done
    for service in "${SERVICES[@]}"; do
        firewall-cmd --zone=$DEFAULT_ZONE --add-service=$service --permanent
    done
    firewall-cmd --reload
    echo "Ports and services added successfully."
}

# Main
echo "Checking Firewalld Service Status and Configuration..."
display_configuration

read -p "Do you want to proceed? (y/n): " choice
if [[ $choice == "y" || $choice == "Y" ]]; then
    echo "Available Network Interfaces:"
    ip addr show | awk '/^[0-9]+:/ {print $2}' | sed 's/://' | nl
    read -p "Enter the number of the network interface to use (default: $DEFAULT_INTERFACE): " interface_number
    selected_interface=$(ip addr show | awk '/^[0-9]+:/ {print $2}' | sed 's/://' | sed -n "${interface_number}p")
    interface=${selected_interface:-$DEFAULT_INTERFACE}
    echo "Selected Network Interface: $interface"
    add_ports_services $interface
    echo "Firewall configuration updated."
else
    echo "Exiting script."
fi
