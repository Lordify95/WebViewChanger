#!bin/bash

WD=/sdcard/Download/WVC

# WebView Selection to Your API and ARCH
PS3="Please Select Your WebView: "
select WV in Mulch Thorium
do
case $WV in
	"Mulch")
	wget -P $WD/system/app/MulchWebView https://gitlab.com/divested-mobile/mulch/-/raw/master/prebuilt/arm/webview.apk
	sleep 1
	mv $WD/system/app/MulchWebView/webview.apk $WD/system/app/MulchWebView/MulchWebView.apk
	sleep 1
	cp $WD/system/app/MulchWebView/MulchWebView.apk /sdcard/Download/
	sleep 1
	bash finalize.sh
	;;
	
	"Thorium")
	wget -P $WD/system/app/ThoriumWebView https://github.com/Alex313031/Thorium-Android/releases/latest/download/SystemWebView_arm32.apk
	sleep 1
	mv $WD/system/app/ThoriumWebView/SystemWebView_arm32.apk $WD/system/app/ThoriumWebView/ThoriumWebView.apk
	sleep 1
	cp $WD/system/app/ThoriumWebView/ThoriumWebView.apk /sdcard/Download/
	sleep 1
	bash finalize.sh
	;;
esac
break
done
