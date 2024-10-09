<div>

<div>

<div>

<div>

### 2.2.4. Post Installation

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Post-Installation Sanity Check

</div>

</div>

</div>

A quick way to check that the database is running, is to point a browser
to the http port. The following example URLs will show the System
Manager for the default, and the demo Virtuoso databases:

``` programlisting
http://example.com
http://example.com:8890
```

</div>

<div>

<div>

<div>

<div>

#### Troubleshooting DB Startup Failures

</div>

</div>

</div>

<span class="emphasis">*Install failure*</span>

Check the .log file in your Virtuoso installation db location, for ex:

``` programlisting
    C:\Program Files\OpenLink Software\Virtuoso 7.2\db\virtuoso.log
```

which is for the database and log files etc. in order to review the
installed files binaries and databases (defaults) for issues if install
fails.

<span class="emphasis">*.lck existance*</span>

Check .log in case of .lck issue

Delete the .lck file and repeat the steps from above.

<span class="emphasis">*.trx incompatiblity issue*</span>

Check .log in case of .trx incompatiblity issue

<span class="emphasis">*oplmgr issue*</span>

See <a href="oplmngrdlp.html#oplmngrdlptl" class="link"
title="Troubleshooting License Problems">Troubleshooting License
Problems</a>

</div>

</div>
