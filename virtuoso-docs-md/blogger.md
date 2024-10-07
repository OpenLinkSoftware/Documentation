<div id="blogger" class="section">

<div class="titlepage">

<div>

<div>

## 14.7. Blogging & Weblogs

</div>

</div>

</div>

Weblogs, or Blog, are web pages or sites organized by date. The content
of a typical blog page contains short messages listed in chronological
order. The blog messages are typically excerpts of HTML markup, since
they typically appear on web sites and expect web browsers as clients.

In the rest of this document we will use interchangeable the terms
"blog" and "weblog", and refer to the users that have a blog as
"bloggers".

The following terms are also commonly used in this section:

|                                                                                                                                                                                                                                     |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*RSS/OCS/OPML/RDF/Atom*</span> - file formats, XML based to represent data or list of files containing a data                                                                                                |
| <span class="emphasis">*Channels*</span> - a public source containing data in any of XML/text/HTML format, usually in RSS format.                                                                                                   |
| <span class="emphasis">*Post/Article(message)*</span> - this is a piece of information describing something in a human readable format, in some language. This can be have satellite parts as title, excerpt, publication data etc. |
| <span class="emphasis">*PermaLink*</span> - a URL that uniquely designates a single article in blog-space and time.                                                                                                                 |

The Virtuoso Blog system comprises a native Web-based interface for
publishing and blog administration, but can also be interacted with
using an XML-RPC API. The Virtuoso server supports the following XML-RPC
APIs for blogging purposes:

|                |
|----------------|
| Blogger API    |
| MetaWeblog API |
| Movable Type   |

In addition to the blogger APIs Virtuoso supports:

|                                                                                                                                              |
|----------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*xmlStorageSystem*</span> - this allows blogging clients to upload static (ready to go) content onto a Weblog server. |
| <span class="emphasis">*Weblogs ping API*</span> - to allow cross-server notification for the latest updated sites/blogs                     |
| <span class="emphasis">*Pingback and Trackback API*</span> - to allow bloggers to notify each other.                                         |
| <span class="emphasis">*Subscription Harmonizer*</span> - to allow bloggers to keep their subscriptions in-sync.                             |

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
<td style="text-align: left;" data-valign="top"><p>Blogger System Tables
<a href="http://xmlrpc.free-conversant.com/docs/bloggerAPI"
class="ulink" target="_top" shape="rect">Blogger API</a></p>
<p><a href="http://www.xmlrpc.com/metaWeblogApi" class="ulink"
target="_top" shape="rect">MetaWeblog API</a></p></td>
</tr>
</tbody>
</table>

</div>

<div id="blogvirtblogapp" class="section">

<div class="titlepage">

<div>

<div>

### 14.7.1. The Virtuoso Blogging Application

</div>

</div>

</div>

Blogs provide their authors with a location on the Internet or Intranet
to receive their thoughts, experiences, idea, or simply anything they
have a desire to write about. For this most part, audience is neither
expected nor required, however comments and feedback are common place.

Blogs originated as a form of public diary. Their exploitation has seen
them as a useful tool for finding personal reviews to products,
situations or general news as guidance for their readers. These can be
viewed quicker and more informative than regular journalism.

Corporate blogs, or use of blogging can be a valuable source of company
information propagation. Members of the company can blog about the
activities or findings with no particular audience in mind. This
provides a continual journal or account of the company's undertakings
that is really self-documenting for every other employee how they fit
into the overall picture. Over time a searchable knowledge base will
unravel itself, people may need information about a product or some
aspect of internal support that took place possibly years prior,
otherwise forgotten, stored within the blog.

Virtuoso implements the three major APIs for blogging which makes
instantly attractive to any standard blog application. Virtuoso provides
blog authoring applications of its own. On a personal level, your blogs
can be stored or exposed using the most appropriate server, authored
using the most appealing client and everything held in right places by
Virtuoso. On a community level you get the same but scaled upwards for
each member individually, and further more, centrally. Virtuoso can
generate and automatically maintain a blog site specially for blog
collaboration within a community suitable for a corporate need. All
members are listed on the front page and have the opportunity to
contribute (publish) to the main blog view. All blogs are fully free
text searchable - a simple exploit of the Virtuoso free-text engine.

Virtuoso can provide the blog client, server or relay for blogs or any
RSS or XML-feed based channel or information.

<div class="figure-float">

<div id="blog001" class="figure">

**Figure 14.50. Virtuoso Blogging Conceptual Diagram**

<div class="figure-contents">

<div class="mediaobject">

![Virtuoso Blogging Conceptual Diagram](images/VirtuosoBlog.jpg)

</div>

</div>

</div>

  

</div>

<div id="blogsyndicateyourblog" class="section">

