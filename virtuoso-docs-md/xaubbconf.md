<div id="xaubbconf" class="section">

<div class="titlepage">

<div>

<div>

## 22.2. Configuration

</div>

</div>

</div>

In order to use Virtuoso as resource manager the UBB config file (Tuxedo
main configuration file) must contain reference to VirtTMS. The
following example of UBB config file configures two services and two
virtuoso servers (resource managers) behind them.

``` programlisting
*RESOURCES
IPCKEY          52617
DOMAINID        qsample
MASTER          NODE
MODEL           SHM
#
*MACHINES
#
NODE
        LMID = NODE
        TUXDIR = "TUXEDODIR"
        TUXCONFIG = "SERVDIR/tuxconfig"
        TLOGDEVICE ="SERVDIR/tuxconfig"
        TLOGSIZE=10
        APPDIR = "SERVDIR"
        ULOGPFX = "SERVDIR/ULOG"
*GROUPS

DEFAULT:        TMSNAME=VirtTMS TMSCOUNT=2 LMID=NODE
GROUP1  GRPNO=1 OPENINFO = "Virtuoso:dba:dba@NODE:1111"
GROUP2  GRPNO=2 OPENINFO = "Virtuoso:dba@NODE:1112"

*SERVERS
#
DEFAULT:        CLOPT="-A"
VirtRMtest      SRVGRP=GROUP1 SRVID=1
# VirtRMtest    SRVGRP=GROUP2 SRVID=1

# VirtRMtest2   SRVGRP=GROUP1 SRVID=2
VirtRMtest2     SRVGRP=GROUP2 SRVID=2

#server         SRVGRP=GROUP1 SRVID=1
*SERVICES
DEFAULT:        LOAD=50
VRMTEST         PRIO=50
VRMTEST2        PRIO=50
```

</div>
