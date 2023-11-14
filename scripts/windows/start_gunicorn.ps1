# Check if the virtual environment is already activated
if (-Not [String]::IsNullOrEmpty($env:VIRTUAL_ENV)) {
    Write-Host "Virtual environment already active"
} else {
    Write-Host "Activating virtual environment"
    .\venv\Scripts\Activate.ps1
}

# Start Gunicorn with the specified configuration
gunicorn -w 4 -b 0.0.0.0:8000 "urlshort:create_app()" --daemon

Write-Host "Gunicorn is running in daemon mode"

# Get the host IP (Windows-specific command)
$HostIP = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -like "Wi-Fi" -or $_.InterfaceAlias -like "Ethernet" } | Select-Object -First 1 -ExpandProperty IPAddress

Write-Host "The application can be accessed at http://$HostIP:8000"