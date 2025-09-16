# راهنمای راه‌اندازی Docker برای ساخت APK

## 🐳 **مراحل راه‌اندازی Docker:**

### 1️⃣ **اجرای Docker Desktop**
1. **از Start Menu**: "Docker Desktop" را جستجو کنید و اجرا کنید
2. **از Desktop**: روی آیکون Docker Desktop کلیک کنید
3. **از Command Line**:
   ```cmd
   "C:\Program Files\Docker\Docker\Docker Desktop.exe"
   ```

### 2️⃣ **انتظار برای راه‌اندازی**
- Docker Desktop 2-3 دقیقه طول می‌کشد تا کاملاً راه‌اندازی شود
- آیکون Docker در system tray سبز می‌شود
- پیام "Docker Desktop is running" نمایش داده می‌شود

### 3️⃣ **تست Docker**
```cmd
docker --version
docker run hello-world
```

## 🚀 **ساخت APK با Docker:**

### **روش 1: استفاده از فایل Batch**
```cmd
build_apk_docker.bat
```

### **روش 2: اجرای دستی**
```cmd
# Build Docker image
docker build -t geoapp-builder .

# Extract APK
docker run --rm -v "%cd%":/output geoapp-builder cp /output/app-debug.apk /output/
```

## ⏱️ **زمان‌بندی:**

- **اولین build**: 10-15 دقیقه (دانلود Android SDK)
- **Build های بعدی**: 2-3 دقیقه (cache)
- **اندازه APK**: 20-50 MB

## 🔧 **عیب‌یابی:**

### خطای "Docker not running":
1. Docker Desktop را اجرا کنید
2. منتظر بمانید تا کاملاً راه‌اندازی شود
3. دوباره امتحان کنید

### خطای "Permission denied":
1. Command Prompt را به عنوان Administrator اجرا کنید
2. یا PowerShell را به عنوان Administrator اجرا کنید

### خطای "Build failed":
1. اتصال اینترنت را چک کنید
2. Docker logs را بررسی کنید:
   ```cmd
   docker logs <container_id>
   ```

## 💡 **نکات مهم:**

1. **اولین بار**: Docker باید Android SDK را دانلود کند
2. **Cache**: Build های بعدی سریع‌تر هستند
3. **فضا**: Docker حدود 2-3 GB فضا نیاز دارد
4. **اینترنت**: برای دانلود SDK نیاز به اینترنت دارید

## 🎯 **مراحل کامل:**

1. **Docker Desktop را اجرا کنید**
2. **منتظر بمانید تا راه‌اندازی شود**
3. **فایل batch را اجرا کنید**:
   ```cmd
   build_apk_docker.bat
   ```
4. **منتظر بمانید تا APK ساخته شود**
5. **APK را روی گوشی نصب کنید**

## 🆘 **اگر Docker کار نکرد:**

### **روش جایگزین: GitHub Actions**
1. کد را در GitHub آپلود کنید
2. از GitHub Actions استفاده کنید
3. APK را دانلود کنید

### **روش جایگزین: Android Studio**
1. Android Studio را نصب کنید
2. پروژه را باز کنید
3. Build → Build Bundle(s) / APK(s) → Build APK(s)

## 🎉 **نتیجه:**

بعد از موفقیت‌آمیز بودن build:
- فایل `app-debug.apk` در پوشه پروژه قرار می‌گیرد
- این فایل را روی گوشی Android نصب کنید
- اپ را اجرا کنید و تست کنید

## 📱 **نصب APK:**

1. **فعال‌سازی نصب از منابع ناشناخته**
2. **انتقال APK به گوشی**
3. **نصب APK**
4. **اجرای اپ و تست**

