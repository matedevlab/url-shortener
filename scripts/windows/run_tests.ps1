# Check if the virtual environment is already activated
if (-Not [String]::IsNullOrEmpty($env:VIRTUAL_ENV)) {
    Write-Host "Virtual environment already active"
} else {
    Write-Host "Activating virtual environment"
    .\venv\Scripts\Activate.ps1
}

# Adding the project root directory to PYTHONPATH
$env:PYTHONPATH = "$env:PYTHONPATH;$(Get-Location)"

# Running pytest
pytest