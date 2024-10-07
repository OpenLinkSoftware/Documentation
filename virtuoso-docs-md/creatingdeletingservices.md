<div id="creatingdeletingservices" class="section">

<div class="titlepage">

<div>

<div>

### 2.2.6. Creating and Deleting Virtuoso Services

</div>

</div>

</div>

At sometime you may need to have multiple Virtuoso server processes
running on your Windows servers or simply need to add or delete existing
Virtuoso servers that have been registered with the "Services" control
panel applet. You do this by executing the following commands:

Adding new Virtuoso Server service: virtuoso-odbc-f +service create -I
\<your chosen service name\>

Deleting an existing Virtuoso service: virtuoso-odbc-f +service delete
-I \<service that you are deleting\>

Starting a new Virtuoso service manually: virtuoso-odbc-f +service start
-I \<service name\>

Showing a list of existing Virtuoso services: virtuoso-odbc-f +service
list

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Note: Note:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Note:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>This functionality is
only available on Windows NT/2000/XP.</p>
<p>Ensure that the services applet from the control panel is closed
while issuing the above commands to prevent locking.</p></td>
</tr>
</tbody>
</table>

</div>

</div>
