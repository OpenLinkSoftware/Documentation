<div id="fn_tidy_list_errors" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

tidy_list_errors — Invoke built-in version of HTML Tidy utility to get
list of errors in given input HTML text

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_tidy_list_errors" class="funcsynopsis">

|                               |                                |
|-------------------------------|--------------------------------|
| ` `**`tidy_list_errors`**` (` | in `raw_html ` varchar ,       |
|                               | in `tidy_config ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_42" class="refsect1">

## Description

This function lists errors in given source HTML text, by invoking some
custom version of HTML Tidy utility. To learn more about Tidy see
<a href="http://www.w3.org/People/Raggett/tidy/" class="ulink"
target="_top">http://www.w3.org/People/Raggett/tidy/</a> .

</div>

<div id="params_14" class="refsect1">

## Parameters

<div id="id113740" class="refsect2">

### raw_html

Source HTML text to validate. Note that the encoding of this text must
be specified in *`tidy_config`* string, and default encoding of session
will not be mentioned by Tidy.

</div>

<div id="id113744" class="refsect2">

### tidy_config

Configuration string, space-delimited list of options, exactly as in
original Tidy's command-line or in Tidy's configuration file. Not all
options of original Tidy will work, due to obvious reasons, unsupported
options will be silently ignored, so you may read your favorite Tidy's
configuration file by file_to_string function and pass it to
tidy_list_errors. For more details, see
<a href="fn_tidy_html.html" class="link" title="tidy_html"><code
class="function">tidy_html</code></a> .

</div>

</div>

<div id="ret_12" class="refsect1">

## Return Types

Text with the list of found errors and warnings, as string of type
varchar.

</div>

<div id="errors_tidy_list_errors" class="refsect1">

## Errors

This function should not signal errors. Unlike
<a href="fn_tidy_html.html" class="link" title="tidy_html"><code
class="function">tidy_html</code></a> , it will log errors into the
resulting string without signalling them.

</div>

<div id="seealso_22" class="refsect1">

## See Also

</div>

</div>
