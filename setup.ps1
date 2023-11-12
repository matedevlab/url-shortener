# Check for Python 3
$python3 = Get-Command python3 -ErrorAction SilentlyContinue
if ($null -eq $python3) {
    Write-Host "Python 3 is not installed. Please install it first."
    exit
}

# Check for venv module in Python 3
$venvCheck = python3 -c "import venv"
if ($LASTEXITCODE -ne 0) {
    Write-Host "venv module for Python 3 is not installed. Please install it first."
    exit
}

# Check if config.py already exists
if (-Not (Test-Path "config.py")) {
    # Generate a random secret key and create config.py in one line
    "SECRET_KEY = b'$(python3 -c "import os; print(os.urandom(16))")'" | Out-File config.py
    Write-Host "config.py created with a new secret key."
} else {
    Write-Host "config.py already exists. No changes made to it."
}

# Create a virtual environment
python3 -m venv env

# Activate virtual environment
& env/Scripts/Activate.ps1

# Install dependencies from requirements.txt
pip install -r requirements.txt

Write-Host "Setup complete. Dependencies are installed."
