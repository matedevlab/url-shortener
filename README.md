# url-shorten

This repository houses a dynamic URL shortening service, designed to simplify long URLs into concise, custom-named links. Unlike traditional URL shorteners, this tool allows users to assign a desired alias to their URLs, making them not only shorter but also more memorable and personalized.

## Set up the project

1. Runt the setup scripts in the temrinal form the root folder:

   1. Unix-like system: `./setup.sh`
   2. Windows in PowerShell: `.\setup.ps1`

      - Before running the PowerShell scripts, ensure that the execution policy allows it:

        `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

2. Activate the virutal environment:

   1. Unix-like system: `source ./env/bin/activate`
   2. Windows in PowerShell: `.\env\Scripts\Activate.ps1`

3. Run the run.py file

   1. From the root directory run `python3 run.py`

## Run the tests

4. If you want to run the tests run these command in the terminal form the root folder

   1. Unix-like system: `./run_tests.sh`
   2. Windows in PowerShell: `.\run_tests.ps1`

      Note: To run the PowerShell script, you may need to adjust your execution policy to allow the script to run. You can do this by running PowerShell as an administrator and executing: `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned`
