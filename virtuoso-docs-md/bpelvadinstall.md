<div id="bpelvadinstall" class="section">

<div class="titlepage">

<div>

<div>

### 17.15.15. BPEL4WS VAD Package installation

</div>

</div>

</div>

<div id="bpelvadinstall_conductor" class="section">

<div class="titlepage">

<div>

<div>

#### Using Conductor

</div>

</div>

</div>

<div class="itemizedlist">

- Step 1. Download BPEL4WS VAD and copy it to a local directory.

- Step 2. Go to Conductor UI: http://host:port/conductor/

- Step 3. Login into the Virtuoso Conductor using the admin account.

- Step 4. Select Systems Admin-\>Packages Tab.

- Step 5. Under the Install Packaged, section of the UI is a list of VAD
  packages. If this is the first time you have installed a VAD package
  you will only see the Virtuoso Conductor. Directly under this list is
  the option Install a Package. You can either enter or browse to the
  location of the directory of the BPEL4WS package or enter a DAV
  location.

- Step 6. Once you have provided the location, select Proceed to upload
  the package.

</div>

</div>

<div id="bpelvadinstall_isql" class="section">

<div class="titlepage">

<div>

<div>

#### Using ISQL

</div>

</div>

</div>

``` programlisting
       SQL>VAD_INSTALL('bpel4ws.vad',0);
        SQL_STATE  SQL_MESSAGE
        VARCHAR  VARCHAR
        _______________________________________________________________________________

        00000    GUI is accessible via http://host:port/BPELGUI
        00000    Quick Start is available from http://host:port/BPELGUI/start.vsp
        00000    No errors detected, installation complete.
        00000    Now making a final checkpoint.
        00000    Final checkpoint is made.
        00000    SUCCESS

        7 Rows. -- 5438 msec.
       
```

</div>

</div>
