<div id="fn_bpel_get_partner_links" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.get_partner_links — Returns a list of partner links used in
the BPEL script

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_get_partner_links_01" class="funcsynopsis">

|                                          |                       |
|------------------------------------------|-----------------------|
| ` `**`BPEL.BPEL.get_partner_links`**` (` | in `scp_id ` int `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_get_partner_links_01" class="refsect1">

## Parameters

<div id="id129947" class="refsect2">

### scp_id

<span class="type">int </span> the ID of BPEL script

</div>

</div>

<div id="ret_get_partner_links_01" class="refsect1">

## Return Types

returns an XML document containing partner links

</div>

<div id="desc_get_partner_links_01" class="refsect1">

## Description

`BPEL.BPEL.get_partner_links ` The function is used for partner link
names retrieval. It returns an XML document containing all partner
links.

</div>

<div id="examples_get_partner_links_01" class="refsect1">

## Examples

<div id="ex_get_partner_links_01" class="example">

**Example 24.640. Simple example**

<div class="example-contents">

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
