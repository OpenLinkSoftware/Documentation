<div id="rdfconnvarsiniriclasses" class="section">

<div class="titlepage">

<div>

<div>

### 16.5.8. Connection Variables in IRI Classes

</div>

</div>

</div>

Writing function-based IRI class is overkill when the IRI can in
principle be made by a
<a href="fn_sprintf_iri.html" class="link" title="sprintf_iri"><code
class="function">sprintf_iri</code></a> but the format should contain
some context-specific data, such as host name used for the
<a href="ch-rdfandsparql.html#rdfdynamiclocal" class="link"
title="16.1.8. Dynamic Renaming of Local IRI&#39;s">dynamic renaming of
local IRIs</a> . Format strings offer a special syntax for that cases.
<span class="emphasis">*%{varname}U*</span> acts as
<span class="emphasis">*%U*</span> but the function
<a href="fn_sprintf.html" class="link" title="sprintf"><code
class="function">sprintf</code></a> will take the value from client
connection variable <span class="emphasis">*varname*</span> , not from
list of arguments. Similarly,
<a href="fn_sprintf_inverse.html" class="link"
title="sprintf_inverse"><code
class="function">sprintf_inverse</code></a> will not return fragment
that match to <span class="emphasis">*%{varname}U*</span> in the vector
of other fragments; instead it will get the value from connection
environment and ensure that it matches the fragment of input; mismatch
between printed and actual value of variable will means that the whole
string do not match the format.

SPARQL optimizer knows about this formatting feature and sometimes it
makes more deductions from occurrence of
<span class="emphasis">*%{varname}U*</span> than from occurrence of
plain <span class="emphasis">*%U*</span> , so this notation may be used
in <span class="emphasis">*option ( returns ...)*</span> when
appropriate. Of course, the optimizer has no access to the actual value
of connection variable because it may vary from run to run or may change
between the compilation and the run, but the value is supposed to be
persistent during any single query run so
<span class="emphasis">*%{myvariable}U*</span> in one place is equal to
<span class="emphasis">*%{myvariable}U*</span> in other.

Connection variables are set by
<a href="fn_connection_set.html" class="link"
title="connection_set"><code class="function">connection_set</code></a>
and some of them have default values that are used if not overridden by
application:

<div class="itemizedlist">

- <span class="emphasis">*URIQADefaultHost*</span>

  is for default host as it is specified in Virtuoso configuration file.
  Note, however, that it will be escaped when printed so if it contains
  colon and port number then the colon is escaped. In addition, there
  are special variables that match dynamic renaming of local IRIs more
  accurately.

- <span class="emphasis">*WSHost*</span>

  is for host and port as it is used by current client connection for
  dynamic renaming. The colon before port will be escaped.

- <span class="emphasis">*WSHostName*</span>

  is for host name only, without port, as it is used by current client
  connection for dynamic renaming.

- <span class="emphasis">*WSHostPort*</span>

  is for port part of host IRI. That is string, not integer. The only
  real use of the variable is in formats like

  <span class="emphasis">*http://%{WSHostName}U:%{WSHostPort}U/...*</span>

  .

</div>

It is inconvenient to write different format strings for different
cases. Two most common policies are different host names for default
HTTP port of a publicly available service and different non-default
ports for one or more host names of an intranet installation; these two
approaches are almost never used in a mix. So declaration of IRI classes
may use shorthand <span class="emphasis">*^{DynamicLocalFormat}^*</span>
in format strings that is expanded either to
<span class="emphasis">*http://%{WSHost}U*</span> or to
<span class="emphasis">*http://%{WSHostName}U:%{WSHostPort}U/...*</span>
, depending on absence or presence of port number in the value of
<span class="emphasis">*DefaultHost*</span> parameter of
<span class="emphasis">*URIQA*</span> section of configuration file.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                   |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                                                                                                              |
|                              | <span class="emphasis">*^{DynamicLocalFormat}^*</span> is for IRI class declarations only and is not expanded in any other place, so it is useful sometimes to create an IRI class with empty argument list in order to get "almost constant" IRIs calculated without writing special procedures. |

</div>

</div>
