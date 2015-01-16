# called from guest machine

cd /home/vagrant/
mkdir source-origin
cd source-origin

# Snap for web
git clone https://github.com/Gubolin/snap.git snapmobile-web
cd snapmobile-web
git submodule init
git submodule update
# copy to shared folder


sudo chown -R vagrant:vagrant /home/vagrant/source-origin/snapmobile-web

cp -R /home/vagrant/source-origin/snapmobile-web /vagrant/

# Snap for mobile apps creation
cd /home/vagrant/source-origin
git clone https://github.com/Gubolin/snap.git snapmobile
cd snapmobile
git checkout mobileapp

sudo chown -R vagrant:vagrant /home/vagrant/source-origin/snapmobile

# init cordova
cd /home/vagrant/source-origin

cordova create cordova edu.berkeley.snap "Snap\!"

cd cordova

cordova platform add android
cordova plugin add org.apache.cordova.plugin.softkeyboard
cordova plugin add org.apache.cordova.vibration
cordova plugin add org.apache.cordova.device-motion
cordova plugin add org.apache.cordova.device-orientation
cordova plugin add org.apache.cordova.geolocation
cordova plugin add de.appplant.cordova.plugin.local-notification

sudo chown -R vagrant:vagrant /home/vagrant/source-origin/cordova
sudo chown vagrant:vagrant /home/vagrant/source-origin
