#!/usr/bin/env bash
set -euo pipefail

# Try to activate a virtualenv if not already active
if [ -z "${VIRTUAL_ENV:-}" ]; then
  if [ -f "venv/bin/activate" ]; then
    . venv/bin/activate
  elif [ -f ".venv/bin/activate" ]; then
    . .venv/bin/activate
  fi
else
  echo "Virtual environment already active"
fi

# Use venv's pip explicitly and ensure wheel/build tools are available
python -m pip install --upgrade pip setuptools wheel
python -m pip install -e '.[dev]'

# Run pytest (forward any args)
pytest "${@:-}"