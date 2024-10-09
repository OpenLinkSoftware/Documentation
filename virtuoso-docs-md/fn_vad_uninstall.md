<div>

<div>

</div>

<div>

## Name

VAD_UNINSTALL — Vad package uninstallation

</div>

<div>

## Synopsis

<div>

|                                           |                                 |
|-------------------------------------------|---------------------------------|
| `varchar DB.DBA. `**`VAD_UNINSTALL`**` (` | in `package_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Invokes the uninstall operation from interactive SQL or from the web
user interface. This will:

<div>

- enter into atomic mode

- Check if no other package is using the subject of uninstall

- Run the pre-uninstall SQL script

- Run any post-uninstall SQL code

- Remove all VSP and XSLT and other web resources from their designated
  place in DAV or the Virtuoso Web root where permitted.

- If DB.DBA.VAD_UNINSTALL() succeeded the server comes back on-line. If
  there was a failure in mid-uninstall, such as running out of disk or
  some other serious unrecoverable database error, the server exits. The
  failed uninstallation can be undone manually. As usual, halting the
  server, deleting the transaction log file and restarting will force
  the server to start from the checkpoint as if the uninstallation was
  never attempted.

</div>

</div>

<div>

## Parameters

<div>

### package_name

name of package '/' version e.g: 'virtodp/1.0'

</div>

</div>

<div>

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

<a href="fn_vad_install.html" class="link" title="VAD_INSTALL"><code
class="function">vad_install() </code></a>

<a href="fn_vad_safe_exec.html" class="link" title="VAD_SAFE_EXEC"><code
class="function">vad_safe_exec() </code></a>

<a href="fn_vad_pack.html" class="link" title="VAD_PACK"><code
class="function">vad_pack() </code></a>

<a href="fn_vad_load_file.html" class="link" title="VAD_LOAD_FILE"><code
class="function">vad_load_file() </code></a>

<a href="fn_vad_check.html" class="link" title="VAD_CHECK"><code
class="function">vad_check() </code></a>

</div>

</div>
