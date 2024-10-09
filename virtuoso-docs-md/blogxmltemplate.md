<div>

<div>

<div>

<div>

### 14.7.26. Posting a dynamic content

</div>

</div>

</div>

The Virtuoso blogging system allows to insert into a post a result from
SQL, XPATH or XQuery expressions. The way this can be done is to have a
SQL access enabled for the Web user making the post, so such blogger can
insert into a post body (note that this is not available for title) a
XMLTemplate. (see "XML Templates" for reference) Then at the render time
the template will be executed on behalf of the blogger who is made the
post and result will be shown. There is no limitation how many XML
Templates can be included in a single post. Please note that bloggers
without SQL access cannot do such posts. Also the SQL granting rules
will be applied when XML Template is executed.

The following will render a simple table containing list of
Demo.demo.Shippers table from Demo database.

``` programlisting
        <table border="1">
        <sql:query xmlns:sql="urn:schemas-openlink-com:xml-sql" >
            select 1 as tag , null as parent, CompanyName as [tr!1!td!element]
            from Demo.demo.Shippers
            for xml explicit
        </sql:query>
        </table>
        
```

The following post will render a table containing a names of people
which is organized in simple OPML file (located in the tutorial system)
using XQuery.

``` programlisting
        <div>
        <sql:xquery  xmlns:sql="urn:schemas-openlink-com:xml-sql"
            sql:context="http://example.com/tutorial/apps/blog_query/">
            <![CDATA[
            <table border="1">
            { for $o in document ("opml.xml")//outline
               return <tr><td>{ string ($o/@text) }</td></tr>
            }
            </table>
            ]]>
        </sql:xquery>
        </div>
```

</div>
