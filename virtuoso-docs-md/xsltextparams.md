<div>

<div>

<div>

<div>

### 15.9.3. External Parameters in XSLT Stylesheets

</div>

</div>

</div>

The XSLT 1.0 standard specifies that parameters may be passed to the
XSLT processor from its environment in order to control data
transformation, but the details are implementation-specific. Virtuoso's
XSLT Processor will accept default values for global parameters from the
optional third argument of the
<a href="fn_xslt.html" class="link" title="xslt">xslt()</a> Virtuoso PL
function. This argument, if specified, must be a vector of parameter
names and values of the form

``` programlisting
vector(name1, value1,... nameN,
valueN)
```

, where *`name1 ... nameN`* must be of type *`varchar`* , and
*`value1 ... valueN`* may be of any Virtuoso datatype, but may not be
null. If a parameter has a null value specified, it is removed from the
vector without any further processing. After removal of null values,
duplicate names are eliminated. If a name occurs more than once in the
vector, only the last one will be retained.

When the XSLT Processor begins the transformation of the document, it
creates two stacks of variables, one for global variables and one for
local variables. Initially the stacks are empty. Then it prepares
temporary indexes for all *`<xsl:key>`* elements; all future calls of
<a href="xpf_key.html" class="link" title="key"><code
class="function">key()</code></a> function will return without any
searches through the source document. Only after the processing of all
keys of the stylesheet, the XSLT Processor pushes all parameters from
the third argument of the
<a href="fn_xslt.html" class="link" title="xslt"><code
class="function">xslt()</code></a> function into the stack of local
variables. Then, as described in the XSLT specification, it initializes
top-level variables and parameters. For every *`<xsl:variable>`* or
*`<xsl:param>`* element found at the top-level of the main stylesheet or
at the top level of some imported stylesheet, the processor calculates
the value and pushes the created variable into the stack of local
variables. The *`<xsl:param>`* element is ignored if the specified name
is already declared in the vector of parameters or in some stylesheet
imported before. When all top-level variables and parameters are
initialized, the content of the stack of local variables is moved into
the stack of global variables, and the stack of local variables is made
empty. During the rest of the XSLT transformation, these variables will
be used as global variables. They may be temporarily shadowed by inner
declarations of local variables - though not by declarations of local
parameters - but they cannot be changed. Note that expressions for
values of variables and parameters may contain calls of
<a href="xpf_key.html" class="link" title="key"><code
class="function">key()</code></a> function, because temporary indexes
are ready to use before the first such expression is calculated.
Expressions of *`<xsl:key>`* elements may not refer to any parameters or
variables, due to the same reason.

</div>
