<div>

<div>

<div>

<div>

### 17.2.5. Importing A WSDL File & SOAP/WSDL Proxying

</div>

</div>

</div>

Virtuoso can import WSDL files from other locations using the function:

<a href="fn_soap_wsdl_import.html" class="link"
title="soap_wsdl_import"><code
class="function">soap_wsdl_import() </code></a>

This function reads the descriptions of SOAP messages available in the
WSDL file and automatically creates Virtuoso stored procedure wrappers
for executing the SOAP messages directly from Virtuoso in procedures.
These generated procedures can then be exposed as SOAP messages in the
normal way from the Virtuoso SOAP server, and of course fully described
by an automatically generated WSDL file for them, thus creating a proxy
service for original messages.

</div>
