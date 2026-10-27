#!/usr/bin/env sh
set -eu
GRADLE_VERSION=8.9
DIST_ROOT="${HOME}/.gradle/manual-dists"
GRADLE_HOME="${DIST_ROOT}/gradle-${GRADLE_VERSION}"

if [ -z "${ANDROID_HOME:-}" ]; then
  if [ -n "${ANDROID_SDK_ROOT:-}" ]; then
    export ANDROID_HOME="$ANDROID_SDK_ROOT"
  elif [ -d "${HOME}/Android/Sdk" ]; then
    export ANDROID_HOME="${HOME}/Android/Sdk"
  else
    echo "Android SDK not found. Install Android Studio/SDK 35 and set ANDROID_HOME." >&2
    exit 1
  fi
fi

if [ ! -x "${GRADLE_HOME}/bin/gradle" ]; then
  mkdir -p "$DIST_ROOT"
  ZIP="${TMPDIR:-/tmp}/gradle-${GRADLE_VERSION}-bin.zip"
  echo "Downloading Gradle ${GRADLE_VERSION}..."
  curl -fL "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -o "$ZIP"
  unzip -oq "$ZIP" -d "$DIST_ROOT"
  rm -f "$ZIP"
fi
"${GRADLE_HOME}/bin/gradle" --no-daemon assembleDebug
printf '\nAPK created at: app/build/outputs/apk/debug/app-debug.apk\n'
