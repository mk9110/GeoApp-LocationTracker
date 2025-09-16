@echo off
echo Testing location tracking server...
echo.

echo Testing health endpoint...
curl -X GET http://localhost:8080/api/health
echo.
echo.

echo Testing location endpoint with sample data...
curl -X POST http://localhost:8080/api/location ^
  -H "Content-Type: application/json" ^
  -d "{\"timestamp\":\"2024-01-01 12:00:00\",\"latitude\":35.6892,\"longitude\":51.3890,\"accuracy\":5.0,\"device_id\":\"test_device\"}"
echo.
echo.

echo Server test completed!
pause

