<div>

<div>

<div>

<div>

### 14.4.7. Registering a VSPX Event Callbacks

</div>

</div>

</div>

The event handlers mechanism can be extended with callbacks. This means
registering a page method(s) which will be invoked after event scrips
are processed. The page methods used in this case can be either defined
using 'method' declaration inside VSPX page or using page subclass
defined in code-behind script(s) (see 'code-file' below). To register a
callback vc_add_handler (name, method_name) method must be invoked in
any script preceding the handler stage. Parameters to the vc_add_handler
are: name - name of event where callback to be executed
(before-data-bind, after-data-bind, on-post, before-render),
method_name - name of a page class method to be registered to the event.

``` programlisting
     <html>
         <body>
         <v:page name="handler_demo" xmlns:v="http://example.com/vspx/">
             <v:form name="sf" type="simple" action="form.vspx" method="POST">
             <v:text name="txt" />
             <v:button name="submit2" action="simple" value="OK" />
             <v:on-init>
                 control.vc_add_handler ('on-post', 'user_post');
             </v:on-init>
             </v:form>
             <v:method name="user_post" arglist="inout control vspx_control">
             dbg_printf ('Invoked: user post method');
             </v:method>
         </v:page>
         </body>
     </html>
     
```

</div>
