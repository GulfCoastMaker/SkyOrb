@echo off
REM ── SkyOrb firmware gathering script (Windows) ──────────────────────────
REM Run this AFTER building with PlatformIO (pio run) to copy the compiled
REM binaries into the firmware/ folder for the web installer.

echo Gathering SkyOrb firmware binaries...

set BUILD=..\SkyOrb\.pio\build\esp32dev
set TOOLS=%USERPROFILE%\.platformio\packages\framework-arduinoespressif32\tools\partitions

if not exist firmware mkdir firmware

copy "%BUILD%\bootloader.bin"  firmware\bootloader.bin
copy "%BUILD%\partitions.bin"  firmware\partitions.bin
copy "%BUILD%\firmware.bin"    firmware\firmware.bin
copy "%TOOLS%\boot_app0.bin"   firmware\boot_app0.bin

echo.
echo Done! Firmware binaries copied to firmware\ folder.
echo Now push to GitHub and enable GitHub Pages.
pause
