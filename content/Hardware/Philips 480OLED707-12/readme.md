# Philips 480OLED707/12 (android tv)

## service menu

* press **HOME** (⌂) button
* press **1 9 9 9**
* press **back** (←) button

## customer service menu

press **1 2 3 6 5 4**

## OLED burn-in protection

disclaimer: maybe all those features and settings are there for good reason. many people refering to a high risk of burn-in issues with OLED.
I personally never experienced it. But yeah take this notes as always at your own risk!

### OFF-RS / JB

there are three records related to OFF-RS and JB in the **service menu**

* OFF-RS FEATURE SWITCH (default: On)
* OLED OFFRS TIME (time since last OFFRS)
* OLED JB TIME (time since last JB)

set `OFF-RS FEATURE SWITCH` to `Off` to disable the automatic shutdown
and image clean every ~10 hours for ~10 minutes.

### imageshift

the panel shifts your image every ~80s up to 8 pixels up/down/left/right.
there is one record in the **service menu**

* OLED IMAGESHIFT (default: Enable)

set `OLED IMAGESHIFT` to `Disable` instead.

## Other settings

### Light boost

* **Menu** (⚙) button
* **All settings**
* **Advanced**
* **Contrast**

set **Light boost** to `Off`.

### Floating Philips (screensaver)

there are two different screensavers.

* floating philips logo
* android screensaver

the floating philips logo can be killed in special app settings

* **Menu** (⚙) button
* **All settings**
* **Android settings**
* **Device Preferences**
* **Storage**
* **Internal shared Storage**
* **Apps**
* **Special App Access**
* **Display over other Apps**

Disable `Tv System UI`.

### inactivity timer

there is an inactivity timer tracking human input events and suspends the tv after ~2 hours of "inactivity"

* **Menu** (⚙) button
* **Manage apps**
* **Special app access**
* **Energy optimisation**

Disable `inactivitytimer`.