<div id="fn_username" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

username — returns the login name of the current user

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_username" class="funcsynopsis">

|                       |      |
|-----------------------|------|
| ` `**`username`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_50" class="refsect1">

## Description

Returns the login name of the user of the connection. Selecting `user `
is equivalent.

</div>

<div id="params_17" class="refsect1">

## Parameters

None

</div>

<div id="ret_04_01" class="refsect1">

## Return Values

A <span class="type">string </span> containing the login name of current
user

</div>

<div id="examples_10_01" class="refsect1">

## Examples

<div id="ex_username_1" class="example">

**Example 24.432. Get current DB user**

<div class="example-contents">

``` screen
SQL> select username();
callret
VARCHAR
_______________________________________________________________________________

dba

1 Rows. -- 5 msec.
SQL> select user;
callret
VARCHAR
_______________________________________________________________________________

dba

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

</div>
