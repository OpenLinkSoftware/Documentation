<div id="htmlusage" class="section">

<div class="titlepage">

<div>

<div>

### 19.8.2. Simple HTML FORM usage

</div>

</div>

</div>

We start with a small example that shows the source of a page including
a FORM with data from the user being sent when a submit button is
pressed. We then examine the elements and attributes of this simple form
that are important to us at this stage.

<div id="basicform" class="section">

<div class="titlepage">

<div>

<div>

#### Basic Forms

</div>

</div>

</div>

<div id="id66211" class="example">

**Example 19.11. Simple Forms**

<div class="example-contents">

``` programlisting
<HTML>
  <HEAD>
    <TITLE>Simple FORM demo</TITLE>
  </HEAD>
  <BODY>
  <FORM METHOD="POST" ACTION="formdemo_receiver.vsp">
    <P>Test form, type some info and click Submit</P>
    <INPUT TYPE="TEXT" NAME="myInput" />
    <INPUT TYPE="SUBMIT" NAME="submit" VALUE="Submit" />
  </FORM>
  </BODY>
</HTML>
```

</div>

</div>

  

The METHOD attribute of a FORM TAG in a VSP page can be either GET or
POST. The GET method allows the form submission to be contained
completely in a URL; this can be advantageous because it permits
bookmarking in browsers, but it also prevents form data from containing
non ASCII characters such as accented letters and special symbols and
restricts the amount of form data that can be handled. The GET method is
l mited by the maximum length of the URL that the server and browser can
process. To be safe, any form whose input might contain non-ASCII
characters or more than 100 characters should use METHOD="POST".

With the POST method, the form input is submitted as an HTTP POST
request with the form data sent in the body of the request. Most current
browsers are unable to bookmark POST requests, but POST does not entail
the character encoding and length restrictions imposed by GET.

The ACTION attribute of FORM specifies the URI of the form handler. This
will usually be another web page that performs some action based on the
data that is sent from the originating form. The URI could point to the
same page as the data originated and for pages that perform a
well-defined small set of functions it usually does. When a page needs
to manage multiple states there needs to be some flow control that can
determine how the page was reached; for example, to differentiate
whether it arrived at as a result of someone clicking on the submit
button or it is the first time the page has been visited.

</div>

<div id="formvalues" class="section">

<div class="titlepage">

<div>

<div>

#### Exchanging Values in Forms

</div>

</div>

</div>

Now we add some VSP to check the values of the parameters in the form.
VSP markup is typically contained in \<?vsp ... ?\> blocks.

<div id="id66220" class="example">

**Example 19.12. Forms and Values**

<div class="example-contents">

``` programlisting
<HTML>
  <HEAD>
    <TITLE>Simple FORM demo</TITLE>
  </HEAD>
  <BODY>
  <P>Last value sent:

  <?vsp
    http(get_keyword('myInput', params, 'no value'));
   ?>

</P>

  <FORM METHOD="POST" ACTION="formdemo.vsp">
    <P>Test form, type some info and click Submit</P>
    <INPUT TYPE="TEXT" NAME="myInput" />
    <INPUT TYPE="SUBMIT" NAME="submit" VALUE="Submit" />
  </FORM>
  </BODY>
</HTML>
```

</div>

</div>

  

This is the same example as above but now it uses the same page for the
form handler and displays the parameters each time. Clicking the Submit
button takes you to the same page and displays whatever you typed in the
field last time.

The VSP block uses two nested functions. The `http()` function allows
you to send data to the HTTP client, the browser. What we send to the
browser is the result of the `get_keyword()` function, which has three
parameters: *`search_for`* , *`source_array`* , and *`default_val`* . It
searches for the keyword-value pair (keyword=value) where the keyword
matches the *`search_for`* parameter (in this case 'myInput') in the
array passed in the *`source_array`* parameter. It returns the value if
one is found; otherwise returns the *`default_val`* parameter in the
function, in this case 'no value'. The*` params`* argument is a special
array that contains all page parameters from the previous FORM state.

</div>

<div id="formandvspconditions" class="section">

<div class="titlepage">

<div>

<div>

#### Conditional Processing

</div>

</div>

</div>

Now we extend this further to add some conditional control so that if a
value was entered we can respond directly to it. We will also use a
variable this time, which must be declared first.

<div id="id66237" class="example">

**Example 19.13. Conditional Processing Using IF**

<div class="example-contents">

