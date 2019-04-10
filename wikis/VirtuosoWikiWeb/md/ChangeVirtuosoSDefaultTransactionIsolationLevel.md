::: {.topic-text}
\

[]{#Changing the Default Transaction Isolation Level for a Virtuoso Server Instance} Changing the Default Transaction Isolation Level for a Virtuoso Server Instance
====================================================================================================================================================================

Note that changing this default may have significant impact on
performance. For most mixed-use deployments, the unset default of
[REPEATABLE READ]{style="font-family: monospace"} should be left
unchanged.

SPARQL does not support transaction isolation adjustments at the session
level, so users focused on RDF interaction may need to adjust this to,
for instance, [READ COMMITTED]{style="font-family: monospace"}.

Transaction isolation may always be changed for individual SQL sessions.

1.  Log in to the machine that hosts your Virtuoso Universal Server.\
2.  Open the relevant [virtuoso.ini]{style="font-family: monospace"}
    file in a text editor.\
3.  Locate the [\[Parameters\]]{style="font-family: monospace"} section
    of the file. For example:\
    \

        [Parameters]
        ServerPort               = 1111
        DisableUnixSocket        = 1
        ;SSLServerPort           = 2111
        ...
        DefaultIsolation         = 4
        ...

    \

4.  Locate the [DefaultIsolation]{style="font-family: monospace"}
    parameter.\
5.  Pass the numeric value for the desired isolation level\

       [Numeric Value](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/VirtuosoWikiWeb/ChangeVirtuosoSDefaultTransactionIsolationLevel?sort=0&col=1)   [Transaction Isolation Level](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/VirtuosoWikiWeb/ChangeVirtuosoSDefaultTransactionIsolationLevel?sort=1&col=2)
      --------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                             unset                                                                                                                                  as if set to 4, `REPEATABLE             READ`
                                                                               1                                                                                                                                                 `READ UNCOMMITTED`
                                                                               2                                                                                                                                                  `READ COMMITTED`
                                                                               4                                                                                                                                                  `REPEATABLE READ`
                                                                               8                                                                                                                                                   `SERIALIZABLE`

    \
    For example:\
    \

        DefaultIsolation = 2   ; READ COMMITTED

    \

6.  Save your changes and exit the file.\
7.  Restart your Virtuoso server.

\
:::
