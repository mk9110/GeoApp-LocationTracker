@echo off
echo Building APK using Docker...
echo.

REM Check if Docker is installed
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Docker is not installed or not running
    echo Please install Docker Desktop from https://www.docker.com/products/docker-desktop
    pause
    exit /b 1
)

echo Docker found. Building APK...
echo.

REM Build Docker image
echo Step 1: Building Docker image...
docker build -t geoapp-builder .

if %errorlevel% neq 0 (
    echo Error: Failed to build Docker image
    pause
    exit /b 1
)

echo.
echo Step 2: Extracting APK from container...
docker run --rm -v "%cd%":/output geoapp-builder cp /output/app-debug.apk /output/

if %errorlevel% neq 0 (
    echo Error: Failed to extract APK
    pause
    exit /b 1
)

echo.
echo ✓ APK built successfully!
echo Location: app-debug.apk
echo.
echo You can now install this APK on your Android device.
echo.

REM Clean up
echo Cleaning up Docker image...
docker rmi geoapp-builder

echo.
echo Build completed successfully!
pause

