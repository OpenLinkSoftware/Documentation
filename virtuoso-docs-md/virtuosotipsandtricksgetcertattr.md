<div>

<div>

<div>

<div>

### 1.5.20. How Can I Get certificate attributes using SPARQL?

</div>

</div>

</div>

The SPARQL query should use the <span class="emphasis">*cert:hex*</span>
and <span class="emphasis">*cert:decimal*</span> in order to get to the
values, so for ex:

``` programlisting
PREFIX cert: <http://www.w3.org/ns/auth/cert#>
PREFIX rsa: <http://www.w3.org/ns/auth/rsa#>

SELECT ?webid
FROM <http://webid.myxwiki.org/xwiki/bin/view/XWiki/homepw4>
WHERE
  {
    [] cert:identity ?webid ;
             rsa:modulus ?m ;
     rsa:public_exponent ?e .
     ?m cert:hex "b520f38479f5803a7ab33233155eeef8ad4e1f575b603f7780f3f60ceab1\n34618fbe117539109c015c5f959b497e67c1a3b2c96e5f098bb0bf2a6597\n779d26f55fe8d320de7af0562fd2cd067dbc9d775b22fc06e63422717d00\na6801dedafd7b54a93c3f4e59538475673972e524f4ec2a3667d0e1ac856\nd532e32bf30cef8c1adc41718920568fbe9f793daeeaeeaa7e8367b7228a\n895a6cf94545a6f6286693277a1bc7750425ce6c35d570e89453117b88ce\n24206afd216a705ad08b7c59\n"^^xsd:string .
     ?e cert:decimal "65537"^^xsd:string
  }
```

</div>
