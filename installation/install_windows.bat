@echo off
setlocal
set ENV_NAME=precision-course-env

echo Setting up course environment from environment.yml

:: Make sure user is in the same directory as the environment.yml file
IF NOT EXIST environment.yml (
    echo ERROR: environment.yml not found in current directory.
    pause
    exit /b
)

:: Check if environment already exists
conda info --envs | findstr /C:"%ENV_NAME%" >nul
IF %ERRORLEVEL%==0 (
    echo Environment "%ENV_NAME%" already exists. Removing it...
    conda env remove -n %ENV_NAME%
    IF %ERRORLEVEL% NEQ 0 (
        echo Failed to remove existing environment. Exiting.
        pause
        exit /b
    )
)

:: Create the environment
echo Creating new environment...
conda env create -f environment.yml

IF %ERRORLEVEL% NEQ 0 (
    echo Failed to create environment. Exiting.
    pause
    exit /b
)

echo Environment created.

:: IMPORTANT: Properly activate conda environment
CALL "%USERPROFILE%\miniconda3\Scripts\activate.bat"
CALL conda activate %ENV_NAME%

:: Run the Python script
echo Running verification...
python verify_installation.py

pause
