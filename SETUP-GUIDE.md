# SkyOrb — One-Time Setup Guide (for the project owner)

Follow these steps once to create a web link that lets ANYONE flash your
firmware to their ESP32 with just a USB cable and Chrome — no software,
no code, no PlatformIO on their end.

---

## Step 1 — Build the firmware (5 minutes)

1. Open your SkyOrb project in VS Code / PlatformIO
2. Click the **PlatformIO build** button (checkmark icon), or open the
   terminal and run:
   ```
   pio run
   ```
3. Wait for "SUCCESS". This creates the compiled `.bin` files.

---

## Step 2 — Gather the firmware files (1 minute)

Put this `SkyOrb-installer` folder right next to your `flight-radar`
project folder, like this:
```
MyProjects/
├── SkyOrb/              ← your PlatformIO project
└── SkyOrb-installer/     ← this folder
```

Then double-click:
- **Windows:** `gather-firmware.bat`
- **Mac/Linux:** run `./gather-firmware.sh` in a terminal

This copies the 4 needed binaries into the `firmware/` folder automatically.

(If the script can't find the files, copy them manually — see README.md.)

---

## Step 3 — Put it on GitHub (10 minutes, one time)

1. Create a free account at https://github.com if you don't have one
2. Create a new repository named **SkyOrb**, set to **Public**
3. In the `SkyOrb-installer` folder, open a terminal and run:
   ```
   git init
   git add .
   git commit -m "SkyOrb web installer"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/SkyOrb.git
   git push -u origin main
   ```
   (Replace YOUR_USERNAME with your GitHub username)

---

## Step 4 — Turn on GitHub Pages (2 minutes)

1. On GitHub, go to your **SkyOrb** repo
2. Click **Settings** → **Pages** (left sidebar)
3. Under "Build and deployment", set **Source** to:
   - Deploy from a branch
   - Branch: **main**, folder: **/ (root)**
4. Click **Save**
5. Wait ~1 minute, then your installer is live at:
   ```
   https://YOUR_USERNAME.github.io/SkyOrb
   ```

---

## Step 5 — Update the GitHub link (1 minute)

Open `index.html`, find `YOUR_USERNAME`, and replace it with your real
GitHub username so the "View source" link works. Commit and push again:
```
git add index.html
git commit -m "Update GitHub link"
git push
```

---

## Done! Share the link

Now anyone can go to **https://YOUR_USERNAME.github.io/SkyOrb**, plug in
their ESP32, and click Install. That's the whole experience for them:

1. Open link in Chrome
2. Plug in ESP32
3. Click "Install SkyOrb"
4. Pick the COM port
5. Wait 30 seconds
6. Connect phone to "FlightRadar-Setup" WiFi → enter their home WiFi

No PlatformIO. No code. No downloads.

---

## Important note about hardware

The flashed firmware has the pin wiring baked in. Anyone using your
installer must wire their display(s) to the SAME pins you used:

**Radar display:** SCL→18, SDA→23, RES→4, DC→2, CS→5, VCC→3.3V, GND→GND
**Clock display:** SCL→18, SDA→23 (shared), RES→21, DC→17, CS→16

Include this wiring info wherever you share the link (it's already shown
on the installer page itself).
