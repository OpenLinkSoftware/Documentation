<div id="bloggerendpointconf" class="section">

<div class="titlepage">

<div>

<div>

### 14.7.9. XML-RPC Endpoint Configuration

</div>

</div>

</div>

The Virtuoso blog server can be contacted directly by SOAP XML-RPC. A
virtual directory can be created with blogger APIs (Blogger, MetaWeblog,
MoveableType, Atom) ability, which requires a mapping to the SOAP
endpoint and grants to use the blogger API. This can be done in two
ways:

<div class="orderedlist">

1.  **Using the graphical Server Administration Interface. ** You can
    use your web browser to configure a virtual directory based on the
    "XML-RPC link" template and with bloggerAPI enabled:

    <div class="orderedlist">

    1.  Open a web browser on the Administration User Interface and
        navigate to: Internet Domains; HTTP Virtual Directories; Edit
        URL mappings.

    2.  Create a new virtual directory.

    3.  Select the template for "XML-RPC link".

    4.  Check the option 'bloggerAPI' is enabled, this will expose all
        available blogger APIs to the endpoint (Blogger, MetaWeblog,
        MoveableType, Atom).

    5.  Configure the logical path.

    6.  Click Add to save the definition.

    </div>

    <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

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
    href="admui.internetdomains.html#httpvirtualdirs" class="link"
    shape="rect" title="HTTP Virtual Directories">Virtual Directory
    Administration UI</a></p>
    <p><a href="fn_vhost_define.html" class="link" shape="rect"
    title="VHOST_DEFINE">vhost_define()</a></p>
    <p><a href="fn_vhost_remove.html" class="link" shape="rect"
    title="VHOST_REMOVE">vhost_remove()</a></p></td>
    </tr>
    </tbody>
    </table>

    </div>

    The new logical path now will support XML-RPC and will support
    blogger API requests.

2.  **Programmatical: Script & ISQL. ** This method gives you full
    control, you must perform all steps to allow full support for the
    blogger API on a virtual directory. Below is a template list of
    commands that could be in a script.

    Using a script, `blogserver.sql` , with following contents:

    ``` programlisting
    vhost_define (
      lpath=>'/RPC2',
      ppath=>'/SOAP/',
      soap_user=>'$U{usr}',
      soap_opts=>vector ('XML-RPC', 'yes')
      );

    grant execute on "blogger.newPost" to $U{usr};
    grant execute on "blogger.editPost" to $U{usr};
    grant execute on "blogger.deletePost" to $U{usr};
    grant execute on "blogger.getPost" to $U{usr};
    grant execute on "blogger.getRecentPosts" to $U{usr};
    grant execute on "blogger.getUsersBlogs" to $U{usr};
    grant execute on "blogger.getTemplate" to $U{usr};
    grant execute on "blogger.setTemplate" to $U{usr};
    grant execute on "blogger.getUserInfo" to $U{usr};
    grant execute on "metaWeblog.newPost" to $U{usr};
    grant execute on "metaWeblog.editPost" to $U{usr};
    grant execute on "metaWeblog.getPost" to $U{usr};
    grant execute on "metaWeblog.getRecentPosts" to $U{usr};
    grant execute on "mt.getRecentPostTitles" to $U{usr};
    grant execute on "mt.getCategoryList" to $U{usr};
    grant execute on "mt.setPostCategories" to $U{usr};
    grant execute on "mt.getPostCategories" to $U{usr};
    grant execute on "mt.getTrackbackPings" to $U{usr};
    grant execute on "mt.publishPost" to $U{usr};
    grant execute on "mt.supportedMethods" to $U{usr};
    ```

    One can start ISQL using the following parameters:

    ``` programlisting
    $ isql 1111 dba dba -u usr="<SQL user for execution>" blog_server.sql
    ```

    Where "\<SQL user for execution\>" is an existing SQL user account
    other than dba.

    <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

    |                              |                                                                                                                                                                                                                                                                                  |
    |:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                            |
    |                              | If you specify the "dba" as user for SOAP execution in a virtual directory, the grant statements will not be needed and this will open a security hole. So this approach is not recommended. It is always better to have a separate user for SOAP execution with limited rights. |

    </div>

</div>

</div>
