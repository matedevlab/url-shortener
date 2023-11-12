# PowerShell script to set up a Python environment with pipenv and Flask

# Check Python version
$pythonVersion = python --version
if ($pythonVersion -like "*Python 3*") {
    Write-Host "Python 3 is detected: $pythonVersion"
} else {
    Write-Host "Python 3 is not installed. Please install it first."
    exit
}

# Install pipenv
Write-Host "Installing pipenv..."
pip install --user pipenv

# Install dependencies using pipenv
Write-Host "Installing project dependencies..."
pipenv install flask

# The script ends here. The user will need to activate the environment manually.
Write-Host "Environment setup is complete. Please activate the environment using 'pipenv shell'."