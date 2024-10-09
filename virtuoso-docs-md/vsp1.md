<div>

<div>

<div>

<div>

## 14.3. Virtuoso Server Pages (VSP)

</div>

</div>

</div>

The Virtuoso Server Pages subsystem is an integral part of the Virtuoso
server. A VSP page is a file system or DAV resident resource that
contains Virtuoso/PL code intermixed with HTML or other static content.

<div>

<div>

**Figure 14.14. VSP Conceptual Diagram**

<div>

<div>

![VSP Conceptual Diagram](images/vspconcept.jpg)

</div>

</div>

</div>

  

</div>

Virtuoso can serve Web pages to HTTP 1.0 and HTTP 1.1 clients. The HTTP
document root is set by the ServerRoot parameter in the \[HTTPServer\]
section of the Virtuoso INI file. By default this is set to `vsp`
sub-directory of the installation. If this parameter is not set, then
the default document root will be the server's working directory.

**Executing VSP Pages. ** Directories under the ServerRoot directory,
including the root itself are not automatically allowed to execute
dynamic pages such as VSP. A virtual directory must first be created
with an appropriate VSP user assigned to permit execution of dynamic
pages. After this, Virtuoso will execute files with a "`.vsp` "
extension as a VSP page.\]

**The VSP Stored Procedure. ** Each VSP page constitutes a Virtuoso
stored procedure named after the URI of the page by taking the URI and
pre-pending the WS.WS. qualifier and owner. Hence the page `/test.vsp`
becomes the procedure `"WS"."WS"."/test.vsp"` . This is automatically
performed when a page is first requested. Subsequent requests to the
page will not reference the file. The VSP engine will check for changes
in the `.vsp` source file before calling the procedure and re-compile as
required. The ws_proc_def() SQL function can be used to explicitly
update the procedure if the .vsp file is changed.

**The VSP Transaction. ** Each URL is executed in its own transaction.
All SQL statements in a page procedure, whether on local or remote data,
make up one transaction, unless transaction control statements are
explicitly used to divide the page into multiple transactions. If the
page procedure returns through completing execution or through a return
statement or as a result of a 'no data found' condition, the transaction
is implicitly committed. If this commit fails, the output is discarded
and the error message indicating the commit failure is sent to the HTTP
client. If a VSP procedure returns as a result of an error the
transaction is rolled back and the output discarded. The client gets the
SQL error message as the HTML body of the reply. A VSP procedure can
commit or roll back explicitly with the `commit work` or `rollback work`
PL statements.

If the client closes the connection to the server while server-side
processing is taking place this will be detected by the server and the
transaction will be eventually interrupted and rolled back in the same
way as if an ODBC client had disconnected. To control the server
reacting or not on the HTTP client disconnecting the SET
HTTP_IGNORE_DISCONNECT = ON/OFF should be used.

Each VSP page-procedure is called with three arguments:

|                                                                                                       |
|-------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*path*</span> - the URI path of the VSP page itself.                           |
| <span class="emphasis">*params*</span> - the parameters from a previous POST to the server.           |
| <span class="emphasis">*lines*</span> - the complete set of headers received from the calling client. |

Each VSP procedure runs in a context that implicitly contains the stream
to the HTTP client. The arguments of the VSP page procedure are
represented as arrays of strings. For example, GETing the URL:

``` programlisting
http://www.test.net/x/y.vsp?arg1=1&arg2=2
```

would cause the following arguments to be given to the page-procedure
`WS.WS./x/y.vsp` :

``` programlisting
path     ('x', 'y.vsp')
params   ('arg1', '1', 'arg2', '2')
lines    ('GET /x/y.vsp?arg1=1&arg2=2 HTTP/1.1', 'Host: www.test.net', ...)
```

Arrays are marked in parentheses with elements separated by commas. The
page procedure is called as a result of either a GET or POST request in
either HTTP/1.0 or HTTP/1.1. In the event of a POST request the params
contains the post data.

Virtuoso can be configured to proxy certain requests to another web
server. This allows using another web server for running cgi-bin's, Java
servelets or other web server functions. Virtuoso, however, is capable
of hosting many other dynamic engines also, such as PHP, JSP and
ASP.Net.

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="ch-webappdevelopment.html#vspconf" class="link"
title="14.1.1. HTTP Server Base Configuration">HTTP Server Base
Configuration</a></p>
<p><a href="admui.internetdomains.html#httpvirtualdirs" class="link"
title="HTTP Virtual Directories">Virtual Directory Administration
UI</a></p>
<p><a href="fn_vhost_define.html" class="link"
title="VHOST_DEFINE">vhost_define()</a> , <a href="fn_vhost_remove.html"
class="link" title="VHOST_REMOVE">vhost_remove()</a></p>
<p><a href="ch-webappdevelopment.html#virtproxy" class="link"
title="Virtuoso As A Proxy">Virtuoso as a Proxy</a></p></td>
</tr>
</tbody>
</table>

</div>

