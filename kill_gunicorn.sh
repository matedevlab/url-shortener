#!/bin/bash

# Find the PID of the Gunicorn master process for the specific project
PID=$(ps aux | grep 'gunicorn' | grep 'urlshort:create_app()' | awk '{print $2}' | head -1)

# Check if the process was found
if [ -z "$PID" ]; then
    echo "No Gunicorn master process found for the project."
else
    # Kill the Gunicorn master process
    echo "Killing Gunicorn master process with PID: $PID"
    kill "$PID"
    echo "Gunicorn master process has been terminated."
fi
