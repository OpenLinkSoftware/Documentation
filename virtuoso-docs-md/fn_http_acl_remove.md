<div id="fn_http_acl_remove" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_acl_remove — Removes conditions against web server ACL's

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_acl_remove" class="funcsynopsis">

|                                     |                           |
|-------------------------------------|---------------------------|
| `integer `**`http_acl_remove`**` (` | in `list_name ` varchar , |
|                                     | in `order ` integer ,     |
|                                     | in `client_ip ` varchar , |
|                                     | in `flag ` integer `)`;   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_acl_remove" class="refsect1">

## Description

This function can be used within application logic to remove ACLs rule.

</div>

<div id="params_http_acl_remove" class="refsect1">

## Parameters

<div id="id92059" class="refsect2">

### list_name

a string designating which list to be used

</div>

<div id="id92062" class="refsect2">

### order

a string designating order

</div>

<div id="id92065" class="refsect2">

### client_ip

a string containing the IP number of client to remove rules

</div>

<div id="id92068" class="refsect2">

### flag

0 - allow, 1 - deny

</div>

</div>

<div id="ret_http_acl_remove" class="refsect1">

## Return Types

The function returns the value of the HA_FLAG of the first matching
rule. If no rule matches it returns -1.

</div>

<div id="seealso_http_acl_remove" class="refsect1">

## See Also

<a href="fn_http.html" class="link" title="http"><code
class="function">http </code></a> ,
<a href="fn_http_acl_get.html" class="link" title="http_acl_get"><code
class="function">http_acl_get</code></a> ,
<a href="fn_http_acl_set.html" class="link" title="http_acl_set"><code
class="function">http_acl_set</code></a> ,
<a href="fn_http_url.html" class="link" title="http_url"><code
class="function">http_url</code></a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a> ,
<a href="fn_http_rewrite.html" class="link" title="http_rewrite"><code
class="function">http_rewrite</code></a> ,
<a href="wsacl.html#wsaclgenpurpacl" class="link"
title="14.2.1. General purpose ACLs">General ACLs</a> .

</div>

</div>
