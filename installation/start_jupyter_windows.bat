@echo off 
REM Activate conda environment and launch Jupyter notebook 

CALL conda activate precision-course-env

IF %ERRORLEVEL% NEQ 0 (
    ECHO Failed to activate conda environment. 
    EXIT /B 1
)

jupyter notebook --notebook-dir="../course_content"
