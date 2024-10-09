<div>

<div>

<div>

<div>

### 2.2.3. Installation Steps

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Prepare to Install

</div>

</div>

</div>

If you are upgrading an existing Virtuoso installation and want to
preserve your existing data and configuration files:

<div>

1.  Shut down your Virtuoso instance as normal.

2.  Right-click on the existing `Virtuoso.app` (exact name may vary),
    and select `Show Package Contents` .

3.  Drill down to `Contents` -\< `virtuoso` -\< `database` .

4.  Check the size of the `virtuoso.trx` file, found in the `database`
    folder alongside the `virtuoso.db` and `virtuoso.ini` files.

    <div>

    - If zero bytes, proceed to step 6.

    - If larger than zero bytes, start the instance from the command
      line with the extra argument, "
      <a href="ch-server.html#commandline" class="link"
      title="Server Startup Command Line Options">+checkpoint-only</a>
      ", and recheck `.trx` file size -- expecting zero bytes.

    - If larger `.trx` files persist,
      <a href="http://support.openlinksw.com/support/online-support.vsp"
      class="ulink" target="_top">contact Technical Support</a> .

    </div>

5.  Make a backup of your existing Virtuoso Database and Configuration
    files (defaults are `virtuoso.db` and `virtuoso.ini` ) prior to
    performing the steps that follow.
    <span class="emphasis">*Note*</span> : Virtuoso's
    <a href="ch-server.html#onlinebackups" class="link"
    title="On-Line Backups">online backup feature</a> , if enabled,
    should have already generated a backup-set.

6.  Use the Add/Remove Programs utility to uninstall any previously
    installed Virtuoso components. Data and configuration files will be
    left behind by this process.

</div>

</div>

<div>

<div>

<div>

<div>

#### Download the Virtuoso Installer Program

</div>

</div>

</div>

<div>

1.  Download the <a
    href="http://opldownload.s3.amazonaws.com/uda%2Fvirtuoso%2F7.2%2Fx86_64-generic-win-64%2Fwavpz2zz.msi#this"
    class="ulink" target="_top">Virtuoso 7.2 installer archive
    (wavpz2zz.msi)</a> from the
    <a href="http://virtuoso.openlinksw.com/download/" class="ulink"
    target="_top">download site</a> .

    <span class="emphasis">*Note*</span>

    : Virtuoso 7.x is 64-bit only, and requires Vista or Windows Server
    2003, or later.

</div>

</div>

<div>

<div>

<div>

<div>

#### Obtain a License File

</div>

</div>

</div>

<div>

1.  If you haven't already obtained a suitable Virtuoso 7.x license
    file, return to the
    <a href="http://virtuoso.openlinksw.com/download/" class="ulink"
    target="_top">download site</a> , and click the link for
    <span class="emphasis">*Free Eval License*</span> (15 day duration,
    requires only your email address) or <span class="emphasis">*Free
    Pilot License*</span> (30 day duration, requires some additional
    personal and business information).

    <div>

    <div>

    **Figure 2.1. Installing the Virtuoso Universal Server on Windows --
    Obtain a License File**

    <div>

    <div>

    ![Installing the Virtuoso Universal Server on Windows -- Obtain a
    License File](images/ui/win_obtain_license.jpg)

    </div>

    </div>

    </div>

      

    </div>

2.  Fill out the relevant form, and download the license file when
    presented.

    <span class="emphasis">*Note*</span>

    : the file must be named `virtuoso.lic` for use. Some browsers may
    rename the file during download; you can simply rename the file on
    your machine.

</div>

</div>

<div>

<div>

<div>

<div>

#### Run the Virtuoso Installer

</div>

</div>

</div>

<div>

1.  Double-click the installer archive, `wavpz2zz.msi` , to start the
    process with the Installer Program Introduction.

    <div>

    <div>

    **Figure 2.2. Installing the Virtuoso Universal Server on Windows --
    Run the Virtuoso Installer**

    <div>

    <div>

    ![Installing the Virtuoso Universal Server on Windows -- Run the
    Virtuoso Installer](images/ui/win_installer_program.jpg)

    </div>

    </div>

    </div>

      

    </div>

2.  Click

    <span class="emphasis">*Next*</span>

    , and you'll be presented with the License Agreement:

    <div>

    <div>

    **Figure 2.3. Installing the Virtuoso Universal Server on Windows --
    License Agreement**

    <div>

    <div>

    ![Installing the Virtuoso Universal Server on Windows -- License
    Agreement](images/ui/win_license_agreement.jpg)

    </div>

    </div>

    </div>

      

    </div>

3.  Tick the box for

    <span class="emphasis">*I accept*</span>

    , and click

    <span class="emphasis">*Next*</span>

    . You'll be asked to locate your license file:

    <div>

    <div>

    **Figure 2.4. Installing the Virtuoso Universal Server on Windows --
    License Agreement Accept**

    <div>

    <div>

    ![Installing the Virtuoso Universal Server on Windows -- License
    Agreement Accept](images/ui/win_install_folder.jpg)

    </div>

    </div>

    </div>

      

    </div>

4.  Use the

    <span class="emphasis">*Browse*</span>

    button to locate the license file you obtained earlier, or click the

    <span class="emphasis">*Try and Buy*</span>

    button to obtain a new one now, or tick the box for

    <span class="emphasis">*I don't want to install a license file
    now*</span>

    . Then, click

    <span class="emphasis">*Next*</span>

    . You'll be prompted to select an Installation Type:

    <div>

    <div>

    **Figure 2.5. Installing the Virtuoso Universal Server on Windows --
    Choose Installation Type**

    <div>

    <div>

    ![Installing the Virtuoso Universal Server on Windows -- Choose
    Installation Type](images/ui/win_install_type.jpg)

    </div>

    </div>

    </div>

      

    </div>

