<div id="voauth" class="section">

<div class="titlepage">

<div>

<div>

## 17.4. OAuth Support

</div>

</div>

</div>

The OAuth protocol enables websites or applications (Consumers) to
access Protected Resources from Web services (Service Providers) via an
API, without requiring Users to disclose their Service Provider
credentials to those Consumers. More generally, OAuth creates a
freely-implementable and generic methodology for API-oriented
authentication.

For Consumer developers, OAuth is a method to publish and interact with
protected data.

For Service Provider developers, OAuth gives users access to their data
while protecting their account credentials.

One use case would be allowing a printing service, printer.example.com
(the Consumer), to access private photos stored on photos.example.net
(the Service Provider), without requiring Users to reveal their
photos.example.net credentials to printer.example.com.

OAuth allows the user to selectively grant access to their private
resources housed on one site (called the Service Provider), to another
site (called the Consumer). In other words, OAuth enables you to grant
access to some of your information without sharing all of your identity.

OAuth does not require a specific user interface or interaction pattern,
nor does it specify how Service Providers authenticate Users, making the
protocol ideally suited for cases where authentication credentials are
unavailable to the Consumer, such as with OpenID.

OAuth aims to unify the experience and implementation of delegated web
service authentication with a single, community-driven protocol. OAuth
builds on existing protocols and best practices that have been
independently implemented by various websites. An open standard,
supported by large and small providers alike, promotes a consistent and
trusted experience for both application developers and the users of
those applications.

What is publicly known as "OAuth" is really the "OAuth Core 1.0"
specification. The "Core" designation is used to stress that this is the
skeleton upon which other extensions and protocols may be built. OAuth
Core 1.0 does NOT by itself provide many desired features such as
automated discovery of endpoints, language support, support for XML-RPC
and SOAP, standard definition of resource access, OpenID integration, a
full range of signing algorithms, or any number of other great ideas
posted to the OAuth group.

This was intentional and is viewed by the authors as a benefit. As the
name implies, Core deals only with the most fundamental aspects of the
protocol:

<div class="itemizedlist">

- Establish a mechanism for exchanging a username and password for a
  token with defined rights

- Provide tools to protect these tokens

</div>

More details can be found
<a href="http://oauth.net/documentation/getting-started" class="ulink"
target="_top">here</a> .

<div id="voauthtokens" class="section">

<div class="titlepage">

<div>

<div>

### 17.4.1. OAuth Access Tokens

</div>

</div>

</div>

Credentials bearing tokens enable a user to provide their credentials in
tokenized form in cases where HTTP redirection to a browser plus human
interaction is unavailable or unsuitable. For example, intermediary
intelligent agents, mobile phones, or set-top devices.

<div id="voauthtokensreqauth" class="section">

<div class="titlepage">

<div>

<div>

#### Request Authentication

</div>

</div>

</div>

To request an Access Token in this model, the Consumer makes an HTTP
request to the Service Provider's Access Token URL. The authentication
request contains \[nine\] parameters contained in the HTTP Authorization
header or as URL parameters. Parameter names and values must be
"percent-encoded" to handle characters in different character sets. The
request should be performed using TLS, and should use HTTP POST.

</div>

<div id="voauthtokensrecauth" class="section">

<div class="titlepage">

<div>

<div>

#### Receive Authentication

</div>

</div>

</div>

Before granting an access token, the Service Provider must ensure that
the request signature has been successfully verified as per OAuth, that
a request with the supplied timestamp and nonce has never been received
before, and that the supplied username and password match a User's
credentials. If successful, the Service Provider generates an Access
Token and Token Secret using a 200 Ok response and returns them in the
HTTP response body.

</div>

<div id="voauthtokensacpr" class="section">

<div class="titlepage">

<div>

<div>

#### Access Protected Resources

</div>

</div>

</div>

After successfully receiving the Access Token and Token Secret, the
Consumer is able to access the Protected Resources on behalf of the User
as per section 7 of the OAuth core specification. In other words, the
Access Token obtained here is no different in capability to the Access
Token specified by OAuth. Once authenticated using the above process,
the Consumer will sign all subsequent requests for the User's Protected
Resources using the returned Token Secret.

</div>

</div>

</div>
