# راهنمای راه‌اندازی PostgreSQL برای ردیابی موقعیت

## مرحله 1: نصب PostgreSQL

### Windows:
1. به [postgresql.org](https://www.postgresql.org/download/windows/) بروید
2. PostgreSQL را دانلود و نصب کنید
3. در حین نصب، رمز عبور برای کاربر `postgres` تنظیم کنید
4. مطمئن شوید که PostgreSQL به عنوان سرویس اجرا می‌شود

### Linux (Ubuntu/Debian):
```bash
sudo apt update
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

### macOS:
```bash
brew install postgresql
brew services start postgresql
```

## مرحله 2: راه‌اندازی دیتابیس

### روش 1: استفاده از فایل Batch (Windows)
```cmd
setup_database.bat
```

### روش 2: دستی
```sql
-- اتصال به PostgreSQL
psql -U postgres

-- ایجاد دیتابیس
CREATE DATABASE location_tracker;

-- خروج از psql
\q

-- اجرای schema
psql -U postgres -d location_tracker -f database/schema.sql
```

## مرحله 3: راه‌اندازی سرور Python

### نصب وابستگی‌ها:
```bash
cd server
pip install -r requirements.txt
```

### تنظیم متغیرهای محیطی:
1. فایل `env_example.txt` را کپی کنید و نام آن را به `.env` تغییر دهید
2. اطلاعات دیتابیس خود را در فایل `.env` وارد کنید:

```env
DB_HOST=localhost
DB_NAME=location_tracker
DB_USER=postgres
DB_PASSWORD=your_password_here
DB_PORT=5432
```

### اجرای سرور:
```bash
python app.py
```

سرور روی `http://localhost:5000` در دسترس خواهد بود.

## مرحله 4: تنظیم اپ اندروید

1. فایل `DatabaseHelper.kt` را باز کنید
2. متغیر `SERVER_URL` را با آدرس IP سرور خود تغییر دهید:

```kotlin
private val SERVER_URL = "http://YOUR_SERVER_IP:5000/api/location"
```

**نکته مهم**: اگر سرور روی همان کامپیوتر است، از IP محلی استفاده کنید:
- Windows: `ipconfig` را اجرا کنید و IP Address را پیدا کنید
- معمولاً چیزی شبیه `192.168.1.100` است

## مرحله 5: تست سیستم

### تست سرور:
```bash
curl http://localhost:5000/api/health
```

### تست ارسال داده:
```bash
curl -X POST http://localhost:5000/api/location \
  -H "Content-Type: application/json" \
  -d '{
    "timestamp": "2024-01-01 12:00:00",
    "latitude": 35.6892,
    "longitude": 51.3890,
    "accuracy": 5.0,
    "device_id": "test_device"
  }'
```

### مشاهده داده‌ها:
```sql
psql -U postgres -d location_tracker
SELECT * FROM location_data ORDER BY timestamp DESC LIMIT 10;
```

## API Endpoints

### 1. Health Check
```
GET /api/health
```

### 2. ارسال موقعیت
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

### 3. دریافت موقعیت‌ها
```
GET /api/locations?device_id=device_001&limit=100&hours=24
```

### 4. آمار
```
GET /api/stats?device_id=device_001
```

## عیب‌یابی

### خطای اتصال به دیتابیس:
- مطمئن شوید PostgreSQL در حال اجرا است
- رمز عبور در فایل `.env` صحیح باشد
- پورت 5432 باز باشد

### خطای اتصال از اپ:
- IP سرور در `DatabaseHelper.kt` صحیح باشد
- سرور در حال اجرا باشد
- فایروال پورت 5000 را مسدود نکرده باشد

### خطای Python:
- Python 3.7+ نصب باشد
- تمام وابستگی‌ها نصب شده باشند
- فایل `.env` موجود باشد

## مزایای استفاده از PostgreSQL

1. **عملکرد بهتر**: برای داده‌های زیاد
2. **امنیت بیشتر**: کنترل کامل روی دسترسی‌ها
3. **امکانات پیشرفته**: Query های پیچیده، Indexing
4. **مقیاس‌پذیری**: قابلیت رشد با حجم داده
5. **Backup و Recovery**: امکان پشتیبان‌گیری

