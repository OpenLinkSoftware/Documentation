<div id="virtuosospongernnt" class="section">

<div class="titlepage">

<div>

<div>

### 16.10.10. Sponger and Nanotations

</div>

</div>

</div>

<div id="virtuosospongernnts" class="section">

<div class="titlepage">

<div>

<div>

#### Situation Analysis

</div>

</div>

</div>

Since the advent of blogging, it has been clear to everyone that posts
require augmentation in order to truly function as rapid-fire meme
vectors. For instance, could you imagine early blog posts without
tagging?

Today, we've evolved from early literal tagging (which didn't scale an
iota) to wide use of `@handles` and `#hastags` . Basically, `@handles`
are social network specific HTTP URIs that denote Agents (People,
Organizations, and Bots) while `#hashtags` are HTTP URIs that denote
Topics.

<span class="emphasis">*Problem:*</span> Looking at the picture above,
in regards to productively encoding and decoding information via the
World Wide Web medium, it should be obvious that `@handles` and
`#hashtags` are basically the digital equivalents of nouns. And as a
consequence, we are basically trying to replicate the power of natural
language sentences without critical components such as verbs
(connectors) and adjectives (classifiers).

<span class="emphasis">*A Solution:*</span> Leverage the power of an
existing language, based on open standards, that already delivers the
power of natural language without being limited by the physical
constraints of paper (as a mechanism for sentence persistence and
exchange).

This is where RDF comes into play. It is an open standards based
language for constructing digital sentences that pack the same (or even
more power) its natural language equivalents. Through the power of RDF
it is possible to create micro-annotations (aka. Nanotations) that are
embeddable in any kind of text based documents. Naturally, the
aforementioned claim doesn't apply to every RDF notation, which is why
RDF-Turtle is the vehicle we've chosen to unleash the full power of RDF
and the Semantic Web it enables when digital sentences take the form of
Linked Open Data.

</div>

<div id="virtuosospongernntw" class="section">

<div class="titlepage">

<div>

<div>

#### What is Nanotation?

</div>

</div>

</div>

Nanotation is a mechanism for using embedded digital sentences to
enhance blog posts, forum discussion posts, tweets (and other
micro-blogging posts), HTML, and plain text document. In addition, it
turns each of the aforementioned document types into end-user oriented
conduits for contributing data to public and/or private Linked Open Data
clouds, on a piecemeal basis -- i.e., you turn curating and publishing
Linked Open Data Cloud into a productive crowd-sourced jigsaw puzzle
game.

</div>

<div id="virtuosospongernntm" class="section">

<div class="titlepage">

<div>

<div>

#### Why is it important?

</div>

</div>

</div>

Being able to say anything, about anything, whenever, and from wherever,
in a manner that's both machine and human comprehensible has always sat
at the very foundations of the Semantic Web Project's value proposition.
Unfortunately, confusion about RDF -- the powerful language that drives
the notion of a global Semantic Web -- lead to a general bottom-up
misconception whereby most perceive it as a document content format
rather that an abstract language (system of signs, syntax, and
semantics) exploitable using a wide variety of notations.

</div>

<div id="virtuosospongernnthow" class="section">

<div class="titlepage">

<div>

<div>

#### How do I use it?

</div>

</div>

</div>

Due to the compact nature of RDF-Turtle notation, it is possible to
embed RDF statements into any text based content. The only requirements
are as follows:

<div class="itemizedlist">

- Use the following as a marker for embedded RDF-Turtle based RDF
  statements:

  ``` programlisting
  ## Turtle Start ##
  ## {Trutle-based-RDF-statements}
  ## Turtle End ##
  ```

- Honor the use of \<\> to indicate reference identifiers (absolute or
  relative)

- Optionally treat `@handle` as an HTTP URIs that denote Agents -- for a
  given data space (e.g., Twitter, LinkedIn, Facebook, Google+ etc..)

