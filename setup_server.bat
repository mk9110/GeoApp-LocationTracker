@echo off
echo Setting up Python server for location tracking...
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python is not installed or not in PATH
    echo Please install Python from https://www.python.org/downloads/
    pause
    exit /b 1
)

echo Python found. Installing dependencies...
echo.

REM Install Python dependencies
cd server
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo Error: Failed to install Python dependencies
    echo Please check your Python installation and internet connection
    pause
    exit /b 1
)

cd ..

echo.
echo ✓ Server setup completed successfully!
echo.
echo Next steps:
echo 1. Copy server\env_example.txt to server\.env
echo 2. Update server\.env with your database credentials
echo 3. Make sure PostgreSQL is running
echo 4. Run: python server\app.py
echo.
echo The server will be available at: http://localhost:5000
echo.
pause

