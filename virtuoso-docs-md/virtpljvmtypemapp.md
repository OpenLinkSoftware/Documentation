<div id="virtpljvmtypemapp" class="section">

<div class="titlepage">

<div>

<div>

### 18.4.2. Virtuoso/PL \<-\> Java VM Type Mapping Schema

</div>

</div>

</div>

Since the Java language uses a different set of data types than Virtuoso
a type mapping system has been established to allow the passage of data
to and from Java. All Java simple types are mapped to a corresponding
Virtuoso type as follows:

<div id="id64706" class="table">

**Table 18.1. Java - Virtuoso Data Type Mapping**

<div class="table-contents">

| Java Type/Class  | Virtuoso Internal Type |
|------------------|------------------------|
| boolean          | smallint               |
| char             | smallint               |
| double           | double precision       |
| float            | real                   |
| int              | integer                |
| short            | integer                |
| long             | integer                |
| boolean          | smallint               |
| java.lang.String | NVARCHAR               |
| java.util.Date   | DATETIME               |

</div>

</div>

  

All other Java objects are represented as a special Virtuoso value,
which contains a reference to the Java object in the VM memory space.
When such a value is returned as a Virtuoso/PL return value or as a
result set column, it calls the `java.lang.Object.toString()` method for
the Java VM object it refers to and that result is returned to the
calling client.

Arrays are mapped to a Virtuoso vector of their elements. The array
handling routines are recursive, so each element may be a Java array or
a scalar type.

The above mappings are applied when converting Virtuoso/PL data to Java
data as follows:

|                                                                                      |
|--------------------------------------------------------------------------------------|
| method parameter values in java_call_method VSE                                      |
| method parameter values in java_new_object VSE                                       |
| property values in java_set_property VSE                                             |
| the instance parameters in java_call_method/java_get_property/java_set_property VSEs |

The above mappings are applied in the opposite direction (Java Data -\>
Virtuoso/PL data) as follows:

|                                                     |
|-----------------------------------------------------|
| method return values in java_call_method VSE        |
| return value of the java_new_object VSE             |
| property values returned from java_get_property VSE |

</div>
