#!/system/bin/sh

# Variables
ARCH=$(getprop ro.product.cpu.abi)

# Updater
if [[ "$ARCH" = "armeabi-v7a" ]]; then
	echo "Downloading Update..."
	curl -o /data/local/tmp/MulchWebView.apk https://gitlab.com/divested-mobile/mulch/-/raw/master/prebuilt/arm/webview.apk
	sleep 1
	echo "Installing Update..."
	su -c pm install --install-location 1 /data/local/tmp/MulchWebView.apk
	sleep 1
	echo "Cleaning Up..."
	su -c rm -rf /data/local/tmp/MulchWebView.apk
	sleep 1
	echo "Update Done!"
else
	echo "Downloading Update..."
	curl -o /data/local/tmp/MulchWebView.apk https://gitlab.com/divested-mobile/mulch/-/raw/master/prebuilt/arm64/webview.apk
	sleep 1
	echo "Installing Update..."
	su -c pm install --install-location 1 /data/local/tmp/MulchWebView.apk
	sleep 1
	echo "Cleaning Up..."
	su -c rm -rf /data/local/tmp/MulchWebView.apk
	sleep 1
	echo "Update Done!"
fi
