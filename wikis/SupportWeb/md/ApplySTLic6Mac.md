::: {.topic-text}
[]{#Apply Release 6.x Lite Edition License Files on Mac OS X} Apply Release 6.x Lite Edition License Files on Mac OS X
======================================================================================================================

1.  ***Note:** You must be logged in as a user with Administrator
    privileges.*\
    \
2.  For best results, quit all ODBC client applications and
    administrative tools to start this process, and do not relaunch any
    of them until instructed to test your connection.\
    \
3.  Locate your new license file in your email or [ODS
    Briefcase](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/SupportWeb/ODSBriefcaseLicenseStorage){.wikiword},
    and note its name.\
    \
4.  Open a Finder window, and drill down to **Macintosh HD** -\>
    **Library** -\> **Application Support** -\> **openlink** -\>
    **Licenses**.\
    \
    1.  In this directory, locate any existing file by the same name as
        your new license file. Generally, this can simply be discarded,
        but you can keep it if you like; simply move it to a different
        location (such as your Desktop) or rename it (e.g.,
        sql\_lt.lic.2011-03-21.bak). Once the new license is confirmed
        to work, it\'s usually best to discard the expired and/or unused
        license files, to avoid future confusion.\
        \
    2.  Drag your new license file from your email or [ODS
        Briefcase](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/SupportWeb/ODSBriefcaseLicenseStorage){.wikiword}
        to this directory, replacing any existing file by the same
        name.\
        \
5.  Launch **Terminal.app** (found in `/Applications/Utilities/`).\
    \
6.  Execute these three commands (you can just copy-and-paste), and
    provide your Mac OS X user password when prompted \--\

        cd "/Library/Application Support/openlink/Licenses"
        sudo ../bin/oplmgr +stop
        sudo ../bin/oplmgr +start

    \

7.  Note also the following document on the [Mac OS X OpenLink License
    Manager Usage
    Notes](http://wikis.openlinksw.com/dataspace/owiki/wiki/UdaWikiWeb/MacOSXOplmgrLicenseLocations){.absuri},
    containing more detailed usages notes with different version of
    `oplmgr`.
8.  Test your connection with the
    [OpenLink](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/SupportWeb/OpenLink){.wikiword}
    ODBC Administrator.app or any other ODBC client application.\
    \
    1.  If license errors come up, reboot, and test again.\
        \
    2.  If errors persist, please [log a Support
        Case](http://support.openlinksw.com/support/online-support.vsp){.absuri}.\
        \
:::
