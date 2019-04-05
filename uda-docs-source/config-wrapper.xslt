<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">
  <xsl:import href="DocBook/xhtml/chunk.xsl"/>

  <xsl:output indent="yes"/>

  <xsl:param name="admon.graphics">1</xsl:param>
  <xsl:param name="appendix.autolabel">1</xsl:param>
  <xsl:param name="autotoc.label.in.hyperlink">0</xsl:param>
  <xsl:param name="body.start.indent">0pt</xsl:param>
  <xsl:param name="chapter.autolabel">1</xsl:param>
  <xsl:param name="chunker.output.cdata-section-elements">programlisting screen computeroutput pre</xsl:param>
  <xsl:param name="chunker.output.encoding">UTF-8</xsl:param>
  <xsl:param name="chunker.output.indent">yes</xsl:param>
  <xsl:param name="chunk.first.sections">1</xsl:param>
  <xsl:param name="chunk.section.depth">1</xsl:param>
  <xsl:param name="chunk.tocs.and.lots.has.title">1</xsl:param>
  <xsl:param name="chunk.tocs.and.lots" select="1"/>
  <xsl:param name="component.label.includes.part.label">1</xsl:param>
  <xsl:param name="css.decoration">0</xsl:param>
  <xsl:param name="funcsynopsis.style">ansi</xsl:param>
  <xsl:param name="generate.id.attributes">1</xsl:param>
  <xsl:param name="generate.index">1</xsl:param>
  <xsl:param name="generate.manifest" select="1"/>
  <xsl:param name="html.ext">.html</xsl:param>
  <xsl:param name="html.extra.head.links">1</xsl:param>
  <xsl:param name="html.stylesheet">opl-style.css</xsl:param>
  <xsl:param name="img.src.path">images/</xsl:param>
  <xsl:param name="label.from.part">1</xsl:param>
  <xsl:param name="navig.graphics">0</xsl:param>
  <xsl:param name="part.autolabel">1</xsl:param>
  <xsl:param name="section.autolabel">1</xsl:param>
  <xsl:param name="section.autolabel.max.depth">2</xsl:param>
  <xsl:param name="section.label.includes.component.label">1</xsl:param>
  <xsl:param name="use.id.as.filename">1</xsl:param>
  <xsl:param name="gendatetime"/>

  <!-- These are supposed to be the official way of including javascript, but the Docbook XSLT puts it in the header -->
  <!-- which breaks onload, so we move it to the footer, below. -->
  <!-- <xsl:param name="html.script">opl-script.js</xsl:param> -->
  <!-- <xsl:param name="html.script.type">text/javascript</xsl:param> -->

  <!-- Remove surplus elements from ToC -->
  <xsl:param name="generate.toc">
        appendix toc,title
        article/appendix nop
        article toc,title
        book toc,title
        chapter toc,title
        part toc,title
        preface toc,title
        qandadiv toc
        qandaset toc
        reference toc,title
        sect1 toc
        sect2 toc
        sect3 toc
        sect4 toc
        sect5 toc
        section toc
        set toc,title
    </xsl:param>

  <!--In-doc permalinks-->
  <xsl:param name="generate.permalink" select="1"/>
  <xsl:param name="permalink.text">¶</xsl:param>

  <!-- Add return-to-top link after every section -->

  <xsl:template name="section.titlepage.before.recto">

  <xsl:variable name="level">
      <xsl:call-template name="section.level"/>
    </xsl:variable>
    <xsl:variable name="chunkfn">
      <xsl:apply-templates mode="chunk-filename" select="."/>
    </xsl:variable>

    <!-- <xsl:if test="$level &gt; $chunk.section.depth"> -->
    <!--   <p class="returntotop"> -->
    <!--     <a href="{$chunkfn}"> -->
    <!--       <xsl:text>Return to top</xsl:text> -->
    <!--     </a> -->
    <!--   </p> -->
    <!-- </xsl:if> -->
  </xsl:template>

  <xsl:template match="*[ancestor-or-self::*[@id='ch-functions']]" mode="toc" priority="1000">
    <xsl:comment>debug: template 1 match=[*[ancestor-or-self::*[@id='ch-functions']]], mode=[toc], priority=[1000]
        </xsl:comment>
    <xsl:comment>Current node is a [<xsl:value-of select="name(.)"/>] with
            <xsl:value-of select="count(.//*)"/> children located
            <xsl:value-of select="count(ancestor-or-self::*)"/> from top.
        </xsl:comment>

    <!-- Memoize the functions chapter for future reference -->
    <xsl:variable name="functionschapter" select="//*[@id='ch-functions']"/>
    <xsl:if test="@id='fn_var_pop'">
      <xsl:apply-templates select="$functionschapter//*[name(.)='keyword']" mode="OplTocReplacement">
        <xsl:with-param name="functionschapter">
          <xsl:copy-of select="$functionschapter"/>
        </xsl:with-param>
        <xsl:with-param name="refentries" select="//*[name(.)='refentry']"/>
      </xsl:apply-templates>
    </xsl:if>
    <xsl:if test="@id='ch-functions'">
      <dt>
        <span class="section">24.
                    <a href="ch-functions.html">Functions Reference</a>
                </span>
      </dt>
    </xsl:if>
  </xsl:template>

  <xsl:template match="keyword" mode="OplTocReplacement" priority="5">
    <xsl:param name="functionschapter"/>
    <xsl:param name="refentries"/>
    <xsl:comment>debug: template 2 match=[keyword], mode=[OplTocReplacement], priority=[5]</xsl:comment>
    <xsl:comment>Current node is a [<xsl:value-of select="name(.)"/>] with
            <xsl:value-of select="count(.//*)"/> children located
            <xsl:value-of select="count(ancestor-or-self::*)"/> from top.
        </xsl:comment>
    <h4 class="OplTocSection">
      <xsl:value-of select="."/>
    </h4>
    <ul class="OplTocSection">
      <xsl:apply-templates select="$refentries" mode="OplTocReplacement">
        <xsl:with-param name="functionschapter" select="$functionschapter"/>
        <xsl:with-param name="desiredID" select="normalize-space(@id)"/>
      </xsl:apply-templates>
    </ul>
  </xsl:template>

  <xsl:template match="refentry" mode="OplTocReplacement" priority="5">
    <xsl:param name="functionschapter"/>
    <xsl:param name="desiredID"/>
    <xsl:comment>debug: template 3 match=[refentry], mode=[OplTocReplacement], priority=[5]</xsl:comment>
    <xsl:comment>Current node is a [<xsl:value-of select="name(.)"/>] with
            <xsl:value-of select="count(.//*)"/> children located
            <xsl:value-of select="count(ancestor-or-self::*)"/> from top.
        </xsl:comment>
    <xsl:comment>Desired ID=[<xsl:value-of select="$desiredID"/>]
        </xsl:comment>
    <xsl:if test="normalize-space(refmeta/refmiscinfo)=$desiredID">
      <li><a href="{concat(@id, '.html')}" title="{refnamediv/refpurpose}"><xsl:value-of select="refmeta/refentrytitle"/></a>
                ()
            </li>
    </xsl:if>
  </xsl:template>

  <xsl:template name="user.head.content">
    <meta name="date" property="http://purl.org/dc/terms/created" itemprop="http://schema.org/dateCreated" content="{$gendatetime}"/>
  </xsl:template>

  <!-- Invoke custom javascript function at page onload -->

  <xsl:template name="body.attributes">
    <xsl:attribute name="onload">pageOnLoad()</xsl:attribute>
  </xsl:template>

  <!-- Docbook XSLT tries to insert javascript at the top of the head where most of the page doesn't even exist yet,
         and has no method for moving it elsewhere, so we rewrite the whole page template to get it right. -->

  <xsl:template name="chunk-element-content">
    <xsl:param name="prev"/>
    <xsl:param name="next"/>
    <xsl:param name="nav.context"/>
    <xsl:param name="content">
      <xsl:apply-imports/>
    </xsl:param>
    <xsl:call-template name="user.preroot"/>
    <html itemscope="itemscope" itemtype="http://schema.org/WebPage">
      <xsl:call-template name="root.attributes"/>
      <xsl:call-template name="html.head">
        <xsl:with-param name="prev" select="$prev"/>
        <xsl:with-param name="next" select="$next"/>
      </xsl:call-template>
      <body>
        <xsl:call-template name="body.attributes"/>
        <xsl:call-template name="user.header.navigation">
          <xsl:with-param name="prev" select="$prev"/>
          <xsl:with-param name="next" select="$next"/>
          <xsl:with-param name="nav.context" select="$nav.context"/>
        </xsl:call-template>
        <xsl:call-template name="header.navigation">
          <xsl:with-param name="prev" select="$prev"/>
          <xsl:with-param name="next" select="$next"/>
          <xsl:with-param name="nav.context" select="$nav.context"/>
        </xsl:call-template>
        <xsl:call-template name="user.header.content"/>
        <xsl:copy-of select="$content"/>
        <xsl:call-template name="user.footer.content"/>
        <xsl:call-template name="footer.navigation">
          <xsl:with-param name="prev" select="$prev"/>
          <xsl:with-param name="next" select="$next"/>
          <xsl:with-param name="nav.context" select="$nav.context"/>
        </xsl:call-template>
        <xsl:call-template name="user.footer.navigation">
          <xsl:with-param name="prev" select="$prev"/>
          <xsl:with-param name="next" select="$next"/>
          <xsl:with-param name="nav.context" select="$nav.context"/>
        </xsl:call-template>
        <script type="text/javascript" src="jquery-1.11.3.min.js">
          <xsl:text>
