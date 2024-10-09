<div>

<div>

<div>

<div>

### 19.8.4. The Forums Application

</div>

</div>

</div>

The "Forums" Application is a World Wide Web Application for posting,
reading and searching of messages developed under the Virtuoso VDBMS
with a wide usage of Virtuoso Server Pages (VSP) and server-side XSL-T
transformation.

Messages in the forums are classified to forums and sub-forums by
interest. Posting is only allowed for registered users. Registration is
performed via a registration form. Every registered user can create new
a theme, post new messages to an existing theme or reply to an existing
message. Unregistered users can only search, browse, and read existing
themes and messages.

<div>

<div>

<div>

<div>

#### Principles

</div>

</div>

</div>

The application is based on VSPs, XML and XSLT transformations. The VSPs
are used to produce XML documents that are transformed to HTML using
server side XSLT. The design and appearance of the application depends
solely on XSLT style sheets. This allows us to divide the development
into two distinct parts: layout and design, and functionality of the
application.

Session management is based on URL manipulation and persistent HTTP
session variables. The messages are stored in Database as XML documents
with a free-text index applied over them.

</div>

<div>

<div>

<div>

<div>

#### Navigation

</div>

</div>

</div>

The application consists of four main pages:

<div>

1.  <span class="emphasis">*home.vsp*</span> - the main page introduces
    the forums with the following information:

    |                                                                  |
    |------------------------------------------------------------------|
    | Forums: name of each forum with link to the relevant sub-forums. |
    | Total: total number of messages for this forum.                  |
    | New: new messages for this forum within the last day.            |
    | Last: number of the last message inserted in the forum.          |
    | Total users: count of registered users.                          |
    | Options: login if the user is already registered in the forums.  |
    | Registration: add a new user.                                    |
    | Search: search in the messages.                                  |

2.  <span class="emphasis">*subforums.vsp*</span> - sub-forums of the
    current forum with the following information:

    |                                                                                              |
    |----------------------------------------------------------------------------------------------|
    | Subforum: name of each sub-forum with links to relevant themes.                              |
    | Total: total number of messages for this forum.                                              |
    | New: new messages for this forum within the last day.                                        |
    | Last: number of the last message inserted in the forum.                                      |
    | Options: login if the user is already registered in the forums.                              |
    | Registration: add a new user                                                                 |
    | Search: search in the messages.                                                              |
    | Forums path: links to the home page and to the forum to which the current sub-forums belong. |

3.  <span class="emphasis">*forum.vsp*</span> - themes of the current
    sub-forum with the following information:

    |                                                                                                            |
    |------------------------------------------------------------------------------------------------------------|
    | Theme: name of each theme with links to its messages.                                                      |
    | Total: total number of messages for this theme.                                                            |
    | New: new messages for this theme within the last day.                                                      |
    | Last: number of the last message inserted in the theme.                                                    |
    | Options: login if the user is already registered in the forums.                                            |
    | Registration: add a new user.                                                                              |
    | Search: search in the messages.                                                                            |
    | Forums path: links to the home page, to the forum and to the sub-forum to which the current themes belong. |

4.  <span class="emphasis">*thread.vsp*</span> - messages of the current
    theme with the following information:

    |                                                                                                                                                                                                                                                       |
    |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | Message: name of each message with a link to its properties. When the link is activated the same page is presented, but with the tree of messages for which the current message is the parent.                                                        |
    | Author: the name of the author of the current message.                                                                                                                                                                                                |
    | Date: posting date of the message.                                                                                                                                                                                                                    |
    | Options: login if the user is already registered in the forums.                                                                                                                                                                                       |
    | Registration: add a new user.                                                                                                                                                                                                                         |
    | Search: search in the messages.                                                                                                                                                                                                                       |
    | Forums path: links to the home page, to the forum and to the sub-forum to which the current message belongs. Also for the current message, the parent message's name is presented. As users move lower in the tree, they can go back using this path. |

</div>

</div>

<div>

<div>

<div>

<div>

#### Remarks

</div>

</div>

</div>

The basic principles of the application's implementation are:

|                                                                                                               |
|---------------------------------------------------------------------------------------------------------------|
| The result of a VSP execution is a well-formed XML document.                                                  |
| Use the Virtuoso server to do server-side XSLT transformations with appropriate style sheets whenever needed. |
| Use URL manipulations for session management.                                                                 |
| Use post-processing functions to provide commonly used parameters (such as user ID) as session variables.     |

If users are not logged in they can access all pages of the site, but if
they want to insert a new theme or create a new message, they have to
log in. When users attempt to create or insert, they will be prompted
with the login page. When they log in, the forums application will take
them directly to the form for inserting messages or themes. If users are
not logged in, the name 'anonymous' is displayed, instead of the e-mail
address that would be displayed if they were logged in.

</div>

<div>

<div>

<div>

<div>

#### The Search Page

</div>

</div>

</div>

Users can search in three ways:

|                                                                         |
|-------------------------------------------------------------------------|
| Theme title: titles of message that are titles of themes.               |
| Message title: titles of message that have the current theme as parent. |
| Message body: bodies of messages that have different themes as parents. |

