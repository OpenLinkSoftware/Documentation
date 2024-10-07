<div id="rthjsp" class="section">

<div class="titlepage">

<div>

<div>

## 14.9. Deploying JSP Applications

</div>

</div>

</div>

The Virtuoso server with Java hosting support can be used to execute JSP
pages, however, Virtuoso requires a JSP container engine first. Jakarta
provide such an engine that can be hosted inside Virtuoso with Java
support. This section describes how JSP's can be executed using Jakarta
Tomcat JSP implementation.

<div class="figure-float">

<div id="http_handler_jsp" class="figure">

**Figure 14.54. The HTTP JSP handler using Jakarta Tomcat**

<div class="figure-contents">

<div class="mediaobject">

![The HTTP JSP handler using Jakarta
Tomcat](images/http_handler_jsp.jpg)

</div>

</div>

</div>

  

</div>

<div id="rthjspprelim" class="section">

<div class="titlepage">

<div>

<div>

### 14.9.1. Environment Setup & Verification

</div>

</div>

</div>

The following components are required:

|                                                                                                                                                  |
|--------------------------------------------------------------------------------------------------------------------------------------------------|
| Java SDK (or runtime only) needs to be installed. Version 1.2 or later.                                                                          |
| Jakarta Tomcat package must be installed and configured. This can be obtained from the <a href="http://jakarta.apache.org/tomcat/" class="ulink" 
 target="_top">Jakarta project site</a> (http://jakarta.apache.org/tomcat/)                                                                        |

The virtuoso.ini file must edited to including the following settings in
the `[Parameters]` section:

``` programlisting
.....
JavaClasspath = <jdk install dir>/lib/tools.jar:<tomcat install dir>/bin/bootstrap.jar
JavaVMOption1 = -Djava.endorsed.dirs=<tomcat install dir>/bin:<tomcat install dir>/common/endorsed
JavaVMOption2 = -Dcatalina.base=<tomcat install dir>
JavaVMOption3 = -Dcatalina.home=<tomcat install dir>
JavaVMOption4 = -Djava.io.tmpdir=<tomcat install dir>/temp
.....
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                     |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                               |
|                              | The above has been tested for the jakarta-tomcat-4.1.18 distribution only. Setting may vary for any other versions of Jakarta Tomcat, in which case we advise you consult the Tomcat documentation. |

</div>

Run the `virtuoso-*-javavm*-t` binary, The Virtuoso server that includes
Java hosting.

Start the Jakarta Tomcat server inside virtuoso server process using the
following command from ISQL:

``` programlisting
SQL> java_call_method ('org.apache.catalina.startup.BootstrapService', null, 'main', 'V',
     vector ('[Ljava/lang/String;', vector ('start')));
```

In order to invoke the above command automatically at server startup you
might put it in the autoexec.isql init script.

Make a virtual directory for accessing JSP server, here is an example:

``` programlisting
vhost_define (lpath=>'/tomcat',ppath=>'http://example.com:8080/');
```

Verify that your installations are correct by pointing your web browser
of choice to `http://example.com:8890/tomcat/` (assuming you are working
on your local machine). Run some of JSP examples provided with Tomcat
distribution to verify that they are executed without errors.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                           |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                     |
|                              | For debugging purposes you may run the virtuoso-\*-javavm\*-t server with foreground option to receive Java error messages, if any occur. |

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                |
|:--------------------------:|:---------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                      |
|                            | <a href="inprocess.html" class="link"                          
                              title="7.6. Virtuoso In-Process Client">In-Process Data Access  
                              Client</a>                                                      |

</div>

</div>

</div>
