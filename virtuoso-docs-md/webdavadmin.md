<div id="webdavadmin" class="section">

<div class="titlepage">

<div>

<div>

### 6.2.4. WebDAV Administration

</div>

</div>

</div>

DAV, or WebDAV, is a protocol for Web-based Distributed Authoring and
Versioning. The location where content items are placed is called the
<span class="emphasis">*repository*</span> . Content elements are called
<span class="emphasis">*documents*</span> , corresponding to files, and
<span class="emphasis">*folders/collections*</span> , corresponding to
directories. Collectively these documents and folders (collections) are
known as <span class="emphasis">*resources*</span> .

Virtuoso implements the DAV protocol, allowing you to create and manage
resources either directly through repository manipulations or
indirectly, through a variety of WebDAV services.

<div id="resourcetypes" class="section">

<div class="titlepage">

<div>

<div>

#### DAV Resource Types

</div>

</div>

</div>

To make sure that when Virtuoso serves files to client user agents the
type of file is conveyed properly so that the right application can be
used with that file a list or file types are maintained in the server.
This list is used when sending any content via the HTTP server which
include content in DAV and under VSP.

<div class="figure-float">

<div id="id14689" class="figure">

**Figure 6.75. DAV Resource Types**

<div class="figure-contents">

<div class="mediaobject">

![DAV Resource Types](images/ui/dav_resrctyp_01.png)

</div>

</div>

</div>

  

</div>

The Web Application Server/Content Management/Resource Types page shows
the list of currently defined resource types in the Virtuoso server. You
can edit or remove these types by using the action links on the right
most column of the list next to the type applicable.

Add new types by typing the details into the fields provided and
pressing the <span class="emphasis">*Save*</span> button.

</div>

<div id="contentmanagement" class="section">

<div class="titlepage">

<div>

<div>

#### Content Management

</div>

</div>

</div>

The content management page gives you an interface to the WebDAV
repository resources. From here you can navigate or create directories,
commonly referred to as collections or folders in DAV, alter properties,
upload or remove files, or edit documents.

The Repository tab lists the current location within the tree and the
current login name. The root of the repository is usually `/DAV/` .

<div class="figure-float">

<div id="id14702" class="figure">

**Figure 6.76. Content Management**

<div class="figure-contents">

<div class="mediaobject">

![Content Management](images/webdav.png)

</div>

</div>

</div>

  

</div>

<div id="davcontresnames" class="section">

<div class="titlepage">

<div>

<div>

##### Resource Names

</div>

</div>

</div>

Resource names are given with collection (folder) names listed first,
then individual documents. Permissions on resources are presented in a
style similar to Unix, with (r)ead, (w)rite, and e(x)ecute permissions
listed for the resource owner (the user), the resource's group, and for
the general public. If a permission is present, the letter is shown; if
not, it is replaced with a dash.

</div>

<div id="davcontresperm" class="section">

<div class="titlepage">

<div>

<div>

##### Resource Permissions

</div>

</div>

</div>

Unlike Unix, the Repository does not use the designation 'd' for
directories, which in DAV are more commonly referred to as collections.
Collections are distinguished by a different icon - a folder-like icon -
and by having the type named "collection".

In addition, the permissions string has a trailing letter designating
the indexing status of the resource. This letter is 'n' to designate
that indexing is off, 'r' for recursive indexing, and 't' for direct
indexing.

</div>

<div id="davcontresug" class="section">

<div class="titlepage">

<div>

<div>

##### Resource User and Group

</div>

</div>

</div>

By default, the user and group of a DAV resource are those set by the
service that created the resource, or they are the ID and primary group
of the user who was logged in when the resource was created.

</div>

<div id="davconterssize" class="section">

<div class="titlepage">

<div>

<div>

##### Resource Size

</div>

</div>

</div>

The size of a document resource is its size in disk bytes. Note that
this does not necessarily correspond to characters displayed on the
screen because of encodings. For example, the HTML token
&-a-m-p-semicolon is five bytes on disk but displays as a single screen
character.

</div>

<div id="davcontrestype" class="section">

<div class="titlepage">

<div>

<div>

##### Resource Type

</div>

</div>

</div>

The type of a resource is always "collection" for collections (folder).
For documents it can be any of the known resource types (see Resource
Types below). The resource type is usually based on the resource's
extension; for example, .xml files are usually assumed to be `text/xml`
. If Virtuoso does not recognize the extension of a resource, it assigns
the default type of `application/octet-stream` .

</div>

<div id="davcontpropedt" class="section">

<div class="titlepage">