</xsl:text>
        </script>
        <script type="text/javascript" src="opl-script.js">
          <xsl:text>
</xsl:text>
        </script>
      </body>
    </html>
    <xsl:value-of select="$chunk.append"/>
  </xsl:template>

  <!-- Breadcrumbs - taken from http://www.sagehill.net/docbookxsl/HTMLHeaders.html#BreadCrumbs -->

  <!-- Template to generate breadcrumbs: -->

  <xsl:template name="breadcrumbs">
    <xsl:param name="this.node" select="."/>
    <div class="breadcrumbs">
      <xsl:for-each select="$this.node/ancestor::*">
        <span class="breadcrumb-link">
          <a>
            <xsl:attribute name="href">
              <xsl:call-template name="href.target">
                <xsl:with-param name="object" select="."/>
                <xsl:with-param name="context" select="$this.node"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:apply-templates select="." mode="title.markup"/>
          </a>
        </span>
        <xsl:text> &gt; </xsl:text>
      </xsl:for-each>

      <!-- And display the current node, but not as a link -->
      <span class="breadcrumb-node">
        <xsl:apply-templates select="$this.node" mode="title.markup"/>
      </span>
    </div>
  </xsl:template>

  <!-- Call the template: -->

  <xsl:template name="user.header.content">
    <xsl:call-template name="breadcrumbs"/>
  </xsl:template>
</xsl:stylesheet>
