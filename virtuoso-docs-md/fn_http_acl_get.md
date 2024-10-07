<div id="fn_http_acl_get" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_acl_get — Test conditions against web server ACL's

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_acl_get" class="funcsynopsis">

|                                  |                                        |
|----------------------------------|----------------------------------------|
| `integer `**`http_acl_get`**` (` | in `list_name ` varchar ,              |
|                                  | in `source_ip ` varchar ,              |
|                                  | in `destination_ip_or_host ` varchar , |
|                                  | in `object_id ` integer ,              |
|                                  | in `read_write_flag ` integer `)`;     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_acl_get" class="refsect1">

## Description

This function can be used within application logic to test that an
internet client would not violate the ACL.

</div>

<div id="params_http_acl_get" class="refsect1">

## Parameters

<div id="id92002" class="refsect2">

### list_name

a string designating which list to be used for matching

</div>

<div id="id92005" class="refsect2">

### source_ip

a string containing the IP number of client to test against rules

</div>

<div id="id92008" class="refsect2">

### destination_ip_or_host

a string containing the IP number of destination requested by client

</div>

<div id="id92011" class="refsect2">

### object_id

is a integer designating a object to match

</div>

<div id="id92014" class="refsect2">

### read_write_flag

an integer designating action to match

</div>

</div>

<div id="ret_http_acl_get" class="refsect1">

## Return Types

The function returns the value of the HA_FLAG of the first matching
rule. If no rule matches it returns -1.

</div>

<div id="seealso_http_acl_get" class="refsect1">

## See Also

<a href="fn_http.html" class="link" title="http"><code
class="function">http() </code></a> ,
<a href="fn_http_value.html" class="link" title="http_value"><code
class="function">http_value()</code></a> ,
<a href="fn_http_url.html" class="link" title="http_url"><code
class="function">http_url()</code></a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output()</code></a> ,
<a href="fn_http_rewrite.html" class="link" title="http_rewrite"><code
class="function">http_rewrite()</code></a> ,
<a href="wsacl.html#wsaclgenpurpacl" class="link"
title="14.2.1. General purpose ACLs">General ACLs</a> .

</div>

</div>
