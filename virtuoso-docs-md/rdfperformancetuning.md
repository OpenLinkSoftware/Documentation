<div id="rdfperformancetuning" class="section">

<div class="titlepage">

<div>

<div>

## 16.17. RDF Performance Tuning

</div>

</div>

</div>

For RDF query performance, we have the following possible questions:

<div class="itemizedlist">

- Is the Virtuoso process properly configured to handle big data sets?

- Is the graph always specified?

- Are public web service endpoints protected against bad queries?

- Are there patterns where only a predicate is given?

- Is there a bad query plan because of cost model error?

</div>

<div id="rdfperfgeneral" class="section">

<div class="titlepage">

<div>

<div>

### 16.17.1. General

</div>

</div>

</div>

When running with large data sets, one should configure the Virtuoso
process to use between 2/3 to 3/5 of system RAM and to stripe storage on
all available disks. See <a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">NumberOfBuffers</a> ,
<a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">MaxDirtyBuffers</a> , and
<a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">Striping</a> INI file parameters.

``` programlisting
; default installation
NumberOfBuffers          = 2000
MaxDirtyBuffers          = 1200
```

Typical sizes for the <a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">NumberOfBuffers</a> and
<a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">MaxDirtyBuffers</a> (3/4 of
NumberOfBuffers) parameters in the Virtuoso configuration file
(virtuoso.ini) for various memory sizes are as follows, with each buffer
consisting of 8K bytes:

<div id="id57906" class="table">

**Table 16.19. recommended NumberOfBUffers and MaxDirtyBuffers**

<div class="table-contents">

| System RAM | NumberOfBuffers | MaxDirtyBuffers |
|------------|-----------------|-----------------|
| 2 GB       | 170000          | 130000          |
| 4 GB       | 340000          | 250000          |
| 8 GB       | 680000          | 500000          |
| 16 GB      | 1360000         | 1000000         |
| 32 GB      | 2720000         | 2000000         |
| 48 GB      | 4000000         | 3000000         |
| 64 GB      | 5450000         | 4000000         |

</div>

</div>

  

Also, if running with a large database, setting
<a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">MaxCheckpointRemap</a> to 1/4th of
the database size is recommended. This is in pages, 8K per page.

</div>

</div>
