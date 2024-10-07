<div id="fn_amazon_create_volume" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.AMAZON_CREATE_VOLUME — Creates an Amazon EBS volume that can be
attached to any Amazon EC2 instance in the same Availability Zone.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_amazon_create_volume" class="funcsynopsis">

|                                          |                                              |
|------------------------------------------|----------------------------------------------|
| ` `**`DB.DBA.AMAZON_CREATE_VOLUME`**` (` | in `aws_access_key ` varchar ,               |
|                                          | in `availabilityZone ` varchar ,             |
|                                          | in `secret_key ` varchar ,                   |
|                                          | in `snapshotId ` varchar (default '') ,      |
|                                          | in `volume_size ` integer (default 1) ,      |
|                                          | in `http_proxy ` varchar (default null) `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_amazon_create_volume" class="refsect1">

## Description

Creates an Amazon EBS volume that can be attached to any Amazon EC2
instance in the same Availability Zone. Any AWS Marketplace product
codes from the snapshot are propagated to the volume.

</div>

<div id="params_amazon_create_volume" class="refsect1">

## Parameters

<div id="id97860" class="refsect2">

### aws_access_key

Amazon Access Key ID.

</div>

<div id="id97863" class="refsect2">

### availabilityZone

The Availability Zone for the new volume.

</div>

<div id="id97866" class="refsect2">

### secret_key

AWS Security Token.

</div>

<div id="id97869" class="refsect2">

### snapshotId

The snapshot from which to create the new volume.

</div>

<div id="id97872" class="refsect2">

### volume_size

The size of the volume, in GiBs.

</div>

<div id="id97875" class="refsect2">

### http_proxy

Proxy server, can be null or empty.

</div>

</div>

<div id="examples_amazon_create_volume" class="refsect1">

## Examples

<div id="ex_amazon_create_volume" class="example">

**Example 24.233. Simple Use**

<div class="example-contents">

``` programlisting
create procedure simple_test()
{
  declare access_key, sec_token, zone varchar;

  access_key := 'AKIAJI7ZL427TI5EDF5A'; -- amazon manager site access key
  sec_token  := 'CGI/UMaXf2LRUctaj/HGJ57UNy/t7fNCshh8wpJg'; -- amazon manager site secret token
  zone       := 'us-east-1a';

  DB.DBA.AMAZON_CREATE_VOLUME (access_key, zone, sec_token);

}
;
```

</div>

</div>

  

</div>

<div id="seealso_amazon_create_volume" class="refsect1">

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

<a href="fn_amazon_create_snapshot.html" class="link"
title="DB.DBA.AMAZON_CREATE_SNAPSHOT"><code
class="function">DB.DBA.AMAZON_CREATE_SNAPSHOT </code></a>

<a href="fn_amazon_create_image.html" class="link"
title="DB.DBA.AMAZON_CREATE_IMAGE"><code
class="function">DB.DBA.AMAZON_CREATE_IMAGE </code></a>

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

<a href="fn_amazon_import_key_pair.html" class="link"
title="DB.DBA.AMAZON_IMPORT_KEY_PAIR"><code
class="function">DB.DBA.AMAZON_IMPORT_KEY_PAIR </code></a>

<a
href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-CreateVolume.html"
class="ulink" target="_top">ApiReference--CreateVolume</a>

</div>

</div>
