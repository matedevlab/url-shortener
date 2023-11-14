# URL Shortener

This repository contains a dynamic URL shortening service, designed to simplify long URLs into concise, easily manageable links. Unlike traditional URL shorteners, this tool allows users to assign custom aliases to their URLs, making them not only shorter but also more memorable and personalized.

## Setting Up the Project

To set up the project, follow these steps:

1. **Prerequisites**:

   - Ensure Python 3.10.12 is installed:
     - Unix-like systems: Follow [Python's official guide](https://www.python.org/downloads/source/).
     - Windows: Download from [Python's official website](https://www.python.org/downloads/windows/).
   - Ensure the venv module is installed (usually comes with Python 3.5 and above).
   - Install Nginx (will be used as reverse proxy):
     - Unix-like systems: Use package managers like `apt` or `yum`. For example, on Ubuntu, run `sudo apt install nginx`.
     - Windows: Download and install from [Nginx for Windows](http://nginx.org/en/docs/windows.html).

2. **Run the Setup Script**:

   - Execute the appropriate setup script from the root folder based on your operating system:
     - Unix-like systems: `./scripts/unix/setup.sh`
     - Windows (using PowerShell): `.\scripts\windows\setup.ps1`
       - **Note**: Ensure the execution policy allows script execution in PowerShell:
         ```powershell
         Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
         ```

3. **Activate the Virtual Environment**:

   - Activate the virtual environment using the following command:
     - Unix-like systems: `source ./venv/bin/activate`
     - Windows (using PowerShell): `.\venv\Scripts\Activate.ps1`

4. **Run the Project**:
   - To start the URL shortener service, follow these steps:
     - Unix-like systems:
       1. Ensure Nginx is running: `sudo systemctl start nginx`
       2. Edit `/etc/nginx/sites-enabled/default` to configure Nginx. Add the following block inside the `server` block:
          ```nginx
          location / {
              proxy_pass http://127.0.0.1:8000;  # Gunicorn on port 8000
              proxy_set_header Host $host;
              proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          }
          ```
       3. Run: `./scripts/unix/start_gunicorn.sh`
     - Windows:
       1. Start Nginx using the Nginx executable.
       2. Edit `nginx.conf` (usually in the Nginx installation directory) to include the following inside the `server` block:
          ```nginx
          location / {
              proxy_pass http://127.0.0.1:8000;  # Gunicorn on port 8000
              proxy_set_header Host $host;
              proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          }
          ```
       3. Run: `.\scripts\windows\start_gunicorn.ps1`

## Stopping the Application

To stop the application, use the following scripts:

- Unix-like systems: `./scripts/unix/kill_gunicorn.sh`
- Windows (using PowerShell): `.\scripts\windows\kill_gunicorn.ps1`

## Running Tests (if you want)

Execute the test script from the root folder to run the tests:

- Unix-like systems: `./scripts/unix/run_tests.sh`
- Windows (using PowerShell): `.\scripts\windows\run_tests.ps1`
  - **Note**: You may need to adjust your execution policy to run the PowerShell script, as mentioned above.

## Note

The `run.py` file is intended for development purposes only and does not need to be used for production deployments.
