<div>

<div>

<div>

<div>

### 1.5.17. How can perform SPARQL Updates without transactional log size getting exceed?

</div>

</div>

</div>

Since SPARUL updates are generally not meant to be transactional, it is
best to run these in:

``` programlisting
SQL> log_enable (2);
```

mode, which commits every operation as it is done. This prevents one
from running out of rollback space. Also for bulk updates, transaction
logging can be turned off. If so, one should do a manual checkpoint
after the operation to ensure persistence across server restart since
there is no roll forward log.

Alternatively, the
"<span class="emphasis">*TransactionAfterImageLimit*</span> " parameter
can be set in the virtuoso.ini config file to a higher value than its
50MB default:

``` programlisting
#virtuoso.ini
...
[Parameters]
...
TransactionAfterImageLimit = N bytes default 50000000
...
```

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="rdfperfsparul.html" class="link"
title="16.17.13. Using SPARUL">Using SPARUL</a></p>
<p><a href="ch-server.html#ini_parameters" class="link"
title="[Parameters]">Virtuoso INI Parameters</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>
