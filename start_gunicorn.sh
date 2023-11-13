#!/bin/bash

# Check if the virtual environment is already activated
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Activating virtual environment"
    source venv/bin/activate
else
    echo "Virtual environment already active"
fi

# Start Gunicorn with the specified configuration
gunicorn -w 4 -b 0.0.0.0:5000 "urlshort:create_app()"
