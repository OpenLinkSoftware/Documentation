<div id="fn_file_to_string" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

file_to_string — returns the contents of a file as a varchar

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_file_to_string" class="funcsynopsis">

|                                    |                         |
|------------------------------------|-------------------------|
| `varchar `**`file_to_string`**` (` | in `path ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_file_to_string" class="refsect1">

## Description

This function requires dba privileges.

Returns the contents of a file as a varchar value. The file's length is
limited to 16 MB. The path is relative to the working directory of the
database server.

</div>

<div id="params_file_to_string" class="refsect1">

## Parameters

<div id="id88943" class="refsect2">

### path

Path name of the file to read.

</div>

</div>

<div id="errors_file_to_string" class="refsect1">

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

</div>

</div>
