<div>

<div>

<div>

<div>

## 19.8. VSP Guide

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 19.8.1. Introduction

</div>

</div>

</div>

Virtuoso Server Pages are the equivalent of a stored procedure in a Web
page that is compiled when it is first read by the Virtuoso server.
Virtuoso detects when the '.vsp' file is modified and recompiles the
procedure. Since VSP is essentially Virtuoso PL in a Web page you can do
anything that PL can, either directly or from interaction with the user.
VSP gives you the advantage of not having to worry about making
connections to the database. You also avoid the overhead of RPCs because
the HTTP server is built into Virtuoso. When you write a VSP page the
connection is automatic since you are already in Virtuoso.

VSP is server script and is therefore executed in the server as it is
encountered on the page. For this reason client (JavaScript) and server
script cannot directly interact but can supplement each other. You can
call JavaScript inside a VSP loop, for example, to manipulate something
that already exists on the page but you cannot pass variables by
reference from VSP directly to JavaScript or vice versa.

Page flow control can be managed using FORMs. The state of the page is
defined in form fields such as INPUT boxes and TEXTAREA boxes and then
passed to the next form or page using POST.

</div>

</div>
