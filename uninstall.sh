WVAD=$(for WVA in ".com.android.webview" ".us.spotco.mulch_wv" ".com.thorium.webview" ".app.vanadium.trichromelibrary" ".app.vanadium.webview"; do ls -R /data/app/ | grep -E -m 1 "$WVA"; done)

# Delete WebView User Data
if [[ ! -d $WVAD ]]; then
	rm -rf "${WVAD%?}"
fi

# Delete WebView User Data
for WVD in "com.android.webview" "us.spotco.mulch_wv" "com.thorium.webview" "app.vanadium.trichromelibrary" "app.vanadium.webview"; do
	if [ -d "/data/data/$WVD" ]; then
		rm -rf /data/data/$WVD
	fi
done

# Don't modify anything after this
if [ -f $INFO ]; then
  while read LINE; do
    if [ "$(echo -n $LINE | tail -c 1)" == "~" ]; then
      continue
    elif [ -f "$LINE~" ]; then
      mv -f $LINE~ $LINE
    else
      rm -f $LINE
      while true; do
        LINE=$(dirname $LINE)
        [ "$(ls -A $LINE 2>/dev/null)" ] && break 1 || rm -rf $LINE
      done
    fi
  done < $INFO
  rm -f $INFO
fi
