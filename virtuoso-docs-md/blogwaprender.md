<div id="blogwaprender" class="section">

<div class="titlepage">

<div>

<div>

### 14.7.28. Rendering the RSS feed in WML format

</div>

</div>

</div>

The user's blog RSS file could be rendered in WML format for accessing
with mobile devices. To do that built-in PL post-processing hook for
blog virtual directory is introduced (DB.DBA.BLOG_RSS2WML_PP). It
working together with a XSL-T style-sheet which converts the RSS in WML
format.

To enable this functionality the blogger should enter '\*wml-default\*'
as RSSFilter option on settings page. Or if he/she has an own XSL-T
filter for WML can enter its URL instead.

The DB.DBA.BLOG_RSS2WML_PP post-processing hook:

``` programlisting
create procedure DB.DBA.BLOG_RSS2WML_PP ()
  {
    declare accept, upar, pars any;
    declare lines any;
    lines := http_request_header ();
    accept := http_request_header (lines, 'Accept');
    if (not isstring (accept))
      accept := '';
    upar := http_request_get ('QUERY_STRING');
    if (regexp_match ('text/vnd\.wap\.wml', accept))
      {
    if (http_path () like '%/rss.xml')
      {
        declare opts, filt, bid any;
        whenever not found goto exitp;
        select top 1 BI_BLOG_ID into bid from SYS_BLOG_INFO where
        http_path () like BI_HOME || '%' order by length (BI_HOME) desc;
        select deserialize (blob_to_string (BI_OPTIONS)) into opts from SYS_BLOG_INFO where BI_BLOG_ID = bid;

        if (not isarray(opts))
          opts := vector ();

        filt := get_keyword ('RSSFilter', opts, '');

        if (filt = '*wml-default*')
          filt := 'http://local.virt/rss2wml.xsl';

        if (not isstring (filt) or not xslt_is_sheet (filt))
          goto exitp;

        if (length (upar) = 0)
          {
                http_xslt (filt);
          }
        else
          {
        declare rss, xt, xsl any;
        rss := http_get_string_output ();
        xt := xml_tree_doc (rss);
        http_rewrite ();
        xsl := xslt (filt, xt, vector ('id', upar));
        http_value (xsl, null);
          }
        http_header ('Content-Type: text/vnd.wap.wml\r\n');
        exitp:;
      }
      }
    return;
  }
;
```

The rss2wml.xsl style sheet:

``` programlisting
<?xml version='1.0'?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
  xmlns:vb="http://example.com/weblog/">
  <xsl:output method="xml" indent="yes" doctype-public="-//WAPFORUM//DTD WML 1.1//EN" doctype-system="http://www.wapforum.org/DTD/wml_1.1.xml" media-type="text/xml"/>

  <xsl:param name="id" />

  <xsl:template match="/">
    <wml>
      <card
xml:id="card1">
    <xsl:apply-templates />
      </card>
    </wml>
  </xsl:template>

  <xsl:template match="item">
    <xsl:choose>
      <xsl:when test="boolean($id!='')">
    <xsl:if test="substring-after(link,'?') = $id">
      <p>
        <xsl:value-of select="vb:tidy_xhtml (string (description), '*default*')"
          disable-output-escaping="yes"/>
        <br/>
        <xsl:if test="preceding-sibling::item">
          <a>
        <xsl:attribute name="href">rss.xml?<xsl:value-of select="substring-after(preceding-sibling::item/link,'?')"/></xsl:attribute>PREVIOUS</a><br />
        </xsl:if>
        <xsl:if test="following-sibling::item">
          <a>
        <xsl:attribute name="href">rss.xml?<xsl:value-of select="substring-after(following-sibling::item/link,'?')"/></xsl:attribute>NEXT</a>
        </xsl:if>
      </p>
    </xsl:if>
      </xsl:when>
      <xsl:otherwise>
    <p>
      <a>
        <xsl:attribute name="href">rss.xml?<xsl:value-of select="substring-after(link,'?')"/></xsl:attribute>
        <xsl:value-of select="title"/>
      </a>
    </p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="text()"/>
</xsl:stylesheet>
```

</div>
