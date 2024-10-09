<div>

<div>

<div>

<div>

### 22.3.3. Services concept

</div>

</div>

</div>

Each service has an entry point (some function), which is supposed to
perform the application task. The result of whole transaction depends on
result of the service's entry function. The scenario of typical workflow
is as follows:

<div>

- client begins global transaction by ATMI tpbegin() call,

- client calls the service N1 to update some tables on the first
  Virtuoso server (resource manager),

- client calls the service N2 to update some tables on the second
  Virtuoso server (resource manager),

- client finishes global transaction by either tpcommit() or tpabort()
  call of ATMI.

</div>

The tx\_\* functions also could be used, See TUXEDO TxRPC related or
ORACLE XA documentation.

<div>

- tx_begin()

- tx_commit()

- tx_open()

</div>

Services can be built with the following command:

``` programlisting
buildserver -v -f virt_service1.o -o VirtService1 -r Virtuoso -s VService1
```

where "virt_service1.o" is the service object file which contains
VService1 entry function. "-r Virtuoso" indicates that service must be
assembled with Virtuoso XA support library.

</div>
