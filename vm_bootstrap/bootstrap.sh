#!/usr/bin/env bash

ANDROID_SDK_FILENAME=android-sdk_r23.0.2-linux.tgz
ANDROID_SDK=http://dl.google.com/android/$ANDROID_SDK_FILENAME

#sudo apt-get install python-software-properties
#sudo add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install -y nodejs nodejs-legacy npm git openjdk-7-jdk ant expect

curl -O $ANDROID_SDK
tar -xzvf $ANDROID_SDK_FILENAME
sudo chown -R vagrant android-sdk-linux/

echo "ANDROID_HOME=~/android-sdk-linux" >> /home/vagrant/.bashrc
echo "PATH=\$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools" >> /home/vagrant/.bashrc

npm install -g cordova
# npm install -g ionic

sudo npm install uglify-js -g
sudo chown -R vagrant:vagrant /home/vagrant/.android

expect -c '
set timeout -1   ;
spawn /home/vagrant/android-sdk-linux/tools/android update sdk -u --all --filter platform-tool,android-19,build-tools-19.1.0
expect { 
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
'

# `zipalign` is missing in "tools" folder in sdk_r23.0.2, copy it
cp android-sdk-linux/build-tools/19.1.0/zipalign android-sdk-linux/tools/

/vagrant/vm_bootstrap/snapmobile_init.sh
# sudo /home/vagrant/android-sdk-linux/platform-tools/adb kill-server
# sudo /home/vagrant/android-sdk-linux/platform-tools/adb start-server
# sudo /home/vagrant/android-sdk-linux/platform-tools/adb devices
