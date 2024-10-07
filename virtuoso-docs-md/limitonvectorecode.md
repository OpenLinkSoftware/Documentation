<div id="limitonvectorecode" class="section">

<div class="titlepage">

<div>

<div>

### 11.7.16. Limitations on Vectored Code

</div>

</div>

</div>

Note: This feature only applies to Virtuoso 7.0 and later.

The body of FOR VECTORED or a vectored procedure may contain arbitrary
Virtuoso PL, except for LOOPs and backward GOTOs. Conditional
expressions and statements are allowed, as well as any subqueries or DML
statements. Looping over a cursor is not allowed, since this is a loop,
but scalar subqueries and selecting-into-variables in
<span class="emphasis">*SELECT ... INTO*</span> is allowed. Exception
handlers are not allowed inside, but an exception handler outside of FOR
VECTORED will catch errors signaled from inside FOR VECTORED. FOR
VECTORED statements may not be nested and may not occur in the body of a
vectored procedure. The handler, being itself not in vectored code, will
not be able to see which specific value in a vectored section gave rise
to the exception.

</div>
