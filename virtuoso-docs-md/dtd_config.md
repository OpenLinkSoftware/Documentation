<div id="dtd_config" class="section">

<div class="titlepage">

<div>

<div>

### 15.7.2. Configuration Options of the DTD Validator

</div>

</div>

</div>

If some built-in Virtuoso/PL or XPATH function can invoke XML parser
then it is probably have a special argument to pass configuration
options to the XML parser. The most typical value of such an argument is
"configuration string" that is a sequence of pairs parameter=value,
delimited by spaces. Instead of single string, it can be passed as a
vector of strings of even length of sort

``` programlisting
vector (parameter1, value1, parameter2, value2 ...)
```

. It can be NULL indicating that the parser can use default values. No
errors are reported if a parameter is specified twice, in which case the
last specified value will be used. The only exception is the
'Validation' parameter which sets typical values for all parameters; if
it is specified then it should be the first parameter in the list. Both
parameter names and values are case-insensitive.

Many parameters are used to specify the importance of a particular
error. For a particular application some validity constraints may be
much more important than others. Because less than perfectly valid XML
is common in practice it is important to configure the validator to
report only those errors which are relevant to the application. Using
configuration parameters, one may specify "importance levels" for every
group of problems. There are 5 "importance levels":

<div id="id46691" class="table">

**Table 15.1. Error Catch Levels**

<div class="table-contents">

| Error Level                            | Description                                                                                                                                                                                                                          |
|----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errortext">FATAL</span>   | violations must be reported and further processing of XML source must be terminated right after the term where the violation was detected, without checking for errors in the rest of the document                                   |
| <span class="errortext">ERROR</span>   | violations must be reported and validation should continue to find further errors, but no XML document will be built if validation is invoked from such function as <a href="fn_xtree_doc.html" class="link" title="xtree_doc"><code 
                                          class="function">xtree_doc() </code></a> or <a href="fn_xper_doc.html" class="link" title="xper_doc"><code                                                                                                                            
                                          class="function">xper_doc() </code></a>                                                                                                                                                                                               |
| <span class="errortext">WARNING</span> | violations must be reported but XML processing will continue                                                                                                                                                                         |
| <span class="errortext">IGNORE</span>  | validator must try to locate violations of given sort but only severe (possibly fatal) violations must be reported                                                                                                                   |
| <span class="errortext">DISABLE</span> | the specified check must be turned off fully, saving time and maybe memory                                                                                                                                                           |

</div>

</div>

  

Some parameters are just switches, with only two values available:
'ENABLE' and 'DISABLE'.

**AttrCompletion (ENABLE/DISABLE, default is DISABLE). ** This is useful
when DTD validator is invoked from XML parser. When enabled, the XML
document built will contain default values of 'IMPLIED' attributes as if
they present in source text. It may be useful if application should
perform free-text search on all attribute values including defaults or
if XML should be converted in form suitable for external non-validating
XML processor or if given XML data should be stored later as part of
composite document and composite document will have another DTD with
other default values.

**AttrMisFormat (FATAL/ERROR/WARNING/IGNORE/DISABLE, default is
DISABLE). ** This describes how to report errors in syntax of values of
attributes.

