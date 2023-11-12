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

# Create a virtual environment
python3 -m venv env

# Activate virtual environment
source env/bin/activate

# Install dependencies from requirements.txt
pip install -r requirements.txt

echo "Setup complete. Dependencies are installed."