``` programlisting
<HTML>
  <HEAD>
    <TITLE>Simple FORM demo</TITLE>
  </HEAD>
  <BODY>

  <?vsp
    declare _myInput varchar;

    _myInput := get_keyword('myInput', params, '');

    if (_myInput <> '')
    {   http('<P>Hello, ');
        http(_myInput);
        http('</P>');
    }
    else
    {   http('<P>Please enter your name</P>');
    }
   ?>

  <FORM METHOD="POST" ACTION="formdemo.vsp">
    <INPUT TYPE="TEXT" NAME="myInput" VALUE="" />
    <INPUT TYPE="SUBMIT" NAME="submit" VALUE="Submit" />
  </FORM>
  </BODY>
</HTML>
```

</div>

</div>

  

</div>

<div id="vsppgctrl" class="section">

<div class="titlepage">

<div>

<div>

#### Further Page Control

</div>

</div>

</div>

We now extend this to control the whole content of the page. In this
example we see that VSP and HTML can be interleaved.

<div id="id66243" class="example">

**Example 19.14. Page Control**

<div class="example-contents">

``` programlisting
<HTML>
  <HEAD>
    <TITLE>Simple FORM demo</TITLE>
  </HEAD>
  <BODY>

  <?vsp
    declare _myInput varchar;
    declare Mode varchar;

    _myInput := get_keyword('myInput', params, '');
    Mode := get_keyword('submit', params, '');

    if (Mode = 'Submit')
    {
   ?>
    <P>Hello, <?vsp http(_myInput); ?>
    </P>

<FORM METHOD="POST" ACTION="demo4.vsp">
<INPUT TYPE="HIDDEN" NAME="myInput" VALUE="" />
<INPUT TYPE="SUBMIT" NAME="submit" VALUE="Again" />
</FORM>

  <?vsp
    }
      else
    {
   ?>

  <P>Please enter you name</P>
  <FORM METHOD="POST" ACTION="demo4.vsp">
    <INPUT TYPE="TEXT" NAME="myInput" />
    <INPUT TYPE="SUBMIT" NAME="submit" VALUE="Submit" />
  </FORM>

  <?vsp
    }
  ?>
  </BODY>
</HTML>
```

</div>

</div>

  

We start by setting the mode based on whether the Submit button has been
pressed. When the mode has changed a different version of the page is
sent to the browser. In the new version, the Again button the appears,
to return you to the previous state when pressed.

</div>

<div id="params" class="section">

<div class="titlepage">

<div>

<div>

#### Communicating Parameters Between Pages

</div>

</div>

</div>

Now we will use two pages to do the same job as in the demo above.

<div id="id66250" class="example">

**Example 19.15. Using more than one page**

<div class="example-contents">

Page 1

``` programlisting
<HTML>
  <HEAD>
    <TITLE>Multi Page Demo</TITLE>
  </HEAD>
  <BODY>
  <P>Please enter you name</P>
  <FORM METHOD="POST" ACTION="demo5_2.vsp">
    <INPUT TYPE="TEXT" NAME="myInput" />
    <INPUT TYPE="SUBMIT" NAME="submit" VALUE="Submit" />
  </FORM>
  </BODY>
</HTML>
```

Page 2

``` programlisting
<HTML>
  <HEAD>
    <TITLE>Multi Page Demo</TITLE>
  </HEAD>
  <BODY>
  <P>The value you entered was:
  <?vsp
    http(get_keyword('submit', params, 'no data'));
  ?>
  </P>
  <FORM METHOD="POST" ACTION="demo5_1.vsp">
    <INPUT TYPE="SUBMIT" NAME="submit" VALUE="Back" />
  </FORM>
  </BODY>
</HTML>
```

</div>

</div>

  

</div>

<div id="formsandjs" class="section">

<div class="titlepage">

<div>

<div>

#### Using JavaScript to Control Forms

</div>

</div>

</div>

JavaScript is a programming language that can be used in the browser and
is useful for client-side programming. It is useful to be able to do
some work on the client machine before making another round trip to the
server for more processing. JavaScript is also useful for making things
more appealing to the Web page viewer.

JavaScript can be made to respond to events within the browser such as
when the mouse is moved over a link, a graphic or a button or when the
mouse is clicked on some part of the page. This can be achieved by using
event handlers within the HTML tags and placing JavaScript code in their
content. Common event handlers are
<span class="emphasis">*onMouseOver*</span> ,
<span class="emphasis">*onMouseClick*</span> ,
<span class="emphasis">*onMouseOut*</span> ,
<span class="emphasis">*onChange*</span> , and the like.

A simple but useful example of this would be to simplify one of the
previous examples by placing a handler on the text box so that you do
not have to press the submit button to send the form to the server:

``` programlisting
  <FORM METHOD="POST" ACTION="demo5_2.vsp" NAME="demo5_2">
    <INPUT TYPE="TEXT" NAME="myInput" onChange="document.demo5_2.submit()" />
    <INPUT TYPE="SUBMIT" NAME="submit" VALUE="Submit" />
  </FORM>
```

</div>

</div>
