<div>

<div>

</div>

<div>

## Name

http_param — returns value of a HTML form parameter in VSP context

</div>

<div>

## Synopsis

<div>

|                         |                         |
|-------------------------|-------------------------|
| ` `**`http_param`**` (` | in `name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to return value of a HTML form parameter in VSP
context. It's almost like call get_keyword ('name', params) used in VSP
programming. When 'name' parameter is not supplied, the result of
http_param() call will be all parameters, as they are contained in
'params' parameter of the VSP pages. This function is useful in HTTP
authentication PL hook, as in this place there is no 'params' argument.

</div>

<div>

## Parameters

<div>

### name

A string with name of the parameter to return

</div>

</div>

<div>

## Return Types

Returns value of a HTML form parameter, or array of all parameters.

</div>

<div>

## See Also

<a href="ch-overview.html" class="link" title="Chapter 1. Overview">VSP
pages</a>
<a href="fn_vhost_define.html" class="link" title="VHOST_DEFINE"><code
class="function">vhost_define() </code></a>

</div>

</div>
