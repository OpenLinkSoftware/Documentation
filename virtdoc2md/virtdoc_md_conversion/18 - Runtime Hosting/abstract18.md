Virtuoso can be extended by in-process hosting of a number of different run time environments. This includes: Microsoft's .NET CLR (CLR), the Mono ECMA-CLI (Mono), and the Java Virtual Machine (JVM). Thus, you can create persistent stored modules, SQL functions, and user defined data types using any Microsoft .NET or Mono bound language, Java, and traditional languages such as 'C'/C++.

Objects provided by hosted run times, such as Java and CLR can be directly and transparently accessed from SQL. This also means that application logic in any hosted language can be exposed as a web service. By offering a choice of hosted run times in a cross platform setting, Virtuoso adds a new degree of freedom for the application designer. Applications can now be developed and deployed on either Windows, Linux or Unix, can be written in Java or any .net CLR bound language and can talk to any database via Virtuoso's virtual databasing capabilities.

The Virtuoso Server Extension Interface (VSEI) provides C interfaces and hooks that enable developers to write external functionality that can be bolted on the side of Virtuoso and called as SQL functions.

