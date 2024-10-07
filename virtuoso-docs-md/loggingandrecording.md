<div id="loggingandrecording" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.66. How can I make HTTP Logging and Recording in Virtuoso?

</div>

</div>

</div>

<div id="loggingandrecordinglg" class="section">

<div class="titlepage">

<div>

<div>

#### HTTP Logging

</div>

</div>

</div>

Virtuoso can keep http log with all the requests that are made to the
HTTP endpoint. Here are the steps:

<div class="orderedlist">

1.  Edit your virtuoso.ini and add the following setting:

    ``` programlisting
    [HTTPServer]
    HTTPLogFile                = logs/http15022012.log
    ```

2.  Restart Virtuoso.

3.  Virtuoso will now maintain a http log in the logs subdirectory, with
    one line per request as in:

    ``` programlisting
    180.76.5.87 - - [15/Feb/2012:21:50:44 +0100] "GET /data/Wilton_power_stations.json HTTP/1.0" 200 8014 ""
      "Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)"
    180.76.5.87 - - [15/Feb/2012:21:50:45 +0100] "POST /sparql HTTP/1.0" 200 3012 "" ""
    ```

4.  The first request after midnight will open a new logfile, to make
    sure the logfile does not keep growing. Old logfiles can be gzipped
    or removed by hand to conserve disk space.

</div>

The HTTP log files that Virtuoso produces can be processed by programs
like <a href="http://www.webalizer.org/" class="ulink"
target="_top">Webalizer</a> or
<a href="http://awstats.sourceforge.net/" class="ulink"
target="_top">AWstats</a> to accurately measure site usage.

</div>

<div id="loggingandrecordingfr" class="section">

<div class="titlepage">

<div>

<div>

#### HTTP Logging Format

</div>

</div>

</div>

Virtuoso supports HTTP Logging format string like
<a href="http://httpd.apache.org/docs/2.2/mod/mod_log_config.html"
class="ulink" target="_top">Apache Module mod_log_config</a> . That
string can be set in the "HTTPLogFormat" INI file param which works in
conjunction with the "HTTPLogFile" INI file param. For example:

``` programlisting
...
[HTTPServer]
...
HTTPLogFormat = %h %u %t "%r" %s %b "%{Referer}i" "%{User-agent}i" "%{NetId}e"
```

In this example we have %{User-Agent}i which means to log the HTTP
header for user-agent. In similar way can log other input headers, "e"
modifier is for environment variable NetId in this case.

Note that not all escapes from
<a href="http://httpd.apache.org/docs/2.2/mod/mod_log_config.html"
class="ulink" target="_top">Apache Module mod_log_config</a> are
supported.

</div>

<div id="loggingandrecordingrc" class="section">

<div class="titlepage">

<div>

<div>

#### HTTP Recording

</div>

</div>

</div>

Virtuoso can also record the complete HTTP request for both GET and POST
requests, including all incoming headers, POST parameters etc. This is a
very useful tool for debugging, but it will cost performance and disk
space, so it should not be left on for long periods of time. Each
request will be written to a separate file.

<span class="emphasis">*Note*</span> : Some filesystem types like ext2
and earlier versions of ext3 on Linux cannot handle huge amounts of
files in a single directory without slowing down the whole system.

</div>

<div id="loggingandrecordingrcexget" class="section">

<div class="titlepage">

<div>

<div>

#### Example of a GET request

</div>

</div>

</div>

``` programlisting
GET /sparql?query=DESCRIBE%20%3CnodeID%3A%2F%2Fb15481%3E&output=text%2Fcxml     HTTP/1.1
Host: example.com
Connection: Keep-alive
Accept: */*
From: googlebot(at)googlebot.com
User-Agent: Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)
Accept-Encoding: gzip,deflate
```

</div>

<div id="loggingandrecordingrcexpost" class="section">

<div class="titlepage">

<div>

<div>

#### Example of a POST request

</div>

</div>

</div>

``` programlisting
POST /ods_services/Http/usersGetInfo HTTP/1.1
User-Agent: Opera/9.80 (Macintosh; Intel Mac OS X 10.5.8; U; en) Presto/2.9.168 Version/11.51
Host: example.com
Accept: text/html, application/xml;q=0.9, application/xhtml+xml, image/png, image/webp, image/jpeg, image/gif,
  image/x-xbitmap, */*;q=0.1
Accept-Language: en,en-US;q=0.9,ja;q=0.8,fr;q=0.7,de;q=0.6,es;q=0.5,it;q=0.4,pt;q=0.3,pt-
  PT;q=0.2,nl;q=0.1,sv;q=0.1,nb;q=0.1,da;q=0.1,fi;q=0.1,ru;q=0.1,pl;q=0.1,zh-CN;q=0.1,zh-TW;q=0.1,ko;q=0.1
Accept-Encoding: gzip, deflate
Referer: https://example.com/ods/
Cookie: interface=js; oatSecurityCookie=0123456878794576; sid=b3fae40reb78bc4babab3cb2a70fb111
Connection: Keep-Alive
Content-Length: 77
Content-Type: application/x-www-form-urlencoded
Authorization: Basic bnQacPPuhhxs
Content-Transfer-Encoding: binary
```

</div>

<div id="loggingandrecordingrcexenbr" class="section">

<div class="titlepage">

<div>

<div>

#### Example Enabling recording

</div>

</div>

</div>

<div class="orderedlist">

1.  Go to the directory where the database is started from:

    ``` programlisting
    mkdir sys_http_recording
    chmod 777 sys_http_recording
    ```

2.  Edit virtuoso.ini and set:

    ``` programlisting
    [HTTPServer]
    EnableRequestTrap          = 1
    ```

3.  Next connect with isql to your database and run the following
    commands:

    ``` programlisting
    registry_set ('__save_http_history_on_disk', '1');
    registry_set ('__save_http_history', '/');
    ```

4.  Finally restart Virtuoso.

5.  As result at this point every HTTP GET and POST request will be
    logged with all the parameters, headers and settings.

</div>

</div>

<div id="loggingandrecordingrcexdsbr" class="section">

<div class="titlepage">

<div>

<div>

#### Example Disabling recording

</div>

</div>

</div>

<div class="orderedlist">

1.  To temporary disable the recordings, edit virtuoso.ini and set:

    ``` programlisting
    [HTTPServer]
    EnableRequestTrap          = 0
    ```

2.  Next you should remove the two registry items:

    ``` programlisting
    registry_remove ('__save_http_history_on_disk');
    registry_remove ('__save_http_history');
    ```

3.  Finally restart Virtuoso.

</div>

</div>

</div>