<div class="titlepage">

<div>

<div>

#### Syndication to your Blog - RSS & RDF

</div>

</div>

</div>

The default Virtuoso blog implementation maintains a "blog/gems"
subdirectory for each blog account. Within this is an RDF file and an
RSS file. These provide direct access to the blog information in XML.
Other bloggers or news syndicators can read just the site contents,
apart from the web interface that Virtuoso provides, potentially
applying an XSLT transformations suitable to their application or
circumstance, for example reading the blog from a PDA or mobile device.

Rich Site Summary (RSS) is a lightweight XML format designed for sharing
headlines and other Web content. Think of it as a distributable "What's
New" for your site. Each RSS text file contains both static information
about your site, plus dynamic information about your new blog entries.
Each entry is defined by an \<item\> tag, which contains a headline
TITLE, URL, and DESCRIPTION. For example:

``` programlisting
...
<item>
  <title>RSS Resources</title>
  <link>http://www.webreference.com/authoring/languages/xml/rss/</link>
  <description>Defined in XML, the Rich Site Summary (RSS) format has
  quietly become a dominant format for distributing headlines on the Web.
  Our list of links gives you the tools, tips and tutorials you need to get
  started using RSS. 0323</description>
</item>
...
```

The Resource Description Framework (RDF) integrates a variety of
applications from library catalogs and world-wide directories to
syndication and aggregation of news, software, and content to personal
collections of music, photos, and events using XML as an interchange
syntax. The RDF specifications provide a lightweight ontology system to
support the exchange of knowledge on the Web.

</div>

<div id="blogchannels" class="section">

<div class="titlepage">

<div>

<div>

#### Channels - OCS & OPML

</div>

</div>

</div>

The default Virtuoso blog implementation maintains a "blog/gems"
subdirectory for each blog account. Within this are an OCS file and an
OPML file. Both files provide an outline or hierarchical list of RSS
feeds linked to the blog account in these two popular formats designed
for channel/list exchange. The files are variably accessible following:

``` programlisting
http://virtserv/DAV/myaccount/blog/gems/index.ocs
http://virtserv/DAV/myaccount/blog/gems/index.opml
```

Open Content Syndication (OCS), an application of XML, is an RDF
description of all external RSS feeds linked to the blog site.

The OCS Directory format is designed to enable channel listings to be
constructed for use by portal sites, client based headline software and
other similar applications.

Outline Processor Markup Language (OPML) is a very simple XML format for
storing information in outline format. XML being inherently
hierarchical, OPML constrains XML so that a wide variety of applications
can build in OPML support with the comfort of knowing it will work with
any other OPML tool. Type of information stored in such hierarchies are
web browser bookmarks, web directories, collaborative outlines, song
playlists, and even web-site content, OPML is a great balance between
the wide open freedom of raw XML and the feeling of security of a formal
vocabulary.

The OCS RDF file is an XML of nested \<rdf:descriptions\> tags loosely
defined as follows:

``` programlisting
<rdf:RDF>
  <rdf:description>
      This contains a description of this RDF originator
    <rdf:description>
        Description of a link RSS blog or news feed
       <rdf:description>
         Description of the URL containing the above described
         RSS feed and details about its format, update frequency
         and when the link for established.
       </rdf:description>
    </rdf:description>
      more RSS descriptions may follow, one for each
      linked.
  </rdf:description>
</rdf:RDF>
```

Here is an example of the contents of the index.ocs file describing a
single linked RSS news feed.

``` programlisting
<rdf:RDF
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:ocs="http://InternetAlchemy.org/ocs/directory#"
    xmlns:dc="http://purl.org/metadata/dublin_core#">
  <rdf:description about="">
  <dc:title>My Blog</dc:title>
  <dc:creator>blog@openlinksw.com</dc:creator>
  <dc:description />
  <rdf:description about="http://msdn.microsoft.com/">
    <dc:title>MSDN Just Published</dc:title>
    <dc:creator />
    <dc:description />
    <dc:subject />
    <dc:image />
    <rdf:description about="http://msdn.microsoft.com/rss.xml">
      <dc:language>us-en</dc:language>
      <ocs:format />
      <ocs:updatePeriod>hourly</ocs:updatePeriod>
      <ocs:updateFrequency>1</ocs:updateFrequency>
      <ocs:updateBase>1999-05-30T00:00</ocs:updateBase>
    </rdf:description>
  </rdf:description>
</rdf:RDF>
```

The OPML file is more simple, the corresponding index.opml would be as
follows:

``` programlisting
<opml>
  <body>
    <outline
      title="MSDN Just Published"
      htmlUrl="http://msdn.microsoft.com/"
      xmlUrl="http://msdn.microsoft.com/rss.xml" />
    more outline tags for each description...
  </body>
</opml>
```

