<div id="plref" class="section">

<div class="titlepage">

<div>

<div>

## 11.7. Virtuoso/PL Syntax

</div>

</div>

</div>

<div id="createprocstmt" class="section">

<div class="titlepage">

<div>

<div>

### 11.7.1. Create Procedure Statement

</div>

</div>

</div>

``` programlisting
CREATE PROCEDURE NAME (parameter , parameter...) [RETURNS data_type]
{ statement ... }

parameter: parameter_type name data_type opt_default

parameter_type: IN | OUT | INOUT

opt_default: | DEFAULT literal | := literal
```

The create procedure statement actually performs a "create or replace"
type operation. The create procedure statement compiles and stores a
Virtuoso/PL procedure. The procedure text is first parsed and compiled
into Virtuoso virtual machine code and if the compilation is successful
the text is stored into the SYS_PROCEDURES table. This table is read at
startup. Stored procedures are thus always available for use and need be
defined only once. New procedures created with the same name as existing
procedures automatically replace their predecessor.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                            |
|:--------------------------:|:---------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                  |
|                            | <a href="createexthostproc.html" class="link"                              
                              title="11.11. CREATE PROCEDURE Syntax - External hosted procedures">CREATE  
                              PROCEDURE Syntax - External hosted procedures</a>                           |

</div>

``` screen
CREATE PROCEDURE FIBO (IN X INTEGER)
{
    IF (X < 2)
    RETURN X;
    ELSE
    RETURN (FIBO (X - 1) + FIBO (X - 2));
}

CREATE PROCEDURE CFIBO (IN X INTEGER)
{
    DECLARE RES INTEGER;

    RES := FIBO (X);

    RESULT_NAMES (RES);

    RESULT (RES);
}
```

</div>

</div>
