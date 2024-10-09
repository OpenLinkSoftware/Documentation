<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.plink_set_option — set value of a partner link option

</div>

<div>

## Synopsis

<div>

|                                         |                        |
|-----------------------------------------|------------------------|
| ` `**`BPEL.BPEL.plink_set_option`**` (` | in `script ` varchar , |
|                                         | in `plink ` varchar ,  |
|                                         | in `opt ` varchar ,    |
|                                         | in `val ` any `)`;     |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### script

<span class="type">varchar </span> name of a process that partner link
belongs to

</div>

<div>

### plink

<span class="type">varchar </span> name of the partner link

</div>

<div>

### opt

<span class="type">varchar </span> name of the options to be set

</div>

<div>

### val

<span class="type">any </span> value of the option to be set

</div>

</div>

<div>

## Return Types

The function has no return value

</div>

<div>

## Description

`BPEL.BPEL.plink_set_option ` This function is used to set an option of
the specified partner link. The options are used to configure
WS-Security, WS-Addressing and WS-Reliable Messaging protocols for
sending and receiving messages to the given partner.

<div>

- <span class="emphasis">*wsa* </span> the version of namespace value
  for WS-Addressing protocol.

- <span class="emphasis">*http-auth-uid* </span> user name for basic
  HTTP authentication

- <span class="emphasis">*http-auth-pwd* </span> password for HTTP
  authentication

- <span class="emphasis">*wss-priv-key* </span> name of the private key
  to be used for signing the requests

- <span class="emphasis">*wss-pub-key* </span> name of the partner's
  public key to be used for encryption of the requests

- <span class="emphasis">*wss-in-encrypt* </span> incoming message XML
  data encryption policy

- <span class="emphasis">*wss-in-signature* </span> incoming messages
  XML signature policy

- <span class="emphasis">*wss-in-signers* </span> list of public key
  names which are trusted (empty list mean all are trusted)

- <span class="emphasis">*wss-out-encrypt-key* </span> type of the
  session key for outgoing message encryption

- <span class="emphasis">*wss-out-signature-type* </span> XML signature
  template type for signing the outgoing messages

- <span class="emphasis">*wss-out-signature-function* </span> in case of
  custom signature this option is a name of the PL function producing
  the template for XML signature

- <span class="emphasis">*wsrm-in-type* </span> WS-Reliable Messaging
  protocol usage for incoming messages

- <span class="emphasis">*wsrm-out-type* </span> WS-Reliable Messaging
  protocol usage for outgoing messages

</div>

</div>

<div>

## Examples

<div>

**Example 24.651. Simple example**

<div>

``` screen
SQL> BPEL.BPEL.plink_set_option  ('WSSecho', 'service', 'wss-in-encrypt', 'Mandatory');

Done. -- 16 msec.
```

</div>

</div>

  

</div>

</div>
