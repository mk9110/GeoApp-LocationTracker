# راهنمای راه‌اندازی Google Sheet

## مرحله 1: ایجاد Google Sheet

1. به [Google Sheets](https://sheets.google.com) بروید
2. روی "Blank" کلیک کنید تا یک صفحه‌کتاب جدید ایجاد شود
3. نام صفحه‌کتاب را به "Location Tracking" تغییر دهید

## مرحله 2: راه‌اندازی Google Apps Script

1. در Google Sheets، از منوی بالا روی "Extensions" کلیک کنید
2. "Apps Script" را انتخاب کنید
3. یک پروژه جدید باز می‌شود
4. کد موجود در فایل `GoogleAppsScript.js` را کپی کنید
5. کد موجود در ویرایشگر را پاک کرده و کد جدید را جایگزین کنید
6. فایل را ذخیره کنید (Ctrl+S یا Cmd+S)
7. نام پروژه را به "Location Tracker" تغییر دهید

## مرحله 3: Deploy کردن Script

1. در Apps Script، روی دکمه "Deploy" کلیک کنید
2. "New deployment" را انتخاب کنید
3. در بخش "Type"، "Web app" را انتخاب کنید
4. تنظیمات زیر را اعمال کنید:
   - Execute as: Me
   - Who has access: Anyone
5. روی "Deploy" کلیک کنید
6. مجوزهای لازم را اعطا کنید:
   - روی "Review permissions" کلیک کنید
   - حساب Google خود را انتخاب کنید
   - "Advanced" را کلیک کنید
   - "Go to Location Tracker (unsafe)" را کلیک کنید
   - "Allow" را کلیک کنید
7. URL تولید شده را کپی کنید (مثل: `https://script.google.com/macros/s/YOUR_SCRIPT_ID/exec`)

## مرحله 4: تنظیم اپ اندروید

1. فایل `app/src/main/java/com/geoapp/locationtracker/GoogleSheetsHelper.kt` را باز کنید
2. خط 12 را پیدا کنید:
   ```kotlin
   private val GOOGLE_SCRIPT_URL = "https://script.google.com/macros/s/YOUR_SCRIPT_ID/exec"
   ```
3. `YOUR_SCRIPT_ID` را با URL کپی شده از مرحله قبل جایگزین کنید

## مرحله 5: تست کردن

1. اپ را build کنید
2. روی گوشی نصب کنید
3. مجوزهای موقعیت مکانی را اعطا کنید
4. "شروع ردیابی" را کلیک کنید
5. به Google Sheet برگردید و ببینید که داده‌ها اضافه می‌شوند

## ساختار داده‌ها

داده‌ها در Google Sheet به صورت زیر ذخیره می‌شوند:

| A (Timestamp) | B (Latitude) | C (Longitude) | D (Accuracy) |
|---------------|--------------|---------------|--------------|
| 2024-01-01 12:00:00 | 35.6892 | 51.3890 | 5.0 |

## عیب‌یابی

- اگر داده‌ها ارسال نمی‌شوند، URL را دوباره بررسی کنید
- مطمئن شوید که Google Apps Script به درستی deploy شده باشد
- مجوزهای موقعیت مکانی در گوشی اعطا شده باشند
- اتصال اینترنت برقرار باشد

