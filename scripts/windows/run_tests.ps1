# Try to activate venv if not already active
if (-not $env:VIRTUAL_ENV) {
    if (Test-Path .\venv\Scripts\Activate.ps1) {
        . .\venv\Scripts\Activate.ps1
    } elseif (Test-Path .\.venv\Scripts\Activate.ps1) {
        . .\.venv\Scripts\Activate.ps1
    }
} else {
    Write-Host "Virtual environment already active"
}

# Use python -m pip to ensure venv python's pip is used
python -m pip install --upgrade pip setuptools wheel
python -m pip install -e '.[dev]'

# Run pytest (forward any args)
pytest $args