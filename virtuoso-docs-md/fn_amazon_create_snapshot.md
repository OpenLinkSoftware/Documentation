<div>

<div>

</div>

<div>

## Name

DB.DBA.AMAZON_CREATE_SNAPSHOT — Creates a snapshot of an Amazon EBS
volume and stores it in Amazon S3.

</div>

<div>

## Synopsis

<div>

|                                            |                                                      |
|--------------------------------------------|------------------------------------------------------|
| ` `**`DB.DBA.AMAZON_CREATE_SNAPSHOT`**` (` | in `aws_access_key ` varchar ,                       |
|                                            | in `volumeId ` varchar ,                             |
|                                            | in `secret_key ` varchar ,                           |
|                                            | in `description ` varchar (default 'new+snapshot') , |
|                                            | in `http_proxy ` varchar (default null) `)`;         |

<div>

 

</div>

</div>

</div>

<div>

## Description

Creates a snapshot of an Amazon EBS volume and stores it in Amazon S3.
You can use snapshots for backups, to make copies of instance store
volumes, and to save data before shutting down an instance.

</div>

<div>

## Parameters

<div>

### aws_access_key

Amazon Access Key ID.

</div>

<div>

### volumeId

The ID of the Amazon EBS volume.

</div>

<div>

### secret_key

AWS Security Token.

</div>

<div>

### description

A description for the snapshot.

</div>

<div>

### http_proxy

Proxy server, can be null or empty.

</div>

</div>

<div>

## Examples

<div>

**Example 24.236. Simple Use**

<div>

``` programlisting
create procedure simple_test()
{
  declare access_key, sec_token, vol_id varchar;

  access_key := 'AKIAJI7ZL427TI5EDF5A'; -- amazon manager site access key
  sec_token  := 'CGI/UMaXf2LRUctaj/HGJ57UNy/t7fNCshh8wpJg'; -- amazon manager site secret token
  vol_id     := 'vol-1a2b3c4d';

  DB.DBA.AMAZON_CREATE_SNAPSHOT (access_key, vol_id, sec_token);

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
href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-CreateSnapshot.html"
class="ulink" target="_top">ApiReference--CreateSnapshot</a>

</div>

</div>
