<div>

<div>

</div>

<div>

## Name

VAD_CHECK — Checks the package has not been altered since installation

</div>

<div>

## Synopsis

<div>

|                                     |                                 |
|-------------------------------------|---------------------------------|
| `array DB.DBA. `**`VAD_CHECK`**` (` | in `package_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This checks to see if the elements of the package are as they are
defined in the original distribution. A list of differing elements is
returned. This does not always indicate a corruption since a later
version or another package may add columns to tables, and some resources
may be customized after installation.

</div>

<div>

## Parameters

<div>

### package_name

name of package '/' version e.g: 'virtodp/1.0'

</div>

</div>

<div>

## Return Types

A list of differing elements is returned as an array of 3-item
structures: key, initial value, final value.

</div>

<div>

## See Also

<a href="fn_vad_check_uninstallability.html" class="link"
title="VAD_CHECK_UNINSTALLABILITY"><code
class="function">vad_check_uninstallability() </code></a>

<a href="fn_vad_check_installability.html" class="link"
title="VAD_CHECK_INSTALLABILITY"><code
class="function">vad_check_installability() </code></a>

<a href="fn_vad_install.html" class="link" title="VAD_INSTALL"><code
class="function">vad_install() </code></a>

<a href="fn_vad_pack.html" class="link" title="VAD_PACK"><code
class="function">vad_pack() </code></a>

<a href="fn_vad_safe_exec.html" class="link" title="VAD_SAFE_EXEC"><code
class="function">vad_safe_exec() </code></a>

<a href="fn_vad_uninstall.html" class="link" title="VAD_UNINSTALL"><code
class="function">vad_uninstall() </code></a>

<a href="fn_vad_fail_check.html" class="link"
title="VAD_FAIL_CHECK"><code
class="function">vad_fail_check() </code></a>

<a href="fn_vad_load_file.html" class="link" title="VAD_LOAD_FILE"><code
class="function">vad_load_file() </code></a>

</div>

</div>
