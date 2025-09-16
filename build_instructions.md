# راهنمای ساخت APK

## روش 1: استفاده از Android Studio (توصیه شده)

1. **نصب Android Studio**
   - Android Studio را از [developer.android.com](https://developer.android.com/studio) دانلود و نصب کنید

2. **باز کردن پروژه**
   - Android Studio را باز کنید
   - "Open an existing project" را انتخاب کنید
   - پوشه `E:\34.GeoApp` را انتخاب کنید

3. **تنظیم SDK**
   - Android Studio به طور خودکار SDK را دانلود و تنظیم می‌کند
   - اگر خطایی وجود داشت، از منوی "Tools" > "SDK Manager" استفاده کنید

4. **ساخت APK**
   - از منوی "Build" گزینه "Build Bundle(s) / APK(s)" > "Build APK(s)" را انتخاب کنید
   - یا از نوار ابزار روی آیکون "Build" کلیک کنید

5. **پیدا کردن APK**
   - فایل APK در مسیر `app/build/outputs/apk/debug/` قرار خواهد گرفت
   - نام فایل: `app-debug.apk`

## روش 2: استفاده از Command Line (پیشرفته)

اگر Gradle نصب دارید:

```bash
# در پوشه پروژه
gradle clean assembleDebug
```

## روش 3: استفاده از فایل Batch

فایل `build_apk.bat` را اجرا کنید:

```cmd
build_apk.bat
```

## تنظیمات قبل از ساخت

1. **Google Sheets URL**
   - فایل `GoogleSheetsHelper.kt` را باز کنید
   - URL Google Apps Script را در متغیر `GOOGLE_SCRIPT_URL` قرار دهید

2. **مجوزها**
   - مجوزهای لازم در `AndroidManifest.xml` تعریف شده‌اند

## نصب روی گوشی

1. فایل APK را به گوشی منتقل کنید
2. در تنظیمات گوشی، "Install from unknown sources" را فعال کنید
3. فایل APK را اجرا کنید و نصب کنید

## عیب‌یابی

- اگر خطای SDK دریافت کردید، Android Studio را نصب کنید
- اگر خطای Gradle دریافت کردید، از Android Studio استفاده کنید
- مطمئن شوید که Java نصب شده باشد

