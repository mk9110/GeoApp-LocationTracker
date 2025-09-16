# راهنمای آپلود پروژه در GitHub و ساخت APK

## 🚀 مراحل آپلود در GitHub:

### 1️⃣ **ایجاد Repository در GitHub**
1. به [github.com](https://github.com) بروید
2. روی "New repository" کلیک کنید
3. نام repository: `GeoApp-LocationTracker`
4. Description: `Android Location Tracking App with PostgreSQL`
5. Public یا Private انتخاب کنید
6. "Create repository" کلیک کنید

### 2️⃣ **آپلود کد به GitHub**

#### روش 1: از طریق GitHub Desktop
1. [GitHub Desktop](https://desktop.github.com/) را دانلود کنید
2. نصب کنید و وارد شوید
3. "Clone a repository from the Internet" انتخاب کنید
4. Repository خود را انتخاب کنید
5. کد را در پوشه کپی کنید
6. Commit و Push کنید

#### روش 2: از طریق Command Line
```cmd
# در پوشه پروژه
git init
git add .
git commit -m "Initial commit - Location tracking app"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/GeoApp-LocationTracker.git
git push -u origin main
```

#### روش 3: از طریق وب GitHub
1. در GitHub، روی "uploading an existing file" کلیک کنید
2. فایل‌ها را drag & drop کنید
3. Commit message بنویسید
4. "Commit changes" کلیک کنید

### 3️⃣ **ساخت APK خودکار**

بعد از آپلود کد:
1. به تب "Actions" بروید
2. Workflow "Build APK" را ببینید
3. روی "Run workflow" کلیک کنید
4. منتظر بمانید تا build تمام شود
5. در "Artifacts" بخش، APK را دانلود کنید

## 📱 **نصب APK روی گوشی**

### 1️⃣ **فعال‌سازی نصب از منابع ناشناخته**
- **Android 8+**: Settings → Apps → Special access → Install unknown apps
- **Android 7-**: Settings → Security → Unknown sources

### 2️⃣ **انتقال و نصب APK**
1. APK را به گوشی منتقل کنید
2. روی فایل APK کلیک کنید
3. "Install" را انتخاب کنید
4. مجوزهای لازم را اعطا کنید

## 🔧 **تنظیمات اپ**

### 1️⃣ **تغییر IP سرور**
اگر IP سرور تغییر کرد:
1. فایل `app/src/main/java/com/geoapp/locationtracker/GoogleSheetsHelper.kt` را ویرایش کنید
2. خط 16 را پیدا کنید:
   ```kotlin
   private val SERVER_URL = "http://YOUR_NEW_IP:5000/api/location"
   ```
3. IP جدید را جایگزین کنید
4. دوباره APK بسازید

### 2️⃣ **تست اپ**
1. اپ را اجرا کنید
2. مجوزهای موقعیت مکانی را اعطا کنید
3. "شروع ردیابی" را کلیک کنید
4. موقعیت‌ها در PostgreSQL ذخیره می‌شوند

## 🎯 **مزایای استفاده از GitHub Actions**

- ✅ **رایگان**: بدون هزینه
- ✅ **خودکار**: هر بار که کد تغییر کند، APK جدید ساخته می‌شود
- ✅ **قابل اعتماد**: سرورهای قدرتمند GitHub
- ✅ **آسان**: بدون نیاز به نصب Android SDK
- ✅ **قابل دسترسی**: از هر جا می‌توانید APK بسازید

## 🆘 **پشتیبانی**

اگر مشکلی داشتید:
1. در Issues بخش GitHub مشکل را گزارش دهید
2. Log های build را بررسی کنید
3. تنظیمات سرور را چک کنید

## 🎉 **تبریک!**

حالا شما یک سیستم کامل ردیابی موقعیت مکانی دارید که:
- موقعیت را هر 10 ثانیه دریافت می‌کند
- در PostgreSQL ذخیره می‌کند
- APK به صورت خودکار ساخته می‌شود
- قابل نصب روی هر گوشی اندرویدی است

