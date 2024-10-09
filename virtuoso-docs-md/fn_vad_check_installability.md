<div>

<div>

</div>

<div>

## Name

VAD_CHECK_INSTALLABILITY — Checks the presence and correct versions of
required packages and of the Virtuoso platform

</div>

<div>

## Synopsis

<div>

|                                                      |                                |
|------------------------------------------------------|--------------------------------|
| `varchar DB.DBA. `**`VAD_CHECK_INSTALLABILITY`**` (` | in `package_uri ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Checks the presence and correct versions of required packages and of the
Virtuoso platform. It does not execute any pre-install Virtuoso/PL code
from the package, so there is no guarantee that installation will be
successful if the check found no error.

</div>

<div>

## Parameters

<div>

### package_uri

URI of VAD file

</div>

</div>

<div>

## See Also

<a href="fn_vad_check_uninstallability.html" class="link"
title="VAD_CHECK_UNINSTALLABILITY"><code
class="function">vad_check_uninstallability() </code></a>

<a href="fn_vad_fail_check.html" class="link"
title="VAD_FAIL_CHECK"><code
class="function">vad_fail_check() </code></a>

<a href="fn_vad_install.html" class="link" title="VAD_INSTALL"><code
class="function">vad_install() </code></a>

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
