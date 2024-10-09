<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.get_partner_links — Returns a list of partner links used in
the BPEL script

</div>

<div>

## Synopsis

<div>

|                                          |                       |
|------------------------------------------|-----------------------|
| ` `**`BPEL.BPEL.get_partner_links`**` (` | in `scp_id ` int `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### scp_id

<span class="type">int </span> the ID of BPEL script

</div>

</div>

<div>

## Return Types

returns an XML document containing partner links

</div>

<div>

## Description

`BPEL.BPEL.get_partner_links ` The function is used for partner link
names retrieval. It returns an XML document containing all partner
links.

</div>

<div>

## Examples

<div>

**Example 24.640. Simple example**

<div>

``` screen
      SQL> select BPEL.BPEL.get_partner_links (4);
      callret
      VARCHAR
      _______________________________________________________________________________

      <n0:partnerLinks xmlns:n0="http://schemas.xmlsoap.org/ws/2003/03/business-process/">
          <n0:partnerLink name="client" partnerLinkType="tns:LoanFlow" partnerRole="LoanFlowRequester" myRole="LoanFlowProvider"/>

          <n0:partnerLink name="creditRatingService" partnerLinkType="services:CreditRatingService" partnerRole="CreditRatingServiceProvider"/>

          <n0:partnerLink name="UnitedLoanService" partnerLinkType="services:LoanService" myRole="LoanServiceRequester" partnerRole="LoanServiceProvider" />

          <n0:partnerLink name="StarLoanService" partnerLinkType="services:LoanService" myRole="LoanServiceRequester" partnerRole="LoanServiceProvider"/>
      </n0:partnerLinks>

      1 Rows. -- 88 msec.

      
```

</div>

</div>

  

</div>

</div>
