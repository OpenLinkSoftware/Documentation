<div>

<div>

<div>

<div>

## 21.4. Omissions, Exceptions from the Definition

</div>

</div>

</div>

Running the benchmark by the book is a complex and costly process which
requires hardware and software that is not commonly available.

To measure tpmC rates that are directly comparable with published
figures the benchmark must comply with the scaling rule of a maximum of
12.5 tpmC per warehouse. Therefore to measure 1250 tpmC, one must have a
database of 100 warehouses, approximately 10 GB.

Obtaining a good figure will require the maximum RAM configuration of
the platform in question.

One will further remember the 180 day rule which states that the disk
configuration quoted in the pricing section must be large enough to
accommodate 180 8 hour days worth of new orders coming in at the
reported rate.

The number of users will also be large, e.g. 1000 users for the 1200
tpmC result, based on 10 terminals per warehouse.

Almost all published results have been obtained with a transaction
monitor, typically Tuxedo.

Note that the driver in this kit initiates a new transaction as soon as
the previous one is completed. The correct behavior is to generate
transactions at a basically constant rate, load being increased by
adding clients and a new warehouse every 10 clients.

<div>

|                            |                                                                                                                            |
|:--------------------------:|:---------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                                  |
|                            | The complete benchmark specification is available at <a href="http://www.tpc.org/" class="ulink" target="_top">the TPC Web 
                              Site</a> .                                                                                                                  |

</div>

</div>
