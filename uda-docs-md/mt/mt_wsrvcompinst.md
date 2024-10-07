<div id="mt_wsrvcompinst" class="section">

<div class="titlepage">

<div>

<div>

## 6.4. Windows 95/98/NT/XP/2000 Install

</div>

</div>

</div>

<div class="orderedlist">

1.  Ensure you have downloaded all of the relevant OpenLink Server
    Components from OpenLink Software Download wizard.

2.  From the OpenLink email that is delivered at the time of download,
    save the attached license file to a temporary location.

3.  Ensure all existing OpenLink server and client applications are
    shutdown.

4.  Close the Services Control Panel Applet to avoid any locking of
    existing OpenLink services.

5.  Run setup.exe, please note that the client and server components for
    Windows are packaged within the same installation archive. You
    distinguish the actual components that you want to install as part
    of your interaction with the installation program.

    <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

    |                              |                                                                                                                                                                                                |
    |:----------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | ![\[Note\]](images/note.png) | Caution:                                                                                                                                                                                       |
    |                              | please do not choose SPX/IPX protocol support during the installation process unless you have verified that this protocol is actually installed and configured on your Windows Server machine. |

    </div>

6.  Once the installer has completed, the broker will be running and
    ready for use, assuming a valid license was supplied.

</div>

If the OpenLink Broker does not respond to client requests, or there was
a Broker creation error during the install, then you can verify its
operation as follows:

<div class="orderedlist">

1.  Start your OpenLink Request Broker in debug mode, from within your
    "services" control panel, or by opening up a DOS command window and
    then executing the OpenLink Request Broker startup command from
    within the "bin" sub-directory of the OpenLink server components
    installation directory:

    ``` programlisting
    oplrqb -dv
    ```

    Note: When doing this from the "services" control panel (Windows NT)
    you must stop the Broker if it is already running and then change
    its startup mode from "Automatic" to "Manual", then enter the
    required startup commands as values in the Startup Parameters field,
    the screen shot below demonstrates this:

    <div class="figure-float">

    <div id="mt_srvcinstf2" class="figure">

    **Figure 6.3. 3image2.gif**

    <div class="figure-contents">

    <div class="mediaobject">

    ![3image2.gif](images/3image2.gif)

    </div>

    </div>

    </div>

      

    </div>

    Selecting the service clicking the
    <span class="emphasis">*Startup*</span> button will give the
    following screen:

    <div class="figure-float">

    <div id="mt_srvcinstf3" class="figure">

    **Figure 6.4. 3image3.gif**

    <div class="figure-contents">

    <div class="mediaobject">

    ![3image3.gif](images/3image3.gif)

    </div>

    </div>

    </div>

      

    </div>

2.  Start your Web Browser and then enter the following URL:
    http://\<network alias of machine on to which you have just
    installed server components\>:\<port number you provided when
    prompted by OpenLink installer\>. For example, if your machine has a
    network alias of "mainserver" and you accept the default port number
    at installation time, then the required URL would be constructed as
    follows: <span class="emphasis">*http://mainserver:8000/*</span> you
    can also enter the value
    <span class="emphasis">*http://localhost:8000/*</span> if the server
    in use is local rather than remote.

3.  Follow the instructions provided in the "Making Your First OpenLink
    Connection" guide in order to verify your server components
    installation.

4.  If the previous step is successful, shutdown the Request Broker by
    pressing: <span class="emphasis">*\<CTRL-C\>*</span> in the debug
    session window, or by selecting the OpenLink Request Broker entry
    within the "services" control panel and then clicking on the "stop"
    button.

    You can also shutdown the Broker by executing the following command
    from a separate DOS command Window:

    ``` programlisting
    oplshut -f
    ```

5.  Revert the OpenLink Request Broker startup mode back to "Automatic"
    from within the "Services" control panel and then restart by
    clicking on the "Startup" button. Note the Broker does not have to
    be in "Automatic" mode for regular use, it is your choice as to the
    startup mode that best suits your operational needs.

    You can also start the Broker from a DOS Window by executing the
    command:

    ``` programlisting
    oplrqb -v
    ```

</div>

</div>
