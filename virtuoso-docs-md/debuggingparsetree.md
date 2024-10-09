<div>

<div>

<div>

<div>

### 12.7.3. Debugging with Parse Trees

</div>

</div>

</div>

It is extremely easy to make errors when manipulating parse trees in
code. A useful technique will be to print out the tree before and after
the operation. This can be conveniently done in the hook function with
dbg_obj_print, as shown in the example.

Once the modified tree is returned to the SQL compilation, the system
checks for it for absence of cycles, so that no two branches are the
same. There is an assertion failure if this happens. Otherwise the tree
is not checked. Hence a malformed tree will in all likelihood crash the
server during the compilation.

</div>
