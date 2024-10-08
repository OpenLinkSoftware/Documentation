<div>

<div>

</div>

<div>

## Name

http_acl_get — Test conditions against web server ACL's

</div>

<div>

## Synopsis

<div>

|                                  |                                        |
|----------------------------------|----------------------------------------|
| `integer `**`http_acl_get`**` (` | in `list_name ` varchar ,              |
|                                  | in `source_ip ` varchar ,              |
|                                  | in `destination_ip_or_host ` varchar , |
|                                  | in `object_id ` integer ,              |
|                                  | in `read_write_flag ` integer `)`;     |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function can be used within application logic to test that an
internet client would not violate the ACL.

</div>

<div>

## Parameters

<div>

### list_name

a string designating which list to be used for matching

</div>

<div>

### source_ip

a string containing the IP number of client to test against rules

</div>

<div>

### destination_ip_or_host

a string containing the IP number of destination requested by client

</div>

<div>

### object_id

is a integer designating a object to match

</div>

<div>

### read_write_flag

an integer designating action to match

</div>

</div>

<div>

## Return Types

The function returns the value of the HA_FLAG of the first matching
rule. If no rule matches it returns -1.

</div>

<div>

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
