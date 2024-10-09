<div>

<div>

<div>

<div>

### 16.12.3. WebService Interface

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### REST interface

</div>

</div>

</div>

The Virtuoso Faceted web service provide following REST interface:

Service description:

<div>

- Endpoint: http://\<cname\>/fct/service for ex.
  http://lod.openlinksw.com/fct/service

- HTTP method: POST

- Content-Type: MUST be 'text/xml'

- The entity body must be XML document with top element 'query' as
  described above.

- The request response namespace MUST be
  "http://openlinksw.com/services/facets/1.0"

</div>

Error conditions:

The all error conditions are reported via 'Error explanation'

Files:

The facet_svc.sql contains web service code and virtual directory
mapping, and it uses fct_req.xsl & fct_resp.xsl as request & response
filters.

Example:

Using CURL program

``` programlisting
curl -H "Content-Type: text/xml" -d @post.xml  http://lod.openlinksw.com/fct/service
```

Where 'post.xml' document contains query document:

``` programlisting
<?xml version="1.0"?>
<query xmlns="http://openlinksw.com/services/facets/1.0" inference="" same-as="">
  <text> Seattle Mariners traveled all the way to Japan to watch</text>
  <view type="text" limit="20" offset=""/>
</query>
```

Produces following response:

``` programlisting
<fct:facets xmlns:fct="http://openlinksw.com/services/facets/1.0/">
<fct:sparql>   SELECT distinct ?s1 as ?c1, (bif:search_excerpt (bif:vector ('THE', 'MARINERS', 'WAY', 'SEATTLE', 'WATCH', 'ALL', 'TO', 'JAPAN', 'TRAVELED'), ?o1)) as ?c2  WHERE { ?s1 ?s1textp ?o1 . FILTER (bif:contains (?o1, '(THE AND MARINERS AND WAY AND SEATTLE AND WATCH AND ALL AND TO AND JAPAN AND TRAVELED)')) . } LIMIT 20  OFFSET 0 </fct:sparql>
<fct:time>116</fct:time>
<fct:complete>yes</fct:complete>
<fct:db-activity>   134R rnd  9.488KR seq      0P disk  8.966MB /    602 messages</fct:db-activity>
 <fct:result>
  <fct:row>
    <fct:column datatype="url" shortform="http://bobdupuy.mlbl...ld_baseball__6.html">http://bobdupuy.mlblogs.com/bobdupuy/2006/03/world_baseball__6.html></fct:column>
    <fct:column />
    <fct:column><span class="srch_xerpt">... While Chuck Armstrong president of <b>the</b> <b>Seattle</b> <b>Mariners</b> <b>traveled</b> <b>all</b> <b>the</b> <b>way</b> <b>to</b> <b>Japan</b> <b>to</b> <b>watch</b> Ichiro... for <b>the</b> advancing <b>Japan</b> team last week <b>the</b> star from <b>the</b> <b>Seattle</b> roster so far in Round 1 has without a doubt... leading <b>the</b> Dominican <b>to</b> its...</span></fct:column>
  </fct:row>
  <fct:row>
    <fct:column datatype="url" shortform="http://bobdupuy.mlbl...ld_baseball__6.html">http://bobdupuy.mlblogs.com/bobdupuy/2006/03/world_baseball__6.html></fct:column>
    <fct:column />
    <fct:column><span class="srch_xerpt">Orlando While Chuck Armstrong president of <b>the</b> <b>Seattle</b> <b>Mariners</b> <b>traveled</b> <b>all</b> <b>the</b> <b>way</b> <b>to</b> <b>Japan</b> <b>to</b> <b>watch</b>... perform for <b>the</b> advancing <b>Japan</b> team last week <b>the</b> star from <b>the</b> <b>Seattle</b> roster so far in Round 1 has without...</span></fct:column>
  </fct:row>
 </fct:result>
</fct:facets>
```

</div>

<div>

<div>

<div>

<div>

#### Virtuoso APIs for Faceted REST services

</div>

</div>

</div>

