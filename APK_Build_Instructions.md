# راهنمای کامل ساخت APK بدون Android Studio

## 🎯 روش‌های موجود:

### 1️⃣ **روش آنلاین (ساده‌ترین)**

#### GitHub Actions (رایگان):
1. کد را در GitHub آپلود کنید
2. فایل `.github/workflows/build.yml` ایجاد کنید
3. هر بار که کد push کنید، APK ساخته می‌شود

#### Appetize.io:
1. کد را در GitHub آپلود کنید
2. از Appetize.io استفاده کنید
3. APK آنلاین ساخته می‌شود

### 2️⃣ **روش محلی (نیاز به نصب)**

#### Android Command Line Tools:
1. **دانلود**: [Android Command Line Tools](https://developer.android.com/studio#command-tools)
2. **نصب**: در `C:\Android\cmdline-tools` استخراج کنید
3. **تنظیم متغیرها**:
   ```
   ANDROID_HOME=C:\Android
   PATH=%PATH%;%ANDROID_HOME%\cmdline-tools\latest\bin
   ```
4. **نصب SDK**:
   ```cmd
   sdkmanager --install "platform-tools" "platforms;android-34" "build-tools;34.0.0"
   ```
5. **ساخت APK**:
   ```cmd
   gradlew.bat assembleDebug
   ```

### 3️⃣ **روش Docker (پیشرفته)**

```dockerfile
FROM openjdk:11-jdk
RUN apt-get update && apt-get install -y wget unzip
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
RUN unzip commandlinetools-linux-9477386_latest.zip
ENV ANDROID_HOME=/opt/android
ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
RUN yes | sdkmanager --licenses
RUN sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"
WORKDIR /app
COPY . .
RUN ./gradlew assembleDebug
```

## 🚀 **توصیه من: استفاده از GitHub Actions**

### مراحل:
1. **ایجاد Repository در GitHub**:
   - به [github.com](https://github.com) بروید
   - Repository جدید ایجاد کنید
   - کد را آپلود کنید

2. **ایجاد فایل GitHub Actions**:
   ```yaml
   name: Build APK
   on: [push]
   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
       - uses: actions/checkout@v2
       - name: Setup JDK
         uses: actions/setup-java@v2
         with:
           java-version: '11'
       - name: Setup Android SDK
         uses: android-actions/setup-android@v2
       - name: Build APK
         run: ./gradlew assembleDebug
       - name: Upload APK
         uses: actions/upload-artifact@v2
         with:
           name: app-debug.apk
           path: app/build/outputs/apk/debug/app-debug.apk
   ```

3. **ساخت APK**:
   - کد را push کنید
   - در Actions tab، APK ساخته می‌شود
   - APK را دانلود کنید

## 📱 **نصب APK روی گوشی**

1. **فعال‌سازی نصب از منابع ناشناخته**:
   - Settings → Security → Unknown Sources (فعال کنید)

2. **انتقال APK**:
   - APK را به گوشی منتقل کنید
   - روی فایل کلیک کنید
   - Install را انتخاب کنید

## 🔧 **عیب‌یابی**

### خطای "SDK not found":
```cmd
# نصب Android SDK
sdkmanager --install "platform-tools" "platforms;android-34"
```

### خطای "Java not found":
- Java JDK نصب کنید
- JAVA_HOME را تنظیم کنید

### خطای "Gradle not found":
- فایل `gradlew.bat` را بررسی کنید
- از Android Studio استفاده کنید

## 💡 **نکات مهم**

1. **امنیت**: APK debug برای تست است، برای production از release build استفاده کنید
2. **اندازه**: APK ممکن است بزرگ باشد، از ProGuard استفاده کنید
3. **تست**: قبل از نصب، APK را در emulator تست کنید

## 🎯 **نتیجه**

APK در مسیر `app/build/outputs/apk/debug/app-debug.apk` قرار خواهد گرفت.

**توصیه**: از GitHub Actions استفاده کنید - رایگان، آسان و قابل اعتماد است!

