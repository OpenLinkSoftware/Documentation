<div>

<div>

</div>

<div>

## Name

DB.DBA.AMAZON_IMPORT_KEY_PAIR — Uploads public key to Amazon.

</div>

<div>

## Synopsis

<div>

|                                            |                                              |
|--------------------------------------------|----------------------------------------------|
| ` `**`DB.DBA.AMAZON_IMPORT_KEY_PAIR`**` (` | in `aws_access_key ` varchar ,               |
|                                            | in `key_name ` varchar ,                     |
|                                            | in `public_key_material ` varchar ,          |
|                                            | in `secret_key ` varchar ,                   |
|                                            | in `http_proxy ` varchar (default null) `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Uploads public key to Amazon

</div>

<div>

## Parameters

<div>

### aws_access_key

Amazon Access Key ID.

</div>

<div>

### key_name

New name of key, which will be used on Amazon lists.

</div>

<div>

### public_key_material

base64 encoded public key.

</div>

<div>

### secret_key

AWS Security Token.

</div>

<div>

### http_proxy

Proxy server, can be null or empty.

</div>

</div>

<div>

## Examples

<div>

**Example 24.241. Simple Use**

<div>

``` programlisting
create procedure simple_test()
{
  declare access_key, sec_token, key_name varchar;
  declare pub_key, fingers, fingerPrint any ;

  access_key  := 'AKIAJI7ZL427TI5EDF5A'; -- amazon manager site access key
  ec_token    := 'CGI/UMaXf2LRUctaj/HGJ57UNy/t7fNCshh8wpJg'; -- amazon manager site secret token
  key_name    := 'my_key';
  pub_key     := encode_base64 (cast (xenc_pubkey_DER_export (key_name) as varchar));
  pub_key     := encode_base64(pub_key);
  fingers     := xtree_doc(DB.DBA.AMAZON_IMPORT_KEY_PAIR (access_key, key_name,   pub_key, sec_token));
  fingerPrint := xpath_eval('/ImportKeyPairResponse/keyFingerprint', fingers, 0);

  if (fingerPrint is not null)
    return 1;
  else
    return 0;
}
;
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_amazon_start_instance.html" class="link"
title="DB.DBA.AMAZON_START_INSTANCE"><code
class="function">DB.DBA.AMAZON_START_INSTANCE </code></a>

<a href="fn_amazon_run_instance.html" class="link"
title="DB.DBA.AMAZON_RUN_INSTANCE"><code
class="function">DB.DBA.AMAZON_RUN_INSTANCE </code></a>

<a href="fn_amazon_stop_instance.html" class="link"
title="DB.DBA.AMAZON_STOP_INSTANCE"><code
class="function">DB.DBA.AMAZON_STOP_INSTANCE </code></a>

<a href="fn_amazon_terminate_instance.html" class="link"
title="DB.DBA.AMAZON_TERMINATE_INSTANCE"><code
class="function">DB.DBA.AMAZON_TERMINATE_INSTANCE </code></a>

<a href="fn_amazon_deregister_image.html" class="link"
title="DB.DBA.AMAZON_DEREGISTER_IMAGE"><code
class="function">DB.DBA.AMAZON_DEREGISTER_IMAGE </code></a>

<a href="fn_amazon_create_image.html" class="link"
title="DB.DBA.AMAZON_CREATE_IMAGE"><code
class="function">DB.DBA.AMAZON_CREATE_IMAGE </code></a>

<a href="fn_amazon_create_volume.html" class="link"
title="DB.DBA.AMAZON_CREATE_VOLUME"><code
class="function">DB.DBA.AMAZON_CREATE_VOLUME </code></a>

<a href="fn_amazon_create_snapshot.html" class="link"
title="DB.DBA.AMAZON_CREATE_SNAPSHOT"><code
class="function">DB.DBA.AMAZON_CREATE_SNAPSHOT </code></a>

<a href="fn_amazon_delete_snapshot.html" class="link"
title="DB.DBA.AMAZON_DELETE_SNAPSHOT"><code
class="function">DB.DBA.AMAZON_DELETE_SNAPSHOT </code></a>

<a href="fn_amazon_delete_volume.html" class="link"
title="DB.DBA.AMAZON_DELETE_VOLUME"><code
class="function">DB.DBA.AMAZON_DELETE_VOLUME </code></a>

<a href="fn_amazon_describe_images.html" class="link"
title="DB.DBA.AMAZON_DESCRIBE_IMAGES"><code
class="function">DB.DBA.AMAZON_DESCRIBE_IMAGES </code></a>

<a href="fn_amazon_describe_instances.html" class="link"
title="DB.DBA.AMAZON_DESCRIBE_INSTANCES"><code
class="function">DB.DBA.AMAZON_DESCRIBE_INSTANCES </code></a>

<a
href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-ImportKeyPair.html"
class="ulink" target="_top">ApiReference--ImportKeyPair</a>

</div>

</div>
