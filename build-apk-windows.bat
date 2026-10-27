@echo off
setlocal
set "GRADLE_VERSION=8.9"
set "DIST_ROOT=%USERPROFILE%\.gradle\manual-dists"
set "GRADLE_HOME=%DIST_ROOT%\gradle-%GRADLE_VERSION%"

if not defined ANDROID_HOME if defined ANDROID_SDK_ROOT set "ANDROID_HOME=%ANDROID_SDK_ROOT%"
if not defined ANDROID_HOME if exist "%LOCALAPPDATA%\Android\Sdk" set "ANDROID_HOME=%LOCALAPPDATA%\Android\Sdk"
if not defined ANDROID_HOME (
  echo ERROR: Android SDK was not found.
  echo Install Android Studio and Android SDK 35, then configure ANDROID_HOME.
  exit /b 1
)

if not exist "%GRADLE_HOME%\bin\gradle.bat" (
  echo Gradle %GRADLE_VERSION% was not found. Downloading it now...
  if not exist "%DIST_ROOT%" mkdir "%DIST_ROOT%"
  powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $zip=Join-Path $env:TEMP 'gradle-8.9-bin.zip'; Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-8.9-bin.zip' -OutFile $zip; Expand-Archive -LiteralPath $zip -DestinationPath '%DIST_ROOT%' -Force; Remove-Item -LiteralPath $zip -Force"
  if errorlevel 1 (
    echo ERROR: Gradle could not be downloaded. Check your internet connection.
    exit /b 1
  )
)

call "%GRADLE_HOME%\bin\gradle.bat" --no-daemon assembleDebug
if errorlevel 1 exit /b %errorlevel%
echo.
echo APK created at: app\build\outputs\apk\debug\app-debug.apk
endlocal
