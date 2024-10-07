<div id="wsrmrcvrapi" class="section">

<div class="titlepage">

<div>

<div>

### 17.7.3. WSRM Receiver API

</div>

</div>

</div>

On the receiver side we have PL wrappers that take as arguments all
\*known\* WS-RM headers. This procedure, when granted to a SOAP endpoint
will process the incoming requests. It will also answer send the
appropriate answers to the sender.

The following is the list of WS-RM receiver wrappers:

<div class="orderedlist">

1.  **WSRMSequence . ** accept and store a Sequence requests. This is
    used to accept Sequence requests from sender and will perform the
    following actions:

    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
    |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | store the message in incoming message log table                                                                                                                                                                                                                                                                                                                                                                                                                                     |
    | process and apply the Policy attachment (if supplied); otherwise apply default rule: AtMostOnce                                                                                                                                                                                                                                                                                                                                                                                     |
    | depending of a addressing headers will reply in synchronous or asynchronous manner. This depends on the value of "From" and "ReplyTo" headers. If these contains non-anonymous URL (see above); an asynchronous Acknowledgment will be sent in a separate TCP connection. Thus in this mode the sender must have defined a listener with WSRMSequenceAcknowledgment exposed to accept such responses. Otherwise synchronous Acknowledgment will be sent in the same TCP connection. |
    | If an error occurred a Fault will be generated                                                                                                                                                                                                                                                                                                                                                                                                                                      |

2.  **WSRMSequenceTerminate . ** accept and process SequenceTerminate
    requests. This is used to accept cancel request; to kill an existing
    message sequence. Further actions on such sequence will be rejected.

3.  **WSRMAckRequested . ** accept and process AckRequested requests.
    This is used to process AckRequested WS-RM messages and will produce
    a SequenceAcknowledgment containing info about messages been
    accepted. Used from sender's side to check the message sequence
    state.

</div>

These PL procedures are built-in to the server, and have to be granted
to the user that is assigned as the SOAP execution account for a given
virtual directory designated as a WS-RM receiver endpoint.

</div>
