@echo off
echo Setting up PostgreSQL database for location tracking...
echo.

REM Check if PostgreSQL is installed
"C:\Program Files\PostgreSQL\17\bin\psql.exe" --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: PostgreSQL is not installed or not in PATH
    echo Please install PostgreSQL from https://www.postgresql.org/download/
    pause
    exit /b 1
)

echo PostgreSQL found. Setting up database...
echo.

REM Create database and run schema
echo Creating database and tables...
"C:\Program Files\PostgreSQL\17\bin\psql.exe" -U postgres -c "CREATE DATABASE location_tracker;" 2>nul
if %errorlevel% neq 0 (
    echo Database might already exist, continuing...
)

"C:\Program Files\PostgreSQL\17\bin\psql.exe" -U postgres -d location_tracker -f database\schema.sql
if %errorlevel% neq 0 (
    echo Error: Failed to create database schema
    echo Please check your PostgreSQL connection and permissions
    pause
    exit /b 1
)

echo.
echo ✓ Database setup completed successfully!
echo.
echo Next steps:
echo 1. Update server\env_example.txt with your database credentials
echo 2. Rename it to .env
echo 3. Install Python dependencies: pip install -r server\requirements.txt
echo 4. Run the server: python server\app.py
echo.
pause
