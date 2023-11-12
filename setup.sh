#!/bin/bash

# Check Python version
if ! command -v python3 &> /dev/null
then
    echo "Python 3 is not installed. Please install it first."
    exit 1
fi

# Install pipenv
echo "Installing pipenv..."
pip3 install --user pipenv

# Install dependencies using pipenv
echo "Installing project dependencies..."
pipenv install flask

# The script ends here. The user will need to activate the environment manually.
echo "Environment setup is complete. Please activate the environment using 'pipenv shell'."
