<div id="compositedatatype" class="section">

<div class="titlepage">

<div>

<div>

### 20.2.3. The composite Data Type

</div>

</div>

</div>

A composite is like a heterogeneous array, except that it is limited in
length, may be stored as a column value for a column declared as ANY,
and may be a key part in a SQL index. Thus, comparison is defined for
composites as follows:

<div class="itemizedlist">

- Composites are equal if all parts are equal.

- A composite is less than another if the first part of it which is not
  equal to the corresponding part of the other composite is less than
  that part.

- If a composite has less parts than another and all of its parts are
  equal to the corresponding parts of the longer composite, then the
  shorter is considered less.

</div>

The collation of composites is just like that of strings, except that in
the place of characters, arbitrary run time typed scalars are compared.

When strings are compared inside composites, they are compared as
binary, without any specific collation. Normal numeric coercion applies
to comparison of composites. Narrow and wide strings are compared with
binary collation. If two elements are of different types, e.g. a number
and a string and are compared, the data type will decide the outcome.
For example any integer is always less than any string.

The composite SQL function makes a composite. It takes a variable number
of arguments and returns a composite. The composite_ref function takes a
composite and a zero based index and returns the value. The serialized
length of a composite is limited to 255 characters. If a composite is
used in a free text index it is limited to 30 characters.

<div class="itemizedlist">

- <a href="fn_composite.html" class="link"
  title="composite">composite()</a>

- <a href="fn_composite_ref.html" class="link"
  title="composite_ref">composite_ref()</a>

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                 |
|:--------------------------:|:------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                       |
|                            | See the <a href="ch-concepts.html#datatypes" class="link"                                       
                              title="5.1.2. Data Types">Data Types</a> section for the storage requirement of each data type.  |

</div>

</div>
