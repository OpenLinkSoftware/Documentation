<div>

<div>

<div>

<div>

### 15.3.5. Using XPATH in SQL Queries and Procedures

</div>

</div>

</div>

An XPATH expression can appear as a SQL query expression, that is, as a
derived table or subquery predicate or scalar subquery. This means that
the XPATH expression is expanded compile time to the corresponding SQL.
The mapping of the XPATH hierarchy to tables and joins is given by the
\_\_view XPATH option, which is mandatory.

The XPATH keyword introduces an embedded XPATH expression. The XPATH
text is presented as a string literal. Note that the tokenization rules
are different for XPATH and SQL, so having XPATH as a string makes it
clear which rules apply to parsing which part of the composite query.

<div>

**Example 15.7. Example**

<div>

``` programlisting
select * from (XPATH '[__* __view "cat"]
    //product') P order by "P."ProductName"";
```

will evaluate the //product query in the context of the cat XML view and
produce a result set consisting of all the attributes of the product
entity as defined in the view.

</div>

</div>

  

<div>

|                              |                                                                                                                                                                                                                                                                    |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                              |
|                              | The \_\_key and \_\_\* XPATH options are central here in defining the result columns of the XPATH. The default result column of an XPATH expression is the serialization of the selected entity or scalar, which is most of the time impractical in a SQL context. |

</div>

<div>

<div>

<div>

<div>

#### Parameters in XPATH

</div>

</div>

</div>

The '\$' sign introduces a parameter in XPATH. The identifier following
the dollar sign should reference a SQL column or variable defined in the
surrounding context. The name of the parameter can contain a dot for
referencing a column with a correlation name.

For instance, to make a VSP page that outputs the category tree which
contains a specific product, one may write:

``` programlisting
<HTML>
<?vsp
      declare N varchar;
      N := {?'name'};
      for (XPATH '[__http __view ''cat'']
        /category[product/@ProductName = $N]' do ; ?>
</HTML>
```

This will iterate over the categories containing a product with
ProductName equal to the URL parameter 'name'. Note the \_\_http option
that causes the text of the selected entities to go directly to the HTTP
client. Note the double '' escape for the XML view name inside the SQL
string literal forming the name.

Also note that the N parameter is in upper case to work in all case
modes. In some modes SQL identifiers will be converted automatically to
upper case but this conversion does not apply inside XPATH.

``` programlisting
select * from "Demo".."Categories" C
    where exists (XPATH '[__view "ord"]
    //products[@CategoryID = $C.CategoryID]');
```

This example selects the categories of products that have been mentioned
in the ord XML view.

<div>

|                              |                                                                                                                                                                             |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Syntax Notes                                                                                                                                                                |
|                              | The main difference of SQL and XPATH is that the '-' is not a breaking character in XPATH and that XPATH is case sensitive without any implicit identifier case conversion. |

</div>

</div>

</div>
