@echo off
cd /d "%~dp0"

where git >nul 2>&1
if %errorlevel% neq 0 (
    if exist "C:\Program Files\Git\cmd\git.exe" (
        set "GIT=C:\Program Files\Git\cmd\git.exe"
    ) else (
        echo Git is not installed. Please install from https://git-scm.com
        pause
        exit /b 1
    )
) else (
    set "GIT=git"
)

"%GIT%" remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    "%GIT%" remote add origin https://github.com/kor-jins/our-wedding-day.git
)

"%GIT%" add .
"%GIT%" commit -m "update"
"%GIT%" push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo === Upload complete! ===
) else (
    echo.
    echo === Upload failed. Check messages above. ===
)

pause
