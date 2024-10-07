<div id="wsrmsndrapi" class="section">

<div class="titlepage">

<div>

<div>

### 17.7.2. WS-RM Sender API

</div>

</div>

</div>

The WS-RM API allows for:

|                                                           |
|-----------------------------------------------------------|
| register/start a conversation                             |
| set parameters on both sides (receiver or sender)         |
| check the acknowledgment                                  |
| retry if needed                                           |
| to finish or cancel the conversation (can be with cancel) |
| check for faults                                          |

The User Defined Types defined in support of WS-RM are as follows:

<div class="itemizedlist">

- <span class="emphasis">*soap_client () parameters wrapper* </span>

  ``` programlisting
  create type soap_client_req as
      (
      url varchar,
      operation varchar,
      target_namespace varchar default null,
      parameters any default null,
      headers any default null,
      soap_action varchar default '',
      attachments any default null,
      ticket any default null,
      passwd varchar default null,
      user_name varchar default null,
      user_password varchar default null,
      auth_type varchar default 'none',
      security_type varchar default 'sign',
      debug integer default 0,
      template varchar default null,
      style integer default 0,
      version integer default 11,
      direction integer default 0
          )
  ;
  ```

  This UDT is used for passing various parameters to the WS-RM client to
  send a SOAP messages along with WS-RM specific headers. The members
  are with same names as for SOAP_CLIENT () function. In other words
  applications must fill a soap_client_req specific data and pass this
  to the wsrm_cli methods (see below).

- <span class="emphasis">*client addressing UDT:* </span> To facilitate
  two-way transport the receiver must know the address of the sender's
  responder (endpoint for asynchronous Acknowledgment or response). To
  pass such addresses to the WS-RM client (wsrm_cli) the following UDT
  is used.

  ``` programlisting
  create type wsa_cli as
      (
      mid varchar default null,
      "to" varchar default null,
      "from" varchar default null,
      action varchar default null,
      fault_to varchar default null,
      reply_to varchar default null
      )
  ```

  Whose members are as follows:

  |                                                                                                                  |
  |------------------------------------------------------------------------------------------------------------------|
  | <span class="emphasis">*mid* </span> - message identifier; unique across space and time                          |
  | <span class="emphasis">*to* </span> - where message traveling to                                                 |
  | <span class="emphasis">*from* </span> - from where it's sent                                                     |
  | <span class="emphasis">*action* </span> - WS-Addressing Action headed element                                    |
  | <span class="emphasis">*fault_to* </span> - where to return the fault                                            |
  | <span class="emphasis">*reply_to* </span> - where to reply; if no such URL given the "to" will be used to reply. |

  <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                              |                                                                                                                                                                                                                                                                       |
  |:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | ![\[Note\]](images/note.png) | Important Note:                                                                                                                                                                                                                                                       |
  |                              | A special "to" equal to '`http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous` ' is used to designate an 'anonymous' sender. Further Acknowledgment can be made as a synchronous reply only. There is no way to return a response in asynchronous manner. |

  </div>

  Constructors:

  ``` programlisting
  constructor method wsa_cli ()
  ```

  Instantiate a new addressing placeholder ; with new message id.

