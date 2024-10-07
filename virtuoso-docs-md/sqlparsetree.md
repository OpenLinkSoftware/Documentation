<div id="sqlparsetree" class="section">

<div class="titlepage">

<div>

<div>

## 12.7. SQL Parse Tree

</div>

</div>

</div>

The SQL parse tree is composed of DV_ARRAY_OF_POINTER boxes. Other types
of boxes may occur as leaves, where they are interpreted as literals.
All nodes' first element (index 0) is the type of the node, one of the
constants in sqlparext.h.

The nodes' various fields can be accessed through the data members of
the sql_tree_t union. Most data members are pointers to the same type.
Sometimes they are double pointers, denoting a variable length array of
pointers to the struct. The caddr_t type is used to denote a terminal,
like a string or other constant. The types are only for declarative
value, the entire structure is a self describing, run time typed tree of
boxes.

The correspondence of the tree to the SQL syntax is documented by the
yacc grammar supplied as appendix.

We will next examine the need to know example:

``` programlisting
ST *
nk_tree_and (ST* left, ST * right)
{
  if (left && right)
    return ((ST*) list (4, BOP_AND, left, right, NULL));
  if (left)
    return left;
  return right;
}
```

This function adds anAND operation between 2 sub trees. If either is
NULL, the non-null one is returned. The list function is used as a
universal constructor of the parse tree, where the first argument is the
count of arguments to follow.

The above could have been written as follows without list:

``` programlisting
ST * r = (ST*) dk_alloc_box (4 * sizeof (caddr_t), DV_ARRAY_OF_POINTER);
r->type = BOP_AND;
r->_.bin_exp.left = left;
r->_.bin_exp.right = right;
r->_.bin_exp.more = NULL;
```

We see that the list notation is more concise.

``` programlisting
void
nk_test_add (ST * outer_texp, char * corr_name, int uid)
{
  /* add a exists (select 1 from need_to_know where nk_class = <corr_name>.r_class) */
  ST * sel, * exists, * texp, **from;
  ST * where = (ST*) list (4, BOP_EQ, list (3, COL_DOTTED, NULL, box_string ("NK_CLASS")),
               list (3, COL_DOTTED, box_string (corr_name), box_string ("R_CLASS")), NULL);
  where = nk_tree_and (where, listst (4, BOP_EQ, list (3, COL_DOTTED, NULL, box_string ("NK_USER")), box_num (uid), NULL));
  from = (ST**)
    list (1, list (3, TABLE_REF,
           list (5, TABLE_DOTTED,
             box_string ("DB.DBA.NEED_TO_KNOW"),
             NULL, box_num (0), box_num (0)),
           NULL));
  texp = listst (7, TABLE_EXP, from,
           where, NULL, NULL, NULL, -1);
  sel = listst (5, SELECT_STMT, NULL, list (1, box_num (1)), NULL, texp);
  exists = (ST*) list (5, EXISTS_PRED, NULL, sel, NULL, NULL);
  outer_texp->_.table_exp.where = nk_tree_and (outer_texp->_.table_exp.where, exists);
}
```

This function takes the table expression referencing the REPORT table
and the correlation name used for the table and the user id of the
querying user. It adds the existence test for the need to know. The
logic is self evident when examined in the context of the yacc grammar.
Note that the table in the FROM of the sub query is a TABLE_REF node
with a TABLE_DOTTED node, which finally contains the table and
correlation names. Note that all strings must be allocated as string
boxes. This is because the tree may only reference other boxes. Note
that all numbers except for the types of the nodes are boxed with
box_num. This will make sure that numbers and pointers are always
distinguishable. The node types are distinguishable by definition due to
their small absolute value.

``` programlisting
caddr_t
bif_need_to_know (caddr_t * qst, caddr_t * err_ret, state_slot_t ** args)
{
  unsigned inx;
  caddr_t uid = (caddr_t) bif_long_arg (qst, args, 0, "need_to_know");
  ST * tree = (ST*) bif_array_arg (qst, args, 1, "need_to_know");
  if (ST_P (tree, SELECT_STMT))
    {
      ST * texp = tree->_.select_stmt.table_exp;
      if (!texp)
    return 0; /* select w/o a from */
      for (inx = 0; inx < BOX_ELEMENTS (texp->_.table_exp.from); inx++)
    {
      ST * tref = texp->_.table_exp.from[inx];
      if (ST_P (tref, TABLE_REF))
        tref = tref->_.table_ref.table;
      if (ST_P (tref, TABLE_DOTTED))
        {
          char * corr_name;
          if (tref->_.table.prefix)
        corr_name = tref->_.table.prefix;
          else
        corr_name = tref->_.table.name;
          if (strstr (tref->_.table.name, "REPORT"))
        nk_test_add (texp, corr_name, (int)uid);
        }
    }
    }
  return 0;
}
```

This is the top level need to know function. It first checks to see that
the statement is a select, that it has a FROM clause (table expression).
For each table in the FROM which has REPORT as part of its name the
function adds an existence test to check the user's need to know. Note
that the correlation name is taken from the table and that the table
name is used in the absence of a correlation name to disambiguate the
reference. Note that the table_exp.from is of type ST \*\*, meaning a
variable length array of boxes. Note that BOX_ELEMENTS returns the
length in pointer-size units.

Note that in this example the tree is spliced in place, only adding
nodes. There is no need to free data or to modify the top node.

<div id="notesonspecialparsetree" class="section">

<div class="titlepage">

<div>

<div>

### 12.7.1. Notes on Special Features of the Parse Tree

</div>

</div>

</div>

The parse tree structure has a 1 to 1 correspondence with the yacc
grammar. The members of the union in sql_tree_t are mostly named after
the syntactic element and the constant that identifies them. There are
however some points worth noting:

|                                                                                                                                                                                                                                 |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Literals - All boxes whose tag is not DV_ARRAY_OF_POINTER are considered literals and may appear in all places where a literal is allowed.                                                                                      |
| Identifier Case - The case conversion of identifiers is controlled by the CaseMode ini file setting. When introducing a constant name referencing a VSE, one should use sqlp_box_id_upcase to get the right case for all modes. |
| The identifiers, once in the tree, are compared case sensitively in all modes case modes except 2.                                                                                                                              |
| Hook functions should use the appropriate comparison functions for the desired case sensitivity.                                                                                                                                |
| When generating references to names the case should be correct as defined by the case mode.                                                                                                                                     |

</div>

</div>
