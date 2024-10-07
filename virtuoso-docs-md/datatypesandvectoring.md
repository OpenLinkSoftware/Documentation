<div id="datatypesandvectoring" class="section">

<div class="titlepage">

<div>

<div>

### 11.7.17. Data Types and Vectoring

</div>

</div>

</div>

Note: This feature only applies to Virtuoso 7.0 and later.

Parameters in vectored procedures or FOR VECTORED blocks can be declared
to be of the corresponding scalar data type. The vectoring is thus in
most cases transparent; the variable will simply have multiple scalar
values instead of one. The ANY type in a vectored code section is
represented as an array of serialized values. Thus types that are
represented as data structures in allocated memory (e.g., arrays, hash
tables, XML elements, etc.) will not work efficiently with ANY vectored
variables. In some cases (for example, with streams or dictionaries),
assigning to a vectored ANY will lose the information.

Therefore, if dealing with vectors of complex data types in vectored
code, the variable holding these must be declared as an ANY ARRAY. With
this type, the representation will be an array of pointers to allocated
memory, not an array of flat serialized values. The ANY ARRAY type must
be used instead of the customary ANY in all cases involving complex
values in vectored code. If dealing with vectors of simple scalars like
strings or numbers, the ANY type is generally more efficient.

</div>
