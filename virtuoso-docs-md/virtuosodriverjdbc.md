<div id="virtuosodriverjdbc" class="section">

<div class="titlepage">

<div>

<div>

## 7.4. Virtuoso Driver for JDBC

</div>

</div>

</div>

The Virtuoso Drivers for JDBC are available in "jar" file formats for
JDBC 1.x, JDBC 2.x and JDBC 3.x specifications. These are Type 4 Drivers
implying that utilization is simply a case of adding the relevant "jar"
file to your CLASSPATH and then providing an appropriate JDBC URL format
in order to establish a JDBC session with a local or remote Virtuoso
server. It is important to note that when you make a JDBC connection to
a Virtuoso Server, you do also have access to Native and External
Virtuoso tables. Thus, you actually have a type 4 JDBC Driver for any
number of different database types that have been linked into Virtuoso.

The JDBC 2 and JDBC 3 drivers also incorporate SSL encryption to enable
very secure connections to the Virtuoso database.

<div id="virtuosodriverpackaging" class="section">

<div class="titlepage">

<div>

<div>

### 7.4.1. Virtuoso Drivers for JDBC Packaging

</div>

</div>

</div>

These drivers are installed alongside the Virtuoso Server or as part of
a Virtuoso Client components only installation. They are packaged as
follows:

<div id="javacompatibilitytable" class="decimalstyle">

**Table 7.14. Features Comparison**

<div class="decimalstyle-contents">

| Driver Name                                          | Java Package   | "jar" File Archive | Default Location                          | Java Version |
|:-----------------------------------------------------|----------------|--------------------|-------------------------------------------|--------------|
| virtuoso.jdbc.Driver                                 | virtuoso.jdbc  | virtjdbc.jar       | \<virtuoso installation directory\>\jdk11 | Java 1.1.x   |
| virtuoso.jdbc2.Driver                                | virtuoso.jdbc2 | virtjdbc2.jar      | \<virtuoso installation directory\>\jdk12 | Java 1.2/1.3 |
| virtuoso.jdbc3.Driver used for Java 1.4 and Java 1.5 | virtuoso.jdbc3 | virtjdbc3.jar      | \<virtuoso installation directory\>\jdk13 | Java 1.4     |
| virtuoso.jdbc4.Driver used for Java 1.6              | virtuoso.jdbc4 | virtjdbc4.jar      | \<virtuoso installation directory\>\jdk14 | Java 1.6     |

</div>

</div>

  

</div>

</div>
