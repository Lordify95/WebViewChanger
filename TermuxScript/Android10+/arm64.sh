#!bin/bash

WD=/sdcard/Download/WVC
LOS=$(getprop | grep -o -c "lineage")

# WebView Selection to Your API and ARCH
PS3="Please Select Your WebView: "
select WV in Mulch Thorium Vanadium Cromite
do
case $WV in
	"Mulch")
	if (( "$LOS" > "0" )); then
		echo
		echo "----------------------------"
		echo "LineageOS Based ROM Detected"
		echo "----------------------------"
		echo
		sleep 1
		wget -P $WD/system/product/app/MulchWebView https://gitlab.com/divested-mobile/mulch/-/raw/master/prebuilt/arm64/webview.apk
		sleep 1
		mv $WD/system/product/app/MulchWebView/webview.apk $WD/system/product/app/MulchWebView/MulchWebView.apk
		sleep 1
		cp $WD/system/product/app/MulchWebView/MulchWebView.apk /sdcard/Download/
		sleep 1
		bash finalize.sh
	else
		wget -P $WD/system/app/MulchWebView https://gitlab.com/divested-mobile/mulch/-/raw/master/prebuilt/arm64/webview.apk
		sleep 1
		mv $WD/system/app/MulchWebView/webview.apk $WD/system/app/MulchWebView/MulchWebView.apk
		sleep 1
		cp $WD/system/app/MulchWebView/MulchWebView.apk /sdcard/Download/
		sleep 1
		bash finalize.sh
	fi	
	;;
	
	"Thorium")
	if (( "$LOS" > "0" )); then
		echo
		echo "----------------------------"
		echo "LineageOS Based ROM Detected"
		echo "----------------------------"
		echo
		sleep 1
		wget -P $WD/system/product/app/ThoriumWebView https://github.com/Alex313031/Thorium-Android/releases/latest/download/SystemWebView_arm64.apk
		sleep 1
		mv $WD/system/product/app/ThoriumWebView/SystemWebView_arm64.apk $WD/system/product/app/ThoriumWebView/ThoriumWebView.apk
		sleep 1
		cp $WD/system/product/app/ThoriumWebView/ThoriumWebView.apk /sdcard/Download/
		sleep 1
		bash finalize.sh
	else
		wget -P $WD/system/app/ThoriumWebView https://github.com/Alex313031/Thorium-Android/releases/latest/download/SystemWebView_arm64.apk
		sleep 1
		mv $WD/system/app/ThoriumWebView/SystemWebView_arm64.apk $WD/system/app/ThoriumWebView/ThoriumWebView.apk
		sleep 1
		cp $WD/system/app/ThoriumWebView/ThoriumWebView.apk /sdcard/Download/
		sleep 1
		bash finalize.sh
	fi	
	;;
	
	"Vanadium")
	if (( "$LOS" > "0" )); then
		echo
		echo "----------------------------"
		echo "LineageOS Based ROM Detected"
		echo "----------------------------"
		echo
		sleep 1
		wget -P $WD/system/product/app/VanadiumWebView https://gitlab.com/grapheneos/platform_external_vanadium/-/raw/14/prebuilt/arm64/TrichromeWebView.apk
		sleep 1
		mv $WD/system/product/app/VanadiumWebView/TrichromeWebView.apk $WD/system/product/app/VanadiumWebView/VanadiumWebView.apk
		sleep 1
		cp $WD/system/product/app/VanadiumWebView/VanadiumWebView.apk /sdcard/Download
		sleep 1
		wget -P $WD/system/product/app/TrichromeLibrary https://gitlab.com/grapheneos/platform_external_vanadium/-/raw/14/prebuilt/arm64/TrichromeLibrary.apk
		sleep 1
		cp $WD/system/product/app/TrichromeLibrary/TrichromeLibrary.apk /sdcard/Download/
		bash finalize.sh
	else
		wget -P $WD/system/app/VanadiumWebView https://gitlab.com/grapheneos/platform_external_vanadium/-/raw/14/prebuilt/arm64/TrichromeWebView.apk
		sleep 1
		mv $WD/system/app/VanadiumWebView/TrichromeWebView.apk $WD/system/app/VanadiumWebView/VanadiumWebView.apk
		sleep 1
		cp $WD/system/app/VanadiumWebView/VanadiumWebView.apk /sdcard/Download/
		sleep 1
		wget -P $WD/system/app/TrichromeLibrary https://gitlab.com/grapheneos/platform_external_vanadium/-/raw/14/prebuilt/arm64/TrichromeLibrary.apk
		sleep 1
		cp $WD/system/app/TrichromeLibrary/TrichromeLibrary.apk /sdcard/Download/
		bash finalize.sh
	fi	
	;;
	
	"Cromite")
	if (( "$LOS" > "0" )); then
		echo
		echo "----------------------------"
		echo "LineageOS Based ROM Detected"
		echo "----------------------------"
		echo
		sleep 1
		wget -P $WD/system/product/app/CromiteWebView https://github.com/uazo/cromite/releases/latest/download/arm64_SystemWebView64.apk
		sleep 1
		mv $WD/system/product/app/CromiteWebView/arm64_SystemWebView64.apk $WD/system/product/app/CromiteWebView/CromiteWebView.apk
		sleep 1
		cp $WD/system/product/app/CromiteWebView/CromiteWebView.apk /sdcard/Download/
		sleep 1
		bash finalize.sh
	else
		wget -P $WD/system/app/CromiteWebView https://github.com/uazo/cromite/releases/latest/download/arm64_SystemWebView64.apk
		sleep 1
		mv $WD/system/app/CromiteWebView/arm64_SystemWebView64.apk $WD/system/app/CromiteWebView/CromiteWebView.apk
		sleep 1
		cp $WD/system/app/CromiteWebView/CromiteWebView.apk /sdcard/Download/
		sleep 1
		bash finalize.sh
	fi	
	;;
esac
break
done