<div id="mt_oldedbdebug" class="section">

<div class="titlepage">

<div>

<div>

## 5.2. Call Tracing

</div>

</div>

</div>

To turn on call tracing and enable logging to a file, use the Registry
Editor (regedit or regedt32) to enter a fully qualified file name in the
registry entry:

``` programlisting
HKEY_LOCAL_MACHINE\SOFTWARE\OpenLink Software\OpenLink OLE DB Provider\DebugFile
```

To turn off call tracing simply leave this entry blank. A separate log
file is opened for each process which uses the provider. Each file
opened is named using the file base name specified in the DebugFile
entry above with a three digit process ID suffix.

</div>
