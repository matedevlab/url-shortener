# Check if the virtual environment is already activated
if (-Not [String]::IsNullOrEmpty($env:VIRTUAL_ENV)) {
    Write-Host "Virtual environment already active"
} else {
    Write-Host "Activating virtual environment"
    .\venv\Scripts\Activate.ps1
}

# Ensure the application is importable without manual PYTHONPATH tweaks
pip install -e .[dev]

# Running pytest
pytest
