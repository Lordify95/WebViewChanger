#!bin/bash

# Variables
API=$(getprop ro.build.version.sdk)
ARCH=$(getprop ro.product.cpu.abi)
WD=/sdcard/Download
WV=$(for dir in CromiteWebView MulchWebView ThoriumWebView VanadiumWebView; do ls /system/app | grep "$dir"; done)
WVLOS=$(for losdir in CromiteWebView MulchWebView ThoriumWebView VanadiumWebView; do ls /system/product/app | grep "$losdir"; done)

# Updater for Android 9 with ARM
if [[ $API -eq 28 && "$ARCH" = "armeabi-v7a" ]]; then
echo
echo "---------------------------"
echo "Android 9 with ARM Detected"
echo "---------------------------"
echo
	if [[ "$WV" = "MulchWebView" ]]; then
	echo
	echo "-------------------------------"
	echo "Mulch WebView Install Detected!"
	echo "-------------------------------"
	echo
		wget -P $WD https://gitlab.com/divested-mobile/mulch/-/raw/master/prebuilt/arm/webview.apk
		sleep 1
		su -c cp $WD/webview.apk /data/local/tmp/
		sleep 1
		su -c pm install --install-location 1 /data/local/tmp/webview.apk
		sleep 1
		rm -rf $WD/webview.apk
		sleep 1
		su -c rm -rf /data/local/tmp/webview.apk
	elif [[ "$WV" = "ThoriumWebView" ]]; then
	echo
	echo "---------------------------------"
	echo "Thorium WebView Install Detected!"
	echo "---------------------------------"
	echo
		wget -P $WD https://github.com/Alex313031/Thorium-Android/releases/latest/download/SystemWebView_arm32.apk
		sleep 1
		su -c cp $WD/SystemWebView_arm32.apk /data/local/tmp/
		sleep 1
		su -c pm install --install-location 1 /data/local/tmp/SystemWebView_arm32.apk
		sleep 1
		rm -rf $WD/SystemWebView_arm32.apk
		sleep 1
		su -c rm -rf /data/local/tmp/SystemWebView_arm32.apk
	fi
fi

# Updater for Android 9 with ARM64
if [[ $API -eq 28 && "$ARCH" = "arm64-v8a" ]]; then
echo
echo "------------------------------"
echo "Android 9 with ARM64 Detected!"
echo "------------------------------"
echo
	if [[ "$WV" = "MulchWebView" ]]; then
	echo
	echo "-------------------------------"
	echo "Mulch WebView Install Detected!"
	echo "-------------------------------"
	echo
		wget -P $WD https://gitlab.com/divested-mobile/mulch/-/raw/master/prebuilt/arm64/webview.apk
		sleep 1
		su -c cp $WD/webview.apk /data/local/tmp/
		sleep 1
		su -c pm install --install-location 1 /data/local/tmp/webview.apk
		sleep 1
		rm -rf $WD/webview.apk
		sleep 1
		su -c rm -rf /data/local/tmp/webview.apk
	elif [[ "$WV" = "ThoriumWebView" ]]; then
	echo
	echo "---------------------------------"
	echo "Thorium WebView Install Detected!"
	echo "---------------------------------"
	echo
		wget -P $WD https://github.com/Alex313031/Thorium-Android/releases/latest/download/SystemWebView_arm64.apk
		sleep 1
		su -c cp $WD/SystemWebView_arm64.apk /data/local/tmp/
		sleep 1
		su -c pm install --install-location 1 /data/local/tmp/SystemWebView_arm64.apk
		sleep 1
		rm -rf $WD/SystemWebView_arm64.apk
		sleep 1
		su -c rm -rf /data/local/tmp/SystemWebView_arm64.apk
	elif [[ "$WV" = "CromiteWebView" ]]; then
	echo
	echo "---------------------------------"
	echo "Cromite WebView Install Detected!"
	echo "---------------------------------"
	echo
		wget -P $WD https://github.com/uazo/cromite/releases/latest/download/arm64_SystemWebView64.apk
		sleep 1
		su -c cp $WD/arm64_SystemWebView64.apk /data/local/tmp/
		sleep 1
		su -c pm install --install-location 1 /data/local/tmp/arm64_SystemWebView64.apk
		sleep 1
		rm -rf $WD/arm64_SystemWebView64.apk
		sleep 1
		su -c rm -rf /data/local/tmp/arm64_SystemWebView64.apk
	fi
fi

