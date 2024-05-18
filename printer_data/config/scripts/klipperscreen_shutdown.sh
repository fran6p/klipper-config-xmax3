#!/bin/bash

# IP address of the Klipperscreen
IP_KS="192.168.1.127"

# Username and password
USER="mks"
PASSWORD="makerbase"

# Define countdown function
countdown() {
    for i in {5..1}; do
        echo "Shutting down Klipperscreen in: $i"
        sleep 1
    done
    echo "Shutting down Klipperscreen in: 0"
}

# Display countdown
echo "Klipperscreen will be shut down:"
countdown

# Establish SSH connection with disabled host key checking and shut down Klipper screen
sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no $USER@$IP_KS "sudo shutdown -h now"

# Check if the Klipper screen has been shut down
sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no $USER@$IP_KS "pgrep klipperscreen > /dev/null"
if [ $? -eq 0 ]; then
  echo "Error: Klipperscreen was not shut down!"
  exit 1
fi

echo "Shutdown completed!"
