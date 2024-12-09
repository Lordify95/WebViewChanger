#!bin/bash

WD=/sdcard/Download/WVC

# Create WebViewChanger Module and Move to /sdcard/Download
cd $WD
sleep 1
zip -r WVC.zip *
sleep 1
cp $WD/WVC.zip /sdcard/Download/
sleep 1
rm -rf $WD
sleep 1

# Add manual updater to .bashrc
echo $'\n' >> ~/.bashrc
echo "# WVC Updater Script" >> ~/.bashrc
echo "alias WVU='bash ~/wvupdate.sh'" >> ~/.bashrc

echo
echo "-------------------------------------------------"
echo "WVC.zip Created to /sdcard/Download"
echo "Flash in Magisk, then Reboot"
echo "If You Would Like to Update the Installed WebView"
echo "Just run WVU Command in Termux"
echo "-------------------------------------------------"
echo

sleep 5
exit
