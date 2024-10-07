<div id="chpntset" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.40. How can I handle checkpoint condition?

</div>

</div>

</div>

In general, to control checkpoint in order to bypass client timeouts
during long checkpoints when inserting triples into the Virtuoso server,
one must disable automatic checkpoint by:

``` programlisting
SQL> checkpoint_interval (0);
```

and also to make sure the AutoCheckpointLogSize is off. Then can be
performed checkpoint whenever the client wants using the 'checkpoint'
command.

However the need of cache check is not needed unless instance shows
regular errors. By default the cache check is disabled.

Virtuoso offers a new option in the Virtuoso ini file to enable the
check of page maps: <span class="emphasis">*PageMapCheck*</span> , 1/0
default 0:

``` programlisting
-- Virtuoso.ini

...
[Parameters]
...
PageMapCheck  = 0
...
```

Also customer can add <span class="emphasis">*CheckpointSyncMode =
0*</span> in order to disable sync during checkpoint to speed the
operations.

</div>
