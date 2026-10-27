# ساخت آنلاین APK بدون نصب Android Studio یا Android SDK

این پروژه با GitHub Actions تنظیم شده است. GitHub روی سرور خودش Java، Android SDK و Gradle را آماده می‌کند و APK را می‌سازد.

## مراحل

1. به https://github.com برو و وارد حساب خودت شو.
2. از دکمهٔ `+` گزینهٔ `New repository` را بزن؛ نام مخزن را `AdadNegar` بگذار. می‌توانی آن را Private نگه داری. در حساب GitHub Free سهمیهٔ رایگان برای اجرای Actions روی مخزن خصوصی وجود دارد؛ در مخزن عمومی، اجرای runner استاندارد رایگان است.
3. ZIP پروژه را روی کامپیوتر استخراج کن. داخل پوشه، فایل‌هایی مثل `settings.gradle.kts`، `build.gradle.kts`، پوشهٔ `app` و پوشهٔ `.github` را می‌بینی.
4. در مخزن تازه‌ساخته، `Add file` → `Upload files` را بزن و **تمام محتویات داخل پوشهٔ پروژه** را آپلود کن؛ خود فایل ZIP را به‌عنوان یک فایل تنها آپلود نکن. مطمئن شو `.github/workflows/build-apk.yml` هم آپلود شده باشد.
5. `Commit changes` را بزن. از تب `Actions` اجرای `Build AdadNegar APK` را باز کن. اگر GitHub خواست workflowها را فعال کنی، `I understand my workflows, go ahead and enable them` را تأیید کن.
6. پس از اتمام موفق، در صفحهٔ همان اجرای workflow، قسمت `Artifacts` را پیدا کن و `adadnegar-debug-apk` را دانلود کن.
7. ZIP مربوط به artifact را استخراج کن؛ فایل `app-debug.apk` همان فایل نصب اندروید است.

## اگر build ناموفق شد

در صفحهٔ اجرای workflow، روی مرحله‌ای که با علامت قرمز شکست خورده کلیک کن و متن خطا را ببین. خطا یا یک اسکرین‌شاتش را بفرست تا تنظیمات پروژه اصلاح شود.

## نکتهٔ امنیتی

برای ساخت APK لازم نیست Personal Access Token یا رمز GitHub را در سایت ثالث وارد کنی. از مخزن خودت و تب Actions رسمی GitHub استفاده کن. اگر مخزن عمومی باشد، کد پروژه برای دیگران هم قابل مشاهده است.