- Optionally treat `#hashtag` as an HTTP URI that denotes a Topic --
  ditto .

</div>

<div id="virtuosospongernnthowbasicr" class="section">

<div class="titlepage">

<div>

<div>

##### Basic Rules (authors and processing engines)

</div>

</div>

</div>

As per natural language sentences we have the following parts:

<div class="orderedlist">

1.  <span class="emphasis">*Subject*</span>

    -- statement focal point

2.  <span class="emphasis">*Predicate*</span>

    -- connection, association, link

3.  <span class="emphasis">*Object*</span>

    -- value of the connection, association, link.

</div>

Each sentence subject, predicate, object is denoted (named or referred
to) using an identifier (word, phrase, or term). If you want to generate
Linked Data that flows across data spaces your best bet is to denote
(refer to) sentence subject, predicate, and object (optionally) using
identifiers that function like terms -- by using HTTP URIs.

Use prefixes to shorten RDF-Turtle statements:

``` programlisting
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
```

Enables statements such as:

``` programlisting
<>
a foaf:Document .
```

</div>

<div id="virtuosospongernnthowex" class="section">

<div class="titlepage">

<div>

<div>

##### Examples

</div>

</div>

</div>

<div class="orderedlist">

1.  Most basic Nanotation:

    ``` programlisting
    <> a <#Document> .
    <> <#topic> <#Nanotation>.
    ```

2.  More sophisticated Nanotation that leverages terms from existing
    vocabularies:

    ``` programlisting
    <> a foaf:Document .
    <> foaf:topic <#Nanotation>  .
    ```

3.  More sophisticated Nanotation that leverages commas and semicolons
    for statement brevity e.g. when multiple sentences have a common
    Subject:

    ``` programlisting
    <>
    a foaf:Document;
    foaf:topic <#Nanotation>.
    ```

4.  When multiple sentences have a common Subject and Predicate but
    varying list of Objects:

    ``` programlisting
    <>
    a foaf:Document;
    foaf:topic <#Nanotation>, <#SemanticWeb>, <#LinkedData>.
    ```

5.  Incorporation of Pronouns into RDF sentence:

    ``` programlisting
    <> a foaf:Document .
    <> foaf:maker [a foaf:Person;
                   foaf:name "Kingsley Idehen"  ] .
    ```

6.  Processor (parser) hint markers that help Nanotation processors
    negate seriously mangled HTML content:

    ``` programlisting
    ## Turtle Start ##

    <>
    a foaf:Document;
    foaf:topic <#Nanotation>, <#SemanticWeb>, <#LinkedData>.

    ## Turtle End ##
    ```

</div>

</div>

<div id="virtuosospongernnthowprusage" class="section">

<div class="titlepage">

<div>

<div>

##### Nanotation Processor Usage

</div>

</div>

</div>

A nanotation processer is an application or service that's capable of
consuming text content enhanced with RDF-Turtle based nanotations.
Virtuoso's in-built Linked Data Transformation middleware (aka
"Sponger") is an example of an application that supports nanotation.
Likewise, our URIBurner service which is a free public service driven by
an instance of Virtuoso with the Sponger module enabled:

<div class="itemizedlist">

- When using your own instance of Virtuoso, the Sponger service is
  invoked via the URL pattern:

  ``` programlisting
  http://{cname-of-virtuoso-host-machine}/sponger
  ```

- When using the public
  <a href="http://linkeddata.uriburner.com/" class="ulink"
  target="_top">URIBurner service</a> , the Sponger services is invoked
  via the URL:

  ``` programlisting
  http://linkeddata.uriburner.com/
  ```

- Note: Either approach outlined above will lead you to an HTML page
  that contains an input field into which you can type or paste an
  HTTP-accessible document URL. Alternatively you can use the following
  URI patterns:

  ``` programlisting
  http://{cname-of-virtuoso-host-machine}/about/html/{document-http-uri}
  ```

</div>

