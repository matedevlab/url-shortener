#!/bin/bash

# Check for Python 3
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install it first."
    exit 1
fi

# Check for venv module in Python 3
if ! python3 -c "import venv" &> /dev/null; then
    echo "venv module for Python 3 is not installed. Please install it first."
    exit 1
fi

# Define the path to the config.py file inside the urlshort directory
configFilePath="urlshort/config.py"

# Check if config.py already exists in the urlshort directory
if [ ! -f "$configFilePath" ]; then
    # Generate a more secure secret key and create config.py in the urlshort directory
    echo "SECRET_KEY = '$(python3 -c "import secrets; print(secrets.token_urlsafe(24))")'" > $configFilePath
    echo "config.py created in the urlshort directory with a new secret key."
else
    echo "config.py already exists in the urlshort directory. No changes made to it."
fi

# Create a virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Install dependencies from requirements.txt
pip install -r requirements.txt

echo "Setup complete. Dependencies are installed."