<div>

<div>

##### Editing Properties

</div>

</div>

</div>

Within the Content Management screen, you can change any of the
properties of a resource, other than its name, by selecting the resource
via the checkbox to the left of the icon, and pressing the "Properties"
button.

<div class="figure-float">

<div id="editres" class="figure">

**Figure 6.77. Edit Resource Properties**

<div class="figure-contents">

<div class="mediaobject">

![Edit Resource Properties](images/ui/editres.png)

</div>

</div>

</div>

  

</div>

XML documents also permit you to edit their XML properties specifically.
This can be done on any document of type text/xml by clicking on the
icon for the document.

<div id="davcontresprops" class="section">

<div class="titlepage">

<div>

<div>

###### Properties

</div>

</div>

</div>

When clicked this button from the bottom of the page, you can edit the
properties for one or a group of resources which should be selected. The
name of a resource cannot be changed.

The owner, group, permissions, and indexing controls on this form apply
to the appropriate properties of resources, as documented above. Changes
to the type of a collection (folder) are ignored.

<div class="figure-float">

<div id="meditres" class="figure">

**Figure 6.78. Multiple Resources Edit Properties**

<div class="figure-contents">

<div class="mediaobject">

![Multiple Resources Edit Properties](images/ui/meditres.png)

</div>

</div>

</div>

  

</div>

The "Property" control permits you to change or add additional
properties. There is a pulldown of predefined XML-related properties, or
you may create your own property.

<div class="figure-float">

<div id="meditres2" class="figure">

**Figure 6.79. Multiple Resources Edit Properties**

<div class="figure-contents">

<div class="mediaobject">

![Multiple Resources Edit Properties](images/ui/meditres2.png)

</div>

</div>

</div>

  

</div>

</div>

<div id="davcontdavprop" class="section">

<div class="titlepage">

<div>

<div>

###### WebDAV Properties

</div>

</div>

</div>

This control permits you to manipulate the specific properties of XML
documents. Existing properties are shown with their values, and can be
removed. New properties can be added.

XML-related properties are generally set by specific XML-related
services and do not need to be edited directly by users; however, this
interface provides a quick means to correct a minor typo or other change
without re-running the entire service. For example, you can change the
*`xml-sql-root`* property, which controls the name of the root XML
element for the document.

</div>

</div>

<div id="davaddnewres" class="section">

<div class="titlepage">

<div>

<div>

##### Adding New Resources

</div>

</div>

</div>

Resources may be added to the repository in two ways: by uploading files
or by creating new collections (folders). Buttons for both these methods
are on the page.

The "Create Folder" button brings up a form in which you can specify the
name of the collection (folder), its owner and group, and the initial
permissions. You may also turn on indexing for the folder's contents at
this point.

<div class="figure-float">

<div id="cfolder" class="figure">

**Figure 6.80. Create Folder**

<div class="figure-contents">

<div class="mediaobject">

![Create Folder](images/ui/cfolder.png)

</div>

</div>

</div>

  

</div>

The "Upload File" button brings up a form in which you can specify the
name and location of a file on your local computer that is to be copied
into the DAV repository. You need to specify the name of the resource in
the repository and give it a type. You can also set the basic repository
properties here.

<div class="figure-float">

<div id="ufile" class="figure">

**Figure 6.81. Upload File**

<div class="figure-contents">

<div class="mediaobject">

![Upload File](images/ui/ufile.png)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div id="freetext" class="section">

<div class="titlepage">

<div>

<div>

#### Free Text

</div>

</div>

</div>

<div id="contentidxmode" class="section">

<div class="titlepage">

<div>

<div>

##### Indexing Mode

</div>

</div>

</div>

When files are inserted into Virtuoso's WebDAV repository, if their type
is a type of text file such as plain text TXT, XML, or HTML, then they
may be automatically free text indexed.

By default files are automatically free text indexed as they are
inserted into Virtuoso. This is very convenient but can be time
consuming if you frequently insert or update text files. For this reason
Virtuoso can be set to index in batch mode at a particular interval in
minutes.

<div class="figure-float">

<div id="id14775" class="figure">

**Figure 6.82. DAV Free Text Index Configuration**

<div class="figure-contents">

<div class="mediaobject">

![DAV Free Text Index Configuration](images/ui/dav_idxprprty_01.png)

</div>

</div>

</div>

  

</div>

To change the free-text index mode to batch mode check the check-box and
provide a non-zero time interval (in minutes). Press the
<span class="emphasis">*Accept*</span> button to save the changes into
the server.

</div>

</div>

</div>
