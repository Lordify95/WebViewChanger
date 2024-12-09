#!/system/bin/sh

# Variables
OVERLAY_APK_FILE="WebViewOverlay.apk"

# Debloat (code from OpenWebView)
ui_print
ui_print "----------------------------------------------"
ui_print "Replacing Packages that can Cause Conflicts..."
ui_print "----------------------------------------------"
ui_print
	for i in "com.android.chrome" "com.android.webview" "com.google.android.webview" "org.mozilla.webview_shell" "com.sec.android.app.chromecustomizations" "com.google.android.trichromelibrary"; do
	local IS_OLD_WEBVIEW_INSTALLED OLD_WEBVIEW_PATH
	IS_OLD_WEBVIEW_INSTALLED=$(cmd package dump "$i" | grep codePath)
		if [[ -n $IS_OLD_WEBVIEW_INSTALLED ]]; then
			ui_print "Detecting WebView: $i"
			OLD_WEBVIEW_PATH=${IS_OLD_WEBVIEW_INSTALLED##*=}
		if [[ ! -z $OLD_WEBVIEW_PATH ]]; then
			ui_print "WebView: $OLD_WEBVIEW_PATH Detected!"
			mktouch "$MODPATH"$OLD_WEBVIEW_PATH/.replace
		fi
	fi
done

# Auto Install WebView/TrichromeLibrary as User App
ui_print
ui_print "------------------------------------------"
ui_print "Auto Install Chosen WebView as User App..."
ui_print "------------------------------------------"
ui_print
for WVF in CromiteWebView.apk MulchWebView.apk ThoriumWebView.apk TrichromeLibrary.apk VanadiumWebView.apk; do
	if [[ -f "/sdcard/Download/$WVF" ]]; then
		cp /sdcard/Download/$WVF /data/local/tmp/
		su -c pm install --install-location 1 /data/local/tmp/$WVF
		rm -rf /sdcard/Download/$WVF
		rm -rf /data/local/tmp/$WVF
		ui_print "WebView Installed!"
	fi
done

# Check for Overlay Directory (code from OpenWebview)
ui_print
ui_print "---------------------------------"
ui_print "Checking for Overlay Directory..."
ui_print "---------------------------------"
ui_print
if [[ -d /product/overlay ]]; then
	OVERLAY_PATH=system/product/overlay/
	elif [[ -d /system_ext/overlay ]]; then
	OVERLAY_PATH=system/system_ext/overlay/
	elif [[ -d /system/overlay ]]; then
	OVERLAY_PATH=system/overlay/
	elif [[ -d /system/vendor/overlay ]]; then
	OVERLAY_PATH=system/vendor/overlay/
	ui_print "Overlay Directory Found!"
	else
	ui_print "Unable to Find a Correct Overlay Path!"
	clean_up 1
fi

# Make Overlay Directory Inside the Module (code from OpenWebView)
ui_print
ui_print "-----------------------------------------------"
ui_print "Creating Overlay Directory Inside the Module..."
ui_print "-----------------------------------------------"
ui_print
mkdir -p "$MODPATH"/$OVERLAY_PATH
	cp_ch "$MODPATH"/overlay/$OVERLAY_APK_FILE "$MODPATH"/$OVERLAY_PATH
	if [[ -d "$MODPATH"/product ]]; then
		if [[ -d "$MODPATH"/system/product ]]; then
		cp -rf "$MODPATH"/product/* "$MODPATH"/system/product/
		rm -rf "$MODPATH"/product/
	else
		mv "$MODPATH"/product/ "$MODPATH"/system/
		ui_print "Directory Structure Created!"
	fi
fi

# Remove Overlay APK After Install and Placeholder
ui_print
ui_print "--------------------------------------"
ui_print "Removing Unnecessary Files/Directories"
ui_print "--------------------------------------"
ui_print
rm -rf "$MODPATH"/overlay
rm -rf "$MODPATH"/system/.placeholder