In all cases, you will end up with an HTML document that includes RDF
statements that describe the processed document in a manner that also
reveals all the embedded nanotations.

</div>

<div id="virtuosospongernnthownotes" class="section">

<div class="titlepage">

<div>

<div>

##### Virtuoso Sponger Implementation Notes

</div>

</div>

</div>

The Sponger treats resources transferred over HTTP as a duality of both
a container document and a primary entity. When a resource is deemed to
be an HTML document, the document is treated as the primary entity.
Otherwise, where the domain is well known, a custom extractor cartridge
populates the primary entity with data arising from API calls and the
HTML content is regarded as secondary, relegated to the container
document. For example, G+ posts are recognized and the Sponger
concentrates on presenting the timestamp, body, tags and links and other
features of a post.

When sponging an HTTP resource, multiple extractor cartridges might be
brought to bear. Consequently, there may be multiple triples containing
the entity's content.

The Turtle Sniffer is implemented as a Metacartridge, i.e it runs after
all the extractor cartridges have run, augmenting data in the graph. It
uses SPARQL inference to collate predicates that constitute "content"
for this purpose, along with the HTTP request content (if any),
flattening each to plain text.

Currently, the list of potential content predicates is:

<div class="itemizedlist">

- `bibo:content` (e.g. arising from the HTML+Variants extractor
  cartridge)

- `bibo:abstract`

- `oplgplus:annotation` (used by Google+ for text when sharing items)

</div>

For each of these contents, it checks if it matches the patterns:

``` programlisting
## Nanotation Start ## .... ## Nannotation End ##
```

``` programlisting
## Turtle Start ## .... ## Turtle Stop ##
```

``` programlisting
{.... } (note: only applies to tweets on Twitter)
```

If a content contains one or more nanotation blocks, each block is
parsed in turn as Turtle; if not, it attempts to parse the content item
as Turtle in entirety.

The HTTP document content is only inspected in case of no triples having
been extracted by prior means.

Optionally (enabled by default) each triple may be reified, i.e an
rdf:Statement entity created to describe its subject, predicate and
object, so you can identify triples arising from nanotations as entities
labelled 'Embedded Turtle Statement' and a number in the graph.

<div id="virtuosospongernnthownotesdom" class="section">

<div class="titlepage">

<div>

<div>

###### Domain-Aware Tag and User Expansion

</div>

</div>

</div>

The Turtle Sniffer expands the patterns `#word` and `@word` when they
appear in URI (\<\>) or double quotes (""), in the context of the domain
of the URI being sponged.

For example, a Tweet containing the nanotation:

``` programlisting
## Nannotation Start ##
<@kidehen> foaf:name "Kingsley Idehen" ;
           foaf:knows <@openlink> ;
           scot:has_tag <#Data> .
## Nannotation End ##
```

will be expanded to a Turtle string:

``` programlisting
<https://twitter.com/kidehen> foaf:name "Kingsley Idehen" ;
  foaf:knows <https://twitter.com/openlink> ;
  scot:has_tag <https://twitter.com/hashtag/Data#this> .
```

We recognize custom URI formats for users and tags in the contexts of
Facebook, Twitter, G+, LinkedIn and Delicious.

Note that the word must appear within quotes -- this is to avoid
confusion with Turtle's @prefix directive (which is not a user!) and
problems that would be caused by performing similar expansions within a
quoted sentence.

</div>

</div>

</div>

<div id="virtuosospongernntliveexamples" class="section">

<div class="titlepage">

<div>

<div>

#### Live Examples

</div>

</div>

</div>

<div class="itemizedlist">

- <a href="http://twitter.com/kidehen/status/493857326680776705"
  class="ulink" target="_top">RDF statement about Privacy;</a>

- <a href="http://twitter.com/kidehen/status/493848344590966785"
  class="ulink" target="_top">RDFs usage re. property/predicate
  description;</a>

