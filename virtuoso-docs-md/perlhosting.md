<div>

<div>

<div>

<div>

## 14.10. Perl Hosting

</div>

</div>

</div>

Virtuoso functionality can be enhanced through external libraries by
loading shared objects or DLLs. The new functions are written in a
language of the developer's choice and compiled to produce a shared
library appropriate to the operating system. The path to the shared
library must be declared in the Virtuoso INI file and the server
restarted before it can be used.

The Perl language is hosted within Virtuoso in this way. hosting_perl.so
is the library used.

The Virtuoso INI file uses a \[Plugins\] configuration section for
listing shared libraries for the server to load upon startup. An example
of this is:

``` programlisting
[Plugins]
LoadPath = /home/virtuoso/hosting
Load1 = Hosting, hosting_perl.so
..
```

The "Hosting" type defines the entry points for initialization of the
runtime hosting environment, destruction of the user environment and
execution of a file or string containing commands in the hosted
language. It also returns a list of file extensions that it is capable
of processing. Virtuoso dynamically defines memory-resident (no disk
image) HTTP server handlers for each specified type.

The Perl hosting plugin supports 'pl' extension. Hence, upon
initialization of the hosting plugin, Virtuoso defines the
`__http_handler_pl(..)` function according to the API for file type
handlers in the Virtuoso HTTP server. With this handler in place, each
hit on a .pl file (file system or WebDAV) with appropriate execute
permissions will cause the HTTP server to execute the code within it and
return the result instead of simply the file's contents.

The handler will call the \_\_hosting_http_handler VSE with a special
set of parameters to represent the HTTP environment correctly.

Virtuoso will normally call the plugin to memory as required, and expel
it when finished. This behavior can be controlled by the INI file
parameter:

``` programlisting
[HTTPServer]
PersistentHostingModules = 1/0 default 0
```

Setting `PersistentHostingModules` to "1" prevents Virtuoso from
removing the interpreters from the HTTP threads after each request.

<div>

|                            |                                                                        |
|:--------------------------:|:-----------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                              |
|                            | <a href="vseplugins.html" class="link" title="18.6. VSEI Plugins">VSEI 
                              Plugins</a>                                                             |

</div>

<div>

**Example 14.67. Using the Perl Plugin**

<div>

Executing Perl code directly:

``` programlisting
select __hosting_http_handler ('pl', 'print "hello world"; ', '', vector (), 'helloworld.pl');
```

``` programlisting
returns : hello world
```

Executing a perl script file (perl/test_print.pl in the Virtuoso working
directory):

``` programlisting
/perl/test_print.pl
-------------------
#!/usr/bin/perl
print "hello world file";
```

``` programlisting
select __hosting_http_handler ('pl', 'perl/test_print.pl');
```

``` programlisting
returns : hello world file
```

</div>

</div>

  

<div>

|                              |                                                                                                                                                                                             |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                       |
|                              | The hosting_perl hosting module uses the perl `tie()` function to "tie" up the STDIN, STDOUT, STDERR, exit() and %ENV perl objects. Untying any of these may lead to unpredictable results. |

</div>

</div>
