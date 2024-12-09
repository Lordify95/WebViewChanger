#!bin/bash

# Variables
WD=/sdcard/Download/WVC
API=$(getprop ro.build.version.sdk)
ARCH=$(getprop ro.product.cpu.abi)

# Check Support Status
if (( "$API" < "28" )); then
	echo
	echo "-----------------------------"
	echo "Your Device is not Supported!"
	echo "-----------------------------"
	echo
	sleep 3
	exit
fi

# Installing Necessary Packages
pkg update
sleep 1
pkg upgrade -y
sleep 1
pkg install wget -y
sleep 1
pkg install zip -y
sleep 1

echo
echo "-----------------------------"
echo "Necessary Packages Installed!"
echo "-----------------------------"
echo

# Download the Latest Version of Module Template
mkdir -p $WD
sleep 1
wget https://git.rp1.hu/Lordify/WebViewChanger/releases/download/7.5/Module.zip
sleep 1
unzip Module.zip -d $WD
sleep 1
rm -rf Module.zip
sleep 1

echo
echo "---------------------------------------------"
echo "Latest Version of Module Template Downloaded!"
echo "---------------------------------------------"
echo

# Check Supported API for the Overlay Package
if (( "$API" == "28" )); then
	echo
	echo "-------------------------"
	echo "Your Device has Android 9"
	echo "-------------------------"
	echo
	unzip Android9/WebViewOverlay.zip
	sleep 1
	cp WebViewOverlay.apk $WD/overlay/
	sleep 1
	rm -rf WebViewOverlay.apk
else
	echo
	echo "---------------------------"
	echo "Your Device has Android 10+"
	echo "---------------------------"
	echo
	unzip Android10+/WebViewOverlay.zip
	sleep 1
	cp WebViewOverlay.apk $WD/overlay/
	sleep 1
	rm -rf WebViewOverlay.apk
fi

# Copy updater to ~/
cp wvupdate.sh ~/
sleep 1

echo
echo "-----------------"
echo "UpdaterCopy Done!"
echo "-----------------"
echo

# Check Supported API & CPU ARCH
if [[ $API -eq 28 && "$ARCH" = "armeabi-v7a" ]]; then
	echo
	echo "---------------------------------"
	echo "Your Android 9 Device has ARM CPU"
	echo "---------------------------------"
	echo
	sleep 1
	bash Android9/arm.sh
fi

if [[ $API -eq 28 && "$ARCH" = "arm64-v8a" ]]; then
	echo
	echo "-----------------------------------"
	echo "Your Android 9 Device has ARM64 CPU"
	echo "-----------------------------------"
	echo
	sleep 1
	bash Android9/arm64.sh
fi

if [[ $API -ge 29 && "$ARCH" = "armeabi-v7a" ]]; then
	echo
	echo "----------------------------------"
	echo "Your Android 10 Device has ARM CPU"
	echo "----------------------------------"
	echo
	sleep 1
	bash Android10+/arm.sh
fi

if [[ $API -ge 29 && "$ARCH" = "arm64-v8a" ]]; then
	echo
	echo "------------------------------------"
	echo "Your Android 10 Device has ARM64 CPU"
	echo "------------------------------------"
	echo
	sleep 1
	bash Android10+/arm64.sh
fi
