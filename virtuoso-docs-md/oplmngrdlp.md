<div id="oplmngrdlp" class="section">

<div class="titlepage">

<div>

<div>

### 2.5.3. Debugging License Problems

</div>

</div>

</div>

Virtuoso license problems are easy to debug. The following information
provides a conceptual framework and troubleshooting tips suitable for
all licensing problems.

<div id="oplmngrdlpil" class="section">

<div class="titlepage">

<div>

<div>

#### Identifying License Problems

</div>

</div>

</div>

License problems occur when users attempt to apply them to products or
when they hit a ceiling associated with concurrent usage. Most license
errors are explicit and include text that states that a license is
invalid, expired, or exceeded. Problems associated with performance or
stability problems that do not produce license related errors are not
likely to be caused by licenses. There is no scenario in which use of an
evaluation key would contribute to limited functionality. OpenLink's
products are fully functional regardless of the license key applied. The
license key simply dictates the length of time for which a product may
be used.

</div>

<div id="oplmngrdlpsl" class="section">

<div class="titlepage">

<div>

<div>

#### Source of License Problems

</div>

</div>

</div>

Licenses problems appear under the following circumstances:

<div class="itemizedlist">

- A license file is ftp'd in ASCII.

- The license covers a different OpenLink product.

- The license covers a different OpenLink release.

- A machine has more physical Processor cores than allotted for by the
  license.

- The license can not be found.

- The wrong license is being found.

- You did not perform the appropriate steps to register the license.

- The License Manager process needs to be restarted.

- The license is inadequate for your level of concurrent activity

</div>

</div>

<div id="oplmngrdlptl" class="section">

<div class="titlepage">

<div>

<div>

#### Troubleshooting License Problems

</div>

</div>

</div>

Use the following tips to resolve your licensing tips or supply OpenLink
Technical Services with your findings:

<div class="itemizedlist">

- FTP all licenses (virtuoso.lic) in binary mode.

- Review the terms of the email that contained the license.

- Ensure that the license that you have received is for Virtuoso
  Universal Server and not a data access provider or driver.

- Compare the Virtuoso version on your machine with the version covered
  by the license key.

- Identify the number of physical Processor cores on the box that hosts
  the license and ensure those cores are covered by the license key.

- Use OpenLink's licensing guidelines to ensure that the license is
  placed in the appropriate location on the target machine.

- Use the host machine's search utilities to ensure that expired or
  deprecated license files are removed from the host machine and deleted
  from the trash.

- Use OpenLink's licensing guidelines to ensure that you have performed
  the license application procedure using the correct steps in the
  appropriate order.

- Use the host monitoring utilities to ensure that applicable processes
  have been restarted as detailed in OpenLink's licensing guidelines.

</div>

</div>

</div>
