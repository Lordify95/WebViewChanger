#!bin/bash

WD=/sdcard/Download/WVC

# WebView Selection to Your API and ARCH
PS3="Please Select Your WebView: "
select WV in Mulch Thorium Cromite
do
case $WV in
	"Mulch")
	wget -P $WD/system/app/MulchWebView https://gitlab.com/divested-mobile/mulch/-/raw/master/prebuilt/arm64/webview.apk
	sleep 1
	mv $WD/system/app/MulchWebView/webview.apk $WD/system/app/MulchWebView/MulchWebView.apk
	sleep 1
	cp $WD/system/app/MulchWebView/MulchWebView.apk /sdcard/Download/
	sleep 1
	bash finalize.sh
	;;
	
	"Thorium")
	wget -P $WD/system/app/ThoriumWebView https://github.com/Alex313031/Thorium-Android/releases/latest/download/SystemWebView_arm64.apk
	sleep 1
	mv $WD/system/app/ThoriumWebView/SystemWebView_arm64.apk $WD/system/app/ThoriumWebView/ThoriumWebView.apk
	sleep 1
	cp $WD/system/app/ThoriumWebView/ThoriumWebView.apk /sdcard/Download/
	sleep 1
	bash finalize.sh
	;;
	
	"Cromite")
	wget -P $WD/system/app/CromiteWebView https://github.com/uazo/cromite/releases/latest/download/arm64_SystemWebView64.apk
	sleep 1
	mv $WD/system/app/CromiteWebView/arm64_SystemWebView64.apk $WD/system/app/CromiteWebView/CromiteWebView.apk
	sleep 1
	cp $WD/system/app/CromiteWebView/CromiteWebView.apk /sdcard/Download/
	sleep 1
	bash finalize.sh
	;;
esac
break
done