# Updater for Android 10+ with ARM
if [[ $API -ge 29 && "$ARCH" = "armeabi-v7a" ]]; then
echo
echo "------------------------------"
echo "Android 10+ with ARM Detected!"
echo "------------------------------"
echo
	if [[ "$WV" = "MulchWebView" || "$WVLOS" = "MulchWebView" ]]; then
	echo
	echo "-------------------------------"
	echo "Mulch WebView Install Detected!"
	echo "-------------------------------"
	echo
		wget -P $WD https://gitlab.com/divested-mobile/mulch/-/raw/master/prebuilt/arm/webview.apk
		sleep 1
		su -c cp $WD/webview.apk /data/local/tmp/
		sleep 1
		su -c pm install --install-location 1 /data/local/tmp/webview.apk
		sleep 1
		rm -rf $WD/webview.apk
		sleep 1
		su -c rm -rf /data/local/tmp/webview.apk
	elif [[ "$WV" = "ThoriumWebView" || "$WVLOS" = "ThoriumWebView" ]]; then
	echo
	echo "---------------------------------"
	echo "Thorium WebView Install Detected!"
	echo "---------------------------------"
	echo
		wget -P $WD https://github.com/Alex313031/Thorium-Android/releases/latest/download/SystemWebView_arm32.apk
		sleep 1
		su -c cp $WD/SystemWebView_arm32.apk /data/local/tmp/
		sleep 1
		su -c pm install --install-location 1 /data/local/tmp/SystemWebView_arm32.apk
		sleep 1
		rm -rf $WD/SystemWebView_arm32.apk
		sleep 1
		su -c rm -rf /data/local/tmp/SystemWebView_arm32.apk
	fi
fi

# Updater for Android 10+ with ARM64
if [[ $API -ge 29 && "$ARCH" = "arm64-v8a" ]]; then
echo
echo "--------------------------------"
echo "Android 10+ with ARM64 Detected!"
echo "--------------------------------"
echo
	if [[ "$WV" = "MulchWebView" || "$WVLOS" = "MulchWebView" ]]; then
	echo
	echo "-------------------------------"
	echo "Mulch WebView Install Detected!"
	echo "-------------------------------"
	echo
		wget -P $WD https://gitlab.com/divested-mobile/mulch/-/raw/master/prebuilt/arm64/webview.apk
		sleep 1
		su -c cp $WD/webview.apk /data/local/tmp/
		sleep 1
		su -c pm install --install-location 1 /data/local/tmp/webview.apk
		sleep 1
		rm -rf $WD/webview.apk
		sleep 1
		su -c rm -rf /data/local/tmp/webview.apk
	elif [[ "$WV" = "ThoriumWebView" || "$WVLOS" = "ThoriumWebView" ]]; then
	echo
	echo "---------------------------------"
	echo "Thorium WebView Install Detected!"
	echo "---------------------------------"
	echo
		wget -P $WD https://github.com/Alex313031/Thorium-Android/releases/latest/download/SystemWebView_arm64.apk
		sleep 1
		su -c cp $WD/SystemWebView_arm64.apk /data/local/tmp/
		sleep 1
		su -c pm install --install-location 1 /data/local/tmp/SystemWebView_arm64.apk
		sleep 1
		rm -rf $WD/SystemWebView_arm64.apk
		sleep 1
		su -c rm -rf /data/local/tmp/SystemWebView_arm64.apk
	elif [[ "$WV" = "VanadiumWebView" || "$WVLOS" = "VanadiumWebView" ]]; then
	echo
	echo "----------------------------------"
	echo "Vanadium WebView Install Detected!"
	echo "----------------------------------"
	echo
		wget -P $WD https://gitlab.com/grapheneos/platform_external_vanadium/-/raw/14/prebuilt/arm64/TrichromeLibrary.apk
		sleep 1
		su -c cp $WD/TrichromeLibrary.apk /data/local/tmp/
		sleep 1
		su -c pm install --install-location 1 /data/local/tmp/TrichromeLibrary.apk
		sleep 1
		rm -rf $WD/TrichromeLibrary.apk
		sleep 1
		su -c rm -rf /data/local/tmp/TrichromeLibrary.apk
		wget -P $WD https://gitlab.com/grapheneos/platform_external_vanadium/-/raw/14/prebuilt/arm64/TrichromeWebView.apk
		sleep 1
		su -c cp $WD/TrichromeWebView.apk /data/local/tmp/
		sleep 1
		su -c pm install --install-location 1 /data/local/tmp/TrichromeWebView.apk
		sleep 1
		rm -rf $WD/TrichromeWebView.apk
		sleep 1
		su -c rm -rf /data/local/tmp/TrichromeWebView.apk
	elif [[ "$WV" = "CromiteWebView" || "$WVLOS" = "CromiteWebView" ]]; then
	echo
	echo "---------------------------------"
	echo "Cromite WebView Install Detected!"
	echo "---------------------------------"
	echo
		wget -P $WD https://github.com/uazo/cromite/releases/latest/download/arm64_SystemWebView64.apk
		sleep 1
		su -c cp $WD/arm64_SystemWebView64.apk /data/local/tmp/
		sleep 1
		su -c pm install --install-location 1 /data/local/tmp/arm64_SystemWebView64.apk
		sleep 1
		rm -rf $WD/arm64_SystemWebView64.apk
		sleep 1
		su -c rm -rf /data/local/tmp/arm64_SystemWebView64.apk
	fi
fi