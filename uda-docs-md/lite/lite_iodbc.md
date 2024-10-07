<div id="lite_iodbc" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 11. OpenLink ODBC Driver Manager (iODBC SDK)

</div>

<div>

<div class="abstract">

**Abstract**

This document provides information on linking your ODBC Applications
with iODBC. iODBC is an alternative ODBC Driver Manager solution for
developing ODBC components and applications for non-Windows systems
(e.g. Mac OS Classic, Mac OS X, Linux....). iODBC is a free project
licensed exclusively under the LGPL and BSD licenses, developed and
maintained by OpenLink Software. iODBC permits non-Windows systems to
communicate with databases via ODBC.

The ODBC API consists of a set of functions to enable any C/C++
applications linked against it to access and manage data. The ODBC
specification is currently maintained by Microsoft Corporation.

iODBC is compliant with the actual Microsoft ODBC version 3.51.

iODBC SDKs are different for each platform. iODBC SDKs are available
free of charge from the iODBC web site, released under the GNU Library
General Public License (LGPL). The SDKs are made up of include files
(.h), libraries for the corresponding platform, and a sample application
for testing and demonstration (odbctest). The sample application is an
Interactive Dynamic SQL Interpreter. Its sources are included for your
use as you see fit.

There are no drivers included with the iODBC SDK, but you can find many
on the OpenLink web site and from other third party middleware vendors.

You can find below a set of URLs for the right iODBC SDK regarding the
platform (which is the operating system and the CPU) you are targeting
at <a href="http://www.iodbc.org/opliodbc.htm" class="ulink"
target="_top">iodbc.org</a>.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">11.1. [iODBC SDK on
Unix](lite_iodbcsdklinux.html)</span>

<span class="section">11.2. [Configuring Data
Sources](lite_iodbcsdkconfdsn.html)</span>

<span class="section">11.2.1. [The Configuration
Files](lite_iodbcsdkconfdsn.html#lite_iodbcsdkunixfiles)</span>

<span class="section">11.2.2. [Making a Test
Connection](lite_iodbcsdkconfdsn.html#lite_iodbcsdktestunix)</span>

<span class="section">11.2.3. [Compiling Sample
Program](lite_iodbcsdkconfdsn.html#lite_compsampodbc)</span>

<span class="section">11.2.4. [Developing ODBC
Applications](lite_iodbcsdkconfdsn.html#lite_devodbc)</span>

<span class="section">11.2.5. [Further
Reading:](lite_iodbcsdkconfdsn.html#lite_furtherread)</span>

<span class="section">11.3. [Linking iODBC and ODBC Applications on Mac
OS](lite_iodbcappsmacos.html)</span>

<span class="section">11.3.1. [Mac OS
Classic](lite_iodbcappsmacos.html#lite_iodbcmacclassic)</span>

<span class="section">11.3.2. [Mac OS
X](lite_iodbcappsmacos.html#lite_iodbcmacosx)</span>

<span class="section">11.3.3.
[References](lite_iodbcappsmacos.html#lite_iodbcsdkrefs)</span>

<span class="section">11.3.4. [Porting Mac OS Classic ODBC applications
to Mac OS X](lite_iodbcappsmacos.html#lite_iodbcportappmac)</span>

</div>

</div>
