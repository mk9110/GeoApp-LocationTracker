# راهنمای ساخت APK بدون Android Studio

## روش 1: استفاده از Android Command Line Tools

### مرحله 1: دانلود Android Command Line Tools
1. به [developer.android.com/studio#command-tools](https://developer.android.com/studio#command-tools) بروید
2. "Command line tools only" را دانلود کنید
3. فایل را در `C:\Android\cmdline-tools` استخراج کنید

### مرحله 2: تنظیم متغیرهای محیطی
1. Windows + R → `sysdm.cpl` → Advanced → Environment Variables
2. متغیر جدید اضافه کنید:
   - Variable name: `ANDROID_HOME`
   - Variable value: `C:\Android`
3. در PATH اضافه کنید:
   - `%ANDROID_HOME%\cmdline-tools\latest\bin`
   - `%ANDROID_HOME%\platform-tools`

### مرحله 3: نصب SDK
```cmd
sdkmanager --install "platform-tools" "platforms;android-34" "build-tools;34.0.0"
```

### مرحله 4: ساخت APK
```cmd
cd E:\34.GeoApp
gradlew assembleDebug
```

## روش 2: استفاده از Gradle Wrapper (ساده‌تر)

### مرحله 1: نصب Java
- Java 8 یا بالاتر نصب کنید
- JAVA_HOME را تنظیم کنید

### مرحله 2: ساخت APK
```cmd
cd E:\34.GeoApp
gradlew.bat assembleDebug
```

## روش 3: استفاده از GitHub Actions (پیشرفته)

### فایل .github/workflows/build.yml ایجاد کنید:
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

## روش 4: استفاده از Docker (پیشرفته)

### Dockerfile ایجاد کنید:
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

## روش 5: استفاده از آنلاین Build Services

### Appetize.io
- کد را در GitHub آپلود کنید
- از Appetize.io استفاده کنید

### GitHub Codespaces
- پروژه را در GitHub باز کنید
- Codespace ایجاد کنید
- در Codespace APK بسازید

## عیب‌یابی

### خطای "gradlew not found"
```cmd
# فایل gradlew.bat را اجرا کنید
gradlew.bat --version
```

### خطای "SDK not found"
```cmd
# SDK را نصب کنید
sdkmanager --install "platform-tools"
```

### خطای "Java not found"
- Java JDK نصب کنید
- JAVA_HOME را تنظیم کنید

## نتیجه
APK در مسیر `app/build/outputs/apk/debug/app-debug.apk` قرار خواهد گرفت.

