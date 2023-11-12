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

# Define the path to the config.py file inside the shorturl directory
$configFilePath = ".\shorturl\config.py"

# Check if config.py already exists
if (-Not (Test-Path $configFilePath)) {
    # Generate a more secure secret key and create config.py in the shorturl directory
    "SECRET_KEY = '$(python3 -c "import secrets; print(secrets.token_urlsafe(24))")'" | Out-File $configFilePath
    Write-Host "config.py created in the shorturl directory with a new secret key."
} else {
    Write-Host "config.py already exists in the shorturl directory. No changes made to it."
}

# Create a virtual environment
python3 -m venv env

# Activate virtual environment
& env/Scripts/Activate.ps1

# Install dependencies from requirements.txt
pip install -r requirements.txt

Write-Host "Setup complete. Dependencies are installed."
