<div id="mt_ssloverview" class="section">

<div class="titlepage">

<div>

<div>

## 9.1. Overview

</div>

</div>

</div>

As of version 5.2, OpenLink UDA now comes with optional support for
using
<a href="http://www.openssl.org" class="ulink" target="_top">OpenSSL</a>
to encrypt the data layer between generic client and request broker /
agent.

Features of the SSL implementation:

|                                                                                                                               |
|-------------------------------------------------------------------------------------------------------------------------------|
| secures connections to both the broker and all database agents                                                                |
| encryption is optional, although it can be made mandatory                                                                     |
| the same connection endpoint endpoint (port) handles both encrypted and non-encrypted clients                                 |
| fully backward-compatible                                                                                                     |
| per-agent certificates                                                                                                        |
| all changes are in the OpenLink communications layer: there is no need to change any of the database agents to cater for SSL. |

</div>
