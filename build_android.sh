#!/bin/bash

echo "Build Android mobile"

# USAGE: ./build_android.sh snap_file.xml

# was called 'snapmobile_init.sh' for init:
# ready to user git source of snap-mobile (checkout mobileapp)
export originalsource="/home/vagrant/source-origin/snapmobile"
export cordovaplugins="/home/vagrant/source-origin/cordova/plugins"

scriptdir=$(readlink -e ".")

# project content
content=$(cat $1)

buildsource=$(mktemp -d)
cp -R $originalsource $buildsource

echo "originalsource: '$originalsource'"
echo "buildsource: '$buildsource'"

cd "$buildsource/snapmobile"

rm -rf .git/

# minimize everything
rm lang* ypr.js paint.js cloud.js gui.js

sed -i '/paint\.js"/d' snap.html
sed -i '/cloud\.js"/d' snap.html
sed -i 's/gui\.js"/binary\.js"/' snap.html

# load custom project from file
sed -i '/sha512\.js"/a\
        <script type="text/javascript" src="code.js"></script> ' snap.html

echo "var code =" > code.js
echo "'$content'" >> code.js
echo ";" >> code.js

sed -i "/ide\.openIn/a\
    ide.droppedText(code); " snap.html

find . -name '*.js' | xargs -I {} uglifyjs {} -o {} -c

# return to the directory where the script was called from
cd "$scriptdir"

# ===============================================
# Android Cordova build

builddir=$(mktemp -d)

cordova create $builddir edu.berkeley.snap "Snap\!"

cd $builddir
rm -rf www config.xml

mv "$buildsource/snapmobile" www
cd www

# add mobile-specific library; it's made available at runtime
sed -i '/link rel="shortcut icon"/a\
        <script type="text/javascript" src="cordova.js"></script>' snap.html

# add everything needed and build for $device
cordova platform add android

cordova plugin add $cordovaplugins/org.apache.cordova.plugin.softkeyboard
cordova plugin add $cordovaplugins/org.apache.cordova.vibration
cordova plugin add $cordovaplugins/org.apache.cordova.device-motion
cordova plugin add $cordovaplugins/org.apache.cordova.device-orientation
cordova plugin add $cordovaplugins/org.apache.cordova.geolocation
cordova plugin add $cordovaplugins/de.appplant.cordova.plugin.local-notification

# Remove default icons
cd "$builddir/platforms/android"
find -name '*.png' | xargs rm

cordova build android
cd $builddir
find -name '*.apk' | xargs -I {} mv {} $scriptdir