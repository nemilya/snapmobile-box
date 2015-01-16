Simple web application for provide access to `snap_project.xml`.

Place your xml (f.e. `snap_project.xml`) to `projects`.

Start by `ruby app.rb -p PORT -o IP-ADDRESS`

Or at guest machine simple `ruby app.rb`

Todo: uncomment port forwarding in `Vagrantfile` config.

Then access to http://IP:PORT/get_xml/snap_project.xml
(test in browser). F.e. from host machine: `http://localhost:8080/get_xml/snap_project.xml`

And user this URL (specify real IP) to `build_android.sh`

For example:

    ./build_android.sh http://IP:PORT/get_xml/snap_project.xml

Install APK to Android, when application is started it access to URL,
and download `xml` project, and load it.

I.e. after changing `projects/snap_project.xml` file, and restart Android application -
new version will be loaded.
