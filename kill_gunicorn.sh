#!/bin/bash

# Find all PIDs of Gunicorn processes for the specific project
PIDS=$(ps aux | grep 'gunicorn -w 4 -b 0.0.0.0:8000 urlshort:create_app() --daemon' | awk '{print $2}')

# Check if any Gunicorn processes were found
if [ -z "$PIDS" ]; then
    echo "No Gunicorn processes found for the project."
else
    # Kill all Gunicorn processes
    echo "Killing Gunicorn processes..."
    for PID in $PIDS; do
        kill "$PID"
        echo "Killed Gunicorn process with PID: $PID"
    done
    echo "All Gunicorn processes have been terminated."
fi