Search results contain information about how many hits were found, and
for each hit the following:

|                                                                                                                       |
|-----------------------------------------------------------------------------------------------------------------------|
| Message title: the title of the current message. When you search in message bodies, the message titles are displayed. |
| Time: date the message or theme was inserted.                                                                         |
| Author: author of the message or theme.                                                                               |

The search page provides the interface for searching contents of forums
including messages and titles.

``` programlisting
<?vsp
  declare id, acount, aresults integer;
  declare aquery, awhat, askiped, search_res, sid, uid, url, usr varchar;

  -- > at this point we instruct server to do server-side XSLT transformation
    -- >    over resultant document
  -- > The transformation will be done before sending the document to the user-agent
  -- >    and after page execution is done.
    -- > To provide flexible file location we use a registry setting for XSLT
    -- >    style sheets
  http_xslt(sprintf ('file:%s/search.xsl', registry_get ('app_forums_xslt_location')));

  -- > because the application does URL poisoning for session management
  -- > we must retrieve the request parameters:

  -- > the session ID
  sid      := get_keyword('sid', params, '0');
  -- > the query text
  aquery   := get_keyword('q',params,'');
  -- > the query locator (for what we searching)
  awhat    := get_keyword('wh',params,'t');
  -- > how many records to skip
  askiped  := atoi (get_keyword('sk',params,'0'));
  -- > how many results to return
  aresults := atoi (get_keyword('rs',params,'10'));
  -- > hits count
  acount   := atoi (get_keyword('c',params,'0'));

  url := 'thread.vsp';

  -- > also we get the user ID from the session variables
  uid := connection_get ('pid');
  usr := connection_get ('usr');

  -- > now we are ready and call the stored procedure that returns the result from search
  search_res := FORI_SEARCH_RES (aquery, awhat, askiped, aresults, acount);
?>

<!-- now we produce the result as well-formed XML document -->

<?xml version="1.0"?>
<page>
<sid><?=sid?></sid>
<usr><?=usr?></usr>
<url><?=url?></url>
<nav_2><?vsp http(FORI_SEARCH_FORM (sid, aquery, awhat, askiped, aresults, acount)); ?></nav_2>
<css_1/>
<squery><?=aquery?></squery>
<swhat><?=awhat?></swhat>
<sskiped><?=askiped?></sskiped>
<sresults><?=aresults?></sresults>
<scount><?=acount?></scount>
<?vsp http (search_res); ?>
<?vsp http (FORI_SEARCH_NAVIGATION (
  sprintf('search.vsp?q=%s&wh=%s&rs=%d&c=%d&sid=%s&', aquery, awhat, aresults, acount, sid),
      acount, askiped, aresults)); ?>
</page>
```

</div>

<div>

<div>

<div>

<div>

#### Search Page Analysis

</div>

</div>

</div>

First we declare the variables used inside the page. In VSP, variables
can be defined at any time, but it is generally good practice is to
declare them near the top.

We call `http_xslt()` with a file URL parameter. This instructs the
Virtuoso server to do XSLT transformation on the server side before
sending output to the client, and after execution of the page. Hence we
will produce an XML document.

After this we need to get the input parameters session_id, query text,
how many records to skip, and how many records to display. We do this by
calling `get_keyword()` and passing it the 'params' array. Every VSP
page has *`params`* , *`path`* , and *`lines`* as input parameters. For
each call we supply a default value in case the variable has not been
used. For some of the parameters we need an integer, but varchars are
always returned, so we use `atoi()` on the result to convert it to an
integer.

Next we retrieve the persistent variables *`user id`* and *`user name`*
. We do this by calling `connection_get()` with the session variable
name.

After this preparation, we are ready to perform the searching by calling
the PL stored procedure `FORI_SEARCH_RES()` . This procedure returns the
XML entities that contain the results from the search.

Once we have results, we want to produce the XML document that will be
used in the XSLT transformation. We do this part of the work using the
shortcuts to the `http_value()` function: '\<?= ?\>' pairs, and also in
some places '\<?vsp ?\>' to call the `FORI_SEARCH_FORM()` and
`FORI_SEARCH_NAVIGATION()` procedures and output their results.

The main benefits to this approach are:

|                                                                                                                                                                                                                                                  |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| design independency of VSP content: if we need a different design we only need to change the XSLT style sheet;                                                                                                                                   |
| different style sheets can represent different themes. If we pass an additional 'theme' parameter, for example, we can associate a new theme with a different style sheet. This way we have a fast approach to customizing the look of the page; |
| browser independence: because we do server-side XSLT transformation we do not need the browser to support XSLT or XML at all.                                                                                                                    |

If we comment out the line that instructs Virtuoso to perform the XSLT
transformation (`http_xslt()` ) we will get the following document:

