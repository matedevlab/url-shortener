# Check if the virtual environment is already activated
if (-Not [String]::IsNullOrEmpty($env:VIRTUAL_ENV)) {
    Write-Host "Virtual environment already active"
} else {
    Write-Host "Activating virtual environment"
    .\venv\Scripts\Activate.ps1
}

# Start Gunicorn with the specified configuration
gunicorn -w 4 -b 0.0.0.0:5000 "urlshort:create_app()"