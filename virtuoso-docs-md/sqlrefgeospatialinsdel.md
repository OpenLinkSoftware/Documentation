<div>

<div>

<div>

<div>

### 9.34.7. Insert and Delete

</div>

</div>

</div>

``` programlisting
geo_insert (in tb any, in geo any, in id int);
geo_delete (in tb any, in geo any, in id int);
```

These functions insert and delete a geometry from an R tree index. The
tb must be a fully qualified name of an R tree table.

These functions will typically be used from triggers on a geometry
column. The functions are transactional and make a transaction log
record of the action.

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
href="fn_geo_insert.html" class="link" title="geo_insert"><code
class="function">geo_insert</code></a></p>
<p><a href="fn_geo_delete.html" class="link" title="geo_delete"><code
class="function">geo_delete</code></a></p></td>
</tr>
</tbody>
</table>

</div>

</div>
