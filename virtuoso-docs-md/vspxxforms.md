<div>

<div>

<div>

<div>

### 14.4.10. XForms rendering

</div>

</div>

</div>

The VSPX form controls such as form, button, select-list, text etc. can
be rendered as XForms analogues using a special connection variable
'RenderXForms' set to true (integer 1). Also XML post data coming from
XForms capable agents will be parsed and provided to the VSPX page
methods in usual form (name/value array). The HTML form elements
substitution to the XForms is as follows: input type="text" -
xforms:input; input type="password" - xforms:secret; textarea -
xforms:textarea; select - xforms:select1; select multiple -
xforms:select; checkbox - xforms:input (of datatype boolean); input
type="radio" - xforms:select1 appearance="full"; input type="submit" -
xforms:submit; form - xforms:model. Furthermore validators which belongs
to a input elements (not to a containers) will enforce XMLSchema types
of the XForms model. Note that some XForms agents may need special
object registering or a special Content-Type reported, so as this varies
from agent to agent the application logic is responsible for setting
them properly.

``` programlisting
    <v:page xmlns:v="http://example.com/vspx/" name="xform_demo">
    <v:on-init>
        -- enable XForms rendering
        connection_set ('RenderXForms', 1);
    </v:on-init>
    ... page content follows ...
    </v:page>
```

</div>