</div>

<div id="blogpersonalblog" class="section">

<div class="titlepage">

<div>

<div>

#### Personal Blog Sites

</div>

</div>

</div>

Every WebDAV account with a home directory has the option to create a
default personal blog site. The default blog pages contains a call to a
function that produces XML data containing a list of messages, calendar
for archive navigation and channels that the owner has subscribed to.
This blog directory and pages are generated upon initial sign-in of the
user. Each WebDAV account with a blog directory will thus have the
following:

``` programlisting
http://<host:port>/DAV/<uname>/blog/
```

containing the following:

|                                                                                                                                                                                       |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*index.vspx*</span> - The default blog home page using VSPX controls.                                                                                          |
| <span class="emphasis">*gems/rss.xml*</span> - The RSS v2.0 file presenting the user's blog data.                                                                                     |
| <span class="emphasis">*gems/rss92.xml*</span> - The RSS v0.92 file presenting the user's blog data.                                                                                  |
| <span class="emphasis">*gems/rss91.xml*</span> - The RSS v0.91 file presenting the user's blog data.                                                                                  |
| <span class="emphasis">*gems/index.rdf*</span> - the user's blog data in RDF format.                                                                                                  |
| <span class="emphasis">*gems/index.ocs*</span> - the user's channels represented in OCS format.                                                                                       |
| <span class="emphasis">*gems/rsd.xml*</span> - Really Simple Discovery file for the blog. This helps client software to find the services needed to read, edit, post etc.             |
| <span class="emphasis">*gems/atom.xml*</span> - Atom feed file. It's similar to the RSS file but in different format.                                                                 |
| <span class="emphasis">*gems/backlog.xml*</span> - RSS v2.0 file containing all posts in user's blog.                                                                                 |
| <span class="emphasis">*gems/foaf.xml*</span> - 'Friend Of Friend' file. This is to provide in a machine-processable format, about blogger, his/she interests, location, friends etc. |
| <span class="emphasis">*gems/index.opml*</span> - the user's channels represented in OPML format.                                                                                     |
| <span class="emphasis">*gems/ocs.xml*</span> - the user's channels represented in OCS format.                                                                                         |
| <span class="emphasis">*gems/opml.xml*</span> - the user's channels represented in OPML format.                                                                                       |
| <span class="emphasis">*comments.vsp*</span> - a VSP page for posting a comment to the user's blog.                                                                                   |
| <span class="emphasis">*default.xsl*</span> - an XSL-T style sheet providing the default HTML view of the blog XML data.                                                              |
| <span class="emphasis">*comments.vsp*</span> - pop-up for blog comments (obsoleted)                                                                                                   |
| <span class="emphasis">*default.css*</span> - CSS for pages                                                                                                                           |
| <span class="emphasis">*main.xsl*</span> - VSPX controls for index.vspx                                                                                                               |
| <span class="emphasis">*calendar.xsl*</span> - calendar control                                                                                                                       |
| <span class="emphasis">*trackback.xsl*</span> - pop-up for trackbacks (obsoleted)                                                                                                     |
| <span class="emphasis">*rss_feeds/*</span> - folder containing channel RSS feeds in XML format                                                                                        |

The `rss.xml` , `index.rdf` , `index.ocs` files are dynamic SQL-XML
resources, they are not static files and must not be deleted. Their
content is generated in real-time per request.

Blog users may edit the `default.xsl` in order to change the appearance
of the default page of their Blog.

<div id="ex_defaultbloghome" class="example">

**Example 14.52. Default blog home (index.vspx) page**

<div class="example-contents">

The following is source of default blog home page. It's built using a
VSPX and macro expansion. All page components are represented with
\<vm:\* /\> this makes page more simpler and allows users to change it's
appearance using custom VSPX components.

``` programlisting
<v:page xmlns:vm="http://example.com/vspx/weblog/"
  xmlns:v="http://example.com/vspx/"
  style="main.xsl" name="blog-home-page"
  doctype="-//W3C//DTD XHTML 1.0 Transitional//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <vm:page
xml:id="<uid>">
    <vm:header>
      <vm:title/>
      <vm:disco-rss-link/>
      <vm:disco-pingback-link/>
      <vm:meta-author/>
      <vm:meta-description/>
      <vm:meta-keywords/>
      <vm:style url="default.css" />
    </vm:header>
    <vm:body>
      <div
xml:id="header">
        <img src="/blog/blogs/images/bloglogo.jpg" alt="OpenLink Virtuoso Blog"/>
        <h1><vm:blog-title/></h1>
        <h2><vm:blog-about/></h2>
      </div>
      <div
xml:id="navbartop">
        <div>Entries: [ <vm:entry-list /> ]</div>
      </div>
      <table
xml:id="pagecontainer" cellspacing="10" cellpadding="0" border="0" width="100%">
        <tr>
          <td class="box">
         <div class="box">
                  <div class="roll" style="border: none; border">
                    <div align="center" style="margin-bottom: 3px;">
                      <b>Personal Details</b>
                    </div>
            <div style="margin-bottom: 3px;"><vm:site-home>Home</vm:site-home></div>
            <vm:if test="contact">
                    <div>
              <vm:e-mail> Contact</vm:e-mail>
            </div>
            </vm:if>
            <div>
              <vm:photo width="64" />
            </div>
                  </div>
          <vm:if test="login">
                  <div class="roll" >
                    <div align="center" style="margin-bottom: 3px;">
                      <b>Configuration</b>
                    </div>
                    <vm:configpages />
                  </div>
          </vm:if>
                  <div class="roll">
                  <div align="center" style="margin-bottom: 3px;">
                    <b>Syndicate This Blog</b>
                  </div>
                    <vm:rss-link/>
                    <vm:rdf-link/>
                    <vm:ocs-link/>
                    <vm:opml-link/>
                  </div>
                  <div align="left" class="roll">
                    <p class="caption">Keyword search:</p>
                    <vm:search/>
                  </div>
                  <div class="roll">
                    <div align="center" style="margin-bottom: 3px;">
                      <b>Post Categories</b>
                    </div>
            <vm:login />
                    <vm:categories/>
                  </div>
        <vm:if test="subscribe">
                <div align="left" class="roll">
                  <p class="caption">Subscribe</p>
          <vm:subscribe/>
        </div>
        </vm:if>
        <div align="left" class="roll">
           <vm:last-messages />
        </div>
          </div>
          </td>
          <td
xml:id="texttd">
         <div
xml:id="text">
              <vm:post-form />
                  <vm:posts trackback="discovery" />
          <vm:if test="comments">
          <vm:comments-view>
            <vm:trackbacks />
            <vm:comments />
            <vm:post-comment />
          </vm:comments-view>
          </vm:if>
             </div>
          </td>
          <td class="box">
        <div class="box">
                  <vm:calendar/>
          <vm:if test="blog">
                  <div class="roll">
                    <div align="center">
                      <b>Blog Roll</b>
                    </div>
                    <vm:rss/>
                  </div>
          </vm:if>
          <vm:if test="channels">
                  <div class="roll">
                    <div align="center">
                      <b>Channel Roll</b>
                    </div>
                    <vm:channels/>
                  </div>
          </vm:if>
          <vm:if test="ocs">
                  <div class="roll">
                    <div align="center" style="margin-bottom: 3px;">
                      <b>OCS Links</b>
                    </div>
                    <vm:ocs/>
                  </div>
          </vm:if>
          <vm:if test="opml">
                  <div class="roll">
                    <div align="center" style="margin-bottom: 3px;">
                      <b>OPML Links</b>
                    </div>
                    <vm:opml/>
                  </div>
          </vm:if>
          </div>
          </td>
        </tr>
      </table>
      <div
xml:id="powered">
        <vm:powered-by/>
      </div>
      <div class="disclaimer">
      <vm:disclaimer/>
        </div>
      <div class="copy">
        <vm:copyright/>
      </div>
    </vm:body>
  </vm:page>
</v:page>
```

</div>

</div>

  

<div id="ex_bloghome" class="example">

**Example 14.53. Blog home (index.vsp) page**

<div class="example-contents">

The XML Schema representing the XML data for blog home page is
represented below. Following this fragment is the `default.xsl` XSL
style sheet that would be used to transform XML document valid to this
into the default web page for public consumption on the Internet or
Intranet.

``` programlisting
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="about">
    <xs:complexType/>
  </xs:element>
  <xs:element name="blog">
    <xs:complexType mixed="true">
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:element ref="title"/>
        <xs:element ref="about"/>
        <xs:element ref="email"/>
        <xs:element ref="items"/>
        <xs:element ref="navigation"/>
        <xs:element ref="copy"/>
        <xs:element ref="disclaimer"/>
      </xs:choice>
      <xs:attribute name="base" type="xs:anyURI"/>
      <xs:attribute name="category" type="xs:string"/>
      <xs:attribute name="category-name" type="xs:string"/>
      <xs:attribute name="post" type="xs:string"/>
      <xs:attribute name="trackback-url" type="xs:anyURI"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="blogroll">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="link"/>
      </xs:sequence>
      <xs:attribute name="id" type="xs:boolean" use="required"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="calendar">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="week" maxOccurs="unbounded"/>
      </xs:sequence>
      <xs:attribute name="monthname" type="xs:string" use="required"/>
      <xs:attribute name="year" type="xs:short" use="required"/>
      <xs:attribute name="month" type="xs:byte" use="required"/>
      <xs:attribute name="day" type="xs:byte" use="required"/>
      <xs:attribute name="prev" type="xs:string" use="required"/>
      <xs:attribute name="prev-label" type="xs:string" use="required"/>
      <xs:attribute name="next" type="xs:string" use="required"/>
      <xs:attribute name="next-label" type="xs:string" use="required"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="categories">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="category" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="category">
    <xs:complexType>
      <xs:attribute name="id" use="required" type="xs:NMTOKEN" />
      <xs:attribute name="name" use="required" type="xs:string" />
    </xs:complexType>
  </xs:element>
  <xs:element name="comments" type="xs:boolean"/>
  <xs:element name="copy" type="xs:string"/>
  <xs:element name="day">
    <xs:complexType>
      <xs:simpleContent>
        <xs:extension base="xs:string">
          <xs:attribute name="active" use="required">
            <xs:simpleType>
              <xs:restriction base="xs:NMTOKEN">
                <xs:enumeration value="0"/>
                <xs:enumeration value="1"/>
              </xs:restriction>
            </xs:simpleType>
          </xs:attribute>
        </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
  </xs:element>
  <xs:element name="description" type="xs:string"/>
  <xs:element name="disclaimer" type="xs:string"/>
  <xs:element name="email" type="xs:string"/>
  <xs:element name="id" type="xs:string" />
  <xs:element name="item">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="description"/>
        <xs:element ref="pubDate"/>
        <xs:element ref="id"/>
        <xs:element ref="comments"/>
        <xs:element ref="trackbacks"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="items">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="item" maxOccurs="unbounded"/>
        <xs:element ref="last"/>
      </xs:sequence>
      <xs:attribute name="search" type="xs:string" use="required"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="last">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="message" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="link">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="blog"/>
      </xs:sequence>
      <xs:attribute name="href" type="xs:anyURI" use="required"/>
      <xs:attribute name="rss" type="xs:anyURI" use="required"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="message">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="id"/>
        <xs:element ref="title"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="navigation">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="calendar"/>
        <xs:element ref="blogroll"/>
        <xs:element ref="categories"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="pubDate" type="xs:string"/>
  <xs:element name="title">
    <xs:complexType>
      <xs:simpleContent>
        <xs:extension base="xs:string">
          <xs:attribute name="blogid" type="xs:byte"/>
        </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
  </xs:element>
  <xs:element name="trackbacks" type="xs:boolean"/>
  <xs:element name="week">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="day" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>
```

The XML data as following XML Schema above will be transformed using the
following XSL-T style sheet, default.xsl:

``` programlisting
<?xml version="1.0"?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
    xmlns:vb="http://example.com/weblog/"
    xmlns:vtb="http://example.com/weblog/tb/" >

  <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    indent="yes" encoding="UTF-8" omit-xml-declaration="yes" media-type="text/html"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:value-of select="//title[1]"/>
        </title>
        <link rel="alternate" type="application/rss+xml" title="RSS" href="{/blog/@base}gems/rss.xml"/>
        <link rel="stylesheet" type="text/css" href="default.css"/>
      </head>
      <body>
        <div
xml:id="header_01">
          <img src="/blog/blogs/images/bloglogo.jpg" alt="OpenLink Virtuoso Blog"/>
          <h1>
            <xsl:value-of select="/blog/title"/>
          </h1>
      <xsl:if test="/blog/about != ''">
          <h2><xsl:value-of select="/blog/about"/></h2>
          </xsl:if>
        </div>
        <div
xml:id="navbartop_01">
          <div>Entries: [ <xsl:call-template name="entrylist"/> ]</div>
        </div>
        <table
xml:id="pagecontainer_01" cellspacing="10" cellpadding="0" border="0" width="100%">
          <tr>
            <td class="box">
              <div class="box">
                <div align="left" class="roll" style="border: none; border">
                    <div align="center" style="margin-bottom: 3px;">
                      <b>Personal Details</b>
                    </div>
          <div>
                  <a>
            <xsl:attribute name="href">mailto:<xsl:value-of select="/blog/email" /></xsl:attribute>
          <img src="/blog/blogs/images/mailto.gif" border="0" alt="mailto"/>
          </a> Contact
          </div>
        </div>
                <div class="roll">
                  <div align="center" style="margin-bottom: 3px;">
                    <b>Syndicate This Blog</b>
                  </div>
                  <div>
                    <a href="gems/rss.xml">
                      <img src="/blog/blogs/images/xml.gif" border="0" alt="rss"/>
                      RSS</a>
                  </div>
                  <div>
                    <a href="gems/index.rdf">
                      <img src="/blog/blogs/images/rdf48.gif" border="0" alt="rdf"/>
                      RDF</a>
                  </div>
                  <div>
                    <a href="gems/index.ocs"><img src="/blog/blogs/images/xml.gif" border="0" alt="ocs"/>OCS</a>
                  </div>
                  <div>
                    <a href="gems/index.opml"><img src="/blog/blogs/images/xml.gif" border="0" alt="opml"/>OPML</a>
                  </div>
                </div>
                <div align="left" class="roll">
                  <p class="caption">Keyword search</p>
                  <form method="post" action="index.vsp">
                    <div>
                      <input type="text" name="txt" value="" size="10"/>
                      <input type="submit" name="GO" value="GO"/>
                    </div>
                    <div>
                      <input type="radio" name="srch_where" value="blog" checked="checked"/>&#160;My Blog</div>
                    <div>
                      <input type="radio" name="srch_where" value="web"/>&#160;The Web</div>
                  </form>
                </div>
                <xsl:apply-templates select="/blog/navigation/categories"/>
                <div align="left" class="roll">
          <xsl:for-each select="/blog/items/last/message">
            <div>
              <a>
                        <xsl:attribute name="href">index.vsp?id=<xsl:value-of select="id" /></xsl:attribute>
            <xsl:value-of select="title" />
              </a>
            </div>
          </xsl:for-each>
        </div>
              </div>
            </td>
            <td
xml:id="texttd_01">
              <xsl:apply-templates select="/blog/items"/>
            </td>
            <td class="box">
              <div class="box">
                <xsl:apply-templates select="/blog/navigation/calendar"/>
                <xsl:apply-templates select="/blog/navigation/blogroll"/>
                <xsl:apply-templates select="/blog/navigation/channelroll"/>
                <xsl:apply-templates select="/blog/navigation/ocs"/>
                <xsl:apply-templates select="/blog/navigation/opml"/>
              </div>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="title|navigation"/>

  <xsl:template name="entrylist">
    <xsl:for-each select="/blog/items/item">
      <a href="#{id}">
        <xsl:number level="multiple" format=" 1 " count="item"/>
      </a>
      <xsl:if test="following-sibling::item"> | </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="items">
    <div
xml:id="text_01">
      <xsl:if test="/blog/@category-name != ''">
        <h3>Category: "<xsl:value-of select="/blog/@category-name"/>"</h3>
      </xsl:if>
      <xsl:apply-templates select="item"/>
      <xsl:if test="/blog/@post != ''">
      <div><a name="tb" /><h3>TrackBacks</h3>

<div class="tb-url">TrackBack URL for this entry:
<br/>
<b>
<xsl:value-of select="/blog/@trackback-url"/>
<xsl:value-of select="/blog/@post"/>
</b>
<br />
      PingBack URL for this entry:<br/>
      <b><xsl:value-of select="/blog/@pingback-url"/></b>
      </div>
      <xsl:apply-templates select="trackbacks"/>
      </div>
      <div><a name="comments" /><h3>Comments</h3>
      <xsl:if test="not post-comments">
      <div>No comments posted yet</div>
      </xsl:if>
      <xsl:apply-templates select="post-comments"/>
      <div>
        <form method="post" action="index.vsp">
        <input type="hidden" name="id">
        <xsl:attribute name="value"><xsl:value-of select="/blog/@post" /></xsl:attribute>
        </input>
    <table border="0">
        <tr><td>Name</td><td><input type="text" name="name" value="" size="50"/></td></tr>
        <tr><td>Email</td><td><input type="text" name="email" value=""  size="50"/></td></tr>
        <tr><td>Web Site</td><td><input type="text" name="url" value=""  size="50"/></td></tr>
        <tr><td colspan="2">Comment</td></tr>
        <tr><td colspan="2"><textarea name="comment" rows="15" cols="50">&#160;</textarea></td></tr>
        <tr><td colspan="2"><input type="submit" name="submit" value="Submit" /></td></tr>
        </table>
        </form>
      </div>
      </div>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="not item and @search != ''">
  No messages found containing "<xsl:value-of select="@search"/>".
  </xsl:when>
        <xsl:when test="not item and /blog/@category != ''">
  No messages found for category  "<xsl:value-of select="/blog/@category-name"/>".
  </xsl:when>
        <xsl:when test="not item and @search = '' and /blog/@cat = ''">
          <div class="message">
  This is a placeholder for your new weblog.
  There are no posts currently.
  </div>
        </xsl:when>
      </xsl:choose>
      <div
xml:id="powered_01">
        <a href="http://example.com/virtuoso/">
          <img src="/blog/blogs/images/PoweredByVirtuoso.gif" border="0" alt="powered by" />
        </a>
      </div>
      <div class="disclaimer">
        <xsl:value-of  select="/blog/disclaimer" disable-output-escaping="yes" />
      </div>
      <div class="copy">
        <xsl:value-of select="/blog/copy" disable-output-escaping="yes" />
      </div>
    </div>
  </xsl:template>

  <xsl:template match="item">
    <a name="{id}"/>
    <div class="message">
      <xsl:apply-templates select="pubDate"/>
      <xsl:apply-templates select="description"/>
      <xsl:if test="function-available('vb:mt_track_back_discovery')">
    <xsl:value-of select="vb:mt_track_back_discovery (id)" disable-output-escaping="yes" />
      </xsl:if>
      <div class="comment">
        <a href="#">
      <xsl:attribute name="href">index.vsp?id=<xsl:value-of select="id"/>#comments</xsl:attribute>
    Comments [<xsl:value-of select="comments"/>]
   </a> | <a href="#">
      <xsl:attribute name="href">index.vsp?id=<xsl:value-of select="id"/>#tb</xsl:attribute>
    TrackBack [<xsl:value-of select="trackbacks"/>]
        </a>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="post-comments">
    <div class="message">
      <xsl:apply-templates select="posted"/>

<a>
<xsl:attribute name="href">
<xsl:value-of select="home"/>
</xsl:attribute>
<b>
<xsl:apply-templates select="name"/>
</b>
</a>
      <div class="desc">
        <xsl:value-of select="vb:tidy_xhtml (comment, '*default*')" disable-output-escaping="yes"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="trackbacks">
    <div class="message">
      <xsl:apply-templates select="posted"/>

<a>
<xsl:attribute name="href">
<xsl:value-of select="url"/>
</xsl:attribute>
<b>
<xsl:apply-templates select="blog-name"/>
</b>
</a>
      <div class="desc">
      <b><xsl:apply-templates select="title"/></b>
        <xsl:value-of select="vb:tidy_xhtml (excerpt, '*default*')" disable-output-escaping="yes"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="description">
    <div class="desc">
      <xsl:choose>
      <xsl:when test="function-available('vb:tidy_xhtml')">
        <xsl:value-of select="vb:tidy_xhtml (., '*default*')" disable-output-escaping="yes"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="." disable-output-escaping="yes"/>
      </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <xsl:template match="pubDate">
    <div class="pubdate">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <xsl:template match="posted">
    <div class="pubdate">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <xsl:template match="blogroll">
    <div class="roll">
      <div align="center">
        <b>Blog Roll</b>
      </div>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="channelroll">
    <div class="roll">
      <div align="center">
        <b>Channel Roll</b>
      </div>
      <xsl:apply-templates/>
    </div>
</xsl:template>

  <xsl:template match="opml">
    <div class="roll">
      <div align="center" style="margin-bottom: 3px;">
        <b>OPML Links</b>
      </div>
      <xsl:for-each select="link">
        <a>
          <xsl:attribute name="href"><xsl:value-of select="@rss"/></xsl:attribute>
          <b>
            <xsl:value-of select="blog"/>
          </b>
        </a>
        <div style="margin-left:1em;">
          <xsl:apply-templates select="link"/>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>

  <xsl:template match="ocs">
    <div class="roll">
      <div align="center" style="margin-bottom: 3px;">
        <b>OCS Links</b>
      </div>
      <xsl:for-each select="link">
        <a>
          <xsl:attribute name="href"><xsl:value-of select="@rss"/></xsl:attribute>
          <b>
            <xsl:value-of select="blog"/>
          </b>
        </a>
        <div style="margin-left:1em;">
          <xsl:apply-templates select="link"/>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>

  <xsl:template match="categories[category]">

  <xsl:variable name="dt" select="concat(//calendar/@year, '-', //calendar/@month, '-', //calendar/@day)"/>
    <div class="roll">
      <div align="center" style="margin-bottom: 3px;">
        <b>Post Categories</b>
      </div>
      <div>
        <a>
          <xsl:attribute name="href">index.vsp?date=<xsl:value-of select="$dt"/>&amp;cat=</xsl:attribute>
          <b>All</b>
        </a>
      </div>
      <xsl:for-each select="category">
        <div>
          <a >
            <xsl:attribute name="href">/blog/rss_cat.xml?:cid=<xsl:value-of select="@id"/>&amp;:bid=<xsl:value-of select="/blog/title/@blogid"/></xsl:attribute>
        <img src="/blog/blogs/images/mxml.gif" border="0" alt="rss"/>
          </a>
          <a>
            <xsl:attribute name="href">index.vsp?date=<xsl:value-of select="$dt"/>&amp;cat=<xsl:value-of select="@id"/></xsl:attribute>
            <b>
              <xsl:value-of select="@name"/>
            </b>
          </a>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>

  <xsl:template match="link">
    <div>
      <xsl:if test="@rss != ''">
        <a>
          <xsl:attribute name="href"><xsl:value-of select="@rss"/></xsl:attribute>
          <img src="/blog/blogs/images/mxml.gif" border="0" alt="rss"/>
        </a>
      </xsl:if>
      <a>
        <xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
        <xsl:value-of select="." disable-output-escaping="yes" />
      </a>
    </div>
  </xsl:template>

  <xsl:template match="calendar">
    <table
xml:id="calendar">
      <caption>
        <xsl:value-of select="@monthname"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="@year"/>
      </caption>
      <tr>
        <th>Sun</th>
        <th>Mon</th>
        <th>Tue</th>
        <th>Wed</th>
        <th>Thu</th>
        <th>Fri</th>
        <th>Sat</th>
      </tr>
      <xsl:apply-templates/>
      <tr>
        <td colspan="3">
          <xsl:if test="@prev != ''">
            <a>
              <xsl:attribute name="href">index.vsp?date=<xsl:value-of select="@prev"/>&amp;cat=<xsl:value-of select="/blog/@category"/></xsl:attribute>
              <xsl:value-of select="@prev-label"/>
            </a>
          </xsl:if>&#160;
        </td>
        <td>&#160;</td>
        <td colspan="3">
          <xsl:if test="@next != ''">
        &#160;
        <a>
              <xsl:attribute name="href">index.vsp?date=<xsl:value-of select="@next"/>&amp;cat=<xsl:value-of select="/blog/@category"/></xsl:attribute>
              <xsl:value-of select="@next-label"/>
            </a>
          </xsl:if>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="week">
    <tr>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>

  <xsl:template match="day">
    <xsl:variable name="dt" select="concat(ancestor::calendar/@year, '-', ancestor::calendar/@month, '-')"/>
    <td>
      <xsl:choose>
        <xsl:when test="boolean(number(@active))">
          <xsl:attribute name="class">calactive</xsl:attribute>
          <a>
            <xsl:attribute name="href">index.vsp?date=<xsl:value-of select="$dt"/><xsl:value-of select="."/>&amp;cat=<xsl:value-of select="/blog/@category"/></xsl:attribute>
            <xsl:apply-templates/>
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>
</xsl:stylesheet>
```

</div>

</div>

  

The XML Schema for RSS v2.0 file (rss.xml)

``` programlisting
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">
  <xs:element name="channel">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="title"/>
        <xs:element ref="link"/>
        <xs:element ref="description"/>
        <xs:element ref="managingEditor"/>
        <xs:element ref="pubDate"/>
        <xs:element ref="generator"/>
        <xs:element ref="webMaster"/>
        <xs:element ref="image"/>
        <xs:element ref="cloud"/>
        <xs:element ref="item" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="cloud">
    <xs:complexType>
      <xs:attribute name="domain" type="xs:string" use="required"/>
      <xs:attribute name="port" type="xs:short" use="required"/>
      <xs:attribute name="path" type="xs:string" use="required"/>
      <xs:attribute name="registerProcedure" type="xs:string" use="required"/>
      <xs:attribute name="protocol" type="xs:string" use="required"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="comments" type="xs:anyURI"/>
  <xs:element name="description" type="xs:string"/>
  <xs:element name="generator" type="xs:string"/>
  <xs:element name="guid" type="xs:anyURI"/>
  <xs:element name="height" type="xs:int"/>
  <xs:element name="image">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="title"/>
        <xs:element ref="url"/>
        <xs:element ref="link"/>
        <xs:element ref="description"/>
        <xs:element ref="width"/>
        <xs:element ref="height"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="item">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="title"/>
        <xs:element ref="guid"/>
        <xs:element ref="comments"/>
        <xs:element ref="pubDate"/>
        <xs:element ref="description"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="link" type="xs:anyURI"/>
  <xs:element name="managingEditor" type="xs:string"/>
  <xs:element name="pubDate" type="xs:string"/>
  <xs:element name="rss">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="channel" minOccurs="1" maxOccurs="1"/>
      </xs:sequence>
      <xs:attribute name="version" type="xs:string" use="required" fixed="2.0"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="title" type="xs:string"/>
  <xs:element name="url" type="xs:anyURI"/>
  <xs:element name="webMaster" type="xs:string"/>
  <xs:element name="width" type="xs:int"/>
</xs:schema>
```

</div>

</div>

</div>
