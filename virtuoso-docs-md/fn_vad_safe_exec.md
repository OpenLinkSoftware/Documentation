<div id="fn_vad_safe_exec" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

VAD_SAFE_EXEC — execute without signalling errors

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vad_safe_exec" class="funcsynopsis">

|                                   |                         |
|-----------------------------------|-------------------------|
| `DB.DBA. `**`VAD_SAFE_EXEC`**` (` | in `expr ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_59" class="refsect1">

## Description

Safe way to do something without generating an exception, e.g.: when it
is necessary to drop a table without insurance of it's existence.

</div>

<div id="params_25" class="refsect1">

## Parameters

<div id="id117871" class="refsect2">

### expr

text of expression

</div>

</div>

<div id="seealso_31" class="refsect1">

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

<a href="fn_vad_install.html" class="link" title="VAD_INSTALL"><code
class="function">vad_install() </code></a>

<a href="fn_vad_uninstall.html" class="link" title="VAD_UNINSTALL"><code
class="function">vad_uninstall() </code></a>

<a href="fn_vad_load_file.html" class="link" title="VAD_LOAD_FILE"><code
class="function">vad_load_file() </code></a>

<a href="fn_vad_check.html" class="link" title="VAD_CHECK"><code
class="function">vad_check() </code></a>

</div>

</div>
