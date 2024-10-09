<div>

<div>

</div>

<div>

## Name

http_enable_gz — Enable / Disable "Content-Encoding: gzip" for HTTP
server

</div>

<div>

## Synopsis

<div>

|                                    |                         |
|------------------------------------|-------------------------|
| `integer `**`http_enable_gz`**` (` | in `mode ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Enable (1)/ Disable (0) "Content-Encoding: gzip" for HTTP server.

</div>

<div>

## Examples

<div>

**Example 24.158. Using http_enable_gz()**

<div>

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
