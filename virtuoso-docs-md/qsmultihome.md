<div id="qsmultihome" class="section">

<div class="titlepage">

<div>

<div>

### 3.4.2. Multi Homing

</div>

</div>

</div>

The term Multi Homing refers to the practice of maintaining more than
one server on one machine, differentiated by their apparent host name.
It is often desirable for companies sharing a web server to have their
own domains, with web servers accessible as www.company1.com and
www.company2.com, without requiring the user to know any extra path
information.

<div id="qsvirthostpl" class="section">

<div class="titlepage">

<div>

<div>

#### Creating Multiple Homes Programmatically

</div>

</div>

</div>

For an overview of Multi Homing, and how to configure it with PL, refer
to the
<a href="ch-webappdevelopment.html#virtandmultihosting" class="link"
title="Virtual Hosting and Multi Hosting">Virtual Hosting and Multi
Hosting</a> section.

</div>

<div id="qsvirthostui" class="section">

<div class="titlepage">

<div>

<div>

#### Setup in Administration Interface

</div>

</div>

</div>

This step by step example will define a virtual home for the URL
http://www.ahelp.com/ to the server www.a.com and directory
/departments/support/

<div class="orderedlist">

1.  Have a domain name allocated in the DNS for the ahelp.com that
    points to the same IP address of the a.com that is hosting a
    Virtuoso server.

2.  From the Conductor UI go to Web Application Server/ Virtual Domains
    & Directories.

    <div class="figure-float">

    <div id="qsvirtdir1" class="figure">

    **Figure 3.27. Http Hosts and Directories.**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Http Hosts and Directories.](images/ui/virtdir1.png)

    </div>

    </div>

    </div>

      

    </div>

3.  To add a new host definition, enter for "Port" 80, enter for "HTTP
    Host" www.ahelp.com and select the "Add" button.

    <div class="figure-float">

    <div id="virthost2" class="figure">

    **Figure 3.28. Add new site**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add new site](images/ui/virthost2.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Click for the new defined site the "Edit" link in order to define
    the mapping between the virtual host and the actual listening host
    domain names.

    <div class="figure-float">

    <div id="virthost3" class="figure">

    **Figure 3.29. New site mapping**

    <div class="figure-contents">

    <div class="mediaobject">

    ![New site mapping](images/ui/virthost3.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Click the "folder" icon for the new defined site and then click the
    "Edit" link for the Logical Path "/".

    <div class="figure-float">

    <div id="virthost3a" class="figure">

    **Figure 3.30. Set Logical Path**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Set Logical Path](images/ui/virthost3a.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Enter details in the form to define the mapping. Most of the fields
    are optional. In this example, only the logical and physical paths
    and the default page name are required.

    <div class="figure-float">

    <div id="virthost4" class="figure">

    **Figure 3.31. Mapping details**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Mapping details](images/ui/virthost4.png)

    </div>

    </div>

    </div>

      

    </div>

7.  The following URLs will then be equivalent:

    |                                                 |
    |-------------------------------------------------|
    | http://www.ahelp.com/                           |
    | http://www.a.com/departments/support/index.html |

</div>

</div>

</div>