- <span class="emphasis">*WS-RM Client UDT* </span> The following is a
  core UDT for the sender's activity. It is used to establish a message
  sequence context, to set various parameters and to send/check/cancel
  WS-RM encapsulated SOAP messages to the sender.

  ``` programlisting
  create type wsrm_cli as
      (
      url varchar,
      seq varchar,
      msgno int default -1,
      assurance varchar,
      expiry datetime,
      address wsa_cli,
      i_timeout int,
      resend_intl int,
      ack_intl int,
      dirty int default 0,
      is_last int default 0,
      is_finish int default 0
      )
      temporary self as ref
  ```

  Members:

  |                                                                                                                                       |
  |---------------------------------------------------------------------------------------------------------------------------------------|
  | <span class="emphasis">*url* </span> - the recipient's URL                                                                            |
  | <span class="emphasis">*seq* </span> - identifier; unique Id for batch of messages to be sent together                                |
  | <span class="emphasis">*msgno*</span> - unique number/unsigned integer greater than 1, unique identifying a message within a sequence |
  | <span class="emphasis">*assurance*</span> - policy to be applied on receiver side : AtLeastOne; InOrder; AtMostOne                    |
  | <span class="emphasis">*expiry* </span> - message expiration                                                                          |
  | <span class="emphasis">*address* </span> - a UDT of type `wsa_cli ` ; identifying sender and receiver URLs                            |
  | <span class="emphasis">*i_timeout* </span> - inactivity timeout                                                                       |
  | <span class="emphasis">*ack_intl* </span> - Acknowledgment interval                                                                   |
  | <span class="emphasis">*dirty* </span> - (internal use)                                                                               |
  | <span class="emphasis">*is_last* </span> - the current message is a last in sequence                                                  |
  | <span class="emphasis">*is_finish* </span> - transfer is finished; no more messages are pending                                       |

  Constructors:

  ``` programlisting
  constructor method wsrm_cli (addr wsa_cli, url varchar),
  ```

  Instantiate a new WS-RM sender object; new message sequence This will
  generate a new sequence identifier, and will store it into a outgoing
  sequences table. The default policy will be established.

  ``` programlisting
  constructor method wsrm_cli (addr wsa_cli, url varchar, seq varchar),
  ```

  Instantiate a WS-RM sender object from a persisted state; The policy
  and parameters will be read from database and instantiated in WS-RM
  sender's object.

  Methods:

  ``` programlisting
  method create_sequence () returns any,
  ```

  Start a new sequence with current WS-RM sender's object;

  ``` programlisting
  method send_message (req soap_client_req, last int) returns any,
  ```

  Send a message to the recipient; depending on 'last' flag this can be
  designate open or closed message sequence. The 'req' must be fulfilled
  with appropriate parameters (see above).

  ``` programlisting
  method send_message (req soap_client_req) returns any,
  ```

  same as send_message (req soap_client_req, 0)

  ``` programlisting
  method finish (req soap_client_req) returns any,
  ```

  same as send_message (req soap_client_req, 1)

  ``` programlisting
  method check_state () returns any,
  ```

  retrieves a state for a sequence. If sequence is closed and all is
  delivered no remote call will be performed. If an message is in
  pending state a remote call will be issued to check the state of
  message sequence. The return value is an array containing message
  numbers (id's within sequence) and their state: 0 or 1 - send or
  pending

  ``` programlisting
  method cancel () returns any,
  ```

  cancel the sequence; kill it on WS-RM sender site ; say that to
  recipient to do that also.

  ``` programlisting
  method set_parameter (name varchar, val any) returns any,
  ```

  Set a parameter to the current message sequence : like policy; timeout
  etc. The parameters will be sent together with next WS-RM
  conversation. Note: Some of parameters may invalidate previous state
  of message transfer; so in this case the sender will receive a fault
  and application must handle the situation properly.

  Valid 'name's are :

  |                                                                                                       |
  |-------------------------------------------------------------------------------------------------------|
  | <span class="emphasis">*Assurance* </span> - 'AtMostOnce','AtLeastOnce','ExactlyOnce','InOrder'       |
  | <span class="emphasis">*Expiry* </span> - date of expiration                                          |
  | <span class="emphasis">*Timeout* </span> - inactivity timeout in milliseconds                         |
  | <span class="emphasis">*RetryInterval* </span> - retry on every n milliseconds if message is not sent |
  | <span class="emphasis">*AckInterval* </span> - Acknowledgment interval in milliseconds                |

</div>

**Sender's responder (endpoint) . ** To receive an asynchronous
Acknowledgment the sender must have an endpoint to handle them. The
`WSRMSequenceAcknowledgment()` procedure must be exposed at that
endpoint. This accepts and processes asynchronous Acknowledgment. This
is used to accept a SequenceAcknowledgment response from a remote party
so it will process the response and will set the state of messages that
are acknowledged.

</div>
