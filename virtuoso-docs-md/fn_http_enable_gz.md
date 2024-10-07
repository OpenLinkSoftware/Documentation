<div id="fn_http_enable_gz" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_enable_gz — Enable / Disable "Content-Encoding: gzip" for HTTP
server

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_enable_gz" class="funcsynopsis">

|                                    |                         |
|------------------------------------|-------------------------|
| `integer `**`http_enable_gz`**` (` | in `mode ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_enable_gz" class="refsect1">

## Description

Enable (1)/ Disable (0) "Content-Encoding: gzip" for HTTP server.

</div>

<div id="examples_http_enable_gz" class="refsect1">

## Examples

<div id="ex_http_enable_gz" class="example">

**Example 24.158. Using http_enable_gz()**

<div class="example-contents">

``` screen
SQL> select http_enable_gz (1);
callret
VARCHAR
_______________________________________________________________________________

1

1 Rows. -- 41 msec.
SQL> 
    
```

</div>

</div>

  

</div>

</div>
