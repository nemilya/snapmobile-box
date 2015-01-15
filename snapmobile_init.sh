# called from guest machine

cd ~/
mkdir source-origin
cd source-origin

# Snap for web
git clone https://github.com/Gubolin/snap.git snapmobile-web
cd snapmobile-web
git submodule init
git submodule update
# copy to shared folder
cp -R ~/source-origin/snapmobile-web /vagrant/

# Snap for mobile apps creation
cd ~/source-origin
git clone https://github.com/Gubolin/snap.git snapmobile
cd snapmobile
git checkout mobileapp

# init cordova
cd ~/source-origin


cordova create cordova edu.berkeley.snap "Snap\!"

cd cordova

cordova platform add android
cordova plugin add org.apache.cordova.plugin.softkeyboard
cordova plugin add org.apache.cordova.vibration
cordova plugin add org.apache.cordova.device-motion
cordova plugin add org.apache.cordova.device-orientation
cordova plugin add org.apache.cordova.geolocation
cordova plugin add de.appplant.cordova.plugin.local-notification
