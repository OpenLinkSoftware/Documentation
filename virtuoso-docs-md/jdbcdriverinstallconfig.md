<div id="jdbcdriverinstallconfig" class="section">

<div class="titlepage">

<div>

<div>

### 7.4.5. Installation & Configuration Steps

</div>

</div>

</div>

Perform the following steps in order to make use of your Virtuoso
Drivers for JDBC:

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                   |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                             |
|                              | You only have to perform these steps if a first attempt to use the Virtuoso Drivers for JDBC fails, the Virtuoso installer will attempt to configure these settings for you at installation time. |

</div>

<div class="orderedlist">

1.  Ensure your PATH environment variable is pointing to a version of
    the Java Virtual Machine (JVM) that is compatible with the version
    of the JDBC Driver Manager installed on your machine. Consult the
    <a href="virtuosodriverjdbc.html#virtuosodriverpackaging" class="link"
    title="7.4.1. Virtuoso Drivers for JDBC Packaging">section above</a>
    to double check. You can also type the following command to verify
    Java versions:

    ``` programlisting
    java -version
    ```

2.  Add the appropriate Virtuoso for JDBC "jar" file to your CLASSPATH
    environment variable.

3.  Attempt to make a connection using one of the sample JDBC
    Applications or Applets provided with your Virtuoso installation.

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Note: Note:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Note:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>If you have problems
using the virtuoso JDBC driver despite your CLASSPATH being defined
correctly, you may force the Java Virtual Machine to load a specific
JDBC driver using: <code class="computeroutput">-D</code> on the java
command line: e.g:</p>
<p><code
class="computeroutput">-Djdbc.drivers=virtuoso.jdbc.Driver</code> .</p>
<p>You can check the Virtuoso JDBC driver version from the command line
using: <code
class="computeroutput">java virtuoso.jdbc.Driver</code></p></td>
</tr>
</tbody>
</table>

</div>

</div>
