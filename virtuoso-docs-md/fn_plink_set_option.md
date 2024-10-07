<div id="fn_plink_set_option" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.plink_set_option — set value of a partner link option

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_plink_set_option_01" class="funcsynopsis">

|                                         |                        |
|-----------------------------------------|------------------------|
| ` `**`BPEL.BPEL.plink_set_option`**` (` | in `script ` varchar , |
|                                         | in `plink ` varchar ,  |
|                                         | in `opt ` varchar ,    |
|                                         | in `val ` any `)`;     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_get_var_05" class="refsect1">

## Parameters

<div id="id130411" class="refsect2">

### script

<span class="type">varchar </span> name of a process that partner link
belongs to

</div>

<div id="id130415" class="refsect2">

### plink

<span class="type">varchar </span> name of the partner link

</div>

<div id="id130419" class="refsect2">

### opt

<span class="type">varchar </span> name of the options to be set

</div>

<div id="id130423" class="refsect2">

### val

<span class="type">any </span> value of the option to be set

</div>

</div>

<div id="ret_plink_set_option_01" class="refsect1">

## Return Types

The function has no return value

</div>

<div id="desc_plink_set_option_01" class="refsect1">

## Description

`BPEL.BPEL.plink_set_option ` This function is used to set an option of
the specified partner link. The options are used to configure
WS-Security, WS-Addressing and WS-Reliable Messaging protocols for
sending and receiving messages to the given partner.

<div class="itemizedlist">

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

<div id="examples_plink_set_option_01" class="refsect1">

## Examples

<div id="ex_plink_set_option_01" class="example">

**Example 24.651. Simple example**

<div class="example-contents">

``` screen
SQL> BPEL.BPEL.plink_set_option  ('WSSecho', 'service', 'wss-in-encrypt', 'Mandatory');

Done. -- 16 msec.
```

</div>

</div>

  

</div>

</div>
