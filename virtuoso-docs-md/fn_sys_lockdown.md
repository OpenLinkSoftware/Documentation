<div>

<div>

</div>

<div>

## Name

sys_lockdown — Set virtuoso in lockdown state and back.

</div>

<div>

## Synopsis

<div>

|                           |                                   |
|---------------------------|-----------------------------------|
| ` `**`sys_lockdown`**` (` | in `lock_action ` integer ,       |
|                           | in `listeners_mode ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

You must have DBA privileges to run that function.

Calling this with lock_mode = 1 causes the server not to accept any new
client connections, except ones coming from localhost (127.0.0.1). This
will also shut down any other listeners and terminate any possibly
pending processing, rolling back all open transactions and disconnecting
all clients, except ones from localhost. Calling thi with lock_mode 0
reverses the effect.

</div>

<div>

## Parameters

<div>

### lock_action

(0\|1) - 0 = unlock the server; 1 = lock the server

</div>

<div>

### listeners

(0\|1 default 0) - 0 = don't serve the listener sockets; 1 = close the
listener sockets

</div>

</div>

<div>

## Return Types

Lock mode (lock_action = 1) if already in that mode returns 0 otherwise
returns 1

Unlock mode (lock_action = 0) if already in that mode returns 0
otherwise returns 2

</div>

</div>
