<div>

<div>

<div>

<div>

### 14.4.5. A Simple Example

</div>

</div>

</div>

<div>

**Example 14.15. Simple VSPX Page**

<div>

The fragment below shows us a VSPX page with a few labels. A label is a
simple control that renders as HTML text, using a data bindable
attribute to specify a value and a C printf style format string for the
format. Note the use of the \<?vsp ?\> processing instruction. This
could just as well have been an HTML literal.

``` programlisting
<html>
  <body>
    <v:page name="demo_label" xmlns:v="http://example.com/vspx/">
      <p>
        <?vsp http ('<H3>Simple page to demonstrate simple VSPX controls</H3>'); ?>
      </p>
      <p> An integer <v:label name="label1" value="--(1 + 2)" format="--'%d'"/> </p>
      <p> A string <v:label name="label2" value="'123'" format="%s"/> </p>
      <p> A string with default format <v:label name="label3" value="String"/> </p>
      <p>
      An url <v:url name="url1" value="--'OpenLink Software Ltd.'" format="%s" url="--'http://openlinksw.com/'"/>
      <br/>
      An url (default format) <v:url name="url2" value="OpenLink Software Ltd." url="http://openlinksw.com/" />
      </p>
      <v:include url="footer.xml"/>
    </v:page>
  </body>
</html>
```

</div>

</div>

  

</div>
