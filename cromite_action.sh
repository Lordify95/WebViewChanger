#!/system/bin/sh

echo "Downloading Update..."
curl -L -o /data/local/tmp/CromiteWebView.apk https://github.com/uazo/cromite/releases/latest/download/arm64_SystemWebView64.apk
sleep 1
echo "Installing Update..."
su -c pm install --install-location 1 /data/local/tmp/CromiteWebView.apk
sleep 1
echo "Cleaning Up..."
su -c rm -rf /data/local/tmp/CromiteWebView.apk
sleep 1
echo "Update Done!"
