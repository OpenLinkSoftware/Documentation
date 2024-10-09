<div>

<div>

</div>

<div>

## Name

http_pending_req — return array describing running VSP threads

</div>

<div>

## Synopsis

<div>

|                               |      |
|-------------------------------|------|
| ` `**`http_pending_req`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function requires dba privileges.

`http_pending_req ` returns an array of arrays of data on running VSP
requests. Each array contains the Client IP Address, URL, and Process
Request ID. These values can be used with the `http_kill()` function.

</div>

<div>

## Return Types

An array of 3-part-arrays. Each 3-part-array consists of
client_IP_address (string), URL (string), and process request ID
(number).

The request ID's can be used to terminate requests with http_kill.

</div>

<div>

## Errors

<div>

**Table 24.42. Errors signalled by `http_pending_req `**

<div>

| SQLState                              | Error Code                            | Error Text                                                                        | Description |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">SR159 </span> | <span class="errortext">Function http_pending_req restricted to dba group </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.173. Retrieving a list of VSP processes**

<div>

``` programlisting
declare ps any;

ps := http_pending_req ();

-- the ps value is (('127.0.0.1', '/long.vsp', 1234567), ('192.168.1.1', '/long.vsp', 345678))
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_http_kill.html" class="link" title="http_kill"><code
class="function">http_kill </code></a>

<a href="fn_http.html" class="link" title="http"><code
class="function">http </code></a>

</div>

</div>
