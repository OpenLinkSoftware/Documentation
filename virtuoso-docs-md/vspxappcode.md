<div id="vspxappcode" class="section">

<div class="titlepage">

<div>

<div>

### 14.4.4. Application Code

</div>

</div>

</div>

Most VSPX controls will support XML children specifying SQL code to run
at various points of the page processing cycle. The elements are:

|                    |
|--------------------|
| v:before-data-bind |
| v:after-data-bind  |
| v:before-post      |
| v:before-render    |

These elements will have a script tag as unique child, most often
containing a CDATA section for escaping the SQL text.

Additionally, most attributes of VSPX elements can have a SQL expression
evaluated at initialization, pre data bind or after data bind time, as
the case may be, depending on the attribute and its value. An attribute
value beginning with `"--"` indicates evaluation on the initialization
or the descending edge of the data bind pass. An attribute value
indicating `"--after"` specifies that the value is calculated on the
returning edge of recursion of the data bind pass.

Arbitrary HTML text may contain attributes with a data bound value. The
attributes should be in the XHTML namespace and have a text beginning
with `"--"` . The expression will be evaluated at render time, where the
<span class="emphasis">*control*</span> variable refers to the enclosing
VSPX template control, e.g. the page instance when at top level.

<div id="vspxvspcompatinlinesql" class="section">

<div class="titlepage">

<div>

<div>

#### VSP Compatibility and In-Line SQL

</div>

</div>

</div>

Arbitrary HTML text may contain \<?vsp ?\>, \<?V ?\> (equivalent of \<?=
VSP notation) and \<?U ?\> (equivalent of \<?/ VSP notation) processing
instructions. The code in question will be evaluated during the render
pass, with control set to the closest enclosing VSPX control. Please
note that the \<?= and \<?/ VSP shortcuts cannot be used inside VSPX
pages as they are not valid processing-instructions.

VSPX maintains backward compatibility with VSP through supporting the
same processing instructions, but additionally requires the page source
to be well formed XML. VSP pages which are well formed in XML terms will
run as such under with the VSPX extension, with the addition of the
`v:page` top level element.

The \<?vsp ?\> processing instruction expects a SQL statement. The
statement can be a compound statement ending in another \<?vsp ?\>
processing instruction at the same nesting level under the same parent
tag. The other pi's \<?V and \<?U expect a SQL expression.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                   |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                             |
|                              | \<?V ?\> is not permitted inside attributes without quotation, as this is not well formed XML. When quoted, this notation in attributes has no special effect, hence the convention about the leading `"--"` and the `XHTML` namespace for HTML attributes with a computed value. |

</div>

</div>

</div>
