Simple web application for provide access to `snap_project.xml`.

Place your xml (f.e. `snap_project.xml`) to `projects`.

Then access to http://IP:PORT/get_xml/snap_project.xml
(test in browser)

And user this URL to `build_android.sh`

For example:

    ./build_android.sh http://IP:PORT/get_xml/snap_project.xml

Install APK to Android, when application is started it access to URL,
upload `xml` project, and load it.

I.e. after changing `projects/snap_project.xml`, and restart Android application
will be loaded new version.