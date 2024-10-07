<div id="loadsqldjdbc" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.63. How Can I execute load of sql dump from jdbc?

</div>

</div>

</div>

LOAD" is not a Virtuoso SQL command, it's an ISQL one. The ISQL checks
the command to be executed, whether it's of special "isql"-ish syntax or
not, it executes commands it understand and send the rest to the server,
unchanged.

There's no way to mimic ISQL's behavior right on the server, without
ISQL. However some files can be loaded via the
<a href="fn_vad_load_sql_file.html" class="link"
title="VAD_LOAD_SQL_FILE"><code
class="function">DB.DBA.VAD_LOAD_SQL_FILE</code></a> function.

</div>
