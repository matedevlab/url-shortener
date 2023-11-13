# URL Shortener

This repository contains a dynamic URL shortening service, designed to simplify long URLs into concise, easily manageable links. Unlike traditional URL shorteners, this tool allows users to assign custom aliases to their URLs, making them not only shorter but also more memorable and personalized.

## Setting Up the Project

To set up the project, follow these steps:

1. **Run the Setup Script**:

   - In a terminal from the root folder, execute the appropriate setup script based on your operating system:
     - For Unix-like systems: `./setup.sh`
     - For Windows (using PowerShell): `.\setup.ps1`
       - Note: Before running the PowerShell script, ensure the execution policy allows script execution:
         ```powershell
         Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
         ```

2. **Activate the Virtual Environment**:

   - Activate the virtual environment using the following command:
     - For Unix-like systems: `source ./venv/bin/activate`
     - For Windows (using PowerShell): `.\venv\Scripts\Activate.ps1`

3. **Run the Project**:
   - Start the URL shortener service by running the corresponding script:
     - For Unix-like systems: `./start_gunicorn.sh`
     - For Windows (using PowerShell): `.\start_gunicorn.ps1`

## Running Tests

To run the tests, execute the test script from the root folder:

- For Unix-like systems: `./run_tests.sh`
- For Windows (using PowerShell): `.\run_tests.ps1`
  - Note: To run the PowerShell script, you may need to adjust your execution policy as mentioned above.