**AttrUnknown (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This describes
how to report attributes whose names are not listed in the DTD.

**BadRecursion (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This describes
how to report circular references, when replacement text of an entity
contains reference to this entity again, either directly (e.g.
'\<!ENTITY bad "some &bad; replacement"\>) or through other entities
(e.g. '\<!ENTITY a "&b;"\> '\<!ENTITY b "&a;"\>).

**BuildStandalone (ENABLE/DISABLE, default is DISABLE). ** When set to
ENABLE, replacement texts of external entities will be inserted instead
of references to these entities, thus all data from a composite document
will be gathered together into one large XML. This is useful for
checking the element content model of the whole document without breaks
on references or if parsed XML will be passed to external application as
a standalone document.

**Fsa (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This describes how to
report violations of specified element-content model. Virtuoso's DTD
validator contains a finite state automaton which can detect the first
error in the content of some element, but remaining errors in the same
element become "obscured" by the first one and will not be reported.
Moreover, if element-content model is not SGML-compatible, some errors
may remain undiscovered: it is possible to write a complex rule, so
ambiguous that full check of all its interpretations will take
prohibitively much time and memory. The validator will simplify such
rules to make check faster, thus some errors will not be reported.

**FsaBadWs (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This describes how
to report the most frequent violation of element-content model specified
by DTD: the use of whitespace characters in positions where only
elements are allowed, not PCDATA. It usually happens when XML is
indented for readability. You may wish to specify 'FsaBadWs=IGNORE' to
eliminate redundant messages about this violation. Note that if you will
specify 'FsaBadWs=DISABLE' then you will disable the check of illegal
PCDATA tokens for this particular case, so common rule for 'Fsa'
violations will be applied and you will see messages.

**FsaSgml (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This describes how to
report violations of SGML compatibility in element-content model. Some
complex DTD rules for elements are not supported by SGML processors and
the validator may report the use of such rules.

**GeRedef (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This describes how to
report redundant definitions of generic entities. There redefinitions
are errors in SGML but they may be ignored in XML processing. The first
definition will be used and others will be ignored.

**IdDuplicates (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This describes
how to report non-unique values of ID attributes. It is a data integrity
error, because IDs are usually parts of some primary keys, and are
expected to be unique.

**IdrefIntegrity (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This describes
how to report "dangling references". Any value of IDREF attribute and
any name from value of IDREFS attribute should appear in the same XML
document as value of some ID attribute. You can think that an ID
attribute specifies a hyperlink anchor and IDREF is a hyperlink, so it's
a data integrity error if a hyperlink points to unknown location.

**Include (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This configures
reading of external sub-documents into "main" document you validate (and
maybe load in database). If 'DISABLE', no additional documents will be
read, otherwise external parameter-entities, external generic-entities
and external DTD will be located, using their SYSTEM names. External
documents may reside in file system, in database or in the Web. Absolute
SYSTEM names (of form 'protocol://server/resource') will be used without
any modifications, relative SYSTEM names should be "resolved", i.e.
converted to absolute by adding a prefix from the *`base_uri`* argument
of SQL function.

**MaxErrors (a string that represents an integer from 1 to 10000,
default is '25'). ** This specifies how many errors may be logged before
the "Too many error messages" fatal error will be reported.

**MaxWarnings (a string that represents an integer from 0 to 10000,
default is '100'). ** This specifies how many warnings may be logged
before the "Too many warning messages" event will stop their logging.

**NamesUnknown (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This describes
how to report if the document contains element names which are not the
declared in DTD. They may be typos in element names or signal that DTD
is incomplete or obsolete. In addition, unknown names may be reported as
element-content model violations.

**NamesUnordered (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This describes
how to report element names not declared before use in DTD. Proper order
("declare element name before use it") is important solely for
compatibility with SGML standard.

**NamesUnresolved (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This
describes how to report if an element name used in the DTD is not
declared at all. This may occur if DTD is incomplete or if some
declaration in it are ignored conditional sections. Unresolved names
cause no data integrity errors while remain unused in data section of
the XML document, NamesUnknown parameter defines what happens if they're
actually used.

**PeRedef (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This describes how to
report redundant definitions of parameter entities. Similarly to
redefinitions of generic entities, there redefinitions are errors in
SGML but they may be ignored in XML processing. The first definition
will be used and others will be ignored.

**Sgml (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This describes how to
report violations of SGML compatibility. In fact, not all such
violations are detected by the Virtuoso Server, because known SGML
readers are insensitive to some sorts of violations.

**TooManyWarns (FATAL/ERROR/WARNING/IGNORE/DISABLE). ** This describes
how to report "Too many warning messages" event. While "Too many errors"
is fatal error and terminates XML processing, "Too many warning
messages" may have arbitrary "importance levels".

**TraceLoading (ENABLE/DISABLE, default is DISABLE). ** If set to
'ENABLE', the validator will log every reading of any resource, for
easier tracking of URI resolving problems. It's possible that some
readings of sub-documents will not be reported: there's a limit for
number of records in the log returned by the validator. In addition,
sub-documents may be cached inside validator, so only first references
to some sub-document will require reading procedure.

**Validation (SGML/RIGOROUS/QUICK/DISABLE, default is DISABLE). ** This
loads one of four "preset configurations". It must be the first
parameter in configuration string, if used. DISABLE means "do not check
for any type of error", QUICK is to check only for violation of "local"
validity constraints, with disabled FsaBadWs, IdDuplicates and
IdrefIntegrity, RIGOROUS enables these three groups, too, SGML enables
all checks including all checks for SGML compatibility.

**VcData (ENABLE/DISABLE, default is DISABLE). ** This describes how to
report violations of generic validity constraints in data section of XML
document. If constraint is not configured by other parameters listed
here, it will be configured by this parameter (or by VcDtd if relates to
the text of DTD section).

**VcDtd (ENABLE/DISABLE, default is DISABLE). ** This describes how to
report violations of generic validity constraints in DTD section of XML
document. If constraint is not configured by other parameters listed
here, it will be configured by this parameter (or by VcData if relates
to the text of data section).

</div>
