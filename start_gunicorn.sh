#!/bin/bash

# Check if the virtual environment is already activated
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Activating virtual environment"
    source venv/bin/activate
else
    echo "Virtual environment already active"
fi

# Start Gunicorn with the specified configuration
gunicorn -w 4 -b 0.0.0.0:8000 "urlshort:create_app()" --daemon

echo "Gunicorn is running in daemon mode"

# Get the host IP
HOST_IP=$(hostname -I | cut -d' ' -f1)

echo "The application can be accessed at http://$HOST_IP:8000"

