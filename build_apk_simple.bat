@echo off
echo Building GeoApp APK...
echo.

REM Check if Java is installed
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Java is not installed or not in PATH
    echo Please install Java JDK from https://www.oracle.com/java/technologies/downloads/
    pause
    exit /b 1
)

echo Java found. Checking Android SDK...

REM Check if Android SDK is available
if not exist "%ANDROID_HOME%" (
    echo Warning: ANDROID_HOME is not set
    echo Please install Android SDK or use Android Studio
    echo.
    echo Alternative: Use online build services like:
    echo - GitHub Actions
    echo - Appetize.io
    echo - GitHub Codespaces
    echo.
    pause
    exit /b 1
)

echo Android SDK found at: %ANDROID_HOME%

REM Try to build with gradle
echo Attempting to build APK...
gradlew.bat assembleDebug

if %errorlevel% equ 0 (
    echo.
    echo ✓ APK built successfully!
    echo Location: app\build\outputs\apk\debug\app-debug.apk
    echo.
    echo You can now install this APK on your Android device.
) else (
    echo.
    echo ✗ Build failed. Please check the error messages above.
    echo.
    echo Solutions:
    echo 1. Install Android Studio and build from there
    echo 2. Use online build services
    echo 3. Install Android SDK manually
)

echo.
pause

