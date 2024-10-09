<div>

<div>

<div>

<div>

### 2.14.4. Cluster Configuration

</div>

</div>

</div>

<div>

1.  Set "FAST_START=1" in the viruoso-start.sh file and then run:

    ``` programlisting
    viruoso-start.sh
    ```

    or

2.  Execute the following line:

    ``` programlisting
    # /etc/init.d/virtuoso start
    Starting OpenLink Virtuoso:                                [  OK  ]
    ```

3.  In order to check the nodes, connect to port 12201 using the ISQL
    tool:

    ``` programlisting
    isql 12201
    ```

4.  To check the cluster status, execute the following command:

    ``` programlisting
    SQL> status('cluster');
    REPORT
    VARCHAR
    _______________________________________________________________________________

    Cluster 4 nodes, 293 s. 0 m/s 0 KB/s  0% cpu 0%  read 0% clw threads 1r 0w 0i buffers 1781 0 d 0 w 0 pfs

    1 Rows. -- 4 msec.
    ```

</div>

</div>