The Virtuoso APIs for FCT REST services are Virtuoso Stored Procedures
that enable faceted browsing over Linked Data hosted in the RDF Quad
Store. This also includes Linked Data that is progressively added to the
Quad Store via URI de-referencing.

They enable the use Virtuoso's VSP/VSPX technology to produce
(X)HTML-based Linked Data explorer pages that are endowed with
high-performance (in-process) faceted browsing capability.

You can use this API with Virtuoso SQL calls that provide data to your
VSP/VSPX, ASP.NET, PHP, etc., -based interfaces using ODBC, JDBC,
ADO.NET, or XMLA connectivity (SPASQL) to Virtuoso.

<div>

<div>

<div>

<div>

##### API Definition

</div>

</div>

</div>

``` programlisting
CREATE PROCEDURE
fct_exec
  (
    IN  tree     ANY ,
    IN  timeout  INT
  )
{
  DECLARE  start_time,
           view3,
           inx,
           n_rows      INT     ;
  DECLARE  sqls,
           msg,
           qr,
           qr2,
           act,
           query       VARCHAR ;
  DECLARE  md,
           res,
           results,
           more        ANY     ;
  DECLARE  tmp         ANY     ;
  DECLARE  offs,
           lim         INT     ;

  SET result_timeout = _min
                         (
                           timeout,
                           ATOI
                             (
                               registry_get ('fct_timeout_max')
                             )
                         )
  ;

  offs := xpath_eval ('//query/view/@offset', tree);
  lim := xpath_eval ('//query/view/@limit', tree);

  -- db_activity ();

  results := vector (null, null, null);
  more := vector ();

  IF
    (
      xpath_eval
        (
          '//query[@view3="yes"]//view[@type="text"]',
          tree
        )
      IS NOT NULL
    )
    {
      more := VECTOR ('classes', 'properties');
    }

  sqls := '00000';
  qr := fct_query
          (
            xpath_eval ('//query', tree, 1)
          )
  ;
  query := qr;
--  dbg_obj_print (qr);
  qr2 := fct_xml_wrap (tree, qr);
  start_time := msec_time ();

  dbg_printf('query: %s', qr2);

  EXEC
    (
      qr2,
      sqls,
      msg,
      vector (),
      0,
      md,
      res
    )
  ;
  n_rows := row_count ();
  act := db_activity ();
  SET result_timeout = 0;
  IF (
       sqls <> '00000'
       AND
       sqls <> 'S1TAT'
     )
    SIGNAL (sqls, msg);
  IF (
       NOT ISARRAY (res)
       OR
       0 = length (res)
       OR
       NOT ISARRAY (res[0])
       OR
       0 = length (res[0])
     )
    results[0] := xtree_doc ('<result/>');
  ELSE
    results[0] := res[0][0];

  inx := 1;

  FOREACH (VARCHAR tp IN more) DO
    {
      tree := XMLUpdate (
                          tree,
                          '/query/view/@type',
                          tp,
                          '/query/view/@limit',
                          '40',
                          '/query/view/@offset',
                          '0'
                        )
      ;
      qr := fct_query (xpath_eval ('//query', tree, 1));
      qr2 := fct_xml_wrap (tree, qr);
      sqls := '00000';
      SET result_timeout = _min (
                                  timeout,
                                  ATOI
                                    (
                                      registry_get ('fct_timeout_max')
                                    )
                                )
      ;
      EXEC (
             qr2,
             sqls,
             msg,
             vector (),
             0,
             md,
             res
           );
      n_rows := row_count ();
      act := db_activity ();
      SET result_timeout = 0;
      IF ( sqls <> '00000'
           AND
           sqls <> 'S1TAT'
         )
    SIGNAL (sqls, msg);
      IF (
           ISARRAY (res)
           AND
           LENGTH (res)
           AND
           ISARRAY (res[0])
           AND
           LENGTH (res[0])
         )
    {
      tmp := res[0][0];
      tmp := XMLUpdate (tmp, '/result/@type', tp);
      results[inx] := tmp;
    }
      inx := inx + 1;
    }

  res := XMLELEMENT
           (
             "facets",
             XMLELEMENT
               ( "sparql", query ),
             XMLELEMENT
               ( "time", msec_time () - start_time ),
             XMLELEMENT
               (
                 "complete",
                 CASE WHEN sqls = 'S1TAT'
                      THEN 'no'
                      ELSE 'yes'
                  END
                ),
             XMLELEMENT
               (
                 "timeout",
                 _min
                   (
                     timeout * 2,
                     ATOI
                       (
                         registry_get
                           ( 'fct_timeout_max' )
                       )
                   )
               ),
             XMLELEMENT
               ("db-activity", act),
             XMLELEMENT
               ("processed", n_rows),
             XMLELEMENT
               (
                 "view",
                 XMLATTRIBUTES
                   (
                     offs AS "offset",
                     lim AS "limit"
                   )
               ),
             results[0],
             results[1],
             results[2]
           );

---- for debugging:
--string_to_file ('ret.xml', serialize_to_UTF8_xml (res), -2);
--  dbg_obj_print (res);

  RETURN res;
}
;
```

