<div id="javaextvm" class="section">

<div class="titlepage">

<div>

<div>

## 18.4. Embedded Java VM API

</div>

</div>

</div>

The Java VM is an embedded system within Virtuoso that allows the
calling of class Java methods and getting class properties. It uses the
JAVA JNI API to interact with the JAVA VM.

<div id="virtvsjvmthreads" class="section">

<div class="titlepage">

<div>

<div>

### 18.4.1. Correspondence Between Virtuoso & Java VM Threads

</div>

</div>

</div>

At maximum one Java VM will be started on demand. If a function from the
Java VM API is called and no JVM is running, one will be started, as
required. Since Virtuoso is multithreaded it requires JDK version 1.3 or
above in order to make better use of it's multithreading support. If the
Java VM is already running the API VSEs attaches the current Virtuoso
working thread, if not already attached, as a Java VM thread to the
running VM. The Virtuoso worker thread does not automatically detached
itself from the Java VM after use, therefore, in order to prevent
leaving redundant Virtuoso worker threads being left attached to the
Java VM the <a href="fn_java_vm_detach.html" class="link"
title="java_vm_detach"><code
class="function">java_vm_detach()</code></a> VSE should be used.

The following require access to the Java VM:

|                                                                                    |
|------------------------------------------------------------------------------------|
| all Virtuoso JAVA PL API (JVM VSEs)                                                |
| allocating/deallocating/copying of the Virtuoso/PL Java VM class reference values. |

If no subsequent JVM VSEs are called after calling `java_vm_detach()` ,
the worker thread can still attach to the VM in order to deallocate or
copy Java VM class reference values. In order to ensure that the worker
thread is properly detached it is advisable to set all the variables
that may hold Java VM class reference values to NULL, which deallocates
their current value, before calling the `java_vm_detach()` JVM VSE.

Attaching and detaching Virtuoso worker threads is marked as a debug
level message in the Virtuoso Event log, so that these messages can be
used to debug the process.

</div>

</div>
