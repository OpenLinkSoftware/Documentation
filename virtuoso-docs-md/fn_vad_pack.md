<div>

<div>

</div>

<div>

## Name

VAD_PACK — get VAD resource

</div>

<div>

## Synopsis

<div>

|                                      |                                       |
|--------------------------------------|---------------------------------------|
| `varchar DB.DBA. `**`VAD_PACK`**` (` | in `sticker_uri ` varchar ,           |
|                                      | in `base_uri_of_resources ` varchar , |
|                                      | in `package_uri ` varchar `)`;        |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function gets the resource identified by the sticker_uri, which
contains the vad:package root element. The URIs present there are
interpreted in the context of the base_uri_of_resources and the
individual resources are fetched. These are parsed to make sure that
they are syntactically correct and the resources are appended to the
generated package resource, which is stored into the result_uri.
vad_pack() returns a human-readable log of error and warning messages,
vad_pack() will signal errors if some resources or database objects will
be unavailable. By convention, VAD package files have the extension
'.vad'.

</div>

<div>

## Parameters

<div>

### sticker_url

stickers file URI

</div>

<div>

### base_uri_of_resources

inlined resources root

</div>

<div>

### package_uri

path of output VAD file

</div>

</div>

<div>

## Return Types

vad_pack() returns a human-readable log of error and warning messages,
vad_pack() will signal errors if some resources or database objects will
be unavailable.

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

<a href="fn_vad_uninstall.html" class="link" title="VAD_UNINSTALL"><code
class="function">vad_uninstall() </code></a>

<a href="fn_vad_load_file.html" class="link" title="VAD_LOAD_FILE"><code
class="function">vad_load_file() </code></a>

<a href="fn_vad_check.html" class="link" title="VAD_CHECK"><code
class="function">vad_check() </code></a>

</div>

</div>
