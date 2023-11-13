#!/bin/bash

# Adding the current directory (project root) to PYTHONPATH
export PYTHONPATH=$PYTHONPATH:`pwd`

# Running pytest
pytest
