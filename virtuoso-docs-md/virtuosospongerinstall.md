<div>

<div>

<div>

<div>

### 16.10.4. Installation Steps

</div>

</div>

</div>

<div>

1.  Download the <a
    href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.3/virtuoso/cartridges_dav.vad"
    class="ulink" target="_top">Cartridges VAD package</a> .

2.  Install the cartridges_dav.vad package by using the Conductor UI or
    by using iSQL:

    ``` programlisting
    SQL> DB.DBA.VAD_INSTALL('tmp/cartridges_dav.vad',0);
    SQL_STATE  SQL_MESSAGE
    VARCHAR  VARCHAR
    _______________________________________________________________________________

    00000    No errors detected
    00000    Installation of "Linked Data Cartridges" is complete.
    00000    Now making a final checkpoint.
    00000    Final checkpoint is made.
    00000    SUCCESS

    6 Rows. -- 1078 msec.
    ```

3.  <a
    href="rdfspongerprogrammerguide.html#virtuosospongercreatecustcartrrgst"
    class="link" title="Registering &amp; Configuring Cartridges">Cartridge
    Configuration</a>

    <div>

    - <a href="virtuosospongerarch.html#virtuosospongercartridgesextr"
      class="link" title="Extractor Cartridges">Extractor Cartridges</a>

    - <a href="virtuosospongerarch.html#virtuosospongercartridgesmeta"
      class="link" title="Meta Cartridges">Meta Cartridges</a>

    </div>

</div>

See Also: <a
href="rdfspongerprogrammerguide.html#virtuosospongerrdfmapperspackage"
class="link" title="Cartridges package content">Cartridges Package
content description.</a>

</div>
