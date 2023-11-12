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
    # Generate a random secret key and create config.py in one line
    echo "SECRET_KEY = b'$(python3 -c 'import os; print(os.urandom(16))')" > config.py
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