5.  Select the desired option:

    <div>

    - <span class="emphasis">*Typical* </span>

      -- installs to the default filesystem location, may not include
      all components

    - <span class="emphasis">*Complete* </span>

      -- installs to the default filesystem location, includes all
      components

    - <span class="emphasis">*Custom* </span>

      -- to install to any filesystem location, and select which
      components will be installed

    </div>

6.  Click

    <span class="emphasis">*Next*</span>

    , and if you chose

    <span class="emphasis">*Typical*</span>

    or

    <span class="emphasis">*Complete*</span>

    , skip this and the next step; if you chose

    <span class="emphasis"></span>

    Custom, you'll be prompted to choose a destination folder:

    <div>

    <div>

    **Figure 2.6. Installing the Virtuoso Universal Server on Windows --
    Choose Destination Folder**

    <div>

    <div>

    ![Installing the Virtuoso Universal Server on Windows -- Choose
    Destination Folder](images/ui/win_destination_folder.jpg)

    </div>

    </div>

    </div>

      

    </div>

7.  Click

    <span class="emphasis">*Next*</span>

    , and if you chose

    <span class="emphasis">*Custom*</span>

    , you'll be prompted for Feature Selection:

    <div>

    <div>

    **Figure 2.7. Installing the Virtuoso Universal Server on Windows --
    Feature Selection**

    <div>

    <div>

    ![Installing the Virtuoso Universal Server on Windows -- Feature
    Selection](images/ui/win_feature_selection.jpg.)

    </div>

    </div>

    </div>

      

    </div>

8.  Click

    <span class="emphasis">*Next*</span>

    , and the installer will indicate it's ready to begin:

    <div>

    <div>

    **Figure 2.8. Installing the Virtuoso Universal Server on Windows --
    Read to install**

    <div>

    <div>

    ![Installing the Virtuoso Universal Server on Windows -- Read to
    install](images/ui/win_file_copystart.jpg)

    </div>

    </div>

    </div>

      

    </div>

9.  Click install, and wait for notification of completion.

</div>

</div>

<div>

<div>

<div>

<div>

#### Start the Virtuoso Service Manager, and Locate it in the Task Bar

</div>

</div>

</div>

<div>

1.  Launch the Virtuoso Service Manager from your

    <span class="emphasis">*Start*</span>

    menu.

    <div>

    <div>

    **Figure 2.9. Installing the Virtuoso Universal Server on Windows --
    Launch the Virtuoso Service Manager.**

    <div>

    <div>

    ![Installing the Virtuoso Universal Server on Windows -- Launch the
    Virtuoso Service Manager.](images/ui/win_locate_manager.jpg)

    </div>

    </div>

    </div>

      

    </div>

2.  Look for an icon to appear in the Task Bar at the bottom right of
    your screen.

    <div>

    <div>

    **Figure 2.10. Installing the Virtuoso Universal Server on Windows
    -- Look for an icon**

    <div>

    <div>

    ![Installing the Virtuoso Universal Server on Windows -- Look for an
    icon](images/win_launch_manager.jpg)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Start and Administer your Virtuoso Instance

</div>

</div>

</div>

<div>

1.  Right-click on the Virtuoso Service Manager icon in the Task Bar,
    and click on

    <span class="emphasis">*OpenLink Virtuoso Server - Start*</span>

    :

    <div>

    <div>

    **Figure 2.11. Installing the Virtuoso Universal Server on Windows
    -- Start your Virtuoso Instance**

    <div>

    <div>

    ![Installing the Virtuoso Universal Server on Windows -- Start your
    Virtuoso Instance](images/win_start_service.jpg)

    </div>

    </div>

    </div>

      

    </div>

2.  Open the

    <span class="emphasis">*Virtuoso Conductor*</span>

    , Virtuoso's HTTP-based administration tool, by loading this URL in
    your Web Browser:
    <a href="http://example.com/conductor" class="ulink"
    target="_top">http://example.com/conductor</a> .

    <div>

    <div>

    **Figure 2.12. Installing the Virtuoso Universal Server on Windows
    -- Virtuoso Conductor**

    <div>

    <div>

    ![Installing the Virtuoso Universal Server on Windows -- Virtuoso
    Conductor](images/win_virt_admin.jpg)

    </div>

    </div>

    </div>

      

    </div>

3.  Use the Conductor to configure your Virtuoso instance for future
    use. For example, it is

    <span class="emphasis">*strongly*</span>

    advised that you change the default passwords for the

    <span class="emphasis">*dba*</span>

    and

    <span class="emphasis">*dav*</span>

    super-user accounts (drill down to

    <span class="emphasis">*System Admin*</span>

    -\<

    <span class="emphasis">*User Accounts*</span>

    ).

</div>

</div>

<div>

<div>

<div>

<div>

#### Optional - Restore your old Data and Configuration Files

</div>

</div>

</div>

If you preserved existing data and configuration files at the start of
this process, now is the time to bring them back into play.

<div>

1.  If you used Virtuoso's online backup feature,
    <a href="ch-server.html#onlinebackups" class="link"
    title="On-Line Backups">the documentation</a> will walk you through
    the restoration process.

2.  If you simply copied the INI and DB files elsewhere, and if they
    were Virtuoso 7.x files, you can just stop the current Virtuoso
    instance, and replace the newly created INI and DB with the old
    ones. For best results, we do advise that you compare the content of
    the old INI with the new, and add any new settings from the new to
    the old, adjust as may be appropriate to your deployment.

3.  If you simply copied the INI and DB files elsewhere, and if they
    were Virtuoso 6.x or older files, there are some extra steps that
    must be taken.

</div>

</div>

</div>
