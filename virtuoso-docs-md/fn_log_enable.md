<div>

<div>

</div>

<div>

## Name

log_enable — controls transaction logging and in-statement autocommit

</div>

<div>

## Synopsis

<div>

|                         |                          |
|-------------------------|--------------------------|
| ` `**`log_enable`**` (` | in `bits ` integer ,     |
|                         | in `quiet ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The `log_enable` function allows enabling or disabling regular
transaction logging or autocommit after every changed row. The parameter
*`bits`* is a bitmask.

<div>

### Bit1

Bit1 controls whether the transactions are written to the transaction
log file (virtuoso.trx) or not.

If this bit is 0, then the transaction within this session are not
logged, meaning if the database is not properly shutdown or
checkpointed, the database will revert to the state of the last
checkpoint and all updates are lost.

If this bit is 1 then all committed transactions within this session are
written to the .trx file. If the server is not shutdown properly, the
transaction log will be replayed on the next startup thus ensuring the
modifications to the database for all committed transactions.

</div>

<div>

### Bit2

Bit2 controls manual or autocommit mode.

If this bit is 0 then the session is in manual commit mode and the user
needs to manually send COMMIT statements to update the database with the
changes made since the previous COMMIT, or ROLLBACK to discard any
changes this session made since the last COMMIT.

If the bit is 1 then the session is in autocommit mode and all updates
to the database are immediately committed and written back.

<div>

**Table 24.52. Significance of bits in bitmask**

<div>

| log_enable | bit2 | bit1 | Description                                       |
|------------|------|------|---------------------------------------------------|
| 1          | 0    | 1    | Manual commit mode, write transaction to log      |
| 2          | 1    | 0    | Autocommit mode, do not write transactions to log |
| 3          | 1    | 1    | Autocommit mode, write transactions to log        |

</div>

</div>

  

<div>

|                            |                                                                                                                                                                                                                                                                                                                                                                                                 |
|:--------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | Performance                                                                                                                                                                                                                                                                                                                                                                                     |
|                            | Note: the fastest way to bulk load data into virtuoso is to use log_enable option 2, which is what is normally used by the rdf_loader_run bulkloader. However, this bypasses the normal ACID workflow of the Virtuoso engine; if the database is not properly checkpointed or shutdown after the data loading has finished, all modifications within that session to the database will be lost. |

</div>

<div>

<table data-border="0" data-summary="Tip: Replication">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">Replication</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>For replication to
work, bit1 should be set to 1 to allow the virtuoso engine to write the
transactions to the trx file as well as the replication log. This means
that either log_enable mode 1 or 3 should be used depending on whether
the application takes are of the commits itself, or relies on the
autocommit mechanism.</p>
<p>When using the bulkloader in combination with replication, the
log_enable flag in the rdf_loader_run should be called like this:</p>
<pre class="programlisting"><code>rdf_loader_run(log_enable =&gt; 3);</code></pre></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>

<div>

## See Also

<a href="fn_log_text.html" class="link" title="log_text"><code
class="function">log_text </code></a>

</div>

</div>
