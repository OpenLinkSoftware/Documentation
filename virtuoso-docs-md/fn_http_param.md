<div id="fn_http_param" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_param — returns value of a HTML form parameter in VSP context

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_param" class="funcsynopsis">

|                         |                         |
|-------------------------|-------------------------|
| ` `**`http_param`**` (` | in `name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_param" class="refsect1">

## Description

This function is used to return value of a HTML form parameter in VSP
context. It's almost like call get_keyword ('name', params) used in VSP
programming. When 'name' parameter is not supplied, the result of
http_param() call will be all parameters, as they are contained in
'params' parameter of the VSP pages. This function is useful in HTTP
authentication PL hook, as in this place there is no 'params' argument.

</div>

<div id="params_http_param" class="refsect1">

## Parameters

<div id="id93167" class="refsect2">

### name

A string with name of the parameter to return

</div>

</div>

<div id="ret_http_param" class="refsect1">

## Return Types

Returns value of a HTML form parameter, or array of all parameters.

</div>

<div id="seealso_http_param" class="refsect1">

## See Also

<a href="ch-overview.html" class="link" title="Chapter 1. Overview">VSP
pages</a>
<a href="fn_vhost_define.html" class="link" title="VHOST_DEFINE"><code
class="function">vhost_define() </code></a>

</div>

</div>
