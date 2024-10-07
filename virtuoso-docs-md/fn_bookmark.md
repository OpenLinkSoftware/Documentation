<div id="fn_bookmark" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

bookmark — Return the bookmark for current row of a scrollable cursor

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_bookmark" class="funcsynopsis">

|                          |                          |
|--------------------------|--------------------------|
| `any `**`bookmark`**` (` | in `cursor ` CURSOR `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_bookmark" class="refsect1">

## Description

`bookmark ` returns a bookmark for the current row of an open scrollable
cursor. Given an invalid argument, i.e. no cursor, no current row or
non-open cursor, it signals an error. The returned value can be used in
subsequent FETCH .. BOOKMARK over the same cursor.

</div>

<div id="params_bookmark" class="refsect1">

## Parameters

<div id="id81569" class="refsect2">

### bookmark

Given Bookmark.

</div>

<div id="id81572" class="refsect2">

### cursor

Open scrollable cursor.

</div>

</div>

<div id="ret_bookmark" class="refsect1">

## Return Types

*`integer `* bookmark id.

</div>

<div id="errors_bookmark" class="refsect1">

## Errors

<div id="id81581" class="table">

**Table 24.8. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                            | Description |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">24000 </span> | <span class="errorcode">SR238 </span> | <span class="errortext">Virtuoso/PL Scrollable cursor not opened </span>              |             |
| <span class="errorcode">HY109 </span> | <span class="errorcode">SR239 </span> | <span class="errortext">Virtuoso/PL Scrollable cursor not positioned on a row </span> |             |

</div>

</div>

  

</div>

<div id="seealso_bookmark" class="refsect1">

## See Also

<a href="openfetchetcintostmts.html" class="link"
title="11.7.10. open, fetch, close, select ... into statements">Cursors</a>
in Virtuoso/PL guide

</div>

</div>
