<div id="serverphpexamples" class="section">

<div class="titlepage">

<div>

<div>

### 14.8.3. PHP Examples

</div>

</div>

</div>

<div id="ex_serverphpstr" class="example">

**Example 14.65. Examples of the php_str() usage**

<div class="example-contents">

Unless the examples are shown as executed in the ISQL tool, this can be
made also in the Virtuoso/PL code.

``` programlisting

SQL> select php_str ('<?php echo "Hello World"?>');
callret
VARCHAR
_______________________________________________________________________________

Hello World

SQL> select php_str ('<?php print abs (-1);?>');
callret
VARCHAR
_______________________________________________________________________________

1

SQL> set MACRO_SUBSTITUTION off;
SQL> select php_str ('<?php echo $a?>', 'a=Hello+World');
callret
VARCHAR
_______________________________________________________________________________

Hello World

SQL> select php_str ('<?php echo $a?>', vector ('a', 'Hello World'));
callret
VARCHAR
_______________________________________________________________________________

Hello World

SQL> select php_str ('<?php echo "$a $b"?>', 'a=Hello+World&b=Hello+Again+World');
callret
VARCHAR
_______________________________________________________________________________

Hello World Hello Again World

SQL> select php_str ('<?php $a=1; $b=2; $c=3; $d=$a+$b+$c; echo $d?>');
callret
VARCHAR
_______________________________________________________________________________

6

SQL>  select php_str ('<?php $a=8; $b=4; $c=8; echo $a|$b&$c?>');
callret
VARCHAR
_______________________________________________________________________________

8
```

</div>

</div>

  

<div id="serverphpredir" class="example">

**Example 14.66. Examples of the php redirect page**

<div class="example-contents">

This is test how the PHP processor can instruct the HTTP server to send
a custom response and header to the user agent. The following page can
stored on the file system or in the WebDAV repository (in which case
execution rights must be enabled). Hitting that page will redirect
user-agent to the index.html page in HTTP server root.

``` programlisting
<?php
  header ("HTTP/1.1 302 Found");
  header ("Location: /index.html");
?>
```

</div>

</div>

  

</div>