</div>

<div>

<div>

<div>

<div>

##### Example

</div>

</div>

</div>

The following example shows how to use the fct_exec APi in vsp page to
perform a "text" search for the word "Mike" assuming this exists in your
Virtuoso RDF store (if not amend the query in the fct_example.vsp code
sample below to search for text known to exist).

<div>

1.  The service can be used in the following sample fct_example.vsp:

    ``` programlisting
    <?vsp

    declare txt, reply, tree any;
    declare timeout int;

    tree := xtree_doc ('
      <query>
        <text>Mike</text>
        <view type="text"/>
      </query>
    ');

    timeout := 3000;
    reply := fct_exec (tree, timeout);

    txt := string_output ();

    http_value (xslt ('virt://WS.WS.SYS_DAV_RES.RES_FULL_PATH.RES_CONTENT:/DAV/fct_example.xsl',
                     reply,
                 vector ()),
                 null, txt);

    http (txt);
    ?>
    ```

2.  The xsl:

    ``` programlisting
    <?xml version="1.0" encoding="utf-8"?>

    <xsl:stylesheet
        version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="html" encoding="ISO-8859-1"/>
      <xsl:variable name="rowcnt" select="count(/facets/result/row)"/>

      <xsl:template match="facets">
        <div
    xml:id="res">
          <xsl:if test="/facets/complete = 'yes' and /facets/processed = 0 and $rowcnt = 0">
            <div>
              Nothing found.
            </div>
          </xsl:if>
          <xsl:for-each select="/facets/result">
            <xsl:call-template name="render-result"/>
          </xsl:for-each>
        </div>
        <!-- #res -->

      </xsl:template>

      <xsl:template name="render-result">
        <table class="result" border="1">
          <thead>
            <tr>
              <th>Entity</th>
              <th>Title</th>
              <th>Text excerpt</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="row">
              <tr>
                <td class="rnk">
                  <xsl:for-each select="column[@datatype='trank' or @datatype='erank']">
                    <xsl:choose>
                      <xsl:when test="./@datatype='trank'">Text Rank:</xsl:when>
                      <xsl:when test="./@datatype='erank'">Entity Rank:</xsl:when>
                    </xsl:choose>
                    <xsl:value-of select="."/>
                    <br/>
                  </xsl:for-each>
                </td>
                <xsl:for-each select="column">
                  <xsl:choose>
                    <xsl:when test="'url' = ./@datatype">
                      <td>
                        <a>
                          <xsl:attribute name="href">http://lod.openlinksw.com/describe/?url=<xsl:value-of select="urlify (.)"/></xsl:attribute>
                          <xsl:attribute name="title"><xsl:value-of select="."/></xsl:attribute>
                          <xsl:choose>
                            <xsl:when test="'' != ./@shortform">
                              <xsl:value-of select="./@shortform"/>
                            </xsl:when>
                            <xsl:when test="'erank' = ./@datatype or 'trank' = ./@datatype">rank</xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="."/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </a>
                      </td>
                    </xsl:when>
                    <xsl:when test="'erank' = ./@datatype or 'trank' = ./@datatype"/>
                    <xsl:when test="'srch_xerpt' = ./span/@class">
                      <td>
                        <xsl:value-of select="."/>
                      </td>
                    </xsl:when>
                    <xsl:otherwise/>
                  </xsl:choose>
                </xsl:for-each>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:template>

      <xsl:template match="@* | node()">
        <xsl:copy>
          <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
      </xsl:template>
    </xsl:stylesheet>
    ```

