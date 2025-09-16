# GeoApp - Location Tracking Android App with PostgreSQL

این اپ اندروید موقعیت مکانی شما را هر 10 ثانیه به دیتابیس PostgreSQL ارسال می‌کند.

## ویژگی‌ها

- **ردیابی موقعیت مکانی** در پس‌زمینه
- **ذخیره در PostgreSQL** با کنترل کامل روی داده‌ها
- **REST API** برای مدیریت داده‌ها
- **رابط کاربری فارسی** و ساده
- **اعلان‌های وضعیت** ردیابی
- **آمار و گزارش‌گیری** پیشرفته

## معماری سیستم

```
Android App → REST API → PostgreSQL Database
```

## راه‌اندازی سریع

### 1. راه‌اندازی دیتابیس PostgreSQL

```cmd
# Windows
setup_database.bat

# یا دستی
psql -U postgres -c "CREATE DATABASE location_tracker;"
psql -U postgres -d location_tracker -f database/schema.sql
```

### 2. راه‌اندازی سرور Python

```cmd
# Windows
setup_server.bat

# یا دستی
cd server
pip install -r requirements.txt
python app.py
```

### 3. تنظیم اپ اندروید

1. فایل `DatabaseHelper.kt` را باز کنید
2. IP سرور خود را در `SERVER_URL` قرار دهید:

```kotlin
private val SERVER_URL = "http://192.168.1.100:5000/api/location"
```

### 4. ساخت APK

از Android Studio استفاده کنید یا فایل `build_instructions.md` را مطالعه کنید.

## استفاده

1. اپ را روی گوشی نصب کنید
2. مجوزهای موقعیت مکانی را اعطا کنید
3. روی "شروع ردیابی" کلیک کنید
4. اپ در پس‌زمینه کار خواهد کرد و موقعیت شما را هر 10 ثانیه به PostgreSQL ارسال می‌کند

## API Endpoints

### Health Check
```
GET /api/health
```

### ارسال موقعیت
```
POST /api/location
Content-Type: application/json

{
  "timestamp": "2024-01-01 12:00:00",
  "latitude": 35.6892,
  "longitude": 51.3890,
  "accuracy": 5.0,
  "device_id": "device_001"
}
```

### دریافت موقعیت‌ها
```
GET /api/locations?device_id=device_001&limit=100&hours=24
```

### آمار
```
GET /api/stats?device_id=device_001
```

## ساختار دیتابیس

```sql
CREATE TABLE location_data (
    id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    accuracy DECIMAL(8, 2),
    device_id VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

## مجوزهای مورد نیاز

- `ACCESS_FINE_LOCATION`: برای دسترسی دقیق به موقعیت
- `ACCESS_COARSE_LOCATION`: برای دسترسی تقریبی به موقعیت
- `ACCESS_BACKGROUND_LOCATION`: برای ردیابی در پس‌زمینه
- `INTERNET`: برای ارسال داده‌ها
- `FOREGROUND_SERVICE`: برای سرویس پس‌زمینه

## مزایای PostgreSQL نسبت به Google Sheets

1. **عملکرد بهتر**: برای داده‌های زیاد
2. **امنیت بیشتر**: کنترل کامل روی دسترسی‌ها
3. **امکانات پیشرفته**: Query های پیچیده، Indexing
4. **مقیاس‌پذیری**: قابلیت رشد با حجم داده
5. **Backup و Recovery**: امکان پشتیبان‌گیری
6. **Real-time Analytics**: تحلیل داده‌ها در زمان واقعی

## فایل‌های مهم

- `PostgreSQL_Setup_Guide.md`: راهنمای کامل راه‌اندازی
- `build_instructions.md`: راهنمای ساخت APK
- `database/schema.sql`: ساختار دیتابیس
- `server/app.py`: سرور REST API
- `app/src/main/java/com/geoapp/locationtracker/DatabaseHelper.kt`: کلاس اتصال به API

## عیب‌یابی

- مطمئن شوید PostgreSQL در حال اجرا است
- IP سرور در `DatabaseHelper.kt` صحیح باشد
- مجوزهای موقعیت مکانی اعطا شده باشند
- اتصال اینترنت برقرار باشد
- پورت 5000 در فایروال باز باشد