``` programlisting
<?xml version="1.0"?>
<page>
<sid>0</sid>
<usr>anonymous</usr>
<url>thread.vsp</url>
<nav_2><search_form>
<hidden>
<hidden_input type="hidden" name="sid" value="0" />
<hidden_input type="hidden" name="sk" value="0" />
<hidden_input type="hidden" name="rs" value="10" />
<hidden_input type="hidden" name="c" value="0" />
</hidden>
<select name="wh">
<option value="t" selected="1">theme title</option>
<option value="mt">message title</option>
<option value="mb">message body</option>
</select>
</search_form>
</nav_2>
<css_1/>
<squery></squery>
<swhat>t</swhat>
<sskiped>0</sskiped>
<sresults>10</sresults>
<scount>0</scount>
<search_result>
<no_hits/>
</search_result>
<navigation pages="0">
</navigation>
</page>
```

If we re-enable the XSLT transformation the user agent will receive the
following HTML content:

``` programlisting
<html><head>
<style type="text/css">
a:hover{color:#a2a2a2}
.id{font-size:12px;font-family:arial,sans-serif;font-weight:bold;color:#004C87}
.ie{font-size:12px;font-family:verdana,sans-serif;color:#FFFFFF}
.ir{font-size:14px;font-weight:bold;font-family:verdana,sans-serif;color:#FFFFFF}
.if{font-size:12px;text-decoration:none;font-family:verdana,sans-serif;
   font-weight:bold;color:#E1F2FE}
.iname{font-size:12px;font-weight:bold;font-family:verdana,sans-serif;color:#FFFFFF}
.ipath{font-size:12px;text-decoration:none;font-weight:bold;
   font-family:verdana,sans-serif;color:#004C87}
.inew {font-size:12px;text-decoration:none;font-weight:bold;
   font-family:verdana,sans-serif;color:#FFC600}
.text {font-size:12px;text-decoration:none;font-family:Arial,sans-serif;color:#004C87}
</style>
</head>
  <body>
    <TABLE WIDTH="100%" BGCOLOR="#004C87" CELLPADDING="0" CELLSPACING="0" BORDER="0">
     <TR>
      <form action="search.vsp" method="post">
        <TD WIDTH="20%" VALIGN="top">
          <IMG SRC="i/logo_n.gif" HEIGHT="49" WIDTH="197" BORDER="0"></TD>
    <TD WIDTH="40%" ALIGN="center">
      <input type="text" name="q" size="36" value=""></TD>
    <TD WIDTH="25%" ALIGN="center">
       <select name="wh">
          <option value="t" selected>theme title</option>
          <option value="mt">message title</option>
          <option value="mb">message body</option>
       </select> <input type="hidden" name="sid" value="0">
       <input type="hidden" name="sk" value="0">
       <input type="hidden" name="rs" value="10">
       <input type="hidden" name="c" value="0">
    </TD>
    <TD WIDTH="15%">
    <input type="image" name="search" src="i/search.gif" border="0"></TD>
    </form>
      </TR>
   </TABLE>
    <TABLE WIDTH="100%" BGCOLOR="#02A5E4" CELLPADDING="0" CELLSPACING="0" BORDER="0">
      <TR>
    <TD>
        <IMG SRC="i/str.gif" HEIGHT="12" WIDTH="35">
        <a class="id" href="home.vsp?sid=0">Home</a>
       </TD>
       <TD HEIGHT="22" class="iname" ALIGN="right">anonymous </TD>
      </TR>
      </TABLE>
      <TABLE BGCOLOR="#E1F2FE" ALIGN="center" WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">
       <TR>
         <TD COLSPAN="3">
        <IMG SRC="i/c.gif" HEIGHT="12" WIDTH="1">
         </TD>
       </TR>
       <TR>
        <TR BGCOLOR="#0073CC">
         <TD WIDTH="60%" HEIGHT="24" class="ie"> message title</TD>
         <TD WIDTH="20%" class="ie">time</TD>
         <TD WIDTH="20%" class="ie">author</TD>
       </TR>
      <TR>
        <TD COLSPAN="3">
          <IMG SRC="i/c.gif" HEIGHT="2" WIDTH="1">
        </TD>
      </TR>
      <TR>
        <TD align="left" class="id" COLSPAN="3">No hits found</TD>
      </TR>
      <TR>
       <TD HEIGHT="18" colspan="3" BGCOLOR="#0073CC" class="id">
       </TD>
      </TR>
     </TR>
     <TR>
       <TD COLSPAN="3">
         <IMG SRC="i/c.gif" HEIGHT="2" WIDTH="1">
       </TD>
     </TR>
     <TR>
      <TD COLSPAN="3" BGCOLOR="#0073CC">
        <IMG SRC="i/c.gif" HEIGHT="1" WIDTH="1">
      </TD>
     </TR>
    </TABLE>
  </body>
</html>
```

The page sources are available in the default distribution under the
samples directory.

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
<td style="text-align: left;" data-valign="top"><p>For more information
about the functions used see: <a href="fn_http_xslt.html" class="link"
title="http_xslt">http_xslt()</a> , <a href="fn_http.html" class="link"
title="http">http()</a> , <a href="fn_http_value.html" class="link"
title="http_value">http_value()</a> .</p>
<p>For more information about VSP in general go the <a href="vsp1.html"
class="link" title="14.3. Virtuoso Server Pages (VSP)">VSP Section</a>
.</p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
