<div id="fn_vad_fail_check" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

VAD_FAIL_CHECK — Signals package check failure

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vad_fail_check" class="funcsynopsis">

|                                    |                        |
|------------------------------------|------------------------|
| `DB.DBA. `**`VAD_FAIL_CHECK`**` (` | in `msg ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_54" class="refsect1">

## Description

makes "rollback work", exits from atomic mode and fails server with
raw_exit(-1)

</div>

<div id="params_02_01" class="refsect1">

## Parameters

<div id="id117575" class="refsect2">

### msg

text of message

</div>

</div>

<div id="seealso_26" class="refsect1">

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

<a href="fn_vad_load_file.html" class="link" title="VAD_LOAD_FILE"><code
class="function">vad_load_file() </code></a>

<a href="fn_vad_check.html" class="link" title="VAD_CHECK"><code
class="function">vad_check() </code></a>

</div>

</div>
