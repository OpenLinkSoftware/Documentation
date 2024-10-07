<div id="fn_file_delete" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

file_delete — Delete a file from the file system

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_file_delete" class="funcsynopsis">

|                                 |                           |
|---------------------------------|---------------------------|
| `integer `**`file_delete`**` (` | in `path ` varchar ,      |
|                                 | in `silent ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_file_delete" class="refsect1">

## Description

This function requires dba privileges.

This function is used to delete a file from file system. This function
has a silent mode, where no errors will be signalled upon failure.

</div>

<div id="params_file_delete" class="refsect1">

## Parameters

<div id="id88455" class="refsect2">

### path

Path name of the file to delete.

</div>

<div id="id88458" class="refsect2">

### silent

Flag which if true (integer 1) will suppress signalling file system
errors.

</div>

</div>

<div id="errors_file_delete" class="refsect1">

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

</div>

</div>
