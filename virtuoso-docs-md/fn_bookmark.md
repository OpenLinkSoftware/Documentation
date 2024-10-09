<div>

<div>

</div>

<div>

## Name

bookmark — Return the bookmark for current row of a scrollable cursor

</div>

<div>

## Synopsis

<div>

|                          |                          |
|--------------------------|--------------------------|
| `any `**`bookmark`**` (` | in `cursor ` CURSOR `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`bookmark ` returns a bookmark for the current row of an open scrollable
cursor. Given an invalid argument, i.e. no cursor, no current row or
non-open cursor, it signals an error. The returned value can be used in
subsequent FETCH .. BOOKMARK over the same cursor.

</div>

<div>

## Parameters

<div>

### bookmark

Given Bookmark.

</div>

<div>

### cursor

Open scrollable cursor.

</div>

</div>

<div>

## Return Types

*`integer `* bookmark id.

</div>

<div>

## Errors

<div>

**Table 24.8. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                                            | Description |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">24000 </span> | <span class="errorcode">SR238 </span> | <span class="errortext">Virtuoso/PL Scrollable cursor not opened </span>              |             |
| <span class="errorcode">HY109 </span> | <span class="errorcode">SR239 </span> | <span class="errortext">Virtuoso/PL Scrollable cursor not positioned on a row </span> |             |

</div>

</div>

  

</div>

<div>

## See Also

<a href="openfetchetcintostmts.html" class="link"
title="11.7.10. open, fetch, close, select ... into statements">Cursors</a>
in Virtuoso/PL guide

</div>

</div>
