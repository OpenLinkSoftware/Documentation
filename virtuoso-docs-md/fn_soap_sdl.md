<div id="fn_soap_sdl" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

soap_sdl — Generate SDL document for a PL module and return it as a
varchar.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_soap_sdl" class="funcsynopsis">

|                       |                             |
|-----------------------|-----------------------------|
| ` `**`soap_sdl`**` (` | in `module_name ` varchar , |
|                       | in `URL ` varchar `)`;      |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_soap_sdl" class="refsect1">

## Description

This function generates a SDL for the procedures in a PL module the same
way as /SOAP/services.xml is generated for the procedures in WS.SOAP.

</div>

<div id="params_soap_sdl" class="refsect1">

## Parameters

<div id="id110821" class="refsect2">

### module

Required. The name of the module to describe. This can be partial name.

</div>

<div id="id110824" class="refsect2">

### URL

Optional (default is the current VSP path if in VSP context. Otherwise
error). The URL to include in the SDL file

</div>

</div>

<div id="ret_09" class="refsect1">

## Return Types

Returns the SDL document describing the module as an varchar value.

</div>

</div>
