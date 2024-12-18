#!/system/bin/sh

echo "Downloading Update..."
curl -o /data/local/tmp/VanadiumTrichromeLibrary.apk https://gitlab.com/grapheneos/platform_external_vanadium/-/raw/14/prebuilt/arm64/TrichromeLibrary.apk
sleep 1
curl -o /data/local/tmp/VanadiumWebView.apk https://gitlab.com/grapheneos/platform_external_vanadium/-/raw/14/prebuilt/arm64/TrichromeWebView.apk
sleep 1
echo "Installing Update..."
su -c pm install --install-location 1 /data/local/tmp/VanadiumTrichromeLibrary.apk
sleep 1
su -c pm install --install-location 1 /data/local/tmp/VanadiumWebView.apk
sleep 1
echo "Cleaning Up..."
su -c rm -rf /data/local/tmp/VanadiumTrichromeLibrary.apk
sleep 1
su -c rm -rf /data/local/tmp/VanadiumWebView.apk
sleep 1
echo "Update Done!"
