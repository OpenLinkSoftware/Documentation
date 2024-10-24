<div id="mt_servcompinstcont" class="section">

<div class="titlepage">

<div>

<div>

## 6.7. Installed Files & Locations

</div>

</div>

</div>

The core components required by the Request Broker and Database Agents
are situated within the "bin" and "bin/w3config" sub-directories under
your OpenLink server components base installation directory. Each of
these components is described below and grouped by directory location.

On Windows, the default base installation directory is
`C:\Progam Files\OpenLink\`. On Mac OS X, the non-configurable base
installation directory is `//Library/Application Support/openlink/`.

<div id="mt_binsubdir" class="section">

<div class="titlepage">

<div>

<div>

### 6.7.1. The "bin" sub-directory:

</div>

</div>

</div>

Below is a list of the important files in the bin directory:

<div id="id6534" class="decimalstyle">

**Table 6.2. Important Files in the bin directory**

<div class="decimalstyle-contents">

| File        | Description                                                                                                                                                                           |
|:------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| oplrqb      | The OpenLink Request Broker.                                                                                                                                                          |
| oplrqb.ini  | The OpenLink "Session Rules" Book.                                                                                                                                                    |
| oplrqb.log  | File that holds critical Broker & Startup and Shutdown audit information. All critical events that affect the Broker are written to this file irrespective of Broker startup options. |
| oplshut     | Utility for showing Agent status and shutting down the Broker.                                                                                                                        |
| xxx_sv      | OpenLink Agent (single thread). xxx will be an abbreviation for the data access or protocol handling service provided by the OpenLink Agent.                                          |
| xxx_mv      | OpenLink Agent (mutli thread). xxx will be an abbreviation for the data access or protocol handling service provided by the OpenLink Agent.                                           |
| release.txt | Text file with the latest information regarding the Request Broker.                                                                                                                   |
| oplrqb.lic  | File containing software activation and license key for the Broker and Database agents.                                                                                               |

</div>

</div>

  

</div>

<div id="mt_w3configdir" class="section">

<div class="titlepage">

<div>

<div>

### 6.7.2. The "bin/w3config" sub-directory:

</div>

</div>

</div>

<div id="id6569" class="decimalstyle">

**Table 6.3. Important Files in the bin/w3config directory**

<div class="decimalstyle-contents">

| File       | Description                                                                                                                                                                                                                       |
|:-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| www_sv     | The OpenLink Web Service Agent, this is basically a HTTP/Web Server implemented as an OpenLink Service Providing Agent. It is this component that forms the core engine around which the OpenLink Admin Assistant has been built. |
| www_sv.log | File that holds critical Web Service Agent & Startup and Shutdown audit information. All critical events that affect the Web Service Agent are written to this file irrespective of Web Service Agent startup options.            |
| www_sv.ini | Web Service Agent configuration file.                                                                                                                                                                                             |
| setup      | Web Service Agent installation and configuration program (you only need to run this directly if you only want to re-install the Web Service Agent component as opposed to the entire pool of OpenLink Server Components.          |

</div>

</div>

  

</div>

</div>
