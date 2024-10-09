<div>

<div>

<div>

<div>

## 23.2. Error Codes Reference

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 23.2.1. Virtuoso Error Codes

</div>

</div>

</div>

<div>

**Table 23.1. Virtuoso Errors Sub-Codes List**

<div>

| Virtuoso Sub-Code                                                        | Description                    |
|--------------------------------------------------------------------------|--------------------------------|
| <a href="errors.html#srxxx" class="link"                                 
 title="SQL Runtime Error">SR</a>                                          | SQL Runtime                    |
| <a href="errors.html#faxxx" class="link" title="File Access">FA</a>      | File access                    |
| <a href="errors.html#sqxxx" class="link" title="SQL Compiler">SQ</a>     | SQL Compile                    |
| <a href="errors.html#clxxx" class="link" title="Client Side">CL</a>      | client-side                    |
| <a href="errors.html#htxxx" class="link" title="HTTP Server">HT</a>      | HTTP Server                    |
| <a href="errors.html#ftxxx" class="link" title="Free-Text">FT</a>        | Free-text                      |
| <a href="errors.html#dcxxx" class="link" title="2 Phase Commit">DC</a>   | 2 phase commit                 |
| <a href="errors.html#vdxxx" class="link" title="VDB">VD</a>              | VDB                            |
| <a href="errors.html#dtxxx" class="link"                                 
 title="Date/Time Routines">DT</a>                                         | date/time routines             |
| <a href="errors.html#inxxx" class="link"                                 
 title="Internationalization Routines">IN</a>                              | Internationalization routines  |
| RE                                                                       | Replication                    |
| <a href="errors.html#trxxx" class="link"                                 
 title="Transactional Replication">TR</a>                                  | Transactional replication      |
| <a href="errors.html#daxxx" class="link" title="WebDAV Domain">DA</a>    | WebDAV domain                  |
| <a href="errors.html#smxxx" class="link"                                 
 title="SMTP/Mail Functions">SM</a>                                        | SMTP functions, Mail functions |
| <a href="errors.html#poxxx" class="link" title="POP3 Functions">PO</a>   | POP3 functions                 |
| <a href="errors.html#nnxxx" class="link" title="NNTP Server">NN</a>      | NNTP server                    |
| GN                                                                       | GNW                            |
| <a href="errors.html#xsxxx" class="link" title="XSLT Processor">XS</a>   | XSLT                           |
| <a href="errors.html#crxxx" class="link"                                 
 title="Cryptographic API">CR</a>                                          | Crypto API                     |
| <a href="errors.html#udxxx" class="link"                                 
 title="User Define Types">UD</a>                                          | User Defined Types             |
| <a href="errors.html#kbxxx" class="link" title="Kerberos Library">KB</a> | Kerberos Library               |
| <a href="errors.html#hoxxx" class="link" title="Hosting">HO</a>          | Hosting                        |

</div>

</div>

  
<span style="color: red">\<title\>SQL Runtime Error\</title\></span>

<div>

<div>

