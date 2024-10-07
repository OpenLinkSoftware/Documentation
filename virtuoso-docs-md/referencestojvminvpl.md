<div id="referencestojvminvpl" class="section">

<div class="titlepage">

<div>

<div>

### 18.4.3. References to Java VM Class Instances in Virtuoso/PL

</div>

</div>

</div>

Java Class instances are represented as a Virtuoso/PL variable values
using a Java VM Global Reference. Each time such a Virtuoso/PL variable
value is created or copied, it adds a Java VM Global Reference. When it
is freed, it removes the Java VM global reference, allowing the Java
Garbage collector (GC) to free it. Each of the API VSEs create a Java VM
local frame upon it's start, and frees it upon exit. This allows for
fast deallocation of the local objects created by mapping Virtuoso/PL
native values to Java objects.

</div>
