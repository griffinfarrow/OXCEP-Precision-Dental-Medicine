@echo off
echo Setting up course environment from environment.yml

:: Make sure user is in the same directory as the environment.yml file
IF NOT EXIST environment.yml (
    echo ERROR: environment.yml not found in current directory.
    pause
    exit /b
)

:: Create the environment
conda env create -f environment.yml

echo Environment created.
echo To activate the environment, run:
echo conda activate course-env
pause
