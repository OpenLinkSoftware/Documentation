<div id="fn_md5" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

md5 — returns the md5 checksum of its argument

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_md5" class="funcsynopsis">

|                          |                        |
|--------------------------|------------------------|
| `checksum `**`md5`**` (` | in `str ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_md5" class="refsect1">

## Description

`md5 ` calculates the MD5 checksum of its argument. The md5 message
digest algorithm is defined in
<a href="http://www.ietf.org/rfc/rfc1321.txt" class="ulink"
target="_top">RFC1321</a> .

</div>

<div id="params_md5" class="refsect1">

## Parameters

<div id="id96367" class="refsect2">

### str

A <span class="type">string </span> or <span class="type">string_output
</span> containing the data for calculating the message digest.

</div>

</div>

<div id="ret_md5" class="refsect1">

## Return Types

A <span class="type">string </span> of 32 lowercase alphanumeric
characters.

</div>

<div id="errors_md5" class="refsect1">

## Errors

<div id="id96378" class="table">

**Table 24.55. Errors signalled by**

<div class="table-contents">

| SQLState                        | Error Code                      | Error Text                      | Description |
|---------------------------------|---------------------------------|---------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode"></span> | <span class="errortext"></span> |             |

</div>

</div>

  

</div>

<div id="examples_md5" class="refsect1">

## Examples

<div id="ex_md5" class="example">

**Example 24.216. Simple example**

<div class="example-contents">

``` screen
SQL> select md5 ('blah blah');
callret
VARCHAR
_______________________________________________________________________________

ae661d08d1ca1576a6efcb82b7bc502f

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

<div id="seealso_md5" class="refsect1">

## See Also

<a href="http://www.ietf.org/rfc/rfc1321.txt" class="ulink"
target="_top">RFC1321</a>

</div>

</div>
