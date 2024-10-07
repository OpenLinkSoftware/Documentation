<div id="qswebserver" class="section">

<div class="titlepage">

<div>

<div>

## 3.4. Web Server

</div>

</div>

</div>

<div id="qsvirtdir" class="section">

<div class="titlepage">

<div>

<div>

### 3.4.1. Virtual Directories

</div>

</div>

</div>

The term virtual directory applies to the mechanism to hide the physical
location of a Web resource under different path which user agents use to
retrieve it. This mechanism in virtuoso is a part of host definition.

This method is useful when one server has to keep many Web sites. Using
a redirect mechanism is not a universal way to do this. It is better to
define virtual hosts and paths to the directory entries which contain
Web pages.

<div id="qsvirtdirpl" class="section">

<div class="titlepage">

<div>

<div>

#### Creating Virtual Directories Programmatically

</div>

</div>

</div>

For an overview of virtual directories, and how to configure them in PL,
refer to the <a href="ch-webappdevelopment.html#virtdir" class="link"
title="14.1.2. Virtual Directories">Virtual Directories Section</a> .

</div>

<div id="qsvirtdirui" class="section">

<div class="titlepage">

<div>

<div>

#### Setup in Administration Interface

</div>

</div>

</div>

This step by step example will define a virtual directory /help that
will point to the directory /departments/support/

<div class="orderedlist">

1.  From the Conductor UI go to Web Application Server/ Virtual Domains
    & Directories.

    <div class="figure-float">

    <div id="virtdir1" class="figure">

    **Figure 3.22. Http Hosts and Directories**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Http Hosts and Directories](images/ui/virtdir1.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Open the "folder" icon for your {Default Web Site}.

    <div class="figure-float">

    <div id="virtdir2" class="figure">

    **Figure 3.23. Edit URL mappings**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Edit URL mappings](images/ui/virtdir2.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click the link "New Directory" to add a new virtual directory.

    <div class="figure-float">

    <div id="virtdir3" class="figure">

    **Figure 3.24. Add virtual directory**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add virtual directory](images/ui/virtdir3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select for "Type" File system, as this mapping example will be from
    one directory to another, and click "Next".

    <div class="figure-float">

    <div id="virtdir4" class="figure">

    **Figure 3.25. Use File system template**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Use File system template](images/ui/virtdir4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Enter details in the form to define the mapping. Most of the fields
    are optional. In this example, only the logical and physical paths
    and the default page name are required. Click finally the button
    "Save Changes".

    <div class="figure-float">

    <div id="virtdir5" class="figure">

    **Figure 3.26. Mapping details**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Mapping details](images/ui/virtdir5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  The following URLs will then be equivalent:

    |                                                        |
    |--------------------------------------------------------|
    | http://example.com:8890/help                           |
    | http://example.com:8890/departments/support/index.html |

</div>

</div>

</div>

</div>
