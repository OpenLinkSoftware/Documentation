<div>

<div>

<div>

<div>

### 14.4.2. Object Model

</div>

</div>

</div>

VSPX controls are SQL user defined type instances, or objects. The SQL
object system is substantially similar to any other single inheritance
object system, such as that of Java or C#. The XML source code of the
VSPX page is processed to generate SQL for instantiating the VSPX
control tree. The XML elements and classes may have similar names but
are not one to one identical.

All controls, including pages, are instances of a subclass of
`vspx_control` . To each VSPX source file corresponds a class named
after the file, which inherits the common superclass `vspx_page` .
Normally, all code, regardless of which specific control on the page it
pertains to, runs inside a method of the page, thus the
<span class="emphasis">*self*</span> (like 'this' in Java or C++) refers
to the page instance. By convention, the variable
<span class="emphasis">*control*</span> references the object
representing the control which declares the particular code snippet. The
variable `e` represents the event which is at the root of the code being
invoked. The event is normally an event object representing a GET or
POST HTTP request, but it can also be a user defined event sent to the
page by other code on the page or elsewhere.

The page has a data member `vc_children` which contains an array of all
top level VSPX controls on the page. Each control in turn has this same
variable for referring to subordinate controls, if any.

Each processing pass allows the developer to specify arbitrary SQL code
to run in the context of the pass. The code runs in the context of a
method of the page object, where the local variable
<span class="emphasis">*control*</span> references the control that
declares the code in question.

Controls may be enabled or disabled, thus supporting conditional
activation and rendering of page parts. Parts may be enabled in function
of a page state, for example a search result control is only on after
the search text has been posted. Another example is that some controls
may only be enabled if a user is logged in.

Code inside a control may locate other controls on the page by name,
either starting from the control itself or at the page. Note that when
repeating control groups are involved, it is best to start at the leaf
and work upwards in the tree, since there can be several identically
named children of the page. All controls have a name which is unique in
terms of the VSPX source file. Additionally, all controls, including
members of repeating groups, have a name which is generated to be unique
at run time. The latter is not however constant. The `vc_parent` data
member references the parent. `vc_name` is the name as appears in the
name attribute of the corresponding XML element. `vc_instance_name` is a
page-wide unique name, generated to be different for each possible
repetition of the control. The `find_control` method of `vspx_control`
can be used to look for a child with a specific `vc_name` .

</div>
