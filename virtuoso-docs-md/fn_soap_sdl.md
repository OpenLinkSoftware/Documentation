<div>

<div>

</div>

<div>

## Name

soap_sdl — Generate SDL document for a PL module and return it as a
varchar.

</div>

<div>

## Synopsis

<div>

|                       |                             |
|-----------------------|-----------------------------|
| ` `**`soap_sdl`**` (` | in `module_name ` varchar , |
|                       | in `URL ` varchar `)`;      |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function generates a SDL for the procedures in a PL module the same
way as /SOAP/services.xml is generated for the procedures in WS.SOAP.

</div>

<div>

## Parameters

<div>

### module

Required. The name of the module to describe. This can be partial name.

</div>

<div>

### URL

Optional (default is the current VSP path if in VSP context. Otherwise
error). The URL to include in the SDL file

</div>

</div>

<div>

## Return Types

Returns the SDL document describing the module as an varchar value.

</div>

</div>
