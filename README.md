What is this project?

A Magisk module creator Termux script for Android, that changes your WebView Implementation.

What is a WebView?

An APK that responsible for displaying Web based content. Usually most of the Android phone comes with Chrome (+ TrichromeLibrary) or Google's Android System WebView. But those are only spywere, nothing else...

Prerequisite:

- Android phone with at least 28 API (Android 9)
- Magisk and Termux installed
- Internet Connection

Choosable WebViews:

- Mulch by DivestOS
- Thorium by Alex313031
- Vanadium by GrapheneOS (Only for Android 10+ with ARM64)
- Cromite by uazo (Only for ARM64 Devices)

How to install:

1. Download the TermuxScript.zip from release page.
2. Grant Termux with storage/files permission (settings -> apps -> termux -> permissions).
3. Extract and open Termux, optionally run termux-change-repo command for faster mirrors (space = select, enter = confirm).
4. cd in the extracted directory and run the script with "bash start.sh" command.
5. Based on your API Level and CPU ARCH, you can choose between compatible WebViews.
6. The script creates a WVC.zip in /sdcard/Download, you have to flash that .zip in Magisk.
7. If you would like to update your flashed WebView, then run WVU command from Termux. (Recommended to run once or twice in a month)

Credits:

- topjonwhu for Magisk
- Zackptg5 for MMT-Extended
- F3FFO for Open WebView module
