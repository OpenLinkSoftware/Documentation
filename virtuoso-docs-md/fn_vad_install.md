<div id="fn_vad_install" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

VAD_INSTALL — Invoke VAD installation process

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vad_install" class="funcsynopsis">

|                                         |                                |
|-----------------------------------------|--------------------------------|
| `varchar DB.DBA. `**`VAD_INSTALL`**` (` | in `package_uri ` varchar ,    |
|                                         | in `source_type ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_55" class="refsect1">

## Description

Invoke the install operation from interactive SQL or from the web user
interface. This will:

<div class="itemizedlist">

- enter into atomic mode

- Check for version and prerequisite package compatibility

- Run the pre-install SQL script

- Load all SQL code and other resources in the order given by the
  developer

- Run any post install SQL code

- If DB.DBA.VAD_INSTALL() succeeded the server comes back on-line.

</div>

If there was a failure in mid-install, such as running out of disk or
some other serious unrecoverable database error, the server exits. The
installation can be undone manually by halting the server, deleting the
transaction log file and restarting. The server will start from the
checkpoint as if the installation was never attempted.

</div>

<div id="params_21" class="refsect1">

## Parameters

<div id="id117639" class="refsect2">

### package_uri

URI of VAD file

</div>

<div id="id117642" class="refsect2">

### source_type

The second parameter to VAD_INSTALL controls whether the given path to
the package is taken as a filesystem path or a DAV path. Value of 1
means the path is interpreted as a DAV path. The default value is 0
which means the VAD package is read from filesystem path.

</div>

</div>

<div id="seealso_27" class="refsect1">

## See Also

<a href="fn_vad_check_uninstallability.html" class="link"
title="VAD_CHECK_UNINSTALLABILITY"><code
class="function">vad_check_uninstallability() </code></a>

<a href="fn_vad_check_installability.html" class="link"
title="VAD_CHECK_INSTALLABILITY"><code
class="function">vad_check_installability() </code></a>

<a href="fn_vad_fail_check.html" class="link"
title="VAD_FAIL_CHECK"><code
class="function">vad_fail_check() </code></a>

<a href="fn_vad_pack.html" class="link" title="VAD_PACK"><code
class="function">vad_pack() </code></a>

<a href="fn_vad_safe_exec.html" class="link" title="VAD_SAFE_EXEC"><code
class="function">vad_safe_exec() </code></a>

<a href="fn_vad_uninstall.html" class="link" title="VAD_UNINSTALL"><code
class="function">vad_uninstall() </code></a>

<a href="fn_vad_load_file.html" class="link" title="VAD_LOAD_FILE"><code
class="function">vad_load_file() </code></a>

<a href="fn_vad_check.html" class="link" title="VAD_CHECK"><code
class="function">vad_check() </code></a>

</div>

</div>
