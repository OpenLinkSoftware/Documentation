<div id="qswebdav" class="section">

<div class="titlepage">

<div>

<div>

## 3.5. WebDAV

</div>

</div>

</div>

WebDAV support enables Virtuoso to act as the Web Content Store for all
of your eBusiness data, this includes Text, Graphics and Multimedia
files. WebDAV support also enables Virtuoso to play the familiar roles
of a FILE & WEB SERVER, hosting entire Web sites within a single
database file, or across multiple database files. Virtuoso's WebDAV
provides file system like access to its non SQL data repository.

Files contained in the DAV repository are stored in a database table.
Free text indexing and replication mechanisms may be applied to the DAV
repository as well as the regular database. Standards based WebDAV
methods are used to access resources stored in the repository based on
Virtuoso's full-featured SQL-92 database engine with performance that
matches or exceeds that of current major players in the DB market.
Typical WebDAV clients that can access the repository for content
management include Network Places on Windows through Explorer, Nautilus
on Gnome (Linux and Solaris), and the Mac OS X desktop. Many web
development tools also support WebDAV directly.

See the <a href="webdavadmin.html" class="link"
title="6.2.4. WebDAV Administration">WebDAV Administration</a> section,
to setup the WebDAV in the Visual Server Administration Interface.

<div id="qswebfolders" class="section">

<div class="titlepage">

<div>

<div>

### 3.5.1. Web Folders

</div>

</div>

</div>

Microsoft Windows has a notion of a Web Folder. This is how Windows
connects to a WebDAV store which can then be traversed like any other
file system. Files can be copied and moved to and from the DAV using
normal drag-and-drop methods.

<div class="orderedlist">

1.  To create a Web Folder open the <span class="emphasis">*Windows
    Explorer*</span> and navigate to <span class="emphasis">*My Network
    Places*</span> .

    <div class="figure-float">

    <div id="qs-dav001" class="figure">

    **Figure 3.32. My Network Places**

    <div class="figure-contents">

    <div class="mediaobject">

    ![My Network Places](images/ui/qs-dav001.png)

    </div>

    </div>

    </div>

      

    </div>

2.  You will find an icon or option to <span class="emphasis">*Add
    Network Place*</span> which when double-clicked will lead you to the
    wizard.

    <div class="figure-float">

    <div id="qs-dav002" class="figure">

    **Figure 3.33. Web Folder Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Web Folder Wizard](images/ui/qs-dav002.png)

    </div>

    </div>

    </div>

      

    </div>

3.  The first screen encourages you to type the location of the network
    place, for connecting to a Virtuoso DAV you will need to know the
    server location and port number. If you installed Virtuoso on to
    your local machine taking default options then you would probably be
    typing:

    ``` programlisting
    http://example.com:8889/DAV/
    ```

    <div class="figure-float">

    <div id="qs-dav003" class="figure">

    **Figure 3.34. WebDAV location**

    <div class="figure-contents">

    <div class="mediaobject">

    ![WebDAV location](images/ui/qs-dav003.png)

    </div>

    </div>

    </div>

      

    </div>

4.  You will then be asked for authentication information which will
    require a username and a password. If defaults are taken then this
    would simply be dav and dav for both.

    <div class="figure-float">

    <div id="qs-dav004" class="figure">

    **Figure 3.35. WebDAV authentication**

    <div class="figure-contents">

    <div class="mediaobject">

    ![WebDAV authentication](images/ui/qs-dav004.png)

    </div>

    </div>

    </div>

      

    </div>

5.  To complete the creation of a Web Folder you be asked to supply a
    name for the network place.

    <div class="figure-float">

    <div id="qs-dav005" class="figure">

    **Figure 3.36. Name of your WebDAV Web Folder**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Name of your WebDAV Web Folder](images/ui/qs-dav005.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Once provided Explorer will automatically open a new Window over
    looking the new location.

    <div class="figure-float">

    <div id="qs-dav006" class="figure">

    **Figure 3.37. Files contained in your DAV**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Files contained in your DAV](images/ui/qs-dav006.png)

    </div>

    </div>

    </div>

      

    </div>

7.  You can find your new Web Folder again from My Network Places where
    the link will be saved.

</div>

</div>

</div>
