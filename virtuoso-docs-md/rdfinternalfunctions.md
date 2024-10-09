<div>

<div>

<div>

<div>

### 16.2.7. Useful Internal Functions

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Conversion Functions for XMLSchema/RDF Data Serialization Syntax

</div>

</div>

</div>

These functions emulate constructor functions from XQuery Core Function
Library.

``` programlisting
create function DB.DBA."http://www.w3.org/2001/XMLSchema#boolean" (in strg any) returns integer
create function DB.DBA."http://www.w3.org/2001/XMLSchema#dateTime" (in strg any) returns datetime
create function DB.DBA."http://www.w3.org/2001/XMLSchema#double" (in strg varchar) returns double precision
create function DB.DBA."http://www.w3.org/2001/XMLSchema#float" (in strg varchar) returns float
create function DB.DBA."http://www.w3.org/2001/XMLSchema#integer" (in strg varchar) returns integer
```

</div>

<div>

<div>

<div>

<div>

#### RDF-specific Predicates

</div>

</div>

</div>

``` programlisting
-- Returns 1 if string s matches pattern p, 0 otherwise
create function DB.DBA.RDF_REGEX (
    in s varchar,            -- source string to check
    in p varchar,            -- regular expression pattern string
    in coll varchar := null) -- unused for now (modes are not yet implemented)

-- Returns 1 if language identifier r matches lang pattern t
create function DB.DBA.RDF_LANGMATCHES (
  in r varchar, -- language identifies (string or NULL)
  in t varchar) -- language pattern (exact name, first two letters or '*')
```

</div>

</div>
