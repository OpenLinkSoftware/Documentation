<div>

<div>

</div>

<div>

## Name

http_listen_host — Starts, stops and retrieves the state of a
user-defined HTTP listener

</div>

<div>

## Synopsis

<div>

|                                      |                                   |
|--------------------------------------|-----------------------------------|
| `integer `**`http_listen_host`**` (` | in `interface_address ` varchar , |
|                                      | in `action ` integer ,            |
|                                      | in `options ` vector `)`;         |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function requires dba privileges.

This function is used to start, stop or lookup the state of user-defined
HTTP and HTTPS listeners. The return value is 0 or 1 and indicates state
of the listener, 1 for started and 0 for stopped.

</div>

<div>

## Parameters

<div>

### interface_address

IP address of interface to be started, stopped or queried for its
current state.

</div>

<div>

### action

Can only take one of the following integer values:

|                 |
|-----------------|
| 0 - start       |
| 1 - stop        |
| 2 - query state |

</div>

<div>

### options

An array of name-value pairs for setting up a HTTPS listeners. This
parameter only used for starting HTTPS listeners, and nothing more. The
available options are:

|                                                         |
|---------------------------------------------------------|
| https_cv - certificate authority file for verification. |
| https_cert - server certificate.                        |
| https_key server private key.                           |
| https_cv_depth - depth of chain for CA verification.    |

The certificate and key are mandatory for HTTPS listeners, but the
others are optional. They are similar to the SSLCertificate,
SSLPrivateKey, X509ClientVerifyCAFile, X509ClientVerifyDepth Virtuoso
INI file settings.

</div>

</div>

<div>

## Return Types

The return type is integer, and will be either 0 or 1 to indicate the
state of the listener, 1 for started and 0 for stopped.

</div>

<div>

## Examples

<div>

**Example 24.167. Starting/stopping and state retrieval of a listener**

<div>

``` screen

  SQL> http_listen_host ('127.0.0.1:7780', 0);
  SQL> select http_listen_host ('127.0.0.1:7780', 2);
  callret
  VARCHAR
  _______________________________________________________________________________

  1

  1 Rows. -- 1 msec.

  SQL> http_listen_host ('127.0.0.1:7780', 1);
  SQL> select http_listen_host ('127.0.0.1:7780', 2);
  callret
  VARCHAR
  _______________________________________________________________________________

  0

  1 Rows. -- 1 msec.
```

</div>

</div>

  

</div>

</div>
