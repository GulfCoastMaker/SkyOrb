#!/bin/bash
# ── SkyOrb firmware gathering script (Mac/Linux) ────────────────────────
# Run this AFTER building with PlatformIO (pio run) to copy the compiled
# binaries into the firmware/ folder for the web installer.

echo "Gathering SkyOrb firmware binaries..."

BUILD="../SkyOrb/.pio/build/esp32dev"
TOOLS="$HOME/.platformio/packages/framework-arduinoespressif32/tools/partitions"

mkdir -p firmware

cp "$BUILD/bootloader.bin"  firmware/bootloader.bin
cp "$BUILD/partitions.bin"  firmware/partitions.bin
cp "$BUILD/firmware.bin"    firmware/firmware.bin
cp "$TOOLS/boot_app0.bin"   firmware/boot_app0.bin

echo ""
echo "Done! Firmware binaries copied to firmware/ folder."
echo "Now push to GitHub and enable GitHub Pages."
