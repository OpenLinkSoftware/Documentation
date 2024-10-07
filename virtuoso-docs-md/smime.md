<div id="smime" class="section">

<div class="titlepage">

<div>

<div>

### 19.6.3. S/MIME Support

</div>

</div>

</div>

S/MIME is a specification for secure electronic mail. S/MIME stands for
Secure/Multipurpose Internet Mail Extensions and was designed to add
security to e-mail messages in MIME format. The security services
offered are authentication (using digital signatures) and privacy (using
encryption).

The S/MIME specification consists of two documents:
<a href="http://www.rfc-editor.org/rfc/rfc2311" class="ulink"
target="_top">S/MIME Message Specification (RFC 2311)</a> and
<a href="http://www.rfc-editor.org/rfc/rfc2312" class="ulink"
target="_top">S/MIME Certificate Handling (RFC 2312)</a> . Both of these
are Internet Drafts. The S/MIME community has submitted these to the
IETF. The goal is to form a working group and produce an Internet
standard.

All certificates and private keys are read and stored as PEM encoded
strings. If the server is compiled without SSL support then dummy
versions of smime_sign, smime_verify, pem_certificates_to_array and
get_certificate_info are available so that existing SQL code would not
be broken. Currently the Virtuoso server supports S/MIME signing and
S/MIME signature verification. These are done through the following 2
functions:

<a href="fn_smime_verify.html" class="link" title="smime_verify"><code
class="function">smime_verify()</code></a>

<a href="fn_smime_sign.html" class="link" title="smime_sign"><code
class="function">smime_sign()</code></a>

A useful utility function for S/MIME support is:

<a href="fn_pem_certificates_to_array.html" class="link"
title="pem_certificates_to_array"><code
class="function">pem_certificates_to_array()</code></a>

</div>
