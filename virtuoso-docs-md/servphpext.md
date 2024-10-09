<div>

<div>

<div>

<div>

## 14.8. Deploying PHP Applications

</div>

</div>

</div>

The PHP server extension allows Virtuoso to execute PHP (v4) pages
stored in the file system or in Virtuoso's WebDAV repository. PHP pages
run inside the Virtuoso process.

<div>

<div>

**Figure 14.53. The HTTP PHP handler**

<div>

<div>

![The HTTP PHP handler](images/http_handler_php.jpg)

</div>

</div>

</div>

  

</div>

The VSE \_\_http_handler_php() has been implemented so that the file
extension '.php' is recognized by Virtuoso to switch between 'normal'
mode and extension processing for PHP mode in the HTTP/WebDAV services.

PHP (recursive acronym for "PHP: Hypertext Preprocessor") is a
widely-used Open Source general-purpose scripting language that is
suited for Web-based development. Here is an example of a simple PHP
page:

<div>

**Example 14.64. PHP introductory example**

<div>

``` programlisting
<html>
    <head>
        <title>Example</title>
    </head>
    <body>

        <?php
        echo "Hi, I'm a PHP script!";
        ?>

    </body>
</html>
```

</div>

</div>

  

Notice how this is similar to VSP script, and different from a script
written in other languages like Perl or C -- instead of writing a
program with lots of commands to output HTML, you write an HTML script
with some embedded code to do something. The PHP code is enclosed in
special start and end tags that allow you to jump into and out of "PHP
mode".

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
href="http://www.php.net/docs.php" class="ulink" target="_top">PHP
Online Documentation</a></p>
<p><a href="inprocess.html" class="link"
title="7.6. Virtuoso In-Process Client">In-Process Data Access
Client</a></p></td>
</tr>
</tbody>
</table>

</div>

<div>

<div>

<div>

<div>

### 14.8.1. Building the Virtuoso Server With PHP Extension

</div>

</div>

</div>

<div>

1.  Firstly you need to have the PHP4 library installed with Zend and
    ODBC interface enabled. On UNIX-es this can be enabled by doing
    'configure --enable-experimental-zts --with-iodbc'. On Windows the
    library must be downloaded from the
    <a href="http://www.php.net/" class="ulink" target="_top">php.net</a>
    site.

2.  Make sure that the iODBC library is installed if you are preparing
    to build on UNIX platform.

3.  Make the bif_server_php executable in the bifsdk/examples/
    directory. This same directory contains the source file for the
    bif_server_php executable: bif_server_php.cpp.

</div>

The Virtuoso distribution may already contain a binary executable of the
PHP extension of the Virtuoso's Web Service. In which case you may skip
the build process and start the server with the PHP extensions instead
of starting the normal virtuoso server executable.

To start and test the Virtuoso server with the PHP extension do the
following:

<div>

1.  Make a simple file 'info.php' and place it in the HTTP root
    directory. The content of the info.php file should be the single
    line:

    ``` programlisting
    <?phpinfo();?>
    ```

    This function produces an HTML page containing various PHP processor
    information.

2.  Start the server. For Linux platform: bif_server_php -f, for Windows
    platform: bif_server_php-odbc-t.exe -f

3.  Test the installation by entering the http://\[host:port\]/info.php
    as the URL of a browser of your choosing.

</div>

<div>

|                              |                                                                                                                                                                                                                                                                                                                                            |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                                                      |
|                              | Windows users will need to install the php4ts.dll (from the <a href="http://www.php.net/" class="ulink" target="_top">php.net</a> site) before running the PHP enabled Virtuoso server. This DLL must be in the system path when Virtuoso starts and can typically be placed in the %SYSTEMROOT% directory without any path modifications. |

</div>

<div>

|                              |                                                                                                                                                                                                                                 |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                           |
|                              | The PHP library used with Virtuoso must be version 4.3.1 or greater. From this version the PHP library includes a serious PHP CGI vulnerability fix, without which the Virtuoso server will fail to start for security reasons. |

</div>

</div>

</div>
