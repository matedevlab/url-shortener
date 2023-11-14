# URL Shortener

This repository contains a dynamic URL shortening service, designed to simplify long URLs into concise, easily manageable links. Unlike traditional URL shorteners, this tool allows users to assign custom aliases to their URLs, making them not only shorter but also more memorable and personalized.

## Setting Up the Project

To set up the project, follow these steps:

1. **Run the Setup Script**:

   - In a terminal from the root folder, execute the appropriate setup script based on your operating system:
     - For Unix-like systems: `./scripts/unix/setup.sh`
     - For Windows (using PowerShell): `.\scripts\windows\setup.ps1`
       - **Note**: Before running the PowerShell script, ensure the execution policy allows script execution:
         ```powershell
         Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
         ```

2. **Activate the Virtual Environment**:

   - Activate the virtual environment using the following command:
     - For Unix-like systems: `source ./venv/bin/activate`
     - For Windows (using PowerShell): `.\venv\Scripts\Activate.ps1`

3. **Run the Project**:
   - To start the URL shortener service, follow these steps:
     1. Download and start Nginx.
     2. Open the `/etc/nginx/sites-enabled/default` file and edit the `location /` block to proxy requests to your Gunicorn server. The block should look like this:
        ```nginx
        location / {
            proxy_pass http://127.0.0.1:8000;  # Gunicorn is on port 8000
            proxy_set_header Host $host;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
        ```
     3. For Unix-like systems: `./scripts/unix/start_gunicorn.sh`
     4. For Windows (using PowerShell): `.\scripts\windows\start_gunicorn.ps1`

## Stopping the Application

To stop the application, use the following scripts:

- For Unix-like systems: `./scripts/unix/kill_gunicorn.sh`
- For Windows (using PowerShell): `.\scripts\windows\kill_gunicorn.ps1`

## Running Tests

Execute the test script from the root folder to run the tests:

- For Unix-like systems: `./scripts/unix/run_tests.sh`
- For Windows (using PowerShell): `.\scripts\windows\run_tests.ps1`
  - **Note**: You may need to adjust your execution policy to run the PowerShell script, as mentioned above.

## Note

The `run.py` file is intended for development purposes only and does not need to be used for production deployments.
