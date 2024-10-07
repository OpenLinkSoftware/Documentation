<div id="vspxeventpars" class="section">

<div class="titlepage">

<div>

<div>

### 14.4.6. VSPX Event Handler Parameters

</div>

</div>

</div>

The user-defined event handlers always accept a 'control' parameter
whose type is the same as that of the control it belongs to. For example
the on-post event of 'button' has a parameter 'control' of type
vspx_button; after-data-bind of a 'label' has a parameter 'control' of
type 'vspx_label' etc.

The event handlers for before-data-bind, after-data-bind and on-post
have an additional parameter: 'e' which is of type vspx_event. The
parameter ('e') keeps the HTTP request as post data, request header and
path just like the global variables 'path', 'params' and 'lines' on a
VSP page. In addition to that, the vspx_event (e) keeps a reference to
the button pressed (if any) and a flag indicating the request type: POST
or GET. It may thus be used in a complex form to detect when to trigger
an event depending of event data or to directly access parameters of the
HTTP request, etc.

``` programlisting
create type vspx_event
as (
    ve_params any,          -- name value pairs of post data
    ve_lines  any,          -- HTTP header lines
    ve_path   any,          -- requested path , parsed as vector
    ve_button vspx_control,     -- which active control originated the event.
    ve_is_post int default 0    -- 0 for GET 1 for POST
   )  temporary self as ref
;
```

</div>
