<div id="fn_vad_load_sql_file" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

VAD_LOAD_SQL_FILE — Loads SQL file and executes its content's
statements.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vad_load_sql_file" class="funcsynopsis">

|                                       |                               |
|---------------------------------------|-------------------------------|
| `DB.DBA. `**`VAD_LOAD_SQL_FILE`**` (` | in `sql_file_name ` varchar , |
|                                       | in `grouping ` integer ,      |
|                                       | in `report_errors ` varchar , |
|                                       | in `is_dav ` integer `)`;     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_57" class="refsect1">

## Description

Loads SQL file ( can be regular file or DAV resource ) and then splits
its content into single statements and executes them one by one. Along
the process, the function makes needed reports and changes
'VAD_errcount' registry variable.

</div>

<div id="params_23" class="refsect1">

## Parameters

<div id="id117747" class="refsect2">

### sql_file_name

For files, this parameter is either absolute or relative to server's
working directory. The directory should be readable according to the
virtuoso.ini settings. For DAV resources, the sql_file_name is always
absolute: ('/DAV/\<folder-name\>...').

</div>

<div id="id117750" class="refsect2">

### grouping

Always set this parameter to 1.

</div>

<div id="id117753" class="refsect2">

### report_errors

The supported values for this parameter are:

<div class="itemizedlist">

- <span class="emphasis">*'report'* </span> - to log errors and continue
  or:

- <span class="emphasis">*'signal'* </span> - at the very first error,
  break the loading and resignal it.

</div>

</div>

<div id="id117763" class="refsect2">

### is_dav

This parameter is 0 for plain file and 1 for resource loaded in DAV.

</div>

</div>

<div id="examples_vad_load_sql_file" class="refsect1">

## Examples

<div id="ex_vad_load_sql_file_1" class="example">

**Example 24.437. Simple Use**

<div class="example-contents">

``` programlisting
DB.DBA.VAD_LOAD_SQL_FILE ('./conductor/vdir_helper.sql', 1, 'report', 0);
```

</div>

</div>

  

</div>

<div id="seealso_29" class="refsect1">

## See Also

<a href="fn_vad_load_file.html" class="link"
title="VAD_LOAD_FILE">vad_load_file()</a>

<a href="fn_vad_check_uninstallability.html" class="link"
title="VAD_CHECK_UNINSTALLABILITY">vad_check_uninstallability()</a>

<a href="fn_vad_check_installability.html" class="link"
title="VAD_CHECK_INSTALLABILITY">vad_check_installability()</a>

<a href="fn_vad_install.html" class="link"
title="VAD_INSTALL">vad_install()</a>

<a href="fn_vad_pack.html" class="link" title="VAD_PACK">vad_pack()</a>

<a href="fn_vad_safe_exec.html" class="link"
title="VAD_SAFE_EXEC">vad_safe_exec()</a>

<a href="fn_vad_uninstall.html" class="link"
title="VAD_UNINSTALL">vad_uninstall()</a>

<a href="fn_vad_fail_check.html" class="link"
title="VAD_FAIL_CHECK">vad_fail_check()</a>

<a href="fn_vad_check.html" class="link"
title="VAD_CHECK">vad_check()</a>

</div>

</div>
