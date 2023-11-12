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

# Check if config.py already exists
if [ ! -f "config.py" ]; then
    # Generate a more secure secret key and create config.py
    echo "SECRET_KEY = '$(python3 -c "import secrets; print(secrets.token_urlsafe(24))")'" > config.py
    echo "config.py created with a new secret key."
else
    echo "config.py already exists. No changes made to it."
fi

# Create a virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Install dependencies from requirements.txt
pip install -r requirements.txt

echo "Setup complete. Dependencies are installed."