- <a
  href="https://plus.google.com/112399767740508618350/posts/hNt1df5G7tk"
  class="ulink" target="_top">owl:sameAs relation inserted into a Google+
  Post;</a>

- <a href="https://www.facebook.com/kidehen/posts/10152525312840751"
  class="ulink" target="_top">Heavy duty RDF statements in a Facebook
  post;</a>

- <a href="http://twitter.com/kidehen/status/494089069995896832"
  class="ulink" target="_top">Another Facebook post that puts Ted Nelsons
  talk on documents and hypertext into contemporary context;</a>

- <a href="https://twitter.com/OpenLink/status/556128747297193985"
  class="ulink" target="_top">A tweet reply demonstrating multiple
  embedded nanotation blocks and tags.</a>

</div>

</div>

<div id="virtuosospongernntliveexamplesstar" class="section">

<div class="titlepage">

<div>

<div>

#### Nanotation generated 5-Star Linked Open Data (via URIBurner - a Nanotation Processor) Examples

</div>

</div>

</div>

<div class="itemizedlist">

- <a href="http://bit.ly/nanotations-from-2014-07-28" class="ulink"
  target="_top">Various Nanotations from 28th July 2014;</a>

- <a href="http://bit.ly/nanotations-for-2014-07-27" class="ulink"
  target="_top">Various Nanotations from 27th July 2014;</a>

- <a
  href="http://bit.ly/utterances-on-twitter-2014-07-25-by-statement-subject"
  class="ulink" target="_top">Various Nanotations from 25th July 2014;</a>

- <a
  href="http://linkeddata.uriburner.com/about/html/https://twitter.com/OpenLink/status/556128747297193985"
  class="ulink" target="_top">A tweet reply demonstrating multiple
  embedded nanotation blocks and tags.</a>

</div>

</div>

<div id="virtuosospongernntfctexamples" class="section">

<div class="titlepage">

<div>

<div>

#### Faceted Browser Nanotation Examples

</div>

</div>

</div>

<div class="itemizedlist">

- Nanotation based RDF statement that describes Nannotation:

  <div class="figure-float">

  <div id="rdf1_01" class="figure">

  **Figure 16.111. Faceted Browser Nanotation RDF**

  <div class="figure-contents">

  <div class="mediaobject">

  ![Faceted Browser Nanotation RDF](images/ui/nano1.png)

  </div>

  </div>

  </div>

    

  </div>

- Nanotation that represents a "Hat Tip" relationship type:

  <div class="figure-float">

  <div id="rdf1_02" class="figure">

  **Figure 16.112. Faceted Browser Nanotation Hat Tip Type**

  <div class="figure-contents">

  <div class="mediaobject">

  ![Faceted Browser Nanotation Hat Tip Type](images/ui/nano2.png)

  </div>

  </div>

  </div>

    

  </div>

- Nanotation generated RDF statements aggregated by Subject:

  <div class="figure-float">

  <div id="rdf1_03" class="figure">

  **Figure 16.113. Faceted Browser Nanotation RDF Aggregation by
  Subject**

  <div class="figure-contents">

  <div class="mediaobject">

  ![Faceted Browser Nanotation RDF Aggregation by
  Subject](images/ui/nano3.png)

  </div>

  </div>

  </div>

    

  </div>

- Nanotation generated RDF statements by Subject:

  <div class="figure-float">

  <div id="rdf1_04" class="figure">

  **Figure 16.114. Faceted Browser Nanotation Generation by Subject**

  <div class="figure-contents">

  <div class="mediaobject">

  ![Faceted Browser Nanotation Generation by
  Subject](images/ui/nano4.png)

  </div>

  </div>

  </div>

    

  </div>

</div>

</div>

<div id="virtuosospongernnts_01" class="section">

<div class="titlepage">

<div>

<div>

#### 

</div>

</div>

</div>

</div>

<div id="virtuosospongernnts_02" class="section">

<div class="titlepage">

<div>

<div>

#### 

</div>

</div>

</div>

</div>

</div>
