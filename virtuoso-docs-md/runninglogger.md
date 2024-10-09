<div>

<div>

<div>

<div>

### 13.6.3. Running the Sample

</div>

</div>

</div>

The logger directory contains various scripts for starting and stopping
servers etc.

<span class="emphasis">*log_init.sh*</span> - Creates the databases with
tables and procedures loaded in the l1, l2, l3 and l4 subdirectories.

<span class="emphasis">*log_start.sh*</span> - starts the 4 servers and
leaves them running in the background.

<span class="emphasis">*log_shut.sh*</span> - Shuts down the 4 test
servers.

<span class="emphasis">*hits.sh*</span> \<hist-per-hour\> \<no-of-hits\>

Starts the hits program on each of the 4 servers. The first command line
argument gives the test transaction rate for each client and the next
gives the duration as a transaction count.

``` screen
hits <dsn> <uid> <pwd> <hits-per-hour> <no-of-hits>
```

The hits executable repeatedly calls wl_hit with random arguments and
collects statistics on call times. If calls complete at a rate faster
than the requested rate this periodically sleeps to keep the rate close
to the requested rate. It prints statistics every 1000 hits.

</div>
