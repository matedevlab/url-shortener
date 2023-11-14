# Find the PID of the Gunicorn master process for the specific project
$processes = Get-Process | Where-Object { $_.ProcessName -eq "gunicorn" -and $_.CommandLine -like "*urlshort:create_app()*" }

# Check if the process was found
if ($processes -eq $null) {
    Write-Host "No Gunicorn master process found for the project."
} else {
    # Kill the Gunicorn master process
    foreach ($process in $processes) {
        Write-Host "Killing Gunicorn master process with PID: $($process.Id)"
        Stop-Process -Id $process.Id
    }
    Write-Host "Gunicorn master process has been terminated."
}