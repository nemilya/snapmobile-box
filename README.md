Snapmobile Box
==============

Android for Snap! project http://snap.berkeley.edu

Thanks to https://github.com/Gubolin

More info: https://github.com/jmoenig/Snap--Build-Your-Own-Blocks/pull/575

Vagrant configuration for Android based on https://github.com/driftyco/ionic-box

### Installation


To install, download and install [Vagrant](https://www.vagrantup.com/downloads.html) for your platform, then download and install [VirtualBox](http://virtualbox.org/).

Once Vagrant and VirtualBox are installed, you can download the latest release of this GitHub repo, and unzip it. `cd` into the unzipped folder and run:

```bash
$ vagrant up
$ vagrant ssh
```

The username for vagrant is `vagrant` and the password is `vagrant`. 

This will download and install the image, and then go through the dependencies and install them one by one. `vagrant ssh` will connect you to the image and give you a bash prompt. Once everything completes, you'll have a working box to build your apps on Android.



### Usage

After installed

Test build, at guest machine:

```bash
$ cd /vagrant/
$ ./build_android.sh snap_mobile_demo.xml
```


1. Start Snap! - folder `snapmobile-web` - in shared folder, from host-machine start `snap.html`
2. Create Snap! project, save as Shift+FileOpen - `Save to disk` (for example `snap_project.xml`)
3. Copy `snap_project.xml` to `snapmobile-box` folder
4. At guest machine:

```bash
$ cd /vagrant/snapmobile-web
$ ./build_android.sh snap_project.xml
```

Copy `CordovaApp-debug.apk` from `snapmobile-box` to Android.

### Landscape

Edit `config.xml` at `~/source-origin/snapmobile` add: 

    <preference name="Orientation" value="landscape" />


