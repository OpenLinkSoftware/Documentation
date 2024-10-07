<div id="fn_urlrewrite_create_regex_rule" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

URLREWRITE_CREATE_REGEX_RULE — Creates regex rules.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_urlrewrite_create_regex_rule" class="funcsynopsis">

|                                           |                                      |
|-------------------------------------------|--------------------------------------|
| ` `**`URLREWRITE_CREATE_REGEX_RULE`**` (` | in `rule_iri ` varchar ,             |
|                                           | in `allow_update ` integer ,         |
|                                           | in `nice_match ` varchar ,           |
|                                           | in `nice_params ` any ,              |
|                                           | in `nice_min_params ` integer ,      |
|                                           | in `target_compose ` varchar ,       |
|                                           | in `target_params ` any ,            |
|                                           | in `target_expn ` varchar ,          |
|                                           | in `accept_pattern ` varchar ,       |
|                                           | in `do_not_continue ` integer ,      |
|                                           | in `http_redirect_code ` integer ,   |
|                                           | in `http_header_lines ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_urlrewrite_create_regex_rule" class="refsect1">

## Description

Creates regex rules.

</div>

<div id="params_urlrewrite_create_regex_rule" class="refsect1">

## Parameters

<div id="id93826" class="refsect2">

### *`rule_iri `*

The rule's name / identifier

</div>

<div id="id93830" class="refsect2">

### *`allow_update `*

Indicates whether the rule can be updated. 1 indicates yes; 0 indicates
no. The update is subject to the following rules:

If the given rule_iri is already in use as a rule list identifier, an
error is signaled.

If the given rule_iri is already in use as a rule identifier and
allow_update for the existing rule is zero, an error is signalled.

If the given rule_iri is already in use as a rule identifier and
allow_update for the existing rule is non-zero, the existing rule is
updated.

</div>

<div id="id93837" class="refsect2">

### *`nice_match `*

A regex match expression to parse the URL into a vector of occurrences.

</div>

<div id="id93841" class="refsect2">

### *`nice_params `*

A vector of the names of the parsed parameters. The length of the vector
should be equal to the number of '(...)' specifiers in the format
string.

</div>

<div id="id93845" class="refsect2">

### *`nice_min_params `*

Used to specify the minimum number of sprintf format patterns to be
matched in order to trigger the given rule. In existing versions of
Virtuoso it only affects sprintf rules and has no effect for regex
rules.

</div>

<div id="id93849" class="refsect2">

### *`target_compose `*

A regex compose expression for the URL of the destination page.

</div>

<div id="id93853" class="refsect2">

### *`target_params `*

A vector of names of parameters that should be passed to the compose
expression (target_compose) as \$1, \$2 and so on.

Special names can be used in addition to names from *`nice_params `* .
That names start and end with asterisk. Name '\*accept\*' is for
required MIME type string, other names of the sort refer to values from
HTTP request header lines. Note that '\*Accept\*' will return the whole
"Accept:" line whereas '\*accept\*' is for the part that matches
*`accept_pattern `* .

</div>

<div id="id93860" class="refsect2">

### *`target_expn `*

Optional SQL text that should be executed instead of a regex compose
call.

</div>

<div id="id93864" class="refsect2">

### *`accept_pattern `*

A regex expression to match the HTTP Accept header

</div>

<div id="id93868" class="refsect2">

### *`do_not_continue `*

If the given rule satisfies the match conditions, 1 signifies do not try
the next rule from same rule list, and 0 signifies try the next rule.

</div>

<div id="id93872" class="refsect2">

### *`http_redirect_code `*

NULL or the integer values 301, 302, 303, or 406, are currently allowed.
If a 3xx redirect code is given, an HTTP redirect response will be sent
back to client. If NULL is specified, the server will process the
redirect internally.

</div>

<div id="id93876" class="refsect2">

### *`http_header_lines `*

Additional header lines to be added to the return value.

</div>

</div>

<div id="ret_urlrewrite_create_regex_rule" class="refsect1">

## Return Types

The return value is not specified.

</div>

<div id="examples_urlrewrite_create_regex_rule" class="refsect1">

## Examples

<div id="ex_urlrewrite_create_regex_rule1" class="example">

**Example 24.184. Example 1**

<div class="example-contents">

``` programlisting
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'demo_nw_rule1',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/sparql?query=CONSTRUCT+{+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%23this%%3E+%%3Fp+%%3Fo+}+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/Northwind%%3E+WHERE+{+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%23this%%3E+%%3Fp+%%3Fo+}&format=%U',
    vector('path', 'path', '*accept*'),
    null,
    '(text/rdf.n3)|(application/rdf.xml)',
    0,
    null
    );
```

</div>

</div>

  

<div id="ex_urlrewrite_create_regex_rule2" class="example">

**Example 24.185. Example 2**

<div class="example-contents">

``` programlisting
DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'demo_nw_rule2',
    1,
    '^/~(.*)',
    vector('uname'),
    1,
    '/home/%s',
    vector('uname'),
    null,
    null,
     2,
     null,
     'MS-Author-Via: DAV'
    );
```

</div>

</div>

  

</div>

</div>