<div>

<div>

<div>

<div>

### 14.3.1. VSP Markup & Basic Functions

</div>

</div>

</div>

All VSP specific markup is represented as a processing instruction (\<?
... ?\>).

``` programlisting
<?vsp
  statement ;
  statement ;
  ...
 ?>
```

This markup introduces Virtuoso PL code to a VSP page, which otherwise
may normally contain HTML markup. The code enclosed must begin and end
at a statement boundary but a compound statement may begin in one \<?vsp
tag and end in another. Code outside of these blocks is ignored by
Virtuoso and placed directly on the HTTP stream to be sent to the
client.

<div>

|                            |                                           |
|:--------------------------:|:------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                 |
|                            | The SQL Procedure Language Guide chapter. |

</div>

Several functions exist to allow VSP code to send data to the HTTP
stream. They are basically the same but offer different escaping
mechanisms to suit different purposes:

<a href="fn_http.html" class="link" title="http"><code
class="code">http (in </code><em><code>value</code></em><code
class="code"> varchar, in </code><em><code>stream</code></em><code
class="code"> any);</code></a>

<a href="fn_http_value.html" class="link" title="http_value"><code
class="code">http_value ( in </code><em><code>value</code></em><code
class="code"> any, in </code><em><code>tag</code></em><code
class="code"> varchar, in </code><em><code>tag</code></em><code
class="code"> varchar, in </code><em><code>stream</code></em><code
class="code"> any);</code></a>

<a href="fn_http_url.html" class="link" title="http_url"><code
class="code">http_url ( in </code><em><code>value</code></em><code
class="code"> any, in </code><em><code>tag</code></em><code
class="code"> varchar, in </code><em><code>stream</code></em><code
class="code"> any);</code></a>

These functions output their *`value`* argument to the specified stream
with varying escaping. The value argument may be any scalar object, i.e.
string, date or number and will automatically be cast to varchar before
further processing.

`http()` will print out the contents of *`value`* cast to string without
any modification.

`http_value()` will use HTML escapes such that '`<` ' will be output as
'`&lt;` '.

The `http_url()` function will use URL escapes such that '+' replaces
spaces and hex escapes like %25 will replace '%'. If `http_value()` gets
an XML entity returned by a path expression it outputs the serialization
of the entity, including children. This is not the string value since
this has the entity start and end tags and other markup. The tag
argument allows specifying a tag in which the value is to be enclosed. A
non-string value, e.g. 0 or null will cause no tag to be put around the
value.

The stream argument may be omitted, in which case it defaults to the
HTTP client of the calling procedure. If present, a value of integer 0
will mean the http client. If non-0 the value must be an object returned
by <a href="fn_string_output.html" class="link"
title="string_output">string_output()</a> .

These HTTP functions are commonly combined with `sprintf()` which allows
string composition based on a template. When using
<a href="fn_sprintf.html" class="link" title="sprintf">sprintf()</a> to
compose data to send to the user agent the %V and %U letters can be used
to introduce escapes similar to http_value and http_url, respectively.

<div>

**Example 14.6. HTTP Functions**

<div>

``` programlisting
http (' % <b>')          ' % <b>'
http_value (' % <b>')    ' % &lt;b&gt;'
http_url (' % <b>')      '+%25+<b>'
http_value (12, 'li')    '<li>12</li>'
```

</div>

</div>

  

<div>

<div>

<div>

<div>

#### Markup Short-hands

</div>

</div>

</div>

VSP markup short-hands exist for the `http_value()` and `http_url()`
functions to perform the same task outside of a VSP code block. This can
improve readability of VSP pages.

``` programlisting
<?= expression ?>  equiv.  http_value()
```

``` programlisting
<?/ expression ?>  equiv.  http_url()
```

These markups are shorthand for substituting values of expressions into
the output. The `<?= ` tag accepts a SQL expression and casts the value
into a string, which is sent to the output. The `<?/ ` markup sends the
value of the expression to the client with HTTP URL escapes.

<div>

**Example 14.7. VSP Markup**

<div>

Here is a very simple example of making a two column HTML table from the
results of a "select" SQL statement. First using normal functions:

``` programlisting
<html>
<h2>List of Users</h2>
<table>
<?vsp
  for (select u_name, u_password from sys_users ) do {
    http('<tr><td>');
    http (u_name);
    http('</td><td>');
    http (u_password);
    http('</td></tr>');
  }
?>
      </table>
</html>
```

This fragment outputs a table of user names and passwords. We have
chosen to not end the code block until the end of the result so we have
repeatedly used the `http()` function to output parts of the table also.

Now the same code but including shorthands:

``` programlisting
<html>
<h2>List of Users</h2>
<table>
<?vsp for (select u_name, u_password from sys_users ) do { ?>
  <tr>
    <td><?=u_name ?></td>
    <td><?=u_password ?></td></tr>
      <?vsp } ?>
      </table>
</html>
```

</div>

</div>

  

</div>

</div>

</div>
