::: {.topic-text}
[]{#Apply Release 6.x Enterprise Edition License Files on Mac OS X}Apply Release 6.x Enterprise Edition License Files on Mac OS X
=================================================================================================================================

You must be logged in as a user with Administrator privileges.

1.  Open a Finder window, and drill down to **Macintosh HD** -\>
    **Library** -\> **Application Support** -\> **openlink** -\>
    **bin**.
2.  Drag your new license file from your email or [ODS
    Briefcase](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/SupportWeb/ODSBriefcaseLicenseStorage){.wikiword}
    to this directory, replacing any existing file by the same name.
3.  Launch **Terminal.app** (found in `/Applications/Utilities/`)
4.  Execute these three commands (you can just copy-and-paste) \--\

        cd "/Library/Application Support/openlink/bin"
        ./oplmgr +stop
        ./oplmgr +start

    \

    -   If you get an error, execute these commands \--\

            sudo ./oplmgr +stop
            sudo ./oplmgr +start

        \
        \-- and provide your Mac OS X user password when prompted.

5.  Test your driver. If license errors come up, reboot, and test again.
    If errors persist, please [log a Support
    Case](http://support.openlinksw.com/support/online-support.vsp){.absuri}.
:::
