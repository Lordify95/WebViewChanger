#!/system/bin/sh

# Variables
local LOS=$(getprop | grep -o -c "lineage")

# Alias for Curl
alias curl='$MODPATH/bin/$ARCH/curl'

# API Check
if [[ $API -ge 29 ]]; then
	echo
	echo "----------------------------------"
	echo "Your Android Version is Supported!"
	echo "----------------------------------"
	echo
else
	echo
	echo "--------------------------------------"
	echo "Your Android Version is not Supported!"
	echo "--------------------------------------"
	echo
fi

# ARCH Check
if [[ "$ARCH" = "arm64" ]]; then
	echo
	echo "-----------------------------------"
	echo "Your CPU Architecture is Supported!"
	echo "-----------------------------------"
	echo
else
	echo
	echo "---------------------------------------"
	echo "Your CPU Architecture is not Supported!"
	echo "---------------------------------------"
	echo
fi

# Debloat (code from OpenWebView)
echo
echo "----------------------------------------------"
echo "Replacing Packages that can Cause Conflicts..."
echo "----------------------------------------------"
echo
for i in "com.android.chrome" "com.android.webview" "com.google.android.webview" "org.mozilla.webview_shell" "com.sec.android.app.chromecustomizations" "com.google.android.trichromelibrary"; do
	local IS_OLD_WEBVIEW_INSTALLED OLD_WEBVIEW_PATH
	IS_OLD_WEBVIEW_INSTALLED=$(cmd package dump "$i" | grep codePath)
	if [[ -n $IS_OLD_WEBVIEW_INSTALLED ]]; then
		echo "Detecting WebView: $i"
		OLD_WEBVIEW_PATH=${IS_OLD_WEBVIEW_INSTALLED##*=}
	if [[ ! -z $OLD_WEBVIEW_PATH ]]; then
		echo "WebView: $OLD_WEBVIEW_PATH Detected!"
		mktouch "$MODPATH"$OLD_WEBVIEW_PATH/.replace
	fi
fi
done

# Download and Install WebView
echo
echo "----------------------------------------------------------"
echo "Download and Install Vanadium TrichromeLibrary and WebView"
echo "----------------------------------------------------------"
echo
if [[ $LOS -gt 0 ]]; then
	TLP=/system/product/app/VanadiumTrichromeLibrary
	WVP=/system/product/app/VanadiumWebView
	echo
	echo "-----------------------------------"
	echo "LineageOS Based Custom ROM Detected"
	echo "-----------------------------------"
	echo
else
	TLP=/system/app/VanadiumTrichromeLibrary
	WVP=/system/app/VanadiumWebView
fi
mkdir -p "$MODPATH"/$TLP
mkdir -p "$MODPATH"/$WVP
	curl -o $MODPATH/$TLP/VanadiumTrichromeLibrary.apk https://gitlab.com/grapheneos/platform_external_vanadium/-/raw/14/prebuilt/arm64/TrichromeLibrary.apk
	su -c cp $MODPATH/$TLP/VanadiumTrichromeLibrary.apk /data/local/tmp
	su -c pm install --install-location 1 /data/local/tmp/VanadiumTrichromeLibrary.apk
	curl -o $MODPATH/$WVP/VanadiumWebView.apk https://gitlab.com/grapheneos/platform_external_vanadium/-/raw/14/prebuilt/arm64/TrichromeWebView.apk
	su -c cp $MODPATH/$WVP/VanadiumWebView.apk /data/local/tmp
	su -c pm install --install-location 1 /data/local/tmp/VanadiumWebView.apk
	echo
	echo "-----------------------------------------------------"
	echo "TrichromeLibrary and WebView Downloaded and Installed"
	echo "-----------------------------------------------------"
	echo
fi

# Check for Overlay Directory (code from OpenWebview)
echo
echo "---------------------------------"
echo "Checking for Overlay Directory..."
echo "---------------------------------"
echo
if [[ $LOS -gt 0 ]]; then
	OVERLAY_PATH=system/product/overlay/
	elif [[ -d /system_ext/overlay ]]; then
	OVERLAY_PATH=system/system_ext/overlay/
	elif [[ -d /system/overlay ]]; then
	OVERLAY_PATH=system/overlay/
	elif [[ -d /system/vendor/overlay ]]; then
	OVERLAY_PATH=system/vendor/overlay/
	echo "Overlay Directory Found!"
	else
	echo "Unable to Find a Correct Overlay Path!"
fi

# Make Overlay Directory Inside the Module (code from OpenWebView)
echo
echo "-----------------------------------------------"
echo "Creating Overlay Directory Inside the Module..."
echo "-----------------------------------------------"
echo
mkdir -p "$MODPATH"/$OVERLAY_PATH
if [[ $API -eq 28 ]]; then
	cp $MODPATH/Overlay/WebViewOverlay28.apk $MODPATH/$OVERLAY_PATH/WebViewOverlay.apk
elif [[ $API -ge 29 ]]; then
	cp $MODPATH/Overlay/WebViewOverlay29.apk $MODPATH/$OVERLAY_PATH/WebViewOverlay.apk
fi

# Some CleanUp
echo
echo "--------------"
echo "Cleaning Up..."
echo "--------------"
echo
mkdir -p $MODPATH/system/bin
cp $MODPATH/bin/$ARCH/curl $MODPATH/system/bin
chmod 0755 $MODPATH/system/bin/curl
rm -rf $MODPATH/bin
rm -rf $MODPATH/system/.placeholder
rm -rf $MODPATH/Overlay
rm -rf /data/local/tmp/VanadiumWebView.apk
rm -rf /data/local/tmp/VanadiumTrichromeLibrary.apk