<div>

<div>

</div>

<div>

## Name

http_kill — Kill VSP process whose details match parameter inputs

</div>

<div>

## Synopsis

<div>

|                        |                                       |
|------------------------|---------------------------------------|
| ` `**`http_kill`**` (` | in `client_IP_address ` varchar ,     |
|                        | in `URL ` varchar ,                   |
|                        | in `process_request_id ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function requires dba privileges.

This function is used to kill the process whose details match that of
the input parameters. If Client's IP and URL are specified, then it will
try to kill all matching pending HTTP requests for that peer requesting
that URL. If all three parameters are given, then it will try to kill
only that pending HTTP request.

</div>

<div>

## Parameters

<div>

### client_IP_address

Client's IP as per the output of `http_pending_req() `

</div>

<div>

### URL

Process' URL as per the output of `http_pending_req() `

</div>

<div>

### process_request_id

The task ID of the request.

</div>

</div>

<div>

## Errors

<div>

**Table 24.40. Errors signalled by `http_kill `**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                             | Description |
|---------------------------------------|---------------------------------------|--------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">SR159 </span> | <span class="errortext">Function http_kill restricted to dba group </span>                             |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR014 </span> | <span class="errortext">Function http_kill needs a string as argument 1, not an arg of type %s </span> |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR014 </span> | <span class="errortext">Function http_kill needs a string as argument 2, not an arg of type %s </span> |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR014 </span> | <span class="errortext">Function http_kill needs a string as argument 3, not an arg of type %s </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.166. Retrieving a list of VSP processes**

<div>

``` programlisting
declare ps any;

ps := http_pending_req ();

-- the ps value is (('127.0.0.1', '/long.vsp', 1234567), ('192.168.1.1', '/long.vsp', 345678))

http_kill ('192.168.1.1', '/long.vsp', 345678);
```

after this and calling http_pending_req() again we get (('127.0.0.1',
'/long.vsp', 1234567)) only.

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_http_pending_req.html" class="link"
title="http_pending_req"><code
class="function">http_pending_req </code></a>

<a href="fn_http.html" class="link" title="http"><code
class="function">http </code></a>

</div>

</div>
