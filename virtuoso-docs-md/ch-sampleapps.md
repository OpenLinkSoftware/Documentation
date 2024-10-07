<div id="ch-sampleapps" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 4. Sample ODBC & JDBC Applications

</div>

<div>

<div class="abstract">

**Abstract**

This chapter applies exclusively to the various commercial releases of
Virtuoso. If you are working with the open source version, please refer
to the instructions on the web site where you obtained it.

The OpenLink Virtuoso Installation provides sample applications to help
you get quick and easy results from you installation. This chapter
explains how to use these applications.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">4.1. [Binary & Source File
Locations](ch-sampleapps.html#binsrcloc)</span>

<span class="section">4.1.1. [ODBC Demonstration
Applications](ch-sampleapps.html#odbcdemos)</span>

<span class="section">4.1.2. [JDBC Demonstration
Applications](ch-sampleapps.html#sampjdbcdemos)</span>

<span class="section">4.2. [Sample ODBC
Applications](sampleodbcapps.html)</span>

<span class="section">4.2.1. [Mac OS
X](sampleodbcapps.html#macosxsamples)</span>

<span class="section">4.2.2. [Windows
95/98/NT/2000](winodbcsamples.html)</span>

<span class="section">4.2.3. [Linux & UNIX](unixodbcsamp.html)</span>

<span class="section">4.2.4. [MS DTC ODBC Sample
Application](msdtcsample.html)</span>

<span class="section">4.2.5. [MS DTC OLE DB Sample
Application](msdtcsample2.html)</span>

<span class="section">4.3. [Sample JDBC Applications &
Applets](jdbcdemos.html)</span>

<span class="section">4.3.1. [JDBCDemo Java
Application](jdbcdemos.html#jdbcdemo)</span>

<span class="section">4.3.2. [ScrollDemo2 Java
Application](scrolldemo2.html)</span>

<span class="section">4.3.3. [ScrollDemo2 Java
Applet](scrolldemo2applet.html)</span>

<span class="section">4.3.4. [JBench
Application](jbenchapplication.html)</span>

<span class="section">4.3.5. [JTA Demo Application](jtademo.html)</span>

</div>

A number of sample applications are bundled with your Virtuoso
installation for the following purposes:

|                                                                                                                  |
|------------------------------------------------------------------------------------------------------------------|
| To simplifying the process of getting Virtuoso up and running                                                    |
| To accelerate the support case creation and resolution process                                                   |
| To demonstrate Virtuoso's unique product features highlighting the benefits it brings to your organization       |
| To demonstrate application programming techniques that can used to aid and assist your ODBC and JDBC programmers |

Virtuoso's services are consumed primarily via ODBC and JDBC
applications (OLE-DB applications connect to Virtuoso via ODBC Data
Providers for OLE-DB), thus separate ODBC & JDBC sample applications
(including source code) have been packaged and integrated into the
Virtuoso installer. The current list of sample applications include:

<div class="itemizedlist">

- **C++ Demo. ** an ODBC based Interactive SQL processor written in C++.

- **ODBC Bench Test. ** a 32 Bit C++ program based on the industry
  standard TPC-A benchmark (we will be extending this program to include
  the TPC-C and TPC-D benchmarks also). This program helps you compare
  the performance of Virtuoso against other backend database engines as
  well as compare the performance of various ODBC Drivers connecting to
  any ODBC compliant backend database.

- **ODBCTEST. ** ODBC based Interactive SQL processor written in 'C' for
  Linux & UNIX

</div>

<div class="itemizedlist">

- **JDBCDemo. ** a JDBC sample application that demonstrates Virtuoso's
  SQL query.

- **ScrollDemo2. ** a JDBC 2.0 sample application that demonstrates
  Virtuoso's support of Scrollable Cursors and its ability to perform
  scrollable cursor operations across heterogeneous databases.

- **JBench. ** a Java and JDBC based adaptations of the industry
  standard TPC-A and TPC-C benchmarks. This program helps you compare
  the performance of Virtuoso against other backend database engines, it
  also helps you to compare the performance of various JDBC Drivers
  connecting to any JDBC compliant backend database.

- **JTADemo. ** a sample based on the TPC-A benchmark as well but
  implemented as a J2EE application which shows the use of XA
  distributed transactions as defined in JDBC 3.0 and JTA 1.0
  specifications.

</div>

<div id="binsrcloc" class="section">

<div class="titlepage">

<div>

<div>

## 4.1. Binary & Source File Locations

</div>

</div>

</div>

<div id="odbcdemos" class="section">

<div class="titlepage">

<div>

<div>

### 4.1.1. ODBC Demonstration Applications

</div>

</div>

</div>

Windows 95/98/NT/2000, Linux & UNIX:

The binary executables of these sample applications reside under the
following directory structure:

``` programlisting
<VIRTUOSO_INSTALLATION_DIRECTORY>\samples\odbc
```

The source code of some of these sample applications, when available,
reside under the following directory structure, for example:

``` programlisting
<VIRTUOSO_INSTALLATION_DIRECTORY>\samples\odbc\cppdemo
```

</div>

<div id="sampjdbcdemos" class="section">

<div class="titlepage">

<div>

<div>

### 4.1.2. JDBC Demonstration Applications

</div>

</div>

</div>

Windows 95/98/NT/2000, Linux & UNIX:

The binary executables (Java class files), and sources for these sample
applications reside under the following directory structure:

``` programlisting
<VIRTUOSO_INSTALLATION_DIRECTORY>\samples\jdbc\<JDK_Version>\<Demo_name>
```

</div>

</div>

</div>
