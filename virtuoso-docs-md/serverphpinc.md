<div id="serverphpinc" class="section">

<div class="titlepage">

<div>

<div>

### 14.8.2. PHP Extension Functions

</div>

</div>

</div>

The following functions have been added to the Virtuoso server in order
to enable PHP processing.

**PHP Server Handler. **

<div id="fsyn_http_handler_php" class="funcsynopsis">

|                             |                                                              |
|-----------------------------|--------------------------------------------------------------|
| **`__http_handler_php`**`(` | in `file_name` varchar,                                      |
|                             | in `params` vector (opt1, value \[,...\]) or string session, |
|                             | in `lines` vector (opt, value\[,...\] ),                     |
|                             | inout `what` any `)`;                                        |

<div class="funcprototype-spacer">

 

</div>

</div>

This function will be detected and called automatically by the Virtuoso
HTTP/WebDAV server when a request for a file with extension .php is
made.

<div class="itemizedlist">

- The

  <span class="emphasis">*file_name*</span>

  argument will be the path to the file when the PHP page is stored on
  the file system or the actual content of the page when a WebDAV
  resource is processed.

- The content of request entity body will be stored in a string session
  and passed down to the \_\_http_handler_php as the

  <span class="emphasis">*params*</span>

  argument.

- The HTTP request header will be passed as the

  <span class="emphasis">*lines*</span>

  argument.

- The

  <span class="emphasis">*what*</span>

  parameter is used for in two ways: to indicate whether the first
  argument is a path/file name to a file on the filesystem or the
  content of the required WebDAV resource. The HTTP/WebDAV server will
  return an array of two elements to this parameter.

</div>

**PHP Processor. **

<div id="fsyn_php_str" class="funcsynopsis">

|                         |                                                        |
|-------------------------|--------------------------------------------------------|
| **`__http_php_str`**`(` | in `string` varchar,                                   |
|                         | in `params` vector (opt1, val1 \[,...\]) , varchar`)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

This function takes a string containing PHP code (page), and parameters
supplied in the params array and returns the result from the PHP engine
as a string. This can be useful for performing PHP transformations in PL
or VSP code.

<div class="itemizedlist">

- the

  <span class="emphasis">*string*</span>

  is the source of the PHP page

- <span class="emphasis">*params*</span>

  is a string or array of strings containing parameter name and
  parameter value pairs. In the case of a single string it must contain
  form parameters in the application/x-www-form-urlencoded encoding. In
  case of an aref of strings it must contain the name and value for
  parameters. (Like the params argument in the VSPs).

</div>

</div>