<span class="errorcode">SR000</span>
<span class="errortype">22023</span>
<span class="errortext">\<function_name\> expects a vector, not an arg
of type \<dv_type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR001</span>
<span class="errortype">37000</span> <span class="errortext">More than
one resultset not supported in a procedure called from exec</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR002</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs a string output as argument \<index\>, not an
arg of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR003</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs an XML entity as argument \<index\>, not an arg
of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR004</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs a binary as argument \<index\>, not an arg of
type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR005</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs a string or NULL as argument \<index\>, not an
arg of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR006</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs a string or NULL as argument \<index\>, not an
arg of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR007</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs a string or NULL as argument \<index\>, not an
arg of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR008</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs an integer as argument \<index\>, not an arg of
type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR009</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs a float as argument \<index\>, not an arg of
type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR010</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs a double as argument \<index\>, not an arg of
type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR011</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs an int or a string as argument \<index\>, not an
arg of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR012</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs a string or an array as argument \<index\>, not
an arg of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR013</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs a string or an array as argument \<index\>, not
an arg of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR014</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs a string as argument \<index\>, not an arg of
type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR015</span>
<span class="errortype">22023</span> <span class="errortext">Function
length is not applicable to XML tree entity</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR016</span>
<span class="errortype">22023</span> <span class="errortext">Function
length needs a string or array as its argument, not an argument of type
\<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR017</span>
<span class="errortype">22003</span> <span class="errortext">aref: Bad
array subscript (zero-based) \<index\> for an arg of type \<type_name\>
and length \<length\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR018</span>
<span class="errortype">22023</span> <span class="errortext">non-generic
vector for aref_set_0</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR019</span>
<span class="errortype">22003</span> <span class="errortext">Bad
subscript for aref_set_0</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR020</span>
<span class="errortype">22003</span> <span class="errortext">Bad array
subscript \<index\> in aset.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR021</span>
<span class="errortype">22003</span> <span class="errortext">make_array
called with an invalid count \<count\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR022</span>
<span class="errortype">22023</span> <span class="errortext">Type for
make_array must be float, double, long or any</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR023</span>
<span class="errortype">22023</span> <span class="errortext">Function
subseq needs a string or object id as its first argument, not an arg of
type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR024</span>
<span class="errortype">22023</span> <span class="errortext">Function
subseq needs integers or NULLs as its arguments 2 and 3, not an argument
of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR025</span>
<span class="errortype">22011</span> <span class="errortext">subseq: Bad
string subrange: from=\<from\>, to=\<to\>, len=\<length\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR026</span>
<span class="errortype">22011</span> <span class="errortext">substr: Bad
string subrange: from=\<from\>, to=\<to\>, len=\<length\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR027</span>
<span class="errortype">22023</span> <span class="errortext">Source
string arg (#1) to replace was not a wide string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR028</span>
<span class="errortype">22023</span> <span class="errortext">From arg
(#2) to replace was not a wide string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR029</span>
<span class="errortype">22023</span> <span class="errortext">To arg (#3)
to replace was not a wide string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR030</span>
<span class="errortype">22003</span> <span class="errortext">Too few
arguments for \<function_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR031</span>
<span class="errortype">22023</span> <span class="errortext">Invalid
format string for sprintf at escape \<index\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR032</span>
<span class="errortype">22026</span> <span class="errortext">sprintf
escape \<index\> (\<escape\>) exceeds the internal buffer of 2000</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR033</span>
<span class="errortype">22026</span> <span class="errortext">The length
of the data for sprintf argument \<index\> exceed the maximum of
2000</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR034</span>
<span class="errortype">22026</span> <span class="errortext">The length
of the data for sprintf argument \<index\> exceed the maximum of
2000</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR035</span>
<span class="errortype">22026</span> <span class="errortext">The length
of the data for sprintf argument \<index\> exceed the maximum of
2000</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR036</span>
<span class="errortype">22025</span> <span class="errortext">The URL
escaping sprintf escape \<index\> doesn't support modifiers</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR037</span>
<span class="errortype">22025</span> <span class="errortext">The HTTP
escaping sprintf escape \<index\> doesn't support modifiers</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR038</span>
<span class="errortype">22023</span> <span class="errortext">Invalid
format string for sprintf</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR039</span>
<span class="errortype">22023</span> <span class="errortext">The first
argument to strstr is not a wide string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR040</span>
<span class="errortype">22023</span> <span class="errortext">The second
argument to strstr is not a wide string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR041</span>
<span class="errortype">22023</span> <span class="errortext">Argument 1
of locate is not a wide string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR042</span>
<span class="errortype">22023</span> <span class="errortext">Argument 2
of locate is not a wide string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR043</span>
<span class="errortype">22019</span> <span class="errortext">the escape
should be non-empty string in matches_like</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR044</span>
<span class="errortype">22023</span> <span class="errortext">Function
ascii needs a string or similar thing as its argument, not an argument
of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR045</span>
<span class="errortype">22023</span> <span class="errortext">Function
mod needs two integers as its arguments, not an argument of type
\<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR046</span>
<span class="errortype">22012</span> <span class="errortext">Division by
zero in mod(\<n1\>,\<n2\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR047</span>
<span class="errortype">22023</span> <span class="errortext">Function
sign needs a numeric type as its argument, not an argument of type
\<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR048</span>
<span class="errortype">22023</span> <span class="errortext">Function
abs needs a numeric type as its argument, not an argument of type
\<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR049</span>
<span class="errortype">22023</span> <span class="errortext">Data type
is not suitable for storage into a global variable
(connection_set)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR050</span>
<span class="errortype">22023</span>
<span class="errortext">connenction_vars_set expects a vector or null as
argument not of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR051</span>
<span class="errortype">22023</span>
<span class="errortext">connenction_vars_set expects a vector of even
length, not of length \<length\> (of type \<type_name\>
(\<dv_type\>))</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR052</span>
<span class="errortype">22023</span>
<span class="errortext">connenction_vars_set expects a string as name of
connection variable not of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR053</span>
<span class="errortype">22023</span> <span class="errortext">Data type
is not suitable for storage into a global variable
(connection_set)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR054</span>
<span class="errortype">22023</span> <span class="errortext">Function
oid_class_spec needs an object id as its argument, not an argument of
type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR055</span>
<span class="errortype">22023</span> <span class="errortext">Function
oid_class_spec detected an object id whose length \<length\> \< 4.
oid\[0\]=\<u1\>. oid\[1\]=\<u2\>. oid\[2\]=\<u3\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR056</span>
<span class="errortype">22023</span>
<span class="errortext">\<function_name\> expects the type of item
searched for \<type_name\> (\<dv_type\>) and the type of the vector
searched from \<type_name\> (\<dv_type\>) to match.
Veclen=\<length\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR057</span>
<span class="errortype">22023</span> <span class="errortext">get_keyword
expects a vector of even length, not of length \<length\> (of type
\<type_name\> (\<dv_type\>))</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR058</span>
<span class="errortype">22023</span> <span class="errortext">get_keyword
expects a vector</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR059</span>
<span class="errortype">22024</span>
<span class="errortext">get_keyword_ucase expects a vector of even
length, not of length \<length\> (of type \<type_name\>
(\<dv_type\>))</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR060</span>
<span class="errortype">22003</span> <span class="errortext">position:
cannot check every 0th element of vector of type \<type_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR061</span>
<span class="errortype">22023</span> <span class="errortext">position:
expects a vector whose length is divisible by \<d\>, not of length
\<d2\> (of type \<type_name\> (\<dv_type\>))</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR062</span>
<span class="errortype">22023</span> <span class="errortext">Row in a
row function is not a valid row string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR063</span>
<span class="errortype">22023</span> <span class="errortext">row string
must begin with container header</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR064</span>
<span class="errortype">22015</span> <span class="errortext">Conversion
overflow from numeric</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR065</span>
<span class="errortype">22023</span> <span class="errortext">Can't
convert SQL_DATA_AT_EXEC blob to varchar. Parameter may only be used in
insert or update</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR066</span>
<span class="errortype">22023</span> <span class="errortext">Unsupported
case in CONVERT</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR067</span>
<span class="errortype">22023</span> <span class="errortext">Collation
specified in cast for non-string datatype \<type_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR068</span>
<span class="errortype">22023</span> <span class="errortext">XML tree
cannot be used as argument of blob_to_string\[\_output\]</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR069</span>
<span class="errortype">22001</span> <span class="errortext">Attempt to
convert a persistent XML document longer than VARCHAR maximum in
blob_to_string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR070</span>
<span class="errortype">22023</span>
<span class="errortext">blob_to_string\[\_output\] requires a blob or
string argument</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR071</span>
<span class="errortype">22023</span> <span class="errortext">Blob
argument to blob_to_string\[\_output\] must be a non-interactive
blob</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR072</span>
<span class="errortype">22001</span> <span class="errortext">Blob longer
than maximum string length not allowed in blob_to_string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR073</span>
<span class="errortype">22023</span> <span class="errortext">Function
log_text needs an array as argument \<index\> not BLOB HANDLE</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR074</span>
<span class="errortype">25000</span> <span class="errortext">replay must
be run in a fresh transaction.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR075</span>
<span class="errortype">22023</span> <span class="errortext">Bad
isolation. Must be uncommitted / committed / repeatable /
serializable</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR076</span>
<span class="errortype">22023</span> <span class="errortext">ISOLATION
option needs a string as value (uncommitted / committed / repeatable /
serializable)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR077</span>
<span class="errortype">42S22</span> <span class="errortext">Bad option
for SET</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR078</span>
<span class="errortype">22005</span> <span class="errortext">The cursor
parameter is not settable</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR079</span>
<span class="errortype">22023</span> <span class="errortext">Too few
arguments to exec_next(cursor, state, message, row)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR080</span>
<span class="errortype">22023</span> <span class="errortext">Parameter 4
is not a valid local exec handle</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR081</span>
<span class="errortype">22023</span> <span class="errortext">Parameter 1
is not a valid local exec handle</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR082</span>
<span class="errortype">22003</span> <span class="errortext">Non numeric
comparison</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR083</span> <span class="errortype"></span>
<span class="errortext">Numeric error (22003 Numeric value out of range
\| 22012 Division by zero \| 37000 Syntax error \| S1000 General error
\| S1107 Row value out of range \| 22012 Division by 0)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR084</span>
<span class="errortype">42S22</span> <span class="errortext">The column
\<column_name\> is not defined in the given table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR085</span>
<span class="errortype">22012</span> <span class="errortext">Division by
0</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR086</span>
<span class="errortype">22012</span> <span class="errortext">Division by
0</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR087</span>
<span class="errortype">22003</span> <span class="errortext">Non numeric
arguments to arithmetic operation</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR088</span>
<span class="errortype">22012</span> <span class="errortext">Division by
0</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR089</span>
<span class="errortype">22012</span> <span class="errortext">Division by
0</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR090</span>
<span class="errortype">22012</span> <span class="errortext">Division by
0</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR091</span>
<span class="errortype">22003</span> <span class="errortext">Non numeric
arguments to arithmetic operation modulo</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR092</span>
<span class="errortype">42000</span> <span class="errortext">system call
not allowed on this server</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR093</span>
<span class="errortype">22000</span> <span class="errortext">Error in
compressing</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR094</span>
<span class="errortype">22023</span>
<span class="errortext">string_output_gz_compress needs a string_output
as a first argument, not an argument of type \<type\>
(\<DV_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR095</span>
<span class="errortype">22023</span>
<span class="errortext">gz_uncompress needs a string_output as a second
argument, not an argument of type \<type\> (\<DV_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR096</span>
<span class="errortype">21S01</span> <span class="errortext">Function
crypt needs a string or integer as its second argument. Not an arg of
type \<type\> (\<DV_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR097</span>
<span class="errortype">2201B</span> <span class="errortext">regexp
error : could not obtain substring (\<offset\> of \<length\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR098</span>
<span class="errortype">2201B</span> <span class="errortext">regexp
error after: \<pattern\> (\<error\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR099</span>
<span class="errortype">22023</span> <span class="errortext">BLOB
submitted by client as SQL_DATA_AT_EXEC cannot be converted into
anything. It must first be stored into a BLOB column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR100</span>
<span class="errortype">22003</span> <span class="errortext">The
requested subsequence of BLOB is longer than 10Mb, thus it cannot be
stored as a string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR101</span>
<span class="errortype">22023</span> <span class="errortext">BLOB
submitted by client as SQL_DATA_AT_EXEC cannot be converted into
anything. It must first be stored into a BLOB column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR102</span>
<span class="errortype">22026</span> <span class="errortext">Error in
compressing (invalid input)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR103</span> <span class="errortype"></span>
<span class="errortext">Zlib error (22000 Error in compressing \| 22003
Error in compressing (compression level parameter is invalid) \| 22005
Error in compressing (not enough memory) \| 22026 Error in compressing
(not enough room in the output buffer))</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR104</span>
<span class="errortype">22025</span> <span class="errortext">Error in
decompressing</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR105</span>
<span class="errortype">42000</span>
<span class="errortext">Unclassified SQL error</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR106</span>
<span class="errortype">40009</span> <span class="errortext">Out of disk
on database</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR107</span>
<span class="errortype">42000</span> <span class="errortext">Read only
transaction for modify operation.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR108</span>
<span class="errortype">4000X</span> <span class="errortext">Transaction
could not commit after DDL statement. Last DDL statement rolled
back.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR109</span>
<span class="errortype">42000</span> <span class="errortext">Cannot free
global server lock if one does not hold it</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR110</span>
<span class="errortype">42000</span> <span class="errortext">backup ()
must be the first operation in its transaction if the transaction is not
read only</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR111</span>
<span class="errortype">40009</span> <span class="errortext">Backup
transaction failed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR112</span>
<span class="errortype">42000</span> <span class="errortext">Transaction
not in backup mode</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR113</span>
<span class="errortype">42000</span> <span class="errortext">backup_row
needs a \_ROW as argument</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR114</span>
<span class="errortype">42000</span> <span class="errortext">Transaction
not in backup mode</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR115</span>
<span class="errortype">42000</span> <span class="errortext">Error
writing backup_flush</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR116</span>
<span class="errortype">42000</span> <span class="errortext">Transaction
not in backup mode</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR117</span>
<span class="errortype">42000</span> <span class="errortext">db_check ()
must be in read only, non-autocommit transaction mode. e.g. do it from
isql in RO mode.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR118</span>
<span class="errortype">40009</span> <span class="errortext">Database
check transaction failed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR119</span>
<span class="errortype">42S11</span> <span class="errortext">Key \<key\>
has 0 parts. Create index probably failed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR120</span>
<span class="errortype">23000</span> <span class="errortext">Convert
error or not possible to insert a value into a blob column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR121</span>
<span class="errortype">42000</span> <span class="errortext">Ruling part
too long on \<key\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR122</span>
<span class="errortype">42000</span> <span class="errortext">Row too
long on \<key\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR123</span>
<span class="errortype">42S12</span> <span class="errortext">Bad key id
in row_insert</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR124</span>
<span class="errortype">42S12</span> <span class="errortext">Bad key id
in row_insert</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR125</span>
<span class="errortype">42S12</span> <span class="errortext">key_insert:
This table does not have this key</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR126</span>
<span class="errortype">22018</span> <span class="errortext">Can't
convert \<column_name\> to numeric</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR127</span>
<span class="errortype">22003</span> <span class="errortext">Can't
convert \<column_name\> to numeric</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR128</span>
<span class="errortype">22003</span> <span class="errortext">Numeric
value out of range for \<column_name\> (\<col_scale\>,
\<col_prec\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR129</span>
<span class="errortype">22003</span> <span class="errortext">Numeric
value out of range</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR130</span>
<span class="errortype">22005</span> <span class="errortext">Bad value
for numeric column \<column_name\>, dtp = \<dtp_value\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR131</span>
<span class="errortype">22005</span> <span class="errortext">Cannot
convert \<string_value\> to number for column \<column_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR132</span>
<span class="errortype">22007</span> <span class="errortext">Bad value
for date / time column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR133</span>
<span class="errortype">23000</span> <span class="errortext">Null
assigned to non-null column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR134</span>
<span class="errortype">42000</span> <span class="errortext">A data at
exec blob must be assigned to a blob column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR135</span>
<span class="errortype">42000</span> <span class="errortext">Blob too
long to store in a non-blob column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR136</span>
<span class="errortype">42S02</span> <span class="errortext">Bad table
name in GRANT / REVOKE \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR137</span>
<span class="errortype">42000</span> <span class="errortext">Bad user
name in GRANT/REVOKE</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR138</span>
<span class="errortype">37000</span> <span class="errortext">Operation
not allowed for PUBLIC</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR139</span>
<span class="errortype">42000</span> <span class="errortext">No group
\<group_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR140</span>
<span class="errortype">42000</span> <span class="errortext">The group
\<group_name\> is already a secondary group for the user \<user_name\>.
Delete it first with DELETE USER GROUP.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR141</span>
<span class="errortype">42000</span> <span class="errortext">No user
\<user_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR142</span>
<span class="errortype">37000</span> <span class="errortext">Operation
not allowed for PUBLIC</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR143</span>
<span class="errortype">42000</span> <span class="errortext">No group
\<group_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR144</span>
<span class="errortype">42000</span> <span class="errortext">Group
\<group_name\> already assigned as a secondary group of
\<user_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR145</span>
<span class="errortype">42000</span> <span class="errortext">Group
\<group_name\> already is a primary group of \<user_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR146</span>
<span class="errortype">42000</span> <span class="errortext">No user
\<user_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR147</span>
<span class="errortype">37000</span> <span class="errortext">Operation
not allowed for PUBLIC</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR148</span>
<span class="errortype">42000</span> <span class="errortext">No group
\<group_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR149</span>
<span class="errortype">42000</span> <span class="errortext">No group
\<group_name\> granted to \<user_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR150</span>
<span class="errortype">42000</span> <span class="errortext">No Group
\<group_name\> granted to \<user_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR151</span>
<span class="errortype">42000</span> <span class="errortext">Group
\<group_name\> is a primary group of \<user_name\>. Use SET USER GROUP
instead</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR152</span>
<span class="errortype">42000</span> <span class="errortext">No user
\<user_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR153</span>
<span class="errortype">28000</span> <span class="errortext">No user in
delete user</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR154</span>
<span class="errortype">42S02</span> <span class="errortext">No table or
view in drop table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR155</span>
<span class="errortype">42S02</span> <span class="errortext">No table in
alter table drop column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR156</span>
<span class="errortype">42S02</span> <span class="errortext">No table in
table rename</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR157</span>
<span class="errortype">42S02</span> <span class="errortext">No table
alter table add column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR158</span>
<span class="errortype">42000</span> <span class="errortext">Permission
denied. Must be owner of object or member of dba group.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR159</span>
<span class="errortype">42000</span> <span class="errortext">Function
\<function_name\> restricted to dba group.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR160</span>
<span class="errortype">42000</span> <span class="errortext">Incorrect
old password in set password</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR161</span>
<span class="errortype">42000</span> <span class="errortext">Unsupported
security statement.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR162</span>
<span class="errortype">07006</span> <span class="errortext">BLOB's not
allowed in function refs.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR163</span>
<span class="errortype">42000</span> <span class="errortext">Ruling part
too long.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR164</span>
<span class="errortype">42000</span> <span class="errortext">Error
writing the BLOB onto a procedure view temp space</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR165</span>
<span class="errortype">07006</span> <span class="errortext">Parameter
BLOB in sorted result.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR166</span>
<span class="errortype">42000</span> <span class="errortext">Key too
long in ORDER BY or DISTINCT temp table.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR167</span>
<span class="errortype">07006</span> <span class="errortext">Parameter
BLOB in sorted result.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR168</span>
<span class="errortype">42000</span> <span class="errortext">Data too
long in ORDER BY or DISTINCT temp table.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR169</span>
<span class="errortype">22023</span> <span class="errortext">signal
state should be an integer 100 (NO DATA FOUND) or a string value, not an
\<type_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR170</span>
<span class="errortype">42000</span> <span class="errortext">Unsupported
arithmetic op.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR171</span>
<span class="errortype">S1T00</span> <span class="errortext">Transaction
timed out.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR172</span>
<span class="errortype">40001</span> <span class="errortext">Transaction
deadlocked</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR173</span>
<span class="errortype">40003</span> <span class="errortext">Transaction
out of disk.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR174</span>
<span class="errortype">40004</span> <span class="errortext">Log out of
disk.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR175</span>
<span class="errortype">23000</span> <span class="errortext">Uniqueness
violation. Transaction killed.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR176</span>
<span class="errortype">4000X</span> <span class="errortext">Transaction
rolled back due to previous SQL error.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR177</span>
<span class="errortype">4000X</span> <span class="errortext">Misc
Transaction Error.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR178</span>
<span class="errortype">42000</span> <span class="errortext">Stack
overflow</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR179</span>
<span class="errortype">07S01</span> <span class="errortext">The
function \<function_name\> does not accept a keyword parameter
\<param_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR180</span>
<span class="errortype">07S01</span> <span class="errortext">Extra
arguments to \<function_name\>, takes only \<number\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR181</span>
<span class="errortype">HY105</span> <span class="errortext">Cannot pass
literal as reference parameter.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR182</span>
<span class="errortype">HY502</span> <span class="errortext">inout or
out parameter \<param_name\> not supplied in keyword parameter
call</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR183</span>
<span class="errortype">07S01</span> <span class="errortext">Required
argument \<param_name\> (no \<index\>) not supplied to
\<function_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR184</span>
<span class="errortype">42000</span> <span class="errortext">Built-in
function is not allowed as the outermost function in a procedure view.
Define an intermediate PL function to call the bif.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR185</span>
<span class="errortype">42001</span> <span class="errortext">Undefined
procedure \<procedure name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR186</span>
<span class="errortype">42000</span> <span class="errortext">No
permission to execute procedure \<procedure_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR187</span>
<span class="errortype">07001</span> <span class="errortext">Too few
actual parameters for \<procedure_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR188</span>
<span class="errortype">HY105</span> <span class="errortext">Cannot pass
literal as reference parameter.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR189</span>
<span class="errortype">HY008</span> <span class="errortext">Async
statement killed by SQLCancel.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR190</span>
<span class="errortype">24000</span> <span class="errortext">Fetch of
unopened cursor.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR191</span>
<span class="errortype">39000</span> <span class="errortext">Unsupported
instruction AREF");</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR192</span>
<span class="errortype">HY105</span> <span class="errortext">Like
pattern not a string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR193</span>
<span class="errortype">HY105</span> <span class="errortext">Blob of
\<length\> bytes in like</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR194</span>
<span class="errortype">HY105</span> <span class="errortext">LIKE must
be between strings.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR195</span>
<span class="errortype">HY001</span> <span class="errortext">No starting
point for ancestor join</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR196</span>
<span class="errortype">HY001</span> <span class="errortext">No place in
from_position clause.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR197</span>
<span class="errortype">23000</span> <span class="errortext">Non unique
primary key on \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR198</span>
<span class="errortype">HY109</span> <span class="errortext">Cursor not
positioned on delete. \<cursor_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR199</span>
<span class="errortype">HY109</span> <span class="errortext">The cursor
in positioned DELETE was not on any row.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR200</span>
<span class="errortype">42S12</span> <span class="errortext">The row
being deleted has no valid key.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR201</span>
<span class="errortype">42S12</span> <span class="errortext">Primary key
not found in delete.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR202</span>
<span class="errortype">42000</span> <span class="errortext">Bad admin
op code.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR203</span>
<span class="errortype">HY008</span> <span class="errortext">Async
statement killed by SQLCancel.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR204</span>
<span class="errortype">22002</span> <span class="errortext">Missing
named parameter</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR205</span>
<span class="errortype">07001</span> <span class="errortext">Not enough
actual parameters.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR206</span>
<span class="errortype">07001</span> <span class="errortext">Not enough
actual parameters.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR207</span>
<span class="errortype">08004</span> <span class="errortext">Maximum
licensed connections exceeded</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR208</span>
<span class="errortype">08004</span> <span class="errortext">Application
access is denied</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR209</span>
<span class="errortype">S1010</span> <span class="errortext">Statement
active</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR210</span>
<span class="errortype">S1010</span> <span class="errortext">Async exec
busy</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR211</span>
<span class="errortype">41000</span>
<span class="errortext">Aborted</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR212</span>
<span class="errortype">S1010</span> <span class="errortext">Statement
not prepared.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR213</span>
<span class="errortype">S1010</span> <span class="errortext">SQLFetch of
busy</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR214</span>
<span class="errortype">40001</span> <span class="errortext">Out of
server threads. Server temporarily unavailable. Transaction rolled
back.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR215</span>
<span class="errortype">42000</span> <span class="errortext">Too many
triggers on \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR216</span>
<span class="errortype">22003</span> <span class="errortext">PL
Scrollable cursor with a rowset \> 1</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR217</span>
<span class="errortype">01001</span> <span class="errortext">Optimistic
cursor updated since last read"</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR218</span>
<span class="errortype">HYC00</span> <span class="errortext">Cursor not
capable of requested SQLSetPos operation</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR219</span>
<span class="errortype">HY107</span> <span class="errortext">Row in
SQLSetPos does not exist in the rowset</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR220</span>
<span class="errortype">S1010</span> <span class="errortext">Unopened
cursor referenced by SQLSetPos</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR221</span>
<span class="errortype">S1010</span> <span class="errortext">Not a
scrollable cursor in SQLSetPos</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR222</span>
<span class="errortype">22003</span> <span class="errortext">PL cursor
with a rowset greater then 1</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR223</span>
<span class="errortype">HY111</span> <span class="errortext">Non static
bookmark for a static cursor</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR224</span>
<span class="errortype">HY111</span>
<span class="errortext">Incompatible bookmark. Must be identical
ordering and primary key columns</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR225</span>
<span class="errortype">HY111</span> <span class="errortext">Static
bookmark for a dynamic / keyset cursor</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR226</span>
<span class="errortype">42000</span> <span class="errortext">Misc.
cursor error</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR227</span>
<span class="errortype">3C000</span> <span class="errortext">Non unique
cursor name</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR228</span>
<span class="errortype">07001</span> <span class="errortext">Too few
actual parameters</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR229</span>
<span class="errortype">42000</span> <span class="errortext">Misc.
cursor error</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR230</span>
<span class="errortype">S1010</span> <span class="errortext">Statement
not executing or not scrollable cursor in SQLExtendedFetch</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR231</span>
<span class="errortype">42S02</span> <span class="errortext">Cursor does
not have table \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR232</span>
<span class="errortype">34000</span> <span class="errortext">No cursor
\<cursor_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR233</span>
<span class="errortype">22023</span> <span class="errortext">Wrong type
of argument to \_\_scroll_cr_init</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR234</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs a cursor as argument \<index\> , not an arg of
type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR235</span>
<span class="errortype">24000</span> <span class="errortext">Virtuoso/PL
Scrollable cursor not opened</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR236</span>
<span class="errortype">07001</span> <span class="errortext">scrollable
fetch with different number of output columns</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR237</span>
<span class="errortype">HY109</span> <span class="errortext">Row
deleted</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR238</span>
<span class="errortype">24000</span> <span class="errortext">Virtuoso/PL
Scrollable cursor not opened</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR239</span>
<span class="errortype">HY109</span> <span class="errortext">Virtuoso/PL
Scrollable cursor not positioned on a row</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR240</span>
<span class="errortype">HY090</span> <span class="errortext">Ruling part
too long in scrolled current of reference.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR241</span>
<span class="errortype">HY109</span> <span class="errortext">Row
referenced in where current of not present</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR242</span>
<span class="errortype">42S22</span> <span class="errortext">No system
status variable \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR243</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<table_name\> in key_stat</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR244</span>
<span class="errortype">22023</span> <span class="errortext">Allowed
stat names are touches, reads, lock_set, lock_waits, deadlocks.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR245</span>
<span class="errortype">42S12</span> <span class="errortext">Index
\<key_name\> not found in key_stat.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR246</span>
<span class="errortype">23000</span> <span class="errortext">Error or
type mismatch inserting a blob</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR247</span>
<span class="errortype">42000</span> <span class="errortext">Primary key
ruling part too long in update</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR248</span>
<span class="errortype">42000</span> <span class="errortext">Row too
long in update</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR249</span>
<span class="errortype">42000</span> <span class="errortext">Ruling part
too long on \<key_name\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR250</span>
<span class="errortype">24000</span> <span class="errortext">Cursor not
positioned on update. \<cursor_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR251</span>
<span class="errortype">24000</span> <span class="errortext">Cursor not
on row in positioned UPDATE</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR252</span>
<span class="errortype">01001</span> <span class="errortext">Row deleted
while waiting to update</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR253</span>
<span class="errortype">42S12</span> <span class="errortext">Could not
find primary key on update.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR254</span>
<span class="errortype">42000</span> <span class="errortext">The cursor
specified is not a SELECT.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR255</span>
<span class="errortype">24000</span> <span class="errortext">Cursor
before first or after end. No current row.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR256</span>
<span class="errortype">HY109</span> <span class="errortext">Cursor
\<cursor_name\> does not have place.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR257</span>
<span class="errortype">34000</span> <span class="errortext">No cursor
named \<cursor_name\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR258</span>
<span class="errortype">42000</span> <span class="errortext">The cursor
specified is not a SELECT.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR259</span>
<span class="errortype">24000</span> <span class="errortext">Cursor
\<cursor_name\> before first or after end. No current row.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR260</span>
<span class="errortype">HY109</span> <span class="errortext">Cursor
\<cursor_name\> does not have place \<name\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR261</span>
<span class="errortype">23000</span> <span class="errortext">Non unique
primary key.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR262</span>
<span class="errortype">24000</span> <span class="errortext">Cursor not
positioned on positioned reference. \<cursor_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR263</span>
<span class="errortype">24000</span> <span class="errortext">Cursor not
on row in positioned UPDATE</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR264</span>
<span class="errortype">42S12</span> <span class="errortext">Could not
find primary key on update.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR265</span>
<span class="errortype">37000</span> <span class="errortext">Table being
dropped is referenced in FOREIGN KEY</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR266</span>
<span class="errortype">S0002</span> <span class="errortext">No table in
drop table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR267</span>
<span class="errortype">37000</span> <span class="errortext">Table being
dropped is referenced in FOREIGN KEY</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR268</span>
<span class="errortype">42S02</span> <span class="errortext">No table in
drop table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR269</span>
<span class="errortype">S0002</span> <span class="errortext">No trigger
in drop trigger. Make sure the name is qualified with the subject
table's qualifier and owner if these are not the default qualifier and
owner</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR270</span>
<span class="errortype">42000</span> <span class="errortext">No
procedure in DROP PROCEDURE \<proc_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR271</span>
<span class="errortype">42000</span> <span class="errortext">Must be in
dba group to drop non-owned procedures</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR272</span>
<span class="errortype">01006</span> <span class="errortext">Privilege
has not been granted. Use list_grants (0) to see what you can
revoke</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR273</span>
<span class="errortype">42000</span> <span class="errortext">No user to
delete</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR274</span>
<span class="errortype">S1001</span> <span class="errortext">Column
already exists in ALTER TABLE</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR275</span>
<span class="errortype">42000</span> <span class="errortext">Column
count too large</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR276</span>
<span class="errortype">42S02</span> <span class="errortext">No table in
add column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR277</span>
<span class="errortype">42S01</span> <span class="errortext">Table
already exists in rename table.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR278</span>
<span class="errortype">42S02</span> <span class="errortext">Bad table
in rename table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR279</span>
<span class="errortype">22023</span>
<span class="errortext">parse_collation : invalid table size
\<size\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR280</span>
<span class="errortype">37000</span> <span class="errortext">The column
is a key or primary key part. Drop the index first</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR281</span>
<span class="errortype">37000</span> <span class="errortext">The column
is referenced in foreign key constraint. Drop the foreign key
first</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR282</span>
<span class="errortype">42S22</span> <span class="errortext">The column
to drop is not defined in the given table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR283</span>
<span class="errortype">42S02</span> <span class="errortext">No table in
add column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR284</span>
<span class="errortype">22023</span> <span class="errortext">Charset
definition is not correct</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR285</span>
<span class="errortype">42000</span> <span class="errortext">Function
user_set_password restricted to dba group</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR286</span>
<span class="errortype">42000</span> <span class="errortext">The user
\<user_name\> does not exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR287</span>
<span class="errortype">42000</span> <span class="errortext">The new
password for \<user_name\> cannot be empty</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR288</span>
<span class="errortype">42S22</span> <span class="errortext">No columns
in the source table \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR289</span>
<span class="errortype">42S22</span> <span class="errortext">No columns
in the source table \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR290</span>
<span class="errortype">42S22</span> <span class="errortext">The column
\<column_name\> in the source table \<table_name\> doesn't have a match
in the destination table \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR291</span>
<span class="errortype">42S11</span> <span class="errortext">Primary key
modification is prohibited if: Table is a subtable or has subtables, is
attached or has a free text index</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR292</span>
<span class="errortype">42S22</span> <span class="errortext">Bad new pk
column list</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR293</span>
<span class="errortype">22023</span> <span class="errortext">function
fk_check_input_values expect -1, 0 or 1 as first parameter</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR294</span>
<span class="errortype">42S22</span> <span class="errortext">Foreign key
references invalid column \<column_name\> in referenced table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR295</span>
<span class="errortype">37000</span> <span class="errortext">Foreign key
references non-unique column \<column_name\> in table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR296</span>
<span class="errortype">37000</span> <span class="errortext">To add
foreign key REFERENCES should be specified</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR297</span>
<span class="errortype">42S12</span> <span class="errortext">Foreign key
does not exist in table \<table_name\> referencing table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR298</span>
<span class="errortype">42S12</span> <span class="errortext">Foreign key
\<key_name\> does not exists</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR299</span>
<span class="errortype">37000</span> <span class="errortext">To drop
foreign key should be specified NAME or REFERENCES</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR300</span>
<span class="errortype">42S11</span> <span class="errortext">To modify a
foreign key first drop the old and then add the new</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR301</span>
<span class="errortype">37000</span> <span class="errortext">A primary
key cannot be added or dropped. It can only be modified. Use alter table
.. modify primary key ...</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR302</span>
<span class="errortype">37000</span> <span class="errortext">To modify a
unique constraint first drop the old and then add the new</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR303</span>
<span class="errortype">22023</span> <span class="errortext">Function
check_col needs string as argument</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR304</span>
<span class="errortype">S1000</span> <span class="errortext">DELETE
statement conflicted with COLUMN REFERENCE constraint \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR305</span>
<span class="errortype">S1000</span> <span class="errortext">UPDATE
statement conflicted with COLUMN REFERENCE constraint \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR306</span>
<span class="errortype">S1000</span> <span class="errortext">INSERT
statement conflicted with FOREIGN KEY constraint referencing table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR307</span>
<span class="errortype">S1000</span> <span class="errortext">UPDATE
statement conflicted with FOREIGN KEY constraint referencing table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR308</span>
<span class="errortype">22023</span> <span class="errortext">exec()
called with an invalid text to execute</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR309</span>
<span class="errortype">22023</span>
<span class="errortext">Non-encrypted session</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR310</span>
<span class="errortype">22023</span> <span class="errortext">Invalid
certificate info index</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR311</span>
<span class="errortype">08004</span> <span class="errortext">Shutting
down the server permitted only to DBA group</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR312</span>
<span class="errortype">08004</span> <span class="errortext">The server
is shutting down</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR313</span>
<span class="errortype">42000</span> <span class="errortext">The
procedure \<proc_name\> is part of a module \<module\>. Drop the module
first.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR314</span>
<span class="errortype">42000</span> <span class="errortext">Trying to
drop a module with drop procedure.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR315</span>
<span class="errortype">37000</span> <span class="errortext">Invalid
module name in soap_sdl.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR316</span>
<span class="errortype">37000</span> <span class="errortext">No URL
specified & soap_sdl called outside HTTP context.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR317</span>
<span class="errortype">37000</span> <span class="errortext">Invalid
module name in soap_wsdl.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR318</span>
<span class="errortype">37000</span> <span class="errortext">No URL
specified & soap_wsdl called outside HTTP context.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR319</span>
<span class="errortype">22026</span> <span class="errortext">Value too
long to insert into VARCHAR column \<col_name\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR320</span>
<span class="errortype">42S12</span> <span class="errortext">Constraint
\<constraint name\> does not exists for table \<table\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR321</span>
<span class="errortype">37000</span> <span class="errortext">A RETURN
statement with a return status can only be used in a stored
procedure</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR322</span>
<span class="errortype">22005</span> <span class="errortext">\<option\>
is not valid trace_on option</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR323</span>
<span class="errortype">22005</span> <span class="errortext">\<option\>
is not valid trace_off option</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR324</span>
<span class="errortype">08U01</span> <span class="errortext">Remote
server has disconnected making the transaction uncommittable.
Transaction has been rolled back.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR325</span>
<span class="errortype">S1T00</span> <span class="errortext">Transaction
aborted due to a database checkpoint or database-wide atomic operation.
Please retry transaction</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR326</span>
<span class="errortype">42S02</span> <span class="errortext">No table in
alter table modify column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR327</span>
<span class="errortype">42S02</span> <span class="errortext">ALTER TABLE
not supported for views. Drop the view and recreate it instead.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR328</span>
<span class="errortype">42S02</span> <span class="errortext">ALTER TABLE
not supported for views. Drop the view and recreate it instead.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR329</span>
<span class="errortype">42S02</span> <span class="errortext">ALTER TABLE
not supported for views. Drop the view and recreate it instead.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR330</span>
<span class="errortype">42S02</span> <span class="errortext">ALTER TABLE
not supported for views. Drop the view and recreate it instead.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR331</span>
<span class="errortype">21000</span> <span class="errortext">Scalar
subquery returned more than one value.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR332</span>
<span class="errortype">42000</span> <span class="errortext">The
DB.DBA.DBEV_DSN_LOGIN should return strings for UID and PWD.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR333</span>
<span class="errortype">42S22</span> <span class="errortext">Access
denied for foreign key referencing \<col\> in table \<tbl\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR334</span>
<span class="errortype">22023</span> <span class="errortext">The result
names description should be an array in exec_result</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR335</span>
<span class="errortype">22023</span> <span class="errortext">The result
names description should be an array in exec_result_names</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR336</span>
<span class="errortype">22023</span> <span class="errortext">Wrong
result description in bif_result_string_names</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR337</span>
<span class="errortype">40006</span> <span class="errortext">Transaction
aborted because the server is out of memory</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR338</span>
<span class="errortype">HY111</span> <span class="errortext">Malformed
bookmark</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR339</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs an integer not less than \<val\> as argument
\<inx\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR340</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs an integer not greater than \<val\> as argument
\<inx\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR341</span>
<span class="errortype">22023</span> <span class="errortext">Invalid
integer value converting \<string_val\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR342</span>
<span class="errortype">22023</span> <span class="errortext">Procedure
view's procedure returned value of type \<type\>(\<dv_val\>) instead of
\<type\>(\<dv_val\>) for column \<col_no\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR343</span>
<span class="errortype">42000</span> <span class="errortext">Access to
pwd_magic_calc not permitted. If you are getting this message in the
Admin interface and you are a DBA, then you need to enable the function
from the INI file in order to use it.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR344</span>
<span class="errortype">41000</span> <span class="errortext">Malformed
RPC</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR345</span>
<span class="errortype">22023</span> <span class="errortext">invalid
offset arguments to subseq</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR346</span>
<span class="errortype">22023</span> <span class="errortext">precision
(\<prec\>) overflow in \<title\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR347</span>
<span class="errortype">22023</span> <span class="errortext">The long
varchar, long varbinary and long nvarchar data types cannot be used in
the WHERE, HAVING, or ON clause, except with the IS NULL predicate for
column \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR348</span>
<span class="errortype">22023</span> <span class="errortext">Value type
(\<type\>) not suitable for use in a hash index</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR349</span>
<span class="errortype">22023</span> <span class="errortext">SKIP
parameter \< 0</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR350</span>
<span class="errortype">22023</span> <span class="errortext">TOP
parameter \< 0</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR351</span>
<span class="errortype">22023</span> <span class="errortext">SKIP
parameter \< 0</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR352</span>
<span class="errortype">22023</span> <span class="errortext">TOP
parameter \< 0</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR353</span>
<span class="errortype">22023</span> <span class="errortext">Sorted TOP
clause specifies more then %ld rows to sort. Only %ld are allowed.
Either decrease the offset and/or row count or use a scrollable
cursor</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SR354</span>
<span class="errortype">23000</span> <span class="errortext">Type
mismatch inserting user defined type instance as a blob for column
\<co\></span>

</div>

</div>

<span style="color: red">\<title\>File Access\</title\></span>

<div>

<div>

<span class="errorcode">FA001</span>
<span class="errortype">42000</span> <span class="errortext">Access to
\<file_name\> is denied</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA002</span>
<span class="errortype">42000</span> <span class="errortext">Can't open
file \<file_name\>, error \<err_no\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA003</span>
<span class="errortype">42000</span> <span class="errortext">Access to
\<file_name\> is denied due to access control in ini file</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA004</span>
<span class="errortype">42000</span> <span class="errortext">Access to
\<file_name\> is denied due to access control in ini file</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA005</span>
<span class="errortype">39000</span> <span class="errortext">Can't open
file \<file_name\>, error \<error_no\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA006</span>
<span class="errortype">39000</span> <span class="errortext">Can't open
file \<file_name\>, error : \<fs_error\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA007</span>
<span class="errortype">39000</span> <span class="errortext">Seek error
in file \<file_name\>, error \<error_no\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA008</span>
<span class="errortype">39000</span> <span class="errortext">File
\<file_name\> too long</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA009</span>
<span class="errortype">39000</span> <span class="errortext">Read from
\<file_name\> failed (\<error_no\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA010</span>
<span class="errortype">42000</span> <span class="errortext">Access to
\<file_name\> is denied due to access control in ini file</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA011</span>
<span class="errortype">42000</span> <span class="errortext">Access to
\<file_name\> is denied due to access control in ini file</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA012</span>
<span class="errortype">42000</span> <span class="errortext">Can't open
file \<file_name\>, error \<error_no\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA013</span>
<span class="errortype">39000</span> <span class="errortext">Read from
\<file_name\> failed (\<error_no\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA014</span>
<span class="errortype">42000</span> <span class="errortext">Access to
\<file_name\> is denied due to access control in ini file</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA015</span>
<span class="errortype">42000</span> <span class="errortext">Access to
\<file_name\> is denied due to access control in ini file</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA016</span>
<span class="errortype">42000</span> <span class="errortext">Access to
\<file_name\> is denied due to access control in ini file</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA017</span>
<span class="errortype">39000</span> <span class="errortext">Path string
is too long.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA018</span>
<span class="errortype">42000</span> <span class="errortext">Access to
\<file_name\> is denied due to access control in ini file</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA019</span>
<span class="errortype">39000</span> <span class="errortext">Path string
is too long.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA020</span>
<span class="errortype">39000</span>
<span class="errortext">\<fs_error\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA021</span>
<span class="errortype">22003</span> <span class="errortext">Third
argument of string_to_file function, should be nonnegative offset value,
-1 or -2</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA022</span>
<span class="errortype">22023</span> <span class="errortext">Function
string_to_file needs a string or blob or string_output as argument 2,
not an arg of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA023</span>
<span class="errortype">42000</span> <span class="errortext">Access to
\<file_name\> is denied due to access control in ini file</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA024</span>
<span class="errortype">42000</span> <span class="errortext">Access to
\<file_name\> is denied due to access control in ini file</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA025</span>
<span class="errortype">39000</span> <span class="errortext">Seek error
in file \<file_name\>, error : \<fs_error\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA026</span>
<span class="errortype">39000</span> <span class="errortext">Write to
\<file_name\> failed (\<fs_error\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA027</span>
<span class="errortype">39000</span> <span class="errortext">Write to
\<file_name\> failed"</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA028</span>
<span class="errortype">39000</span> <span class="errortext">Write to
\<file_name\> failed (\<fs_error\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA029</span>
<span class="errortype">39000</span> <span class="errortext">Write to
\<file_name\> failed (fs_error)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA030</span>
<span class="errortype">39000</span> <span class="errortext">Can't open
file \<file_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA031</span>
<span class="errortype">39000</span> <span class="errortext">Can't open
file \<file_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA032</span>
<span class="errortype">39000</span> <span class="errortext">Can't open
file \<file_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA033</span>
<span class="errortype">39000</span> <span class="errortext">Can't open
file \<file_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA034</span>
<span class="errortype">39000</span> <span class="errortext">Can't open
file \<file_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA035</span>
<span class="errortype">39000</span> <span class="errortext">Can't open
file \<file_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA036</span>
<span class="errortype">42000</span> <span class="errortext">Allow &
deny file ACL cannot be modified</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA037</span>
<span class="errortype">39000</span> <span class="errortext">Can't
update \<file_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA038</span>
<span class="errortype">42000</span> <span class="errortext">Cannot open
backup file \<file_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA039</span>
<span class="errortype">40003</span> <span class="errortext">Out of disk
in query temp space.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA040</span>
<span class="errortype">42000</span> <span class="errortext">Access to
\<file_name\> is denied due to access control in ini file</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA041</span>
<span class="errortype">42000</span> <span class="errortext">Debug
session is already open, close it first</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FA042</span>
<span class="errortype">39000</span> <span class="errortext">Cannot open
debug log file \<file_name\>, error : \<OS error\></span>

</div>

</div>

<span style="color: red">\<title\>SQL Compiler\</title\></span>

<div>

<div>

<span class="errorcode">SQ001</span>
<span class="errortype">28000</span> <span class="errortext">No owner
user in \_\_view_changed for \<text\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ002</span>
<span class="errortype">42S02</span> <span class="errortext">Bad table
in drop trigger.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ003</span>
<span class="errortype">42S22</span> <span class="errortext">Collation
\<collation_name\> is not defined</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ004</span>
<span class="errortype">42S22</span> <span class="errortext">Collation
defined for a non-string column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ005</span>
<span class="errortype">42000</span> <span class="errortext">Column
count too large</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ006</span>
<span class="errortype">42S22</span> <span class="errortext">Table has
non unique column names either directly through inheritance</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ007</span>
<span class="errortype">37000</span> <span class="errortext">Column
count too large</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ008</span>
<span class="errortype">42S22</span> <span class="errortext">No column
\<name\> in \<table_name\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ009</span>
<span class="errortype">07006</span> <span class="errortext">Column
\<name\> is a BLOB column and blob columns are not supported as index
parts</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ010</span>
<span class="errortype">42S22</span> <span class="errortext">Column
count too large</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ011</span>
<span class="errortype">42S22</span> <span class="errortext">Column
count too large</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ012</span>
<span class="errortype">42S12</span> <span class="errortext">Cannot
inherit table with no keys \<name\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ013</span>
<span class="errortype">42S22</span> <span class="errortext">Column
count too large</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ014</span>
<span class="errortype">07006</span> <span class="errortext">Not a DDL
type name: \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ015</span>
<span class="errortype">07006</span> <span class="errortext">Not a DDL
type name: \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ016</span>
<span class="errortype">42S01</span> <span class="errortext">Table
\<table_name\> already exists</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ017</span>
<span class="errortype">42S12</span> <span class="errortext">No primary
key for \<table_name\>. Specify qualifier and owner if you are not owner
of the table.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ018</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ019</span>
<span class="errortype">42S12</span> <span class="errortext">No key
\<name\> in (\<table_name\>\|any table)."</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ020</span>
<span class="errortype">23000</span> <span class="errortext">Can't drop
primary key. Use drop table instead.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ021</span>
<span class="errortype">42S02</span> <span class="errortext">bad table
or index for build key</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ022</span>
<span class="errortype">42S11</span> <span class="errortext">Duplicate
index name</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ023</span>
<span class="errortype">42S02</span> <span class="errortext">No table in
rename table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ024</span>
<span class="errortype">4000X</span> <span class="errortext">Transaction
could not commit after DDL statement. Last DDL statement rolled
back</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ025</span>
<span class="errortype">42S02</span> <span class="errortext">Bad table
in drop table.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ026</span>
<span class="errortype">42000</span> <span class="errortext">The
subtable \<table_name\> must have the same owner as the supertable
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ027</span>
<span class="errortype">42S11</span> <span class="errortext">Only one
PRIMARY KEY clause allowed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ028</span>
<span class="errortype">42S21</span> <span class="errortext">Unsupported
table constraint.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ029</span>
<span class="errortype">42S12</span> <span class="errortext">A table
must either have an UNDER or PRIMARY KEY specification.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ030</span>
<span class="errortype">42S11</span> <span class="errortext">A table
cannot have both an UNDER and PRIMARY KEY.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ031</span>
<span class="errortype">42000</span> <span class="errortext">Unsupported
DDL statement.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ032</span>
<span class="errortype">42000</span> <span class="errortext">Owner of
procedure has been deleted. Cannot recompile procedure</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ033</span>
<span class="errortype">42000</span> <span class="errortext">Access
denied for column \<name\>.",</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ034</span>
<span class="errortype">42S22</span> <span class="errortext">Ambiguous
column ref \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ035</span>
<span class="errortype">37000</span> <span class="errortext">Bad
function reference in expression, only ones in selection recognized in
HAVING / ORDER BY</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ036</span>
<span class="errortype">42S22</span> <span class="errortext">Bad
column/variable ref \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ037</span>
<span class="errortype">37000</span> <span class="errortext">ancestor_of
must be between 2 columns</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ038</span>
<span class="errortype">37000</span> <span class="errortext">ancestor_of
must be between 2 entity subtables</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ039</span>
<span class="errortype">37000</span> <span class="errortext">Can't have
more than 1 ancestor join per table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ040</span>
<span class="errortype">37000</span> <span class="errortext">Can't have
more than 1 contains/xcontains per table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ041</span>
<span class="errortype">37000</span> <span class="errortext">Can't have
more than one xpath_contains per table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ042</span>
<span class="errortype">42S12</span> <span class="errortext">No index
for table \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ043</span>
<span class="errortype">42000</span> <span class="errortext">\_ROW
requires select permission on the entire table.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ044</span>
<span class="errortype">42S22</span> <span class="errortext">Bad
column/variable reference \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ045</span>
<span class="errortype">42000</span> <span class="errortext">Bad compare
operator.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ046</span>
<span class="errortype">42S22</span> <span class="errortext">Bad column
predicate.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ047</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ048</span>
<span class="errortype">42S12</span> <span class="errortext">No key
\<key_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ049</span>
<span class="errortype">42S12</span> <span class="errortext">No key
named \<key_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ050</span>
<span class="errortype">42S22</span> <span class="errortext">\<name\> is
not the name of a CURRENT OF.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ051</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ052</span>
<span class="errortype">21S01</span> <span class="errortext">Uneven col
and value lists in insert.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ053</span>
<span class="errortype">42S22</span> <span class="errortext">No such
column \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ054</span>
<span class="errortype">42000</span> <span class="errortext">Bad insert
mode.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ055</span>
<span class="errortype">21S01</span> <span class="errortext">Odd
assignment list for update.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ056</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<table_name\> in update.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ057</span>
<span class="errortype">42S22</span> <span class="errortext">No such
column \<name\> in update.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ058</span>
<span class="errortype">42S12</span> <span class="errortext">No key in
key_insert.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ059</span>
<span class="errortype">42000</span> <span class="errortext">No
statement \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ060</span>
<span class="errortype">42000</span> <span class="errortext">Must be in
dba group to use EQL.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ061</span>
<span class="errortype">42000</span> <span class="errortext">Lisp reader
error.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ062</span>
<span class="errortype">42S22</span> <span class="errortext">No column
\<owner\>.\<name\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ063</span>
<span class="errortype">42S22</span> <span class="errortext">No column
\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ064</span>
<span class="errortype">42000</span> <span class="errortext">Illegal use
of '\*'.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ065</span>
<span class="errortype">42S22</span> <span class="errortext">Col ref
ambiguous \<name\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ066</span>
<span class="errortype">37000</span> <span class="errortext">Natural
join only allowed between tables or views. No derived tables or
joins.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ067</span>
<span class="errortype">37000</span> <span class="errortext">Explicit
join condition not allowed in natural join</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ068</span>
<span class="errortype">37000</span> <span class="errortext">Empty or
USING join condition not allowed with non-natural join</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ069</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ070</span>
<span class="errortype">42000</span> <span class="errortext">Must have
select privileges on view \<view_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ071</span>
<span class="errortype">42000</span> <span class="errortext">Cannot mix
aggregate functions with non-aggregate functions or columns not included
in GROUP BY.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ072</span>
<span class="errortype">42000</span> <span class="errortext">Goto to
undeclared label.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ073</span>
<span class="errortype">37000</span> <span class="errortext">Statement
not supported.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ074</span>
<span class="errortype">37000</span> <span class="errortext">\<parser
error\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ075</span>
<span class="errortype">42000</span>
<span class="errortext">Unclassified SQL compilation error.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ076</span>
<span class="errortype">42000</span> <span class="errortext">The
procedure owner specified is different than the creator.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ077</span>
<span class="errortype">34000</span> <span class="errortext">Bad cursor
name \<cursor_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ078</span>
<span class="errortype">42000</span>
<span class="errortext">Unclassified SQL compilation error.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ079</span>
<span class="errortype">42000</span> <span class="errortext">No
permission to execute procedure \<procedure_name\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ080</span>
<span class="errortype">37000</span> <span class="errortext">ELSE must
be last clause in CASE.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ081</span>
<span class="errortype">37000</span> <span class="errortext">ELSE must
be last clause in CASE.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ082</span>
<span class="errortype">37000</span> <span class="errortext">Reference
to non-object variable</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ083</span>
<span class="errortype">42000</span> <span class="errortext">Can't
generate scalar exp \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ084</span>
<span class="errortype">42000</span> <span class="errortext">Subquery
predicate not supported.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ085</span>
<span class="errortype">42000</span> <span class="errortext">Reference
to undefined label.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ086</span>
<span class="errortype">42000</span> <span class="errortext">ORDER BY:
less than \<number\> cols in select.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ087</span>
<span class="errortype">09000</span> <span class="errortext">Forward
only cursor called not with FETCH NEXT</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ088</span>
<span class="errortype">39000</span> <span class="errortext">Statement
not supported in a procedure context.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ089</span>
<span class="errortype">S0022</span> <span class="errortext">Bad column
\<name\> in trigger column list</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ090</span>
<span class="errortype">42S02</span> <span class="errortext">Bad table
\<table_name\> in trigger \<name\> definition</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ091</span>
<span class="errortype">42000</span> <span class="errortext">Views not
supported as trigger objects</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ092</span>
<span class="errortype">42000</span> <span class="errortext">Access
denied for table \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ093</span>
<span class="errortype">21S01</span> <span class="errortext">Mismatched
columns and values in insert.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ094</span>
<span class="errortype">21S01</span> <span class="errortext">Too many
(\<number\>) values in insert into \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ095</span>
<span class="errortype">42S22</span> <span class="errortext">No column
\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ096</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ097</span>
<span class="errortype">42000</span> <span class="errortext">No insert
or insert/delete permission for insert / insert replacing</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ098</span>
<span class="errortype">42S22</span> <span class="errortext">No column
\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ099</span>
<span class="errortype">21S01</span> <span class="errortext">different
number of cols and values in insert.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ100</span>
<span class="errortype">42000</span> <span class="errortext">A local
table of over maximum columns may not be inserted</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ101</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ102</span>
<span class="errortype">42S22</span> <span class="errortext">No column
\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ103</span>
<span class="errortype">42000</span> <span class="errortext">Update of
\<name\> not allowed.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ104</span>
<span class="errortype">09000</span> <span class="errortext">Cursor with
a sorted order by, distinct, grouping etc. is not referenceable in where
current of</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ105</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ106</span>
<span class="errortype">42S22</span> <span class="errortext">No column
\<name\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ107</span>
<span class="errortype">42000</span> <span class="errortext">Update of
\<table_name\> not allowed.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ108</span>
<span class="errortype">43000</span> <span class="errortext">Permission
denied for delete.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ109</span>
<span class="errortype">09000</span> <span class="errortext">Cursor with
a sorted order by, distinct, grouping etc. is not referenceable in where
current of</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ110</span>
<span class="errortype">42000</span> <span class="errortext">Permission
denied for delete.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ111</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ112</span>
<span class="errortype">42S02</span> <span class="errortext">View
without table \<view_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ113</span>
<span class="errortype">37000</span> <span class="errortext">Non-view
column set in view update</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ114</span>
<span class="errortype">37000</span> <span class="errortext">View
\<name\> is not updatable in insert.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ115</span>
<span class="errortype">37000</span>
<span class="errortext">Non-updatable column \<name\> in view
\<view_name\> (expression or constant)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ116</span>
<span class="errortype">37000</span> <span class="errortext">View
\<name\> is not updatable.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ117</span>
<span class="errortype">42000</span> <span class="errortext">No column
update privilege for \<name\> in view \<view_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ118</span>
<span class="errortype">37000</span>
<span class="errortext">Non-updatable column \<name\> in view
\<view_name\> (expression or constant)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ119</span>
<span class="errortype">37000</span> <span class="errortext">View
\<name\> is not updatable.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ120</span>
<span class="errortype">S0022</span> <span class="errortext">Bad
CORRESPONDING BY column \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ121</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ122</span>
<span class="errortype">42000</span> <span class="errortext">Must have
select privileges on view \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ123</span>
<span class="errortype">42S02</span> <span class="errortext">foreign key
references non-existent table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ124</span>
<span class="errortype">42S02</span> <span class="errortext">Foreign key
reference to non existent table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ125</span>
<span class="errortype">37000</span> <span class="errortext">Different
number of referencing and referenced columns in foreign key declaration
from \<table_name\> to \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ126</span>
<span class="errortype">42S22</span> <span class="errortext">Foreign key
references invalid column \<name\> in referencing table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ127</span>
<span class="errortype">42000</span> <span class="errortext">The user
has been deleted</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ128</span>
<span class="errortype">42000</span> <span class="errortext">Unsupported
table constraint.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ129</span>
<span class="errortype">42S22</span> <span class="errortext">No column
\<column_name\> in \<table_name\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ130</span>
<span class="errortype">42000</span> <span class="errortext">The count
of supplied parameters to Virtuoso/PL FETCH statement does not match the
count of the selected columns.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ131</span>
<span class="errortype">42S22</span> <span class="errortext">Column
\<column_name\> from a derived table not found</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ132</span>
<span class="errortype">42S01</span> <span class="errortext">Table
\<table_name\> already exists</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ133</span>
<span class="errortype">37000</span> <span class="errortext">Procedure
declaration tries to overwrite a module with the same name</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ134</span>
<span class="errortype">42000</span> <span class="errortext">Table
already has an IDENTIFIED BY option</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ135</span>
<span class="errortype">42000</span> <span class="errortext">Duplicate
label name \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ136</span>
<span class="errortype">37000</span> <span class="errortext">Invalid
escape character in LIKE</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ137</span>
<span class="errortype">37000</span> <span class="errortext">Dots not
allowed inside column names</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ138</span>
<span class="errortype">37000</span> <span class="errortext">Comma
expressions not allowed in an IN clause</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ139</span>
<span class="errortype">37000</span> <span class="errortext">Different
number of subquery output columns for a predicate</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ140</span>
<span class="errortype">37000</span> <span class="errortext">Module
declaration tries to overwrite a module with the same name. Drop the
module first.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ141</span>
<span class="errortype">37000</span> <span class="errortext">Column is
invalid in the select list because it is not contained in either an
aggregate function or the GROUP BY clause.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ142</span>
<span class="errortype">37000</span> <span class="errortext">Different
number of expected and generated columns in a select</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ143</span>
<span class="errortype">37000</span> <span class="errortext">Tables
'\<tb1\>' and '\<tb2\>' have the same exposed names. Use correlation
names to distinguish them.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ144</span>
<span class="errortype">21S01</span> <span class="errortext">different
number of cols and values in insert.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ145</span>
<span class="errortype">21S01</span> <span class="errortext">different
number of cols and values in insert.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ146</span>
<span class="errortype">21S01</span> <span class="errortext">different
number of cols and values in insert.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ147</span>
<span class="errortype">37000</span> <span class="errortext">Incorrect
ORDER BY clause for query expression.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ148</span>
<span class="errortype">37000</span> <span class="errortext">TOP not
supported in IN, ANY, SOME, ALL, ONE subqueries</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ149</span>
<span class="errortype">42S22</span> <span class="errortext">The column
'\<column name\>' was specified multiple times for '\<table
name\>'</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ150</span>
<span class="errortype">37000</span> <span class="errortext">Column
'\<col\>' is invalid in the select list because it is not contained in
either an aggregate function or the GROUP BY clause.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ151</span>
<span class="errortype">S0022</span> <span class="errortext">Invalid
alias declaration: insert trigger cannot reference old values.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ152</span>
<span class="errortype">S0022</span> <span class="errortext">Invalid
alias declaration: delete trigger cannot reference new values.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ153</span>
<span class="errortype">37000</span> <span class="errortext">Other joins
in the joined table of another outer join not supported.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ154</span>
<span class="errortype">37000</span> <span class="errortext">Error in
trying to get the return value of a remote procedure.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ155</span>
<span class="errortype">37000</span> <span class="errortext">General
internal \[Optimized\] compiler error in \<file\>:\<line\>. Please
report the statement compiled.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ156</span>
<span class="errortype">37000</span> <span class="errortext">Internal
\[Optimized\] compiler error in \<file\>:\<line\>: \<message\>. Please
report the statement compiled.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ157</span>
<span class="errortype">42S02</span> <span class="errortext">The
supertable \<table\> in UNDER is not defined.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ158</span>
<span class="errortype">42S12</span> <span class="errortext">The
supertable \<table\> in UNDER has no primary key.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ159</span>
<span class="errortype">42S21</span> <span class="errortext">Column
names in each table must be unique. Column name \<col\> in table
\<table\> conflicts with a column of the supertable \<table\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ160</span>
<span class="errortype">42000</span> <span class="errortext">No Select
permission on the table \<table\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ161</span>
<span class="errortype">42000</span> <span class="errortext">No select
permission on the table \<table\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ162</span>
<span class="errortype">42000</span> <span class="errortext">No insert
or insert/delete permission for insert / insert replacing</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ164</span>
<span class="errortype">42000</span> <span class="errortext">Update of
\<table\> not allowed.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ165</span>
<span class="errortype">37000</span> <span class="errortext">Empty
namespace name is not valid in create xml view \<view\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ166</span>
<span class="errortype">42000</span> <span class="errortext">Reference
to undefined label.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ167</span>
<span class="errortype">22023</span> <span class="errortext">The long
varchar, long varbinary and long nvarchar data types cannot be used in
the WHERE, HAVING, or ON clause, except with the IS NULL predicate for
column \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ168</span>
<span class="errortype">22023</span> <span class="errortext">The long
varchar, long varbinary and long nvarchar data types cannot be used in
the WHERE, HAVING, or ON clause, except with the IS NULL predicate for
column \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ169</span>
<span class="errortype">37000</span> <span class="errortext">Invalid
fetch direction in FETCH</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ170</span>
<span class="errortype">37000</span> <span class="errortext">Key \<key\>
is inherited from table \<table\>. Drop the index from it.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ171</span>
<span class="errortype">42000</span> <span class="errortext">an SQL
\<module\|stored procedure\|user defined type\> with name \<name\>
already exists</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ172</span>
<span class="errortype">37000</span> <span class="errortext">Invalid
external name in CREATE PROCEDURE</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SQ173</span>
<span class="errortype">42000</span> <span class="errortext">Maximum
number of keys (\<num\>) already created</span>

</div>

</div>

<span style="color: red">\<title\>Client Side\</title\></span>

<div>

<div>

<span class="errorcode">CL001</span>
<span class="errortype">IM001</span> <span class="errortext">Function
not supported : \<function_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL002</span>
<span class="errortype">HY010</span> <span class="errortext">Unprepared
statement in SQLExtendedFetch</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL003</span>
<span class="errortype">HY106</span> <span class="errortext">Bad fetch
type for forward only cursor</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL004</span>
<span class="errortype">HY107</span> <span class="errortext">Specified
keyset size must be \>= the rowset size</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL005</span>
<span class="errortype">HY106</span> <span class="errortext">Bookmarks
not enabled or no bookmark retrieved</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL006</span>
<span class="errortype">HY111</span> <span class="errortext">Bad
bookmark for SQLExtendedFetch</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL007</span>
<span class="errortype">S1010</span> <span class="errortext">SQLSetPos
only allowed after SQLExtendedFetch</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL008</span>
<span class="errortype">HY092</span> <span class="errortext">SQLSetPos
irow out of range</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL009</span>
<span class="errortype">HY109</span> <span class="errortext">Only
SQL_POSITION SQLSetPos option supported for forward cursors</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL010</span>
<span class="errortype">01S02</span> <span class="errortext">Option
value changed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL011</span>
<span class="errortype">01S02</span> <span class="errortext">Option
value changed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL012</span>
<span class="errortype">01S02</span> <span class="errortext">Option
value changed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL013</span>
<span class="errortype">01S02</span> <span class="errortext">Option
value changed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL014</span>
<span class="errortype">01S02</span> <span class="errortext">Option
value changed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL015</span>
<span class="errortype">IM001</span> <span class="errortext">Driver does
not support this function</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL016</span>
<span class="errortype">01S02</span> <span class="errortext">Option
value changed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL017</span>
<span class="errortype">IM001</span> <span class="errortext">Driver does
not support this function</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL018</span>
<span class="errortype">01S02</span> <span class="errortext">Option
value changed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL019</span>
<span class="errortype">01S02</span> <span class="errortext">Option
Value Changed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL020</span>
<span class="errortype">HY091</span> <span class="errortext">Invalid
descriptor field identifier</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL021</span>
<span class="errortype">HY091</span> <span class="errortext">Invalid
descriptor type</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL022</span>
<span class="errortype">HY091</span> <span class="errortext">Invalid
descriptor type</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL023</span>
<span class="errortype">HY091</span> <span class="errortext">Invalid
descriptor type</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL024</span>
<span class="errortype">HY091</span> <span class="errortext">Not
supported</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL025</span>
<span class="errortype">HY091</span> <span class="errortext">Invalid
descriptor type</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL026</span>
<span class="errortype">IM001</span> <span class="errortext">Driver
doesn't support this function</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL027</span>
<span class="errortype">HYC00</span> <span class="errortext">Optional
feature not supported</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL028</span>
<span class="errortype">S1010</span> <span class="errortext">Statement
not prepared.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL029</span>
<span class="errortype">07005</span> <span class="errortext">Statement
does not have output cols.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL030</span>
<span class="errortype">07009</span> <span class="errortext">Bookmarks
not enabled for statement</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL031</span>
<span class="errortype">S1002</span> <span class="errortext">Column
index too large.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL032</span>
<span class="errortype">S1C00</span> <span class="errortext">Information
not available.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL033</span>
<span class="errortype">S2801</span> <span class="errortext">Connect
failed to \<dsn\> = \<host_port\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL034</span>
<span class="errortype">28000</span> <span class="errortext">Bad
login</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL035</span>
<span class="errortype">2C000</span> <span class="errortext">Charset
\<name\> not available. Server default \<name2\> will be used.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL036</span>
<span class="errortype">01S02</span> <span class="errortext">Switching
to the server default charset \<name\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL037</span>
<span class="errortype">S1010</span> <span class="errortext">Statement
not prepared.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL038</span>
<span class="errortype">07005</span> <span class="errortext">Statement
does not have output cols.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL039</span>
<span class="errortype">07009</span> <span class="errortext">Bookmarks
not enabled for statement</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL040</span>
<span class="errortype">S1002</span> <span class="errortext">Column
index too large.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL041</span>
<span class="errortype">HY010</span> <span class="errortext">Can't mix
SQLFetch and SQLExtendedFetch.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL042</span>
<span class="errortype">HY010</span> <span class="errortext">Statement
not prepared.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL043</span>
<span class="errortype">08S01</span> <span class="errortext">Connection
lost to server</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL044</span>
<span class="errortype">07009</span> <span class="errortext">Bad
parameter index in SQLDescribeParam</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL045</span>
<span class="errortype">08S01</span> <span class="errortext">Lost
connection to server</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL046</span>
<span class="errortype">40001</span> <span class="errortext">could not
enlist transaction</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL047</span>
<span class="errortype">25000</span> <span class="errortext">could not
enlist resource manager in transaction</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL048</span>
<span class="errortype">S1009</span> <span class="errortext">Information
not available.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL049</span>
<span class="errortype">HY010</span> <span class="errortext">Can't mix
SQLFetch and SQLExtendedFetch.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL050</span>
<span class="errortype">S1010</span> <span class="errortext">Bad call to
SQLParamData</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL051</span>
<span class="errortype">S1010</span> <span class="errortext">No param
was asked for.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL052</span>
<span class="errortype">S1010</span> <span class="errortext">Bad place
to call SQLPutData</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL053</span>
<span class="errortype">S1010</span> <span class="errortext">No data was
asked for.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL054</span>
<span class="errortype">S1010</span> <span class="errortext">Invalid
buffer length (even) in passing character data to binary column in
SQLPutData</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL055</span>
<span class="errortype">S1010</span> <span class="errortext">Invalid
buffer length (even) in passing character data to binary column in
SQLPutData</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL056</span>
<span class="errortype">07009</span> <span class="errortext">Bookmarks
not enable for statement</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL057</span>
<span class="errortype">S1010</span> <span class="errortext">Statement
not fetched in SQLGetData.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL058</span>
<span class="errortype">07009</span> <span class="errortext">Column out
of range in SQLGetData</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL059</span>
<span class="errortype">01004</span> <span class="errortext">Data
truncated.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL060</span>
<span class="errortype">07006</span> <span class="errortext">Non string
data received with SQLGetData.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL061</span>
<span class="errortype">S1010</span> <span class="errortext">Can't set
scroll on open cursor</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL062</span>
<span class="errortype">S1090</span> <span class="errortext">Invalid
string or buffer length</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL063</span>
<span class="errortype">S1010</span> <span class="errortext">Async call
in progress</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL064</span>
<span class="errortype">08S01</span> <span class="errortext">Lost
connection to server</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL065</span>
<span class="errortype">08S01</span> <span class="errortext">Lost
connection to server</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL066</span>
<span class="errortype">S1T00</span> <span class="errortext">Virtuoso
Communications Link Failure (timeout)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL067</span>
<span class="errortype">08S01</span> <span class="errortext">Lost
connection to server</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL068</span>
<span class="errortype">01000</span> <span class="errortext">Non last
proc w/array params returned</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL069</span>
<span class="errortype">22002</span> <span class="errortext">Invalid
(odd) length in conversion from SQL_C_CHAR to SQL_BINARY</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL070</span>
<span class="errortype">S1010</span> <span class="errortext">Invalid
buffer length (even) in passing character data to binary column in
SQLPutData</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL071</span>
<span class="errortype">01004</span> <span class="errortext">Data
truncated.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL072</span>
<span class="errortype">01004</span> <span class="errortext">Data
truncated.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL073</span>
<span class="errortype">01004</span> <span class="errortext">Data
truncated.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL074</span>
<span class="errortype">01004</span> <span class="errortext">Data
truncated</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL075</span>
<span class="errortype">01004</span> <span class="errortext">Data
truncated</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL076</span>
<span class="errortype">01004</span> <span class="errortext">Data
truncated.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL077</span>
<span class="errortype">01004</span> <span class="errortext">Data
truncated.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL078</span>
<span class="errortype">01004</span> <span class="errortext">Data
truncated.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL079</span>
<span class="errortype">01004</span> <span class="errortext">Data
truncated.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL080</span>
<span class="errortype">01004</span> <span class="errortext">Data
truncated.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL081</span>
<span class="errortype">01S07</span> <span class="errortext">Numeric
truncated by client</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL082</span>
<span class="errortype">01S01</span> <span class="errortext">Error in
row in SQLSetPos</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL083</span>
<span class="errortype">IM001</span> <span class="errortext">Unable to
handle array parameters on a scrollable cursor</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL084</span>
<span class="errortype">IM001</span> <span class="errortext">Unable to
handle DATA_AT_EXEC params in SQLSetPos</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL085</span>
<span class="errortype">HY020</span> <span class="errortext">Attempt to
concatenate NULL value</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL086</span>
<span class="errortype">28000</span> <span class="errortext">Password to
be sent in cleartext with no encryption</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL087</span>
<span class="errortype">01004</span> <span class="errortext">String
data, right truncation</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL088</span>
<span class="errortype">01004</span> <span class="errortext">String
data, right truncation</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL089</span>
<span class="errortype">42000</span> <span class="errortext">Not
connected to the data source</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CL090</span>
<span class="errortype">01004</span> <span class="errortext">Data
truncated</span>

</div>

</div>

<span style="color: red">\<title\>Client Side -
Clustering\</title\></span>

<div>

<div>

<span class="errorcode">08C02</span>
<span class="errortype">CLDPN</span> <span class="errortext">luster
operation cancelled because of peer disconnect HOST:CLUSTER_PORT</span>

This is an inter-cluster communication error which requires the DBA to
restart the node corresponding to the HOST:CLUSTERPORT.

</div>

</div>

<span style="color: red">\<title\>HTTP Server\</title\></span>

<div>

<div>

<span class="errorcode">HT001</span>
<span class="errortype">22023</span> <span class="errortext">An
interactive blob can't be passed as argument to ses_write</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT002</span>
<span class="errortype">22023</span> <span class="errortext">ses_write
requires string or blob as argument 1</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT003</span>
<span class="errortype">08003</span> <span class="errortext">cannot
write to session</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT004</span>
<span class="errortype">42001</span> <span class="errortext">No
DB.DBA.\_\_HTTP_XSLT defined</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT005</span>
<span class="errortype">22023</span> <span class="errortext">No VSP
parameter for /INLINEFILE</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT006</span>
<span class="errortype">37000</span> <span class="errortext">http output
function outside of http context and no stream specified:
\<function_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT007</span>
<span class="errortype">22023</span> <span class="errortext">An
interactive blob can't be passed as argument to http</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT008</span>
<span class="errortype">22023</span> <span class="errortext">http
requires string or blob as argument 1</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT009</span>
<span class="errortype">37000</span> <span class="errortext">XML output
function allowed only inside HTTP request</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT010</span>
<span class="errortype">42000</span> <span class="errortext">This
function is only allowed processing a HTTP request</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT011</span>
<span class="errortype">42000</span> <span class="errortext">XML output
function allowed only inside HTTP request</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT012</span>
<span class="errortype">42000</span> <span class="errortext">XML output
function allowed only inside HTTP request</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT013</span>
<span class="errortype">42000</span> <span class="errortext">http_path()
function allowed only inside HTTP request</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT014</span>
<span class="errortype">22023</span> <span class="errortext">Host name
is too long</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT015</span>
<span class="errortype">2E000</span> <span class="errortext">Cannot
resolve host in http_get</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT016</span>
<span class="errortype">08001</span> <span class="errortext">Cannot
connect in http_get</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT017</span>
<span class="errortype">08006</span> <span class="errortext">Error in
reading from HTTP server</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT018</span>
<span class="errortype">22023</span> <span class="errortext">URI too
long in http_get \<uri\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT019</span>
<span class="errortype">22023</span> <span class="errortext">Proxy must
contain port number</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT020</span>
<span class="errortype">2E000</span> <span class="errortext">Cannot
resolve host in http_get \<uri\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT021</span>
<span class="errortype">08001</span> <span class="errortext">Cannot
connect in http_get \<uri\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT022</span>
<span class="errortype">08007</span> <span class="errortext">Error in
writing to the target HTTP server</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT023</span>
<span class="errortype">08006</span> <span class="errortext">Error in
reading from target HTTP server</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT024</span>
<span class="errortype">42000</span> <span class="errortext">http_proxy
only allowed inside HTTP request</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT025</span>
<span class="errortype">42000</span> <span class="errortext">HTTP proxy
function disabled.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT026</span>
<span class="errortype">08006</span> <span class="errortext">Error in
mid read in http_get \<uri\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT027</span>
<span class="errortype">08006</span> <span class="errortext">Error in
mid read in http_get \<uri\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT028</span>
<span class="errortype">22023</span> <span class="errortext">no http
protocol identifier in http_get URI \<uri\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT029</span>
<span class="errortype">08006</span> <span class="errortext">Misc. error
in connection in http_get \<uri\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT030</span>
<span class="errortype">08006</span> <span class="errortext">Error in
mid read in http_get \<uri\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT031</span>
<span class="errortype">22023</span> <span class="errortext">The HTTP
output is not an STRING session in http_output_flush</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT032</span>
<span class="errortype">42000</span>
<span class="errortext">ses_read_line with no argument defaults it
direct to the raw client connection. Allowed only inside HTTP
request</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT033</span>
<span class="errortype">08003</span> <span class="errortext">cannot read
from session</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT034</span>
<span class="errortype">42000</span> <span class="errortext">The
http_flush not effective outside an VSP context</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT035</span>
<span class="errortype">42000</span> <span class="errortext">The
http_flush already done</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT036</span>
<span class="errortype">42000</span> <span class="errortext">The
http_auth not effective outside an VSP context</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT037</span>
<span class="errortype">42000</span> <span class="errortext">The
http_client_ip not effective outside an VSP context</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT038</span>
<span class="errortype">08003</span> <span class="errortext">Server
address not known</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT039</span>
<span class="errortype">42000</span> <span class="errortext">Not allowed
to call the http_xslt in an non VSP context</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT040</span>
<span class="errortype">42000</span>
<span class="errortext">http_map_get function outside of http
context</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT041</span>
<span class="errortype">39001</span> <span class="errortext">set_user_id
function cannot be called twice in the same context.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT042</span>
<span class="errortype">22023</span> <span class="errortext">Not valid
user id \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT043</span>
<span class="errortype">37000</span>
<span class="errortext">bif_ses_write not called inside HTTP
context</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT044</span>
<span class="errortype">22023</span> <span class="errortext">The
physical path must points to the dav domain.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT045</span>
<span class="errortype">22023</span> <span class="errortext">The port
number of host and listen host must be the same.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT046</span>
<span class="errortype">22023</span> <span class="errortext">The listen
host should be equal to SSLPort</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT047</span>
<span class="errortype">37000</span> <span class="errortext">Max nesting
level (20) reached when processing \<url\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT048</span>
<span class="errortype">37000</span>
<span class="errortext">Unterminated include tag at offset \<ofs\> in
\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT049</span>
<span class="errortype">37000</span> <span class="errortext">An include
tag at offset \<ofs\> with no name or VSP end tag before an include tag
in \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT050</span>
<span class="errortype">22023</span> <span class="errortext">Path
contains ..</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT051</span>
<span class="errortype">42000</span> <span class="errortext">Invalid
SOAP URL</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT052</span>
<span class="errortype">42000</span> <span class="errortext">Persistent
XML not allowed as an argument to soap_server</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT053</span>
<span class="errortype">42000</span> <span class="errortext">Function
http_body_read not allowed outside http_context</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT054</span>
<span class="errortype">08006</span> <span class="errortext">Error
reading the content in http_body_read</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT055</span>
<span class="errortype">22023</span> <span class="errortext">The
authentication function required in the authentication hook</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT056</span>
<span class="errortype">42000</span> <span class="errortext">Searching
for POST stream parameters not allowed outside HTTP context</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT057</span>
<span class="errortype">22023</span> <span class="errortext">The STRING
session is longer than 10Mb. Use substring to access it in parts.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT058</span>
<span class="errortype">22023</span> <span class="errortext">Missing
leading slash in path parameter</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT059</span>
<span class="errortype">42000</span> <span class="errortext">Proxy
access denied to \[host\]</span>

</div>

</div>

<div>

<div>

<span class="errorcode">HT060</span>
<span class="errortype">22023</span> <span class="errortext">The port
number of SSL host and SSL listen host must be the same.</span>

</div>

</div>

<span style="color: red">\<title\>Free-Text\</title\></span>

<div>

<div>

<span class="errorcode">FT001</span>
<span class="errortype">22026</span> <span class="errortext">Length
limit of composite exceeded.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT002</span>
<span class="errortype">S0002</span> <span class="errortext">bad table
for vt_words_next_d_id</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT003</span>
<span class="errortype">22003</span> <span class="errortext">composite
index out of range \<n1\> for length \<n2\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT004</span>
<span class="errortype">24000</span> <span class="errortext">cursor in
vt_words_next_d_id is not open or not on row</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT005</span>
<span class="errortype">42000</span> <span class="errortext">vtb_match
only allowed after vt_batch_strings</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT006</span>
<span class="errortype">22023</span> <span class="errortext">Unknown
encoding name \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT007</span>
<span class="errortype">22023</span>
<span class="errortext">vt_batch_d_id requires a composite or a number
as id</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT008</span>
<span class="errortype">22023</span> <span class="errortext">composite
document id over 32 characters long.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT009</span>
<span class="errortype">22023</span>
<span class="errortext">vt_batch_d_id id's not in ascending order</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT010</span>
<span class="errortype">22023</span>
<span class="errortext">vt_batch_d_id id's cannot be 0, -1 or -2</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT011</span>
<span class="errortype">22023</span> <span class="errortext">Bad XML
entity tree in vt_batch_feed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT012</span>
<span class="errortype">22023</span> <span class="errortext">Bad XML
entity tree in vt_batch_feed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT013</span>
<span class="errortype">22023</span> <span class="errortext">Bad XML
entity tree in vt_batch_feed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT014</span>
<span class="errortype">42000</span> <span class="errortext">The
vt_batch can't be used in vt_batch_feed after vt_batch_strings has been
called.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT015</span>
<span class="errortype">22023</span> <span class="errortext">The
vt_batch_feed can't index XML tree entity argument, only textual data
and XPERs are allowed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT016</span>
<span class="errortype">22023</span>
<span class="errortext">vt_batch_strings needs a string_output as a
second argument, not an argument of type \<type_name\>
(\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT017</span>
<span class="errortype">22003</span>
<span class="errortext">word_string_insert max length too high</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT018</span>
<span class="errortype">42S02</span> <span class="errortext">The table
is not freetext indexed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT019</span>
<span class="errortype">22023</span> <span class="errortext">The new
mode should be ON or OFF, not \<mode\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT020</span>
<span class="errortype">42S22</span> <span class="errortext">No
column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT021</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<table_name\> in create text index</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT022</span>
<span class="errortype">42S01</span> <span class="errortext">Only one
text index allowed per table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT023</span>
<span class="errortype">37000</span> <span class="errortext">Use NOT
INSERT flag, because function hooks does not generated before text index
creation.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT024</span>
<span class="errortype">22023</span> <span class="errortext">the column
\<name\> is not an integer</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT025</span>
<span class="errortype">42000</span> <span class="errortext">id =
id</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT026</span>
<span class="errortype">42000</span> <span class="errortext">Misc. error
upon update log creation. The free text index cannot be created.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT027</span>
<span class="errortype">22008</span> <span class="errortext">Invalid XML
supplied for an validating free text index of \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT028</span>
<span class="errortype">22008</span> <span class="errortext">Invalid XML
supplied for an validating free text index of \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT029</span>
<span class="errortype">22008</span> <span class="errortext">Invalid XML
supplied for an validating free text index of \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT030</span>
<span class="errortype">22008</span> <span class="errortext">Invalid XML
supplied for an validating free text index of \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT031</span>
<span class="errortype">37000</span> <span class="errortext">Setting
initial state of the freetext index for \<table_name\> failed. The data
is intact, but the freetext index is unusable. In order to recover from
this state the table \<name2\> should be dropped. This will clear all
these created so far. Then the freetext index creation should be retried
after removing the cause of the error which is : SQL State
\[\<sql_state\>\] Explanation : \<sql_message\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT032</span>
<span class="errortype">42S02</span> <span class="errortext">The table
\<table_name\> is not full-text indexed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT033</span> <span class="errortype"></span>
<span class="errortext">Cannot create a scheduled event : \<error
message\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT034</span>
<span class="errortype">42S02</span> <span class="errortext">Text index
not defined for \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT035</span>
<span class="errortype">42S02</span> <span class="errortext">Text index
should be enabled for the table \<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT036</span>
<span class="errortype">42S22</span> <span class="errortext">The id
column \<name\> does not exist in table \<table_name\> definition</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT037</span><span class="errortype">42S22</span><span class="errortext">The
data column \<name\> does not exist in table \<table_name\>
definition</span> x

</div>

</div>

<div>

<div>

<span class="errorcode">FT038</span>
<span class="errortype">22015</span> <span class="errortext">wildcard
has over 1000 matches</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT039</span>
<span class="errortype">22023</span> <span class="errortext">composite
expected for composite_ref</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT040</span>
<span class="errortype">09000</span> <span class="errortext">No cursor
for vt_words_next_d_id</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT041</span>
<span class="errortype">22023</span> <span class="errortext">negative
offset not allowed in composite_ref</span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT220</span>
<span class="errortype">22023</span> <span class="errortext">function
\<function_name\> expects a word batch as argument \<inx\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">FT370</span>
<span class="errortype">22023</span> <span class="errortext">Wildcard
word needs at least 3 leading characters</span>

</div>

</div>

<span style="color: red">\<title\>2 Phase Commit\</title\></span>

<div>

<div>

<span class="errorcode">DC001</span>
<span class="errortype">22023</span> <span class="errortext">Bad option
for SET 2PC</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DC002</span>
<span class="errortype">37100</span> <span class="errortext">MTS support
is not enabled</span>

</div>

</div>

<span style="color: red">\<title\>VDB\</title\></span>

<div>

<div>

<span class="errorcode">VD001</span>
<span class="errortype">22023</span> <span class="errortext">Value of
vdb_timeout must be an integer</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD002</span>
<span class="errortype">HY001</span> <span class="errortext">Not enough
temp space to pass decimal parameter</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD003</span>
<span class="errortype">HZ000</span> <span class="errortext">Cannot pass
dtp \<dv_type\> as param \<inx\> to remote execute \<text\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD004</span>
<span class="errortype">HZ000</span> <span class="errortext">Unknown
result set column C type \<c_type_code\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD005</span>
<span class="errortype">37000</span> <span class="errortext">Too few
arguments for rexecute (dsn, text, state, message, params, max, desc,
result\[, handle)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD006</span>
<span class="errortype">37000</span> <span class="errortext">More then
the maximum parameters supplied for rexecute</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD007</span>
<span class="errortype">22023</span> <span class="errortext">Supplied
DSN \<dsn\> is not valid</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD008</span>
<span class="errortype">22023</span> <span class="errortext">The handle
passed to rclose is not valid</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD009</span>
<span class="errortype">22023</span> <span class="errortext">The handle
passed to rnext is not valid</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD010</span>
<span class="errortype">22023</span> <span class="errortext">The handle
passed to rmoreresults is not valid</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD011</span>
<span class="errortype">22023</span> <span class="errortext">Supplied
DSN \<dsn\> is not valid</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD012</span>
<span class="errortype">HZ000</span> <span class="errortext">Bad DSN in
catalog call</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD013</span>
<span class="errortype">HZ000</span> <span class="errortext">Bad DSN in
catalog call</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD014</span>
<span class="errortype">HZ000</span> <span class="errortext">Cannot
remove DSN from ini</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD015</span>
<span class="errortype">42000</span> <span class="errortext">Unknown
windows version. The ODBCINST functionality disabled</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD016</span>
<span class="errortype">42000</span> <span class="errortext">This
feature runs only on Windows NT/Windows 2000. The ODBCINST functionality
disabled</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD017</span>
<span class="errortype">HZ000</span> <span class="errortext">Cannot get
installed drivers</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD018</span>
<span class="errortype">22002</span> <span class="errortext">Init string
cannot be empty</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD019</span>
<span class="errortype">22011</span> <span class="errortext">Init string
should finish with ;</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD020</span>
<span class="errortype">22026</span> <span class="errortext">DSN name is
too long</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD021</span>
<span class="errortype">22023</span>
<span class="errortext">DSN=\<DSN_NAME\> parameter should be specified
in init string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD022</span>
<span class="errortype">42000</span> <span class="errortext">Cannot add
DSN</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD023</span>
<span class="errortype">42000</span> <span class="errortext">Cannot
write the DSN setting to INI</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD024</span>
<span class="errortype">01S08</span> <span class="errortext">Cannot
write the File DSN</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD025</span>
<span class="errortype">HZ000</span> <span class="errortext">Array
parameters not supported by \<dsn\>. Retry statement</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD026</span>
<span class="errortype">42000</span>
<span class="errortext">Inconsistent vdb subquery compilation</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD027</span>
<span class="errortype">HY090</span> <span class="errortext">Remote
statement text over 19K</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD028</span>
<span class="errortype">HY090</span> <span class="errortext">Remote
statement text over 19K</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD029</span>
<span class="errortype">42S02</span> <span class="errortext">Cannot
generate remote ref to col w/ no table \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD030</span>
<span class="errortype">37000</span> <span class="errortext">The \_ROW
virtual column cannot be referenced for remote tables.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD031</span>
<span class="errortype">37000</span> <span class="errortext">Cannot
reprint node \<inx\> for remote text</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD032</span> <span class="errortype"></span>
<span class="errortext">remote prepare : \<sql_error\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD033</span>
<span class="errortype">42000</span> <span class="errortext">No insert
or insert/delete permission for insert / insert replacing</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD034</span>
<span class="errortype">42S22</span> <span class="errortext">No column
\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD035</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD036</span>
<span class="errortype">42S22</span> <span class="errortext">No column
\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD037</span>
<span class="errortype">42000</span> <span class="errortext">Update of
\<name\> not allowed.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD038</span>
<span class="errortype">S0002</span> <span class="errortext">No remote
procedure \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD039</span>
<span class="errortype">42S02</span> <span class="errortext">No table
\<table_name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD040</span>
<span class="errortype">42S02</span> <span class="errortext">Ref to
wrong table in remote current of </span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD041</span>
<span class="errortype">42S22</span> <span class="errortext">No column
\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD042</span>
<span class="errortype">42000</span> <span class="errortext">Update of
\<name\> not allowed.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD043</span>
<span class="errortype">42S02</span> <span class="errortext">Ref to
wrong table in remote current of </span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD044</span>
<span class="errortype">43000</span> <span class="errortext">Permission
denied for delete.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD045</span>
<span class="errortype">42S02</span> <span class="errortext">Table in
positioned delete is not the table of the cursor</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD046</span>
<span class="errortype">S1000</span> <span class="errortext">Remote DSN
\<dsn\> not defined</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD047</span>
<span class="errortype">40001</span> <span class="errortext">Transaction
killed during VDB call</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD048</span>
<span class="errortype">40001</span> <span class="errortext">Transaction
killed during VDB operation</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD049</span>
<span class="errortype">HZ000</span> <span class="errortext">No remote
DSN \<dsn\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD050</span>
<span class="errortype">HZ000</span> <span class="errortext">No remote
DSN \<dsn\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD051</span>
<span class="errortype">HZ000</span> <span class="errortext">No remote
DSN \<dsn\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD052</span> <span class="errortype"></span>
<span class="errortext">Remote DSN \<dsn\> : \<err_message\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD053</span>
<span class="errortype">HY090</span> <span class="errortext">Blob larger
than \<len\> bytes is too long for VDB buffering.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD054</span>
<span class="errortype">HY090</span> <span class="errortext">Blob larger
than \<len\> bytes is too long for VDB buffering.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD055</span>
<span class="errortype">22003</span> <span class="errortext">Can't
convert remote numeric \<numeric_string\> to local numeric</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD056</span>
<span class="errortype">HY001</span> <span class="errortext">Not enough
temp space to pass decimal param</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD057</span>
<span class="errortype">22023</span> <span class="errortext">Blob
parameters not allowed at this point</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD058</span>
<span class="errortype">22023</span> <span class="errortext">Cannot pass
dtp \<dt_type\> as param \<inx\> to remote query \<text\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD059</span>
<span class="errortype">07001</span> <span class="errortext">Too many
parameters in the call to the remote procedure \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD060</span>
<span class="errortype">22023</span> <span class="errortext">Blobs can't
be passed as non-input parameter \<inx\> to remote procedure
\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD061</span>
<span class="errortype">HY105</span> <span class="errortext">The
parameter \<inx\> of the remote procedure \<name\> is an output
parameter</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD062</span>
<span class="errortype">HZ000</span> <span class="errortext">Cannot
attach tables from the same server</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD063</span>
<span class="errortype">42S01</span> <span class="errortext">Table
already exists in ATTACH</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD064</span>
<span class="errortype">42S02</span> <span class="errortext">no remote
table/view or ambiguous remote table/view \<table_name\> in DSN
\<dsn\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD065</span>
<span class="errortype">42S22</span> <span class="errortext">\<name\> is
not a remote view \<table_name\> column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD066</span>
<span class="errortype">42S12</span> <span class="errortext">No unique
key</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD067</span>
<span class="errortype">HZ000</span> <span class="errortext">Driver not
capable for SQLTables</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD068</span>
<span class="errortype">HZ000</span> <span class="errortext">Driver not
capable for SQLTables</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD069</span>
<span class="errortype">HZ000</span> <span class="errortext">Driver not
capable for SQLTables</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD070</span>
<span class="errortype">42S01</span> <span class="errortext">Table
\<name\> exists as local table, cannot unlink similarly named remote
table</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD071</span>
<span class="errortype">HY090</span> <span class="errortext">Blob larger
than \<len\> bytes is too long for VDB buffering.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD072</span>
<span class="errortype">HY090</span> <span class="errortext">Blob of
\<len\> bytes is too long for VDB buffering.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD073</span>
<span class="errortype">HZ000</span> <span class="errortext">Bad DSN in
sql_columns</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD074</span>
<span class="errortype">HZ000</span> <span class="errortext">Bad DSN in
sql_tables</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD075</span>
<span class="errortype">HZ000</span> <span class="errortext">Bad DSN in
sql_primary_keys</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD076</span>
<span class="errortype">HZ000</span> <span class="errortext">Bad DSN in
sql_statistics</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD077</span>
<span class="errortype">HZ000</span> <span class="errortext">Bad DSN in
sql_procedures</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD078</span>
<span class="errortype">42000</span> <span class="errortext">Invalid
type of the parameter \<num\> to rexec. Should be 'INOUT' or
'OUT'</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD079</span>
<span class="errortype">42000</span> <span class="errortext">Invalid
datatype of the parameter \<num\> to rexec.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD080</span>
<span class="errortype">42000</span> <span class="errortext">Missing
input value of the inout parameter \<num\> to rexec.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD081</span>
<span class="errortype">42000</span> <span class="errortext">Output
parameters require the use of settable resultset variable in
rexec.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD082</span>
<span class="errortype">42000</span> <span class="errortext">Output
parameters don't allow use of an rexec cursor.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD083</span>
<span class="errortype">42000</span> <span class="errortext">Output
parameters Output parameters require the use of settable parameters
variable in rexec.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD084</span>
<span class="errortype">42000</span> <span class="errortext">DDL
operation not allowed on a remote table '\<table_name\>'</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD085</span>
<span class="errortype">42000</span> <span class="errortext">Can't
(commit \| rollback) dsn \<dsn_name\> because it is (not in manual
commit \| not transaction capable)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD086</span>
<span class="errortype">22023</span> <span class="errortext">The
statement in RSTMTEXEC should return resultset</span>

</div>

</div>

<div>

<div>

<span class="errorcode">VD087</span>
<span class="errortype">42000</span> <span class="errortext">No
permission to rexecute on DSN \<dsn\></span>

</div>

</div>

<span style="color: red">\<title\>Date/Time Routines\</title\></span>

<div>

<div>

<span class="errorcode">DT001</span>
<span class="errortype">22007</span> <span class="errortext">Function
\<name\> needs a datetime, date or time as argument \<inx\>, not an arg
of type \<type_name\> (\<dv_type\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DT002</span>
<span class="errortype">22023</span> <span class="errortext">Bad unit in
datediff: \<unit\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">DT003</span>
<span class="errortype">22015</span> <span class="errortext">Interval
not supported in \<function\>: \<interval\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">DT004</span>
<span class="errortype">22015</span> <span class="errortext">Bad
interval in timestampdiff: \<interval\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DT005</span>
<span class="errortype">22015</span> <span class="errortext">Bad
interval in extract.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DT006</span>
<span class="errortype">22007</span> <span class="errortext">Cannot
convert \<literal\> to datetime</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DT007</span>
<span class="errortype">22002</span> <span class="errortext">Nulls not
allowed as parameters to stringdate</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DT008</span>
<span class="errortype">25000</span>
<span class="errortext">now/get_timestamp: No current txn for
timestamp</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DT009</span>
<span class="errortype">22002</span> <span class="errortext">Nulls not
allowed as parameters to stringtime</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DT010</span>
<span class="errortype">22007</span> <span class="errortext">Can't
convert \<literal\> to time</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DT011</span>
<span class="errortype">22007</span> <span class="errortext">Can't
convert \<literal\> to time</span>

</div>

</div>

<span style="color: red">\<title\>Internationalization
Routines\</title\></span>

<div>

<div>

<span class="errorcode">IN001</span>
<span class="errortype">2C000</span> <span class="errortext">The UTF-8
is not a redefinable charset</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN002</span>
<span class="errortype">2C000</span>
<span class="errortext">charset_define : Charset table not a wide
string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN003</span>
<span class="errortype">2C000</span>
<span class="errortext">crahset_define : 0 not allowed as a charset
definition</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN004</span>
<span class="errortype">2C000</span> <span class="errortext">charset
\<name\> already defined. Drop it first</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN005</span>
<span class="errortype">2C000</span> <span class="errortext">Alias
\<inx\> not of type STRING</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN006</span>
<span class="errortype">22023</span> <span class="errortext">Collation
\<name\> not defined</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN007</span>
<span class="errortype">2C000</span> <span class="errortext">Charset
\<name\> not defined</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN008</span>
<span class="errortype">2C000</span> <span class="errortext">Charset
\<name\> not defined</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN009</span>
<span class="errortype">22005</span> <span class="errortext">Bad value
for wide string column \<name\>, dtp = \<dv_type\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN010</span>
<span class="errortype">22021</span>
<span class="errortext">Untranslatable character in an output context
that doesn't allow escapes.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN011</span>
<span class="errortype">22005</span> <span class="errortext">Bad value
for wide string column \<name\>, type = \<dv_type_title\>.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN012</span>
<span class="errortype">2C000</span> <span class="errortext">Narrow
source charset specified, but the supplied string is wide</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN013</span>
<span class="errortype">2C000</span> <span class="errortext">Wide source
charset specified, but the supplied string not wide</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN014</span>
<span class="errortype">22005</span> <span class="errortext">Invalid
data supplied in NVARCHAR -\> VARBINARY conversion</span>

</div>

</div>

<div>

<div>

<span class="errorcode">IN015</span>
<span class="errortype">22005</span> <span class="errortext">Invalid
data supplied in VARBINARY -\> NVARCHAR conversion</span>

</div>

</div>

<span style="color: red">\<title\>Transactional
Replication\</title\></span>

<div>

<div>

<span class="errorcode">TR001</span>
<span class="errortype">37000</span> <span class="errortext">The
publication \<name\> doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR002</span>
<span class="errortype">37000</span> <span class="errortext">Replication
not enabled on this server</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR003</span>
<span class="errortype">37000</span> <span class="errortext">The
publication \<name\> doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR004</span>
<span class="errortype">37000</span> <span class="errortext">The
subscription \<name\> from \<server\> doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR005</span>
<span class="errortype">37000</span> <span class="errortext">publication
and subscription servers have identical names.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR006</span>
<span class="errortype">37000</span> <span class="errortext">Publishing
server must be declared with REPL_SERVER before subscribing</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR007</span>
<span class="errortype">37000</span> <span class="errortext">The
subscription \<name\> already exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR008</span>
<span class="errortype">22023</span> <span class="errortext">User name
and password should be supplied when subscribe to new publisher</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR009</span>
<span class="errortype">37000</span> <span class="errortext">The WebDAV
collection \<name\> already exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR010</span>
<span class="errortype">37000</span> <span class="errortext">The table
\<name\> already exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR011</span>
<span class="errortype">22023</span> <span class="errortext">The item
type \<type\> not applicable</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR012</span>
<span class="errortype">37000</span> <span class="errortext">Can't
schedule local publication</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR014</span>
<span class="errortype">22023</span> <span class="errortext">You should
specify valid user name and password for replication
synchronization</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR015</span>
<span class="errortype">37000</span> <span class="errortext">Replication
account \<acct\> from \<server\> doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR016</span>
<span class="errortype">37000</span> <span class="errortext">The
publication \<name\> does not exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR017</span>
<span class="errortype">37000</span> <span class="errortext">The
publication \<name\> doesn't exists.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR018</span>
<span class="errortype">37000</span> <span class="errortext">The WebDAV
collection \<name\> doesn't exists.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR019</span>
<span class="errortype">37000</span> <span class="errortext">The DAV
collection \<name\> must added before checkpoint.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR020</span>
<span class="errortype">22023</span> <span class="errortext">Function
DAV_COL_I needs string or array as path</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR021</span>
<span class="errortype">22023</span> <span class="errortext">The first
parameter is not valid path string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR022</span>
<span class="errortype">37000</span>
<span class="errortext">Non-existing collection</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR023</span>
<span class="errortype">22023</span> <span class="errortext">Function
DAV_COL_U needs strings as paths</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR024</span>
<span class="errortype">22023</span> <span class="errortext">The second
parameter is not valid path string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR025</span>
<span class="errortype">22023</span> <span class="errortext">The first
parameter is not valid path string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR026</span>
<span class="errortype">37000</span>
<span class="errortext">Non-existing collection</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR027</span>
<span class="errortype">37000</span>
<span class="errortext">Non-existing parent collection</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR028</span>
<span class="errortype">22023</span> <span class="errortext">Function
DAV_COL_D needs string as path</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR029</span>
<span class="errortype">22023</span> <span class="errortext">The first
parameter is not valid path string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR030</span>
<span class="errortype">37000</span>
<span class="errortext">Non-existing collection</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR031</span>
<span class="errortype">22023</span> <span class="errortext">Function
DAV_RES_I needs string or array as path</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR032</span>
<span class="errortype">22023</span> <span class="errortext">The first
parameter is not valid path string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR033</span>
<span class="errortype">37000</span>
<span class="errortext">Non-existing collection</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR034</span>
<span class="errortype">22023</span> <span class="errortext">Function
DAV_RES_D needs string as path</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR035</span>
<span class="errortype">22023</span> <span class="errortext">The first
parameter is not valid path string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR036</span>
<span class="errortype">37000</span>
<span class="errortext">Non-existing resource</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR037</span>
<span class="errortype">37000</span> <span class="errortext">The
publication account \<name\> does't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR038</span>
<span class="errortype">37000</span> <span class="errortext">The dav
publication \<name\> already exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR039</span>
<span class="errortype">37000</span> <span class="errortext">The WebDAV
collection \<name\> doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR040</span>
<span class="errortype">37000</span> <span class="errortext">The table
\<name\> doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR041</span>
<span class="errortype">37000</span> <span class="errortext">The
procedure name doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR042</span>
<span class="errortype">37000</span> <span class="errortext">The
procedures calls to \<name\> can not be replicated to more than one
publication</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR043</span>
<span class="errortype">22023</span> <span class="errortext">The item
type \<type\> not applicable</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR044</span>
<span class="errortype">37000</span> <span class="errortext">The table
\<name\> doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR045</span>
<span class="errortype">37000</span> <span class="errortext">The
replication server \<server\> doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR046</span>
<span class="errortype">37000</span> <span class="errortext">The target
table \<target_table\> already exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR047</span>
<span class="errortype">37000</span> <span class="errortext">The
publication \<acct\> doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR048</span>
<span class="errortype">22023</span> <span class="errortext">The grantee
is invalid user name : \<grantee\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR049</span>
<span class="errortype">37000</span> <span class="errortext">The
publication \<acct\> doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR050</span>
<span class="errortype">22023</span> <span class="errortext">The grantee
is invalid user name : \<grantee\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR051</span>
<span class="errortype">37000</span> <span class="errortext">The grantee
\<grantee\> doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR052</span>
<span class="errortype">22023</span> <span class="errortext">The path
string is mandatory for DB.DBA.MKCOL</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR053</span>
<span class="errortype">37000</span> <span class="errortext">Publication
server \<server\> doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR054</span>
<span class="errortype">37000</span> <span class="errortext">Table
\<tbl\> doesn't exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR055</span>
<span class="errortype">37000</span> <span class="errortext">The WebDAV
collection \<name\> already exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR057</span>
<span class="errortype">42000</span> <span class="errortext">The new
name must be the same as in the ServerName (from INI file)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR058</span>
<span class="errortype">42000</span> <span class="errortext">General
error, publication records can't be updated</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR059</span>
<span class="errortype">42000</span> <span class="errortext">The current
name of server cannot be altered.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR060</span>
<span class="errortype">42000</span> <span class="errortext">The name of
new server used from another publishing server.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR061</span>
<span class="errortype">42000</span> <span class="errortext">The
publication on "\[new_name\]" exists with the same name a on
"\[old_name\]". The rename operation cannot be performed</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR065</span>
<span class="errortype">22023</span> <span class="errortext">Replication
account can not be empty</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR066</span>
<span class="errortype">22023</span> <span class="errortext">Replication
account can not be empty</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR067</span>
<span class="errortype">37000</span> <span class="errortext">No
replication account \<server\> \<account\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR068</span>
<span class="errortype">37000</span> <span class="errortext">No such
account</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR069</span>
<span class="errortype">37000</span> <span class="errortext">Server must
have a DBName entry in its ini file for replication</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR070</span>
<span class="errortype">42000</span> <span class="errortext">Replication
server not enabled in repl_log_text</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR071</span>
<span class="errortype">42000</span> <span class="errortext">Replication
account or trail missing for account name \<name\> in logging
replication.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">TR072</span>
<span class="errortype">08001</span> <span class="errortext">Replication
connect to \<server\> failed.</span>

</div>

</div>

<span style="color: red">\<title\>WebDAV Domain\</title\></span>

<div>

<div>

<span class="errorcode">DA001</span>
<span class="errortype">37000</span> <span class="errortext">Includes
can be owned only by admin & cannot be writable for others</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DA002</span>
<span class="errortype">37000</span> <span class="errortext">Max nesting
level (20) reached when processing \<path\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">DA003</span>
<span class="errortype">37000</span>
<span class="errortext">Unterminated include tag at offset \<offset\> in
\<path\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">DA004</span>
<span class="errortype">37000</span> <span class="errortext">An include
tag at offset \<inx\> with no name or VSP end tag before an include tag
in \<path\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">DA005</span>
<span class="errortype">22023</span> <span class="errortext">Unsupported
type of metadata</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DA006</span>
<span class="errortype">22023</span> <span class="errortext">Unsupported
type of metadata</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DA007</span>
<span class="errortype">22023</span> <span class="errortext">Function
ISPUBL needs string or array as argument.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DA008</span>
<span class="errortype">08006</span> <span class="errortext">Cannot read
from client</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DA009</span>
<span class="errortype">42000</span> <span class="errortext">Function
dav_user_set_password restricted to dba group</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DA010</span>
<span class="errortype">42000</span> <span class="errortext">The user
\[name\] does not exist</span>

</div>

</div>

<div>

<div>

<span class="errorcode">DA011</span>
<span class="errortype">42000</span> <span class="errortext">The new
password for \[name\] cannot be empty</span>

</div>

</div>

<span style="color: red">\<title\>SMTP/Mail Functions\</title\></span>

<div>

<div>

<span class="errorcode">SM001</span>
<span class="errortype">08006</span> <span class="errortext">\<SMTP
server response\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">SM002</span>
<span class="errortype">2E000</span> <span class="errortext">Cannot
resolve host in smtp_send</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SM003</span>
<span class="errortype">08001</span> <span class="errortext">Cannot
connect in smtp_send</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SM004</span>
<span class="errortype">22023</span> <span class="errortext">Default
mail server and/or destination server should be specified</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SM005</span>
<span class="errortype">08006</span> <span class="errortext">Misc. error
while connecting in smtp_send</span>

</div>

</div>

<div>

<div>

<span class="errorcode">SM006</span>
<span class="errortype">22023</span> <span class="errortext">Sender can
not be empty</span>

</div>

</div>

<span style="color: red">\<title\>POP3 Functions\</title\></span>

<div>

<div>

<span class="errorcode">PO001</span>
<span class="errortype">2E000</span> <span class="errortext">Cannot
resolve host in pop3_get</span>

</div>

</div>

<div>

<div>

<span class="errorcode">PO002</span>
<span class="errortype">08001</span> <span class="errortext">Cannot
connect in pop3_get</span>

</div>

</div>

<div>

<div>

<span class="errorcode">PO003</span>
<span class="errortype">08006</span> <span class="errortext">\<POP3
server error response\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">PO004</span>
<span class="errortype">08006</span> <span class="errortext">Misc. error
in connection in pop3_get</span>

</div>

</div>

<span style="color: red">\<title\>NNTP Server\</title\></span>

<div>

<div>

<span class="errorcode">NN001</span>
<span class="errortype">22023</span> <span class="errortext">Large ID in
nntp_id_get</span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN002</span>
<span class="errortype">2E000</span> <span class="errortext">Invalid
address for News Server at \<addr\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN003</span>
<span class="errortype">08001</span> <span class="errortext">Unable to
Contact News Server at \<addr\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN004</span>
<span class="errortype">08006</span> <span class="errortext">\<NNTP
server error message\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN005</span>
<span class="errortype">08006</span> <span class="errortext">Misc. error
in connection in nntp_get</span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN006</span>
<span class="errortype">22023</span> <span class="errortext">the command
is not recognized</span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN007</span>
<span class="errortype">08006</span> <span class="errortext">Misc. error
in connection in nntp_auth_get</span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN008</span>
<span class="errortype">22023</span> <span class="errortext">the command
is not recognized</span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN009</span>
<span class="errortype">08006</span> <span class="errortext">Misc. error
in connection in nntp_id_get</span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN010</span>
<span class="errortype">22023</span> <span class="errortext">The command
is not recognized</span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN011</span>
<span class="errortype">2E000</span> <span class="errortext">Invalid
address for the News Server at \<addr\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN012</span>
<span class="errortype">08001</span> <span class="errortext">Unable Post
to the News Server at \<addr\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN013</span>
<span class="errortype">08007</span> <span class="errortext">Misc. error
in connection in nntp_post</span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN014</span>
<span class="errortype">08007</span> <span class="errortext">\<NNTP
server error message\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN015</span>
<span class="errortype">2E000</span> <span class="errortext">Invalid
address for the News Server at \<addr\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN016</span>
<span class="errortype">08001</span> <span class="errortext">Unable Post
to the News Server at \<addr\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN017</span>
<span class="errortype">08007</span> <span class="errortext">Misc. error
in connection in nntp_auth_post</span>

</div>

</div>

<div>

<div>

<span class="errorcode">NN018</span>
<span class="errortype">08007</span> <span class="errortext">\<NNTP
server error message\></span>

</div>

</div>

<span style="color: red">\<title\>XSLT Processor\</title\></span>

<div>

<div>

<span class="errorcode">XS001</span>
<span class="errortype">37000</span> <span class="errortext">Bad match
XPATH expression</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS002</span>
<span class="errortype">XS370</span> <span class="errortext">Only
xsl:attribute elements allowed inside xsl:attribute-set
name=\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS003</span>
<span class="errortype">XS370</span> <span class="errortext">Only
xsl:attribute elements allowed inside xsl:attribute-set
name=\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS004</span>
<span class="errortype">XS370</span> <span class="errortext">Only
xsl:attribute elements and no value allowed inside xsl:attribute-set
name=\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS005</span>
<span class="errortype">XS370</span> <span class="errortext">Max nesting
(\<num\>) of XSLT attribute-sets exceeded</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS006</span>
<span class="errortype">XS370</span> <span class="errortext">xsl:text
with disable-output-escaping=on content is not a string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS007</span>
<span class="errortype">XS370</span> <span class="errortext">Element in
set to be sorted must be an XML node</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS008</span>
<span class="errortype">XS370</span> <span class="errortext">XSLT select
in apply-templates must return a node set</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS009</span>
<span class="errortype">XS370</span> <span class="errortext">Not an
entity in select in apply-templates</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS010</span>
<span class="errortype">XS370</span> <span class="errortext">XSLT
template \<name\> not found.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS011</span>
<span class="errortype">XS370</span> <span class="errortext">select in
for-each must return a node set</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS012</span>
<span class="errortype">XS370</span> <span class="errortext">Element in
for-each is not an entity</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS013</span>
<span class="errortype">XS370</span> <span class="errortext">Bad ns
prefix in q name \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS014</span>
<span class="errortype">XS370</span> <span class="errortext">Qualified
name too long</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS015</span>
<span class="errortype">XS370</span> <span class="errortext">Attribute
value for \<name\> is not a string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS016</span>
<span class="errortype">XS370</span> <span class="errortext">processing
instruction body for \<name\> is not a string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS017</span>
<span class="errortype">XS370</span> <span class="errortext">comment
body is not a string</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS018</span>
<span class="errortype">XS370</span> <span class="errortext">child
element of xsl:choose must be a xsl:when or an xsl:otherwise</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS019</span>
<span class="errortype">XS370</span> <span class="errortext">Unsupported
numbering level \<level\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS020</span>
<span class="errortype">XS370</span> <span class="errortext">Bad xsl
node \<node-name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS021</span>
<span class="errortype">22023</span> <span class="errortext">The xslt
parameters must be an even length generic array</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS022</span>
<span class="errortype">22023</span> <span class="errortext">XSLT
parameters must have strings for even numbered elements</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS023</span>
<span class="errortype">XS370</span> <span class="errortext">Required
XSLT attribute \<attr-name\> missing in \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS024</span>
<span class="errortype">XS370</span> <span class="errortext">Required
XSLT attribute \<attr-name\> missing in \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS025</span>
<span class="errortype">XS370</span> <span class="errortext">top element
is not stylesheet</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS026</span>
<span class="errortype">XS370</span> <span class="errortext">top element
is not stylesheet</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS027</span>
<span class="errortype">XS370</span> <span class="errortext">no top
element is stylesheet</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS028</span>
<span class="errortype">XS379</span> <span class="errortext">cyclic
reference in: \<name\> included from: \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS029</span>
<span class="errortype">XS370</span> <span class="errortext">"yes" or
"no" required for "output" tag attribute \<attr-name\> in
\<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS030</span>
<span class="errortype">22023</span> <span class="errortext">Bad style
sheet in xslt_sheet</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS031</span>
<span class="errortype">XS379</span> <span class="errortext">cyclic
reference in: \<url1\> imported from: \<uri2\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS032</span>
<span class="errortype">XS379</span> <span class="errortext">Standalone
required but no SYSTEM or PUBLIC doctype</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS033</span>
<span class="errortype">22023</span> <span class="errortext">An XSLT
sheet must be a memory based XML tree</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS034</span>
<span class="errortype">22023</span> <span class="errortext">Undefined
style sheet \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS035</span>
<span class="errortype">XS370</span> <span class="errortext">Number
format \<format\> redefined with different attributes</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS036</span>
<span class="errortype">XS370</span> <span class="errortext">Number
format \<format\> not defined</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS037</span>
<span class="errortype">22023</span> <span class="errortext">Unquoted
special character in format-number()</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS038</span>
<span class="errortype">22023</span> <span class="errortext">Unquoted
special character in format-number()</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS039</span>
<span class="errortype">22023</span> <span class="errortext">Too many
percent/permille characters in format-number() pattern</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS040</span>
<span class="errortype">22023</span> <span class="errortext">Too many
percent/permille characters in format-number() pattern</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS041</span>
<span class="errortype">22023</span> <span class="errortext">Unexpected
'0' in format-number() pattern</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS042</span>
<span class="errortype">22023</span> <span class="errortext">Multiple
decimal separators in format-number() pattern</span>

</div>

</div>

<div>

<div>

<span class="errorcode">XS043</span>
<span class="errortype">22023</span> <span class="errortext">Malformed
format-number() pattern</span>

</div>

</div>

<span style="color: red">\<title\>Cryptographic API\</title\></span>

<div>

<div>

<span class="errorcode">CR001</span>
<span class="errortype">42000</span> <span class="errortext">Cannot
allocate temp space. SSL Error : \<err\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">CR002</span>
<span class="errortype">42000</span> <span class="errortext">Cannot read
certificates. SSL Error : \<err\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">CR003</span>
<span class="errortype">42000</span> <span class="errortext">No CA
certificates. SSL Error : \<err\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">CR004</span>
<span class="errortype">42000</span> <span class="errortext">Cannot read
PKCS7 attached signature. SSL Error : \<err\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">CR005</span>
<span class="errortype">42000</span> <span class="errortext">Cannot
allocate output storage. SSL Error : \<err\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">CR006</span>
<span class="errortype">42000</span> <span class="errortext">No CA
certificates</span>

</div>

</div>

<div>

<div>

<span class="errorcode">CR007</span>
<span class="errortype">42000</span> <span class="errortext">Error
reading the signer certificate. SSL Error : \<err\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">CR008</span>
<span class="errortype">42000</span> <span class="errortext">Error
reading the signer private key. SSL Error : \<err\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">CR009</span>
<span class="errortype">42000</span> <span class="errortext">Cannot
generate PKCS7 signature. SSL Error : \<err\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">CR010</span>
<span class="errortype">42000</span> <span class="errortext">Cannot
allocate output storage. SSL Error : \<err\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">CR011</span>
<span class="errortype">42000</span> <span class="errortext">Cannot
allocate temp space. SSL Error : \<err\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">CR012</span>
<span class="errortype">42000</span> <span class="errortext">Cannot read
certificates. SSL Error : \<err\></span>

</div>

</div>

<span style="color: red">\<title\>Backup Functions\</title\></span>

<div>

<div>

<span class="errorcode">IB002</span>
<span class="errortype">42000</span> <span class="errortext">Read of
page \[PAGE NUM\] failed</span>

</div>

<div>

Internal error of backup process. Possible reason - corrupted database
file.

</div>

</div>

<div>

<div>

<span class="errorcode">IB001</span>
<span class="errortype">42000</span> <span class="errortext">Could not
compress page \[PAGE NUM\]</span>

</div>

<div>

Internal error of backup process. Possible reason - corrupted database
file.

</div>

</div>

<div>

<div>

<span class="errorcode">IB003</span>
<span class="errortype">42000</span> <span class="errortext">Could not
store backup context</span>

</div>

<div>

Possible reason - user has no permissions to perform online backup.

</div>

</div>

<div>

<div>

<span class="errorcode">IB004</span>
<span class="errortype">42000</span> <span class="errortext">Could not
read backup context</span>

</div>

<div>

Possible reason - user has no permissions to perform online backup.

</div>

</div>

<div>

<div>

<span class="errorcode">IB008</span>
<span class="errortype">42000</span> <span class="errortext">Could not
clear online backup context</span>

</div>

<div>

Possible reason - user has no permissions to perform online backup.

</div>

</div>

<div>

<div>

<span class="errorcode">IB008</span>
<span class="errortype">42000</span> <span class="errortext">Could not
clear online backup context</span>

</div>

<div>

Possible reason - user has no permissions to perform online backup.

</div>

</div>

<div>

<div>

<span class="errorcode">IB005</span>
<span class="errortype">42000</span> <span class="errortext">Backup file
\[FILE NAME\] writing error</span>

</div>

<div>

Backup file can not be written. Possible reason - disk is full.

</div>

</div>

<div>

<div>

<span class="errorcode">IB006</span>
<span class="errortype">42000</span> <span class="errortext">Number of
backup pages is less than 100</span>

</div>

<div>

Minimal allowed maximal number of pages contained in one backup file is
100. Increase second argument of online_backup.

</div>

</div>

<div>

<div>

<span class="errorcode">IB007</span>
<span class="errortype">42000</span> <span class="errortext">Could not
create backup file \[FILE NAME\]</span>

</div>

<div>

Backup file could not be created in the virtuoso directory. Check file
permissions.

</div>

</div>

<div>

<div>

<span class="errorcode">IB009</span>
<span class="errortype">42000</span> <span class="errortext">Timeout
exceeded</span>

</div>

<div>

online_backup procedure was aborted due to timeout.

</div>

</div>

<div>

<div>

<span class="errorcode">IB010</span>
<span class="errortype">42000</span> <span class="errortext">Timeout
cannot be negative</span>

</div>

<div>

Negative timeout parameter in online_backup procedure is not valid.

</div>

</div>

<span style="color: red">\<title\>User Define Types\</title\></span>

<div>

<div>

<span class="errorcode">UD001</span>
<span class="errortype">22023</span> <span class="errortext">User
defined type specified for an element</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD002</span>
<span class="errortype">42S22</span> <span class="errortext">Class
\<class\> is TEMPORARY. It can't be used as a column type</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD003</span>
<span class="errortype">22023</span> <span class="errortext">aset has no
effect on values returned by member observers</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD004</span>
<span class="errortype">22023</span> <span class="errortext">Invalid
proc_name array supplied</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD005</span>
<span class="errortype">22023</span>
<span class="errortext">Non-existent user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD006</span>
<span class="errortype">22023</span> <span class="errortext">No such
method in user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD007</span>
<span class="errortype">22023</span> <span class="errortext">Method
\<mtd\> in user defined type \<type\> not defined</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD008</span>
<span class="errortype">22023</span> <span class="errortext">Method
\<mtd\> needs an user defined type instance as argument 1, not an arg of
type \<type\> (\<tdp\>)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD009</span>
<span class="errortype">37000</span> <span class="errortext">Field
\<fld\> declared of different language than the class \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD010</span>
<span class="errortype">37000</span> <span class="errortext">Field
\<fld\> declared of different language than the class \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD011</span>
<span class="errortype">37000</span> <span class="errortext">Duplicate
external name option</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD012</span>
<span class="errortype">37000</span> <span class="errortext">Duplicate
external language option</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD013</span>
<span class="errortype">37000</span> <span class="errortext">Duplicate
external language option</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD014</span>
<span class="errortype">37000</span> <span class="errortext">EXTERNAL
VARIABLE NAME can be used only with STATIC methods</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD015</span>
<span class="errortype">37000</span> <span class="errortext">Method
\<mtd\> declared of different language than the class \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD016</span>
<span class="errortype">37000</span> <span class="errortext">Class
\<type\> already declared</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD017</span>
<span class="errortype">37000</span> <span class="errortext">Class
\<type\> declared of different language from it's forward
declaration</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD018</span>
<span class="errortype">37000</span> <span class="errortext">Class
\<type\> declared of different language from it's superclass
\<class\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD019</span>
<span class="errortype">37000</span> <span class="errortext">Can't make
a (TEMPORARY \| PERSISTENT) subclass \<class\> of a (TEMPORARY \|
PERSISTENT) class \<class\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD020</span>
<span class="errortype">42S01</span> <span class="errortext">Type
\<type\> already exists</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD021</span>
<span class="errortype">42000</span> <span class="errortext">No user
defined class \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD022</span>
<span class="errortype">42000</span> <span class="errortext">Type
\<type\> is used in one or more compiled queries. Drop them
first.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD023</span>
<span class="errortype">42000</span> <span class="errortext">Duplicate
member name \<fld\> in type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD024</span>
<span class="errortype">42000</span> <span class="errortext">Duplicate
method \<method\> in type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD025</span>
<span class="errortype">22023</span> <span class="errortext">Function
\<function_name\> needs an user defined type name as argument
\<arg_no\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD026</span>
<span class="errortype">22023</span> <span class="errortext">Invalid
instance in user defined type observer</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD027</span>
<span class="errortype">22023</span> <span class="errortext">Invalid
instance in user defined type mutator</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD028</span>
<span class="errortype">22023</span> <span class="errortext">Invalid
instance in user defined type method call</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD029</span>
<span class="errortype">22023</span> <span class="errortext">\<type\> is
not an instance of \<type\> in user defined type method call</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD030</span>
<span class="errortype">22023</span> <span class="errortext">\<type\>
instance supplied to a static method call \<mtd\> of \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD031</span>
<span class="errortype">22023</span> <span class="errortext">No instance
supplied to a non-static method call \<mtd\> of \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD032</span>
<span class="errortype">42000</span> <span class="errortext">Method
'\<mtd\>' of type '\<type\>' not defined</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD033</span>
<span class="errortype">22023</span> <span class="errortext">Non-valid
object instance supplied to member observer/mutator for class
\<class\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD034</span>
<span class="errortype">42000</span> <span class="errortext">The object
(type \<type\>) is not an instance of \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD035</span>
<span class="errortype">42000</span> <span class="errortext">invalid
instance offset \<ofs\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD036</span>
<span class="errortype">42000</span> <span class="errortext">invalid
vtable offset \<offset\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD037</span>
<span class="errortype">22023</span> <span class="errortext">The object
supplied is not an instance of \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD038</span>
<span class="errortype">22023</span> <span class="errortext">The object
(type \<type\>) is not an instance of \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD039</span>
<span class="errortype">42000</span> <span class="errortext">invalid
vtable offset \<ofs\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD040</span>
<span class="errortype">37000</span> <span class="errortext">User
defined type \<type\> not found in member observer (... AS ...)
call</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD041</span>
<span class="errortype">37000</span> <span class="errortext">No user
defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD042</span>
<span class="errortype">37000</span> <span class="errortext">No method
\<mtd\> in the user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD043</span>
<span class="errortype">37000</span> <span class="errortext">Ambiguous
method \<method\> in the user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD044</span>
<span class="errortype">37000</span>
<span class="errortext">Non-existent method \<method\> in dynamic method
call</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD045</span>
<span class="errortype">37000</span> <span class="errortext">No method
\<method\> in the user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD046</span>
<span class="errortype">37000</span> <span class="errortext">Ambiguous
method \<method\> in the user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD047</span>
<span class="errortype">37000</span> <span class="errortext">Not an
proper constructor call</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD048</span>
<span class="errortype">37000</span> <span class="errortext">No
constructor in the user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD049</span>
<span class="errortype">37000</span> <span class="errortext">Ambiguous
constructor call for the user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD050</span>
<span class="errortype">37000</span> <span class="errortext">No
class</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD051</span>
<span class="errortype">37000</span> <span class="errortext">Method
definition allowed only for SQL user defined types</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD053</span>
<span class="errortype">37000</span> <span class="errortext">No method
of that name declared</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD054</span>
<span class="errortype">37000</span> <span class="errortext">Invalid
class for the method definition</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD055</span>
<span class="errortype">22023</span> <span class="errortext">Can't write
to an user defined type column</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD056</span>
<span class="errortype">22023</span> <span class="errortext">No field
\<fld\> in the user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD057</span>
<span class="errortype">22023</span> <span class="errortext">No field
\<fld\> in the user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD058</span>
<span class="errortype">22023</span> <span class="errortext">No user
defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD059</span>
<span class="errortype">22023</span> <span class="errortext">Failed to
make instance of the user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD060</span>
<span class="errortype">22023</span> <span class="errortext">XML
attributes not supported with user defined types</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD061</span>
<span class="errortype">22023</span> <span class="errortext">No member
\<fld\> in the user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD062</span>
<span class="errortype">42000</span> <span class="errortext">Method with
bad owner, owner = \<owner\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD063</span>
<span class="errortype">22023</span> <span class="errortext">Type
\<type\> is obsolete.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD064</span>
<span class="errortype">37000</span> <span class="errortext">Type
\<type\> is DISTINCT. ALTER TYPE ADD ATTRIBUTE for distinct types is not
supported</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD065</span>
<span class="errortype">37000</span> <span class="errortext">Field with
name \<name\> is already defined(inherited) for type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD066</span>
<span class="errortype">42S22</span> <span class="errortext">Field with
name \<name\> defined for type \<type\>, which is an derived type of
\<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD067</span>
<span class="errortype">42S22</span> <span class="errortext">The
definition of type \<type\> not found in SYS_USER_TYPES</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD068</span>
<span class="errortype">37000</span> <span class="errortext">Type
\<type\> is DISTINCT. ALTER TYPE DROP ATTRIBUTE for distinct types is
not supported</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD069</span>
<span class="errortype">37000</span> <span class="errortext">No field
with name \<name\> for type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD070</span>
<span class="errortype">37000</span> <span class="errortext">User
defined type \<type\> is not instantiable</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD071</span>
<span class="errortype">37000</span> <span class="errortext">Method
\<name\> already defined in type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD072</span>
<span class="errortype">37000</span> <span class="errortext">User
defined type \<type\> is not instantiable</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD073</span>
<span class="errortype">37000</span> <span class="errortext">No method
\<name\> found in type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD074</span>
<span class="errortype">42S22</span> <span class="errortext">No user
defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD075</span>
<span class="errortype">42S22</span> <span class="errortext">\<type\> is
declared TEMPORARY. ALTER TYPE not supported for TEMPORARY
classes</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD076</span>
<span class="errortype">42S22</span> <span class="errortext">\<type\> is
not instantiable</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD077</span>
<span class="errortype">42S22</span> <span class="errortext">\<type\> is
an external hosted user defined type. ALTER TYPE not supported for
non-SQL user defined types.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD078</span>
<span class="errortype">42000</span> <span class="errortext">ALTER TYPE
action not implemented</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD079</span>
<span class="errortype">42000</span> <span class="errortext">Internal
error: No user defined type to alter</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD080</span>
<span class="errortype">42000</span> <span class="errortext">User
defined type \<type\> is a super type at least of \<type\>. Drop it and
any other such types first.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD081</span>
<span class="errortype">42S22</span> <span class="errortext">Field with
name \<name\> defined for type \<type\>, which is an derived type of
\<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD082</span>
<span class="errortype">42S22</span> <span class="errortext">The
definition of type \<name\> not found in SYS_USER_TYPES</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD083</span>
<span class="errortype">37000</span> <span class="errortext">Type
\<name\> is DISTINCT. ALTER TYPE DROP ATTRIBUTE for distinct types is
not supported</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD084</span>
<span class="errortype">37000</span> <span class="errortext">No field
with name \<name\> for type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD085</span>
<span class="errortype">37000</span> <span class="errortext">User
defined type \<name\> is not instantiable</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD086</span>
<span class="errortype">37000</span> <span class="errortext">Method
\<name\> already defined in type \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD087</span>
<span class="errortype">37000</span> <span class="errortext">User
defined type \<name\> is not instantiable</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD088</span>
<span class="errortype">37000</span> <span class="errortext">No method
\<name\> found in type \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD089</span>
<span class="errortype">42S22</span> <span class="errortext">No user
defined type \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD090</span>
<span class="errortype">42S22</span> <span class="errortext">\<name\> is
declared TEMPORARY. ALTER TYPE not supported for TEMPORARY
classes</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD091</span>
<span class="errortype">42S22</span> <span class="errortext">\<name\> is
not instantiable</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD092</span>
<span class="errortype">42S22</span> <span class="errortext">\<name\> is
an external hosted user defined type. ALTER TYPE not supported for
non-SQL user defined types.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD093</span>
<span class="errortype">42000</span> <span class="errortext">ALTER TYPE
action not implemented</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD094</span>
<span class="errortype">42000</span> <span class="errortext">Internal
error: No user defined type to alter</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD095</span>
<span class="errortype">42000</span> <span class="errortext">user
defined type \<type\> owner specified is different than the
creator.</span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD096</span>
<span class="errortype">42000</span> <span class="errortext">No
permission to use type \<type\> as a superclass for \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD097</span>
<span class="errortype">42000</span> <span class="errortext">No
permission to instantiate user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD098</span>
<span class="errortype">42000</span> <span class="errortext">No
permission to access members of user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD099</span>
<span class="errortype">42000</span> <span class="errortext">No
permission to change members of user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD100</span>
<span class="errortype">42000</span> <span class="errortext">No
permission to call methods of user defined type \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD101</span>
<span class="errortype">42000</span> <span class="errortext">No
permission to define methods of class \<type\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">UD102</span>
<span class="errortype">42000</span> <span class="errortext">Cannot
compile the temp method for external procedure</span>

</div>

</div>

<span style="color: red">\<title\>Kerberos Library\</title\></span>

<div>

<div>

<span class="errorcode">KB001</span>
<span class="errortype">42000</span> <span class="errortext">while
initializing Kerberos 5 library</span>

</div>

</div>

<div>

<div>

<span class="errorcode">KB002</span>
<span class="errortype">42000</span> <span class="errortext">while
getting default credential cache (ccache)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">KB003</span>
<span class="errortype">42000</span> <span class="errortext">when
parsing name \<name\></span>

</div>

</div>

<div>

<div>

<span class="errorcode">KB004</span>
<span class="errortype">42000</span> <span class="errortext">when
unparsing name</span>

</div>

</div>

<div>

<div>

<span class="errorcode">KB005</span>
<span class="errortype">42000</span> <span class="errortext">when
initializing cache</span>

</div>

</div>

<div>

<div>

<span class="errorcode">KB006</span>
<span class="errortype">42000</span> <span class="errortext">wrong
password</span>

</div>

</div>

<div>

<div>

<span class="errorcode">KB007</span>
<span class="errortype">42000</span> <span class="errortext">while
storing credentials</span>

</div>

</div>

<div>

<div>

<span class="errorcode">KB008</span>
<span class="errortype">42000</span> <span class="errortext">while
initializing Kerberos 5 library</span>

</div>

</div>

<div>

<div>

<span class="errorcode">KB009</span>
<span class="errortype">42000</span> <span class="errortext">while
getting \<name\> credential cache (ccache)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">KB010</span>
<span class="errortype">42000</span> <span class="errortext">while
getting default credential cache (ccache)</span>

</div>

</div>

<div>

<div>

<span class="errorcode">KB011</span>
<span class="errortype">42000</span> <span class="errortext">while
getting remove credential cache (ccache)</span>

</div>

</div>

<span style="color: red">\<title\>Hosting\</title\></span>

<div>

<div>

<span class="errorcode">HO001</span>
<span class="errortype">22023</span> <span class="errortext">Invalid
params type \<tag\> (\<name\>)</span>

</div>

</div>

</div>

</div>
