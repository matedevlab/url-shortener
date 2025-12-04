#!/bin/bash

# Check if the virtual environment is already activated
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Activating virtual environment"
    source venv/bin/activate
else
    echo "Virtual environment already active"
fi

# Ensure the application is importable without manual PYTHONPATH tweaks
pip install -e .[dev]

# Running pytest
pytest
