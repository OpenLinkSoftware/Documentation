<div id="correctjavatype" class="section">

<div class="titlepage">

<div>

<div>

### 18.4.4. Specifying the Correct Java Type When Passing Values from Virtuoso/PL

</div>

</div>

</div>

Each method parameter in the `java_new_object()` /`java_call_method()`
can be either the value itself or a two-element vector. When it is a
two-element vector it's first element is the JNI type signature string,
e.g.: for integer - I, for array of integers - \[I\], for
java.lang.String - Ljava/lang/String. The signature is important because
the Java VM JNI API needs it in order to find the appropriate
constructor/method/property.

</div>
