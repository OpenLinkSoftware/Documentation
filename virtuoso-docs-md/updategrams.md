<div id="updategrams" class="section">

<div class="titlepage">

<div>

<div>

## 15.5. Using UpdateGrams to Modify Data

</div>

</div>

</div>

Updategrams allow database updates to be defined as XML. This is
ultimately achieved by mapping the XML nodes against corresponding
database columns. Updategrams can be used to replace existing data
access components in a middle tier. A typical application will include a
middle tier consisting of business logic and data access code. The data
access code will interact with the database using disconnected
recordsets and command objects calling stored procedures. Most of the
data access section of the middle tier can be replaced with updategrams.

Most data access tiers (both middle tier code and stored procedures)
will deal individually with specific database tables or groups of
related tables. This can inhibit performance and often several round
trips to the database are required to complete a transaction.
Updategrams solve this problem by including all the data in an XML
document that is then mapped to database tables and columns. The entire
database update can then be accomplished at once. This update can
include inserting, updating and deleting data.

The `xmlsql_update()` function supports XML-based insert, update, and
delete operations performed on an existing table in the database.
<a href="fn_xmlsql_update.html" class="link" title="xmlsql_update"><code
class="function">xmlsql_update()</code></a>

<div id="updategrambasics" class="section">

<div class="titlepage">

<div>

<div>

### 15.5.1. Updategrams Basics

</div>

</div>

</div>

The general format of an updategram is:

``` programlisting
<sql:sync xmlns:sql="xml-sql">
 <sql:before>
    <TABLENAME [sql:id="value"] col="value" col="value"?../>
 </sql:before>
 <sql:after>
    <TABLENAME [sql:id="value"] [sql:at-identity="value"]
      col="value" col="value"?../>
 </sql:after>
</sql:sync>
```

or

``` programlisting
<sql:sync xmlns:sql="xml-sql">
        <sql:before>
                <TABLENAME [sql:id="value"]>
           <col>"value"</col>
           <col>"value"</col>
           ...
        </TABLENAME>
        ...
        </sql:before>
        <sql:after>
                <TABLENAME [sql:id="value"] [sql:at-identity="value"]>
           <col>"value"</col>
           <col>"value"</col>
           ...
        </TABLENAME>
        ...
        </sql:after>
</sql:sync>
```

</div>

</div>