3.  The result of executing the fct_example.vsp should be:

    <div>

    <div>

    **Figure 16.183. Faceted API Example**

    <div>

    <div>

    ![Faceted API Example](images/ui/fcapiex1.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### SOAP interface

</div>

</div>

</div>

The facet web service is also available via SOAP protocol.

The request message contains single element 'query' with syntax
explained earlier. Also the SOAPAction HTTP header should be '#query' .
After successful evaluation of the query, the service will return a SOAP
envelope containing in the Body element single 'facets' element
described above.

Example:

This example shows execution of same command as in example for REST
interface here it using SOAP:

Request message:

``` programlisting
<SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/">
  <SOAP:Body>
    <query xmlns="http://openlinksw.com/services/facets/1.0/" inference="" same-as="">
      <text>Seattle Mariners traveled all the way to Japan to watch</text>
      <view type="text" limit="20" offset="0"/>
    </query>
  </SOAP:Body>
</SOAP:Envelope>
```

Response message:

``` programlisting
<SOAP:Envelope xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/">
  <SOAP:Body>
    <fct:facets xmlns:fct="http://openlinksw.com/services/facets/1.0/">
      <fct:sparql>SELECT distinct ?s1 as ?c1, (bif:search_excerpt (bif:vector ('THE', 'MARINERS', 'WAY', 'SEATTLE', 'WATCH', 'ALL', 'TO', 'JAPAN', 'TRAVELED'), ?o1)) as ?c2  where { ?s1 ?s1textp ?o1 . filter (bif:contains (?o1, '(THE AND MARINERS AND WAY AND SEATTLE AND WATCH AND ALL AND TO AND JAPAN AND TRAVELED)')) . } LIMIT 20  OFFSET 0</fct:sparql>
      <fct:time>114</fct:time>
      <fct:complete>yes</fct:complete>
      <fct:db-activity>   134R rnd  9.488KR seq      0P disk  8.966MB /    602 messages</fct:db-activity>
      <fct:result>
        <fct:row>
          <fct:column datatype="url" shortform="http://bobdupuy.mlbl...ld_baseball__6.html">http://bobdupuy.mlblogs.com/bobdupuy/2006/03/world_baseball__6.html</fct:column>
          <fct:column/>
          <fct:column><span class="srch_xerpt">... While Chuck Armstrong president of <b>the</b> <b>Seattle</b> <b>Mariners</b> <b>traveled</b> <b>all</b> <b>the</b> <b>way</b> <b>to</b> <b>Japan</b> <b>to</b> <b>watch</b> Ichiro... for <b>the</b> advancing <b>Japan</b> team last week <b>the</b> star from <b>the</b> <b>Seattle</b> roster so far in Round 1 has without a doubt... leading <b>the</b> Dominican <b>to</b> its...</span></fct:column>
        </fct:row>
        <fct:row>
          <fct:column datatype="url" shortform="http://bobdupuy.mlbl...ld_baseball__6.html">http://bobdupuy.mlblogs.com/bobdupuy/2006/03/world_baseball__6.html</fct:column>
          <fct:column/>
          <fct:column><span class="srch_xerpt">Orlando While Chuck Armstrong president of <b>the</b> <b>Seattle</b> <b>Mariners</b> <b>traveled</b> <b>all</b> <b>the</b> <b>way</b> <b>to</b> <b>Japan</b> <b>to</b> <b>watch</b>... perform for <b>the</b> advancing <b>Japan</b> team last week <b>the</b> star from <b>the</b> <b>Seattle</b> roster so far in Round 1 has without...</span></fct:column>
        </fct:row>
      </fct:result>
    </fct:facets>
  </SOAP:Body>
</SOAP:Envelope>
```

</div>

</div>
