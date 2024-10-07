<div id="fn_tree_md5" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

tree_md5 — returns MD5 checksum of array argument

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_tree_md5" class="funcsynopsis">

|                             |                     |
|-----------------------------|---------------------|
| `string `**`tree_md5`**` (` | in `tree ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_tree_md5" class="refsect1">

## Description

Returns a string of 16 characters representing the binary MD5 checksum
of the argument. The argument can be any array or scalar.

</div>

<div id="params_tree_md5" class="refsect1">

## Parameters

<div id="id114067" class="refsect2">

### tree

String or string_session to be processed with MD5 algorithm.

</div>

</div>

<div id="ret_tree_md5" class="refsect1">

## Return Values

A string of 32 lower case hex digits that are the result of the MD5
algorithm used on the data argument.

</div>

<div id="errors_tree_md5" class="refsect1">

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

</div>

</div>
