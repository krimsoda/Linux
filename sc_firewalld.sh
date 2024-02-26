#!/bin/bash

# Predefined variables
PORTS=("8080/tcp" "8443/tcp")  # Example ports to add
SERVICES=("http" "https")      # Example services to add

# Function to display current firewall configuration
display_configuration() {
    echo "Current Firewall Configuration:"
    echo "--------------------------------"
    firewall-cmd --list-all
    echo "--------------------------------"
}

# Function to add ports
add_ports() {
    for port in "${PORTS[@]}"; do
        firewall-cmd --zone=public --add-port="$port" --permanent
    done
    firewall-cmd --reload
    echo "Ports added successfully."
}

# Function to add services
add_services() {
    for service in "${SERVICES[@]}"; do
        firewall-cmd --zone=public --add-service="$service" --permanent
    done
    firewall-cmd --reload
    echo "Services added successfully."
}

# Function to prompt user to select network card
select_network_card() {
    echo "Available network cards:"
    echo "-------------------------"
    ip -o link show | awk -F': ' '{print $2}'
    echo "-------------------------"
    read -p "Enter the network card (e.g., eth0): " network_card
}

# Main script
echo "Checking Firewalld service status..."
if systemctl is-active --quiet firewalld; then
    echo "Firewalld service is running."
else
    echo "Firewalld service is not running. Exiting."
    exit 1
fi

display_configuration

# Prompt user to select network card
select_network_card

# Add ports and services
add_ports
add_services

echo "Configuration updated successfully."

