<div>

<div>

</div>

<div>

## Name

md5 — returns the md5 checksum of its argument

</div>

<div>

## Synopsis

<div>

|                          |                        |
|--------------------------|------------------------|
| `checksum `**`md5`**` (` | in `str ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`md5 ` calculates the MD5 checksum of its argument. The md5 message
digest algorithm is defined in
<a href="http://www.ietf.org/rfc/rfc1321.txt" class="ulink"
target="_top">RFC1321</a> .

</div>

<div>

## Parameters

<div>

### str

A <span class="type">string </span> or <span class="type">string_output
</span> containing the data for calculating the message digest.

</div>

</div>

<div>

## Return Types

A <span class="type">string </span> of 32 lowercase alphanumeric
characters.

</div>

<div>

## Errors

<div>

**Table 24.54. Errors signalled by**

<div>

| SQLState                        | Error Code                      | Error Text                      | Description |
|---------------------------------|---------------------------------|---------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode"></span> | <span class="errortext"></span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.216. Simple example**

<div>

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

<div>

## See Also

<a href="http://www.ietf.org/rfc/rfc1321.txt" class="ulink"
target="_top">RFC1321</a>

</div>

</div>
