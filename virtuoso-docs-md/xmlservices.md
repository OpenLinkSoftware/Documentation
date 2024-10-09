<div>

<div>

<div>

<div>

## 15.3. Virtuoso XML Services

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 15.3.1. XPATH Implementation and SQL

</div>

</div>

</div>

Virtuoso offers XPATH as a query language for XML views. The statement
is there converted into SQL in the context of the mapping defined by the
\_\_view XPATH option, which is mandatory. An XPATH query string is a
valid top level SQL statement. This is interpreted as a single select or
union of selects with the result columns being specified by various
XPATH options.

The basic query string

``` programlisting
XPATH [__view "cat"]/category
```

will select any top level category elements from the cat XML view,
defined with CREATE XML VIEW. This has a single result column with the
serialization string of the selected entity as value. This string starts
with the category start tag and ends with the corresponding end tag. As
many result rows are generated as there are top level category nodes in
the view.

This basic behaviour can be modified by XPATH options enclosed in
brackets after the XPATH keyword. These options allow specifying the
output columns of the generated select statement.

</div>

</div>
