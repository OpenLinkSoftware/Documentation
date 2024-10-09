<div>

<div>

</div>

<div>

## Name

http_acl_set — Set conditions against web server ACL's

</div>

<div>

## Synopsis

<div>

|                                  |                                        |
|----------------------------------|----------------------------------------|
| `integer `**`http_acl_set`**` (` | in `list_name ` varchar ,              |
|                                  | in `order ` integer ,                  |
|                                  | in `client_ip ` varchar ,              |
|                                  | in `flag ` integer ,                   |
|                                  | in `destination_ip_or_host ` varchar , |
|                                  | in `object_id ` integer ,              |
|                                  | in `read_write_flag ` integer ,        |
|                                  | in `rate ` integer `)`;                |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function can be used within application logic to set ACLs rule.

</div>

<div>

## Parameters

<div>

### list_name

a string designating which list to be used for matching

</div>

<div>

### order

a string designating order

</div>

<div>

### client_ip

a string containing the IP number of client to set rules

</div>

<div>

### flag

0 - allow, 1 - deny

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

an integer designating action to match: 0 - read, 1 - write

</div>

<div>

### rate

When set, the filter will calculate hit rate average and will compare
with limit for http acl rule. If it is larger then will drop connection.
Once per day the statistics will be reset.

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
class="function">http </code></a> ,
<a href="fn_http_acl_get.html" class="link" title="http_acl_get"><code
class="function">http_acl_get</code></a> ,
<a href="fn_http_acl_remove.html" class="link"
title="http_acl_remove"><code
class="function">http_acl_remove</code></a> ,
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
