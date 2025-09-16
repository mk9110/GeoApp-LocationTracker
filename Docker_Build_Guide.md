# راهنمای ساخت APK با Docker

## 🐳 **مزایای استفاده از Docker:**

- ✅ **بدون نصب Android SDK**: همه چیز در container
- ✅ **قابل تکرار**: همیشه همان نتیجه
- ✅ **ایزوله**: محیط build جدا از سیستم
- ✅ **سریع**: بعد از اولین build، cache می‌شود

## 🚀 **مراحل ساخت APK:**

### 1️⃣ **بررسی Docker**
```cmd
docker --version
```
اگر نصب نیست، از [docker.com](https://www.docker.com/products/docker-desktop) دانلود کنید.

### 2️⃣ **اجرای فایل Batch**
```cmd
build_apk_docker.bat
```

### 3️⃣ **یا اجرای دستی**
```cmd
# Build Docker image
docker build -t geoapp-builder .

# Extract APK
docker run --rm -v "%cd%":/output geoapp-builder cp /output/app-debug.apk /output/
```

## 📱 **نتیجه:**
APK در فایل `app-debug.apk` در پوشه پروژه قرار می‌گیرد.

## 🔧 **عیب‌یابی:**

### خطای "Docker not found":
- Docker Desktop را نصب کنید
- Docker را restart کنید

### خطای "Build failed":
- اتصال اینترنت را چک کنید
- Docker logs را بررسی کنید

### خطای "Permission denied":
- Docker Desktop را به عنوان administrator اجرا کنید

## 💡 **نکات:**

1. **اولین build**: ممکن است 10-15 دقیقه طول بکشد
2. **Build های بعدی**: سریع‌تر هستند (cache)
3. **اندازه APK**: معمولاً 20-50 MB
4. **نصب**: روی گوشی Android نصب کنید

## 🎯 **مراحل نصب APK:**

1. **فعال‌سازی نصب از منابع ناشناخته**:
   - Settings → Security → Unknown Sources

2. **انتقال APK**:
   - APK را به گوشی منتقل کنید
   - روی فایل کلیک کنید
   - Install را انتخاب کنید

3. **تست اپ**:
   - اپ را اجرا کنید
   - مجوزهای موقعیت مکانی را اعطا کنید
   - "شروع ردیابی" را کلیک کنید

## 🆘 **پشتیبانی:**

اگر مشکلی داشتید:
1. Docker logs را بررسی کنید
2. اتصال اینترنت را چک کنید
3. Docker Desktop را restart کنید

## 🎉 **تبریک!**

حالا شما یک APK کامل دارید که:
- موقعیت را هر 10 ثانیه دریافت می‌کند
- در PostgreSQL ذخیره می‌کند
- قابل نصب روی هر گوشی اندرویدی است

