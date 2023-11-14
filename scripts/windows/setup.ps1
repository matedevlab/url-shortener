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

# Check for Nginx
$nginx = Get-Command nginx -ErrorAction SilentlyContinue
if ($null -eq $nginx) {
    Write-Host "Nginx is not installed. Please install Nginx manually."
    exit
}

# Check if Nginx is running
$nginxService = Get-Service -Name nginx -ErrorAction SilentlyContinue
if ($null -eq $nginxService) {
    Write-Host "Nginx service not found. Please ensure Nginx is installed."
    exit
} elseif ($nginxService.Status -ne "Running") {
    Write-Host "Nginx is not running. Attempting to start Nginx..."
    Start-Service nginx
    $nginxService.Refresh()
    if ($nginxService.Status -ne "Running") {
        Write-Host "Failed to start Nginx. Please start Nginx manually."
        exit
    }
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
python3 -m venv venv

# Activate virtual environment
& venv/Scripts/Activate.ps1

# Install dependencies from requirements.txt
pip install -r requirements.txt

Write-Host "Setup complete. Dependencies are installed."
