<div id="fn_log_message" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

log_message — print output into the system log file

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_log_message" class="funcsynopsis">

|                          |                        |
|--------------------------|------------------------|
| ` `**`log_message`**` (` | in `str ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_log_message" class="refsect1">

## Description

`log_message ` Appends a line to the system log file (typically
virtuoso.log).

</div>

<div id="params_log_message" class="refsect1">

## Parameters

<div id="id95983" class="refsect2">

### str

An informative string to append to the log file.

</div>

</div>

<div id="ret_log_message" class="refsect1">

## Return Values

None

</div>

<div id="examples_log_message" class="refsect1">

## Examples

<div id="ex_log_message_1" class="example">

**Example 24.209. Simple example**

<div class="example-contents">

``` screen
                SQL> log_message('1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
                33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67
                68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100');
                Done. -- 0 msec.
                SQL> ^D
            
```

``` screen
                bash$ tail virtuoso.log
                16:05:48 INFO: PL LOG: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
                31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65
                66 67 68 69 70
            
```

</div>

</div>

  

</div>

<div id="seealso_log_message" class="refsect1">

## See Also

<a href="fn_dbg_printf.html" class="link"
title="dbg_printf">dbg_printf</a>

</div>

</div>
