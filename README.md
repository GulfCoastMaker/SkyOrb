# ✈ SkyOrb

**A live flight radar and clock for your desk, built on an ESP32 with round displays.**

SkyOrb shows real aircraft flying near your location in real time, with an
animated radar sweep that makes planes glow as it passes over them. A second
round display shows the time and date. Everything is configured from your
phone — no coding, no computer required after flashing.

### 🛜 [**Install it now → gulfcoastmaker.github.io/SkyOrb**](https://gulfcoastmaker.github.io/SkyOrb/)

Flash your ESP32 directly from Chrome or Edge — no software to install.

---

## What it does

- **Live flight tracking** — real ADS-B aircraft data from airplanes.live (free, no account or API key)
- **Animated radar sweep** — planes light up as the sweep passes, just like a real radar scope
- **Flight details** — callsigns and altitudes shown right on the display
- **Airport markers** — nearby airports shown on the radar, auto-found via OpenStreetMap
- **Clock display** — a second round screen showing time, day, and date with automatic timezone
- **Phone setup** — set your location, search radius, and airports from a web page on your phone
- **Tap to track** — tap any aircraft in the web portal to open it on FlightRadar24

---

## What you need

| Part | Notes |
|------|-------|
| [30-pin ESP32 dev board](https://www.amazon.com/dp/B0DF2YJSHN) | ESP-WROOM-32 |
| [Two GC9A01 round 1.28" displays](https://www.amazon.com/dp/B0B7TFRNN1) | 240×240 SPI, 7-pin — one for radar, one for clock |
| [30-pin ESP32 GPIO breakout board](https://www.amazon.com/dp/B0BNQ85GF3) | Screw terminals — no soldering needed |
| USB cable | To power and flash the ESP32 |

---

## Wiring

Both displays share the same SCL and SDA pins. Each display has its own
RES, DC, and CS pins.

**Radar display**

| Display Pin | ESP32 Pin |
|-------------|-----------|
| GND | GND |
| VCC | 3.3V |
| SCL | GPIO 18 (D18) |
| SDA | GPIO 23 (D23) |
| RES | GPIO 4 (D4) |
| DC  | GPIO 2 (D2) |
| CS  | GPIO 5 (D5) |

**Clock display**

| Display Pin | ESP32 Pin |
|-------------|-----------|
| GND | GND |
| VCC | 3.3V |
| SCL | GPIO 18 (D18, shared) |
| SDA | GPIO 23 (D23, shared) |
| RES | GPIO 21 (D21) |
| DC  | GPIO 17 (TX2) |
| CS  | GPIO 16 (RX2) |

> The displays have no backlight pin — the backlight is always on internally.

---

## How to set it up

1. **Wire up** your two displays to the ESP32 using the tables above.
2. **Flash the firmware** — go to the [installer page](https://gulfcoastmaker.github.io/SkyOrb/)
   in Chrome or Edge, plug in your ESP32, and click **Install SkyOrb**.
3. **Connect to WiFi** — after flashing, the ESP32 creates a WiFi hotspot
   called **SKYORB-Setup** (password: **radar1234**). On your phone, connect
   to that hotspot — a setup page pops up. Choose your home WiFi and enter
   the password, then save.
4. **Switch your phone back to your home WiFi** — ⚠️ this is the step people
   miss. After saving, your phone usually stays stuck on the SKYORB-Setup
   hotspot. Go into your phone's WiFi settings and reconnect to your normal
   home network. (Some phones do this on their own after a minute.) If you
   skip this, the next step won't load.
5. **Set your location** — now, with your phone on your home WiFi, open a
   browser and go to:

   ### `http://skyorb.local`

   (The radar display also shows this address on screen, with a backup
   numeric IP in case `skyorb.local` doesn't resolve on your network.) In
   the portal you can:
   - Enter your address or coordinates to center the radar
   - Choose your search radius (5–30 miles)
   - Add or remove airports
   - See a live copy of the radar and a tappable aircraft list

That's it — planes should start appearing within a few seconds, and the
clock's timezone updates automatically once your location is set.

---

## Tips

- **No planes showing?** Make sure your location is set correctly in the web
  portal, and that there's actually air traffic nearby — try a wider radius
  or check during busier hours.
- **Moving it to a new WiFi network?** Use the WiFi reset button in the web
  portal, then reconnect to the SKYORB-Setup hotspot to enter the new
  network.
- **Want to change the timezone?** The clock timezone updates automatically
  when you set your location in the web portal.

---

## Build it yourself / customize

SkyOrb is open source. The full firmware source code is available if you
want to tweak colors, pin assignments, or add features — built with
PlatformIO, TFT_eSPI, ArduinoJson, and WiFiManager.

---

## Credits

- Flight data: [airplanes.live](https://airplanes.live)
- Airport & address lookup: [OpenStreetMap](https://www.openstreetmap.org)
- Browser flashing: [ESP Web Tools](https://esphome.github.io/esp-web-tools/)

Licensed under the MIT License — free to use, modify, and share.
