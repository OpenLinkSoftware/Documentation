<div>

<div>

</div>

<div>

## Name

tidy_list_errors — Invoke built-in version of HTML Tidy utility to get
list of errors in given input HTML text

</div>

<div>

## Synopsis

<div>

|                               |                                |
|-------------------------------|--------------------------------|
| ` `**`tidy_list_errors`**` (` | in `raw_html ` varchar ,       |
|                               | in `tidy_config ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function lists errors in given source HTML text, by invoking some
custom version of HTML Tidy utility. To learn more about Tidy see
<a href="http://www.w3.org/People/Raggett/tidy/" class="ulink"
target="_top">http://www.w3.org/People/Raggett/tidy/</a> .

</div>

<div>

## Parameters

<div>

### raw_html

Source HTML text to validate. Note that the encoding of this text must
be specified in *`tidy_config`* string, and default encoding of session
will not be mentioned by Tidy.

</div>

<div>

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

<div>

## Return Types

Text with the list of found errors and warnings, as string of type
varchar.

</div>

<div>

## Errors

This function should not signal errors. Unlike
<a href="fn_tidy_html.html" class="link" title="tidy_html"><code
class="function">tidy_html</code></a> , it will log errors into the
resulting string without signalling them.

</div>

<div>

## See Also

</div>

</div>
