<div id="arrays" class="section">

<div class="titlepage">

<div>

<div>

## 11.5. Result Sets and Array Parameters

</div>

</div>

</div>

A procedure may be called with array parameters, c.f. SQLParamOptions.
Each call can yield multiple result sets.

The SQLMoreResults function is used to get from one result set to the
next and from one procedure call to the next. One may have to call this
function an indeterminate number of times before all results from a
procedure with array parameters have been received.

Each procedure return is marked with SQL_SUCCESS_WITH_INFO with SQL
state 'PMORE'. The next SQLFetch will retrieve the first row of the
first result set of the next procedure invocation.

</div>
