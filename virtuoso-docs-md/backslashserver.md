<div id="backslashserver" class="section">

<div class="titlepage">

<div>

<div>

### 11.17.3. Server Default

</div>

</div>

</div>

SQL_NO_CHAR_C_ESCAPE=0/1 can be set in the "Client" section of the
virtuoso.ini file to set the connection default backslash handling
behavior. The default value is 0.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                          |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                     |
|                              | When a 'create procedure' is executed and that mode is "ON" the procedure is stored in such a way that it will preserve the setting for it's text no matter what the current default is. |

</div>

</div>
