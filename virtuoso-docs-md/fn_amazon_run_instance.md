<div>

<div>

</div>

<div>

## Name

DB.DBA.AMAZON_RUN_INSTANCE — Runs new AMI instance of image.

</div>

<div>

## Synopsis

<div>

|                                         |                                              |
|-----------------------------------------|----------------------------------------------|
| ` `**`DB.DBA.AMAZON_RUN_INSTANCE`**` (` | in `aws_access_key ` varchar ,               |
|                                         | in `image_id ` varchar ,                     |
|                                         | in `secret_key ` varchar ,                   |
|                                         | in `key_name ` varchar ,                     |
|                                         | in `MinCount ` integer (default 1) ,         |
|                                         | in `MaxCount ` integer (default 1) ,         |
|                                         | in `http_proxy ` varchar (default null) `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Runs new AMI instance of image.

</div>

<div>

## Parameters

<div>

### aws_access_key

Amazon Access Key ID.

</div>

<div>

### image_id

The Image ID of the AMI.

</div>

<div>

### secret_key

AWS Security Token.

</div>

<div>

### key_name

Name of public key to use (can be used for Linux images). Can be empty
or null.

</div>

<div>

### MinCount

The minimum number of instances to launch. If the value is more than
Amazon EC2 can launch, no instances are launched at all. Default is 1.

</div>

<div>

### MaxCount

The maximum number of instances to launch. If the value is more than
Amazon EC2 can launch, the largest possible number above MinCount will
be launched instead. Default is 1.

</div>

<div>

### http_proxy

Proxy server, can be null or empty.

</div>

</div>

<div>

## Examples

<div>

**Example 24.230. Simple Use**

<div>

``` programlisting
create procedure simple_test()
{
  declare access_key, sec_token, key_name, p_name varchar;

  access_key := 'AKIAJI7ZL427TI5EDF5A'; -- amazon manager site access key
  sec_token  := 'CGI/UMaXf2LRUctaj/HGJ57UNy/t7fNCshh8wpJg'; -- amazon manager site secret token
  key_name   := 'my_key';
  p_name     := 'my_instance_of_linux';

  DB.DBA.AMAZON_RUN_INSTANCE (access_key, p_name, sec_token, key_name);

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

<a href="fn_amazon_import_key_pair.html" class="link"
title="DB.DBA.AMAZON_IMPORT_KEY_PAIR"><code
class="function">DB.DBA.AMAZON_IMPORT_KEY_PAIR </code></a>

<a
href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-RunInstances.html"
class="ulink" target="_top">ApiReference--RunInstances</a>

</div>

</div>
