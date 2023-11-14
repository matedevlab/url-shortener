#!/bin/bash

# Check if the virtual environment is already activated
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Activating virtual environment"
    source venv/bin/activate
else
    echo "Virtual environment already active"
fi


# Adding the current directory (project root) to PYTHONPATH
export PYTHONPATH=$PYTHONPATH:`pwd`

# Running pytest
pytest
