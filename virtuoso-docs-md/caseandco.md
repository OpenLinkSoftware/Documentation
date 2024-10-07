<div id="caseandco" class="section">

<div class="titlepage">

<div>

<div>

### 9.19.11. CASE, NULLIF, COALESCE, CAST Value Expressions

</div>

</div>

</div>

<div id="case" class="section">

<div class="titlepage">

<div>

<div>

#### The CASE Expression

</div>

</div>

</div>

There are many situations where you might find it useful to alter the
the data returned by a SQL query based on a few rules. For example, you
may want to display Customers gender as 'Male' or 'Female' based on
whether their title is 'Mr' or one of 'Miss', 'Mrs' or 'Ms'. The CASE
expression can easily accommodate this.

The Syntax of CASE is:

``` programlisting
CASE
  WHEN <search-condition> THEN <output>
  WHEN <search-condition> THEN <output>
  ...
  ELSE <output>
END
```

When a \<search-condition\> is met the corresponding \<output\> is
returned. If no conditions are met then the \<output\> after is ELSE is
returned as a default value.

<div id="ex_caseexp" class="example">

**Example 9.34. Using the CASE expression**

<div class="example-contents">

``` programlisting
SELECT Title, CustomerName,
  CASE
    WHEN Title = 'Mr' THEN 'Male'
    WHEN Title = 'Mrs' THEN 'Female'
    WHEN Title = 'Miss' THEN Female'
    WHEN Title = 'Ms' THEN 'Female'
    ELSE 'Unknown'
  END as Gender,
  Company
  FROM Customers
```

May return values such as:

``` screen
Title   Gender  CustomerName        Company
VARCHAR VARCHAR VARCHAR             VARCHAR
___________________________________________________________

Mr      Male    Thomas Hardy        Around the Horn
Miss    Female  Christina Berglund  Berglunds shop
Mrs     Female  Hanna Moos          Blauer See Delikatessen
Mr      Male    Laurence Lebihan    Bon app
```

</div>

</div>

  

There is also a short hand notation for the CASE expression as follows:

``` programlisting
CASE <search-parameter>
  WHEN <search-value> THEN <output>
  WHEN <search-value> THEN <output>
  ...
  ELSE <output>
END
```

This short hand is best demonstrated by the rewrite of the above example
as follows:

<div id="ex_caseexpshort" class="example">

**Example 9.35. Using the CASE short-hand expression**

<div class="example-contents">

``` programlisting
SELECT Title, CustomerName,
  CASE Title
    WHEN 'Mr' THEN 'Male'
    WHEN 'Mrs' THEN 'Female'
    WHEN 'Miss' THEN Female'
    WHEN 'Ms' THEN 'Female'
    ELSE 'Unknown'
  END as Gender,
  Company
  FROM Customers
```

</div>

</div>

  

In both cases the ELSE keyword is optional. If ELSE is unspecified then
ELSE NULL is implicit.

</div>

<div id="casenullif" class="section">

<div class="titlepage">

<div>

<div>

#### The NULLIF Expression

</div>

</div>

</div>

The NULLIF expression is a short hand implementation of a special case
of the CASE expression for a popular demand. Consider the following CASE
expression:

``` programlisting
CASE col1
  WHEN 'something' THEN NULL
  ELSE col1
END
```

This is replaced by the NULLIF expression which achieves the same result
using the following, much shorter expression:

``` programlisting
NULLIF (col1, 'something')
```

This is often useful in situations where you have a code to denote a
value as unspecified for whatever reason, but in many applications you
would rather this was NULL.

</div>

<div id="casecoalesce" class="section">

<div class="titlepage">

<div>

<div>

#### The COALESCE Expression

</div>

</div>

</div>

The COALESCE expression is another application of the CASE expression to
suit another frequent requirement. The syntax of COALESCE is as follows:

``` programlisting
COALESCE (value-1, value-2, ..., value-n)
```

COALESCE returns the first non-NULL parameter. This is equivalent to

``` programlisting
CASE
  WHEN value-1 IS NOT NULL THEN value-1
  WHEN value-2 IS NOT NULL THEN value-2
  ...
  ELSE value-n
END
```

</div>

<div id="selcastexp" class="section">

<div class="titlepage">

<div>

<div>

#### The CAST Expression

</div>

</div>

</div>

SQL has always been considered a strongly typed language, meaning that
you cannot have expressions that contain arbitrary data types. Casting
is invaluable for comparing values that are obviously compatible but
their data types are not, such as `1 = '1'` . This attempts compares an
integer with a char which would not work unless one of the values was
cast as follows:

``` programlisting
cast('1' as integer) = 1
```

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                  |
|:--------------------------:|:-----------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                        |
|                            | The <a href="ch-sqlreference.html#dtcasting" class="link"        
                              title="9.1.2. Casting">CASTING</a> section for more information.  |

</div>

</div>

</div>
