<div>

<div>

<div>

<div>

### 18.5.3. Memory Management Rules

</div>

</div>

</div>

All state slots in a query have distinct values. With the exception of a
reference parameter, no value is referenced twice. All state slot values
can therefore be recursively freed independently of each other.

If a VSE returns data, this data must always be new, i.e. allocated
inside the VSE and may not be a copy of or include any of the arguments
as a substructure. All return values and arguments must be legitimate
boxes and may not share a structure.

</div>
