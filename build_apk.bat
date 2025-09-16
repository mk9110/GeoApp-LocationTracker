@echo off
echo Building GeoApp APK...
echo.

REM Check if gradlew exists
if not exist "gradlew.bat" (
    echo Error: gradlew.bat not found. Make sure you're in the project root directory.
    pause
    exit /b 1
)

REM Clean previous builds
echo Cleaning previous builds...
call gradlew clean

REM Build release APK
echo Building release APK...
call gradlew assembleRelease

REM Check if build was successful
if exist "app\build\outputs\apk\release\app-release.apk" (
    echo.
    echo ✓ APK built successfully!
    echo Location: app\build\outputs\apk\release\app-release.apk
    echo.
    echo You can now install this APK on your Android device.
) else (
    echo.
    echo ✗ Build failed. Please check the error messages above.
)

echo.
pause

