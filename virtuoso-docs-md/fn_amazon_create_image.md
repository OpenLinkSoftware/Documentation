<div>

<div>

</div>

<div>

## Name

DB.DBA.AMAZON_CREATE_IMAGE — Creates an Amazon EBS-backed AMI from an
Amazon EBS-backed instance that is either running or stopped.

</div>

<div>

## Synopsis

<div>

|                                         |                                              |
|-----------------------------------------|----------------------------------------------|
| ` `**`DB.DBA.AMAZON_CREATE_IMAGE`**` (` | in `aws_access_key ` varchar ,               |
|                                         | in `instance_id ` varchar ,                  |
|                                         | in `image_name ` varchar ,                   |
|                                         | in `secret_key ` varchar ,                   |
|                                         | in `http_proxy ` varchar (default null) `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Creates an Amazon EBS-backed AMI from an Amazon EBS-backed instance that
is either running or stopped.

</div>

<div>

## Parameters

<div>

### aws_access_key

Amazon Access Key ID.

</div>

<div>

### instance_id

Image instance ID (check Amazon list of instances).

</div>

<div>

### image_name

New image ID (check Amazon list of images).

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

**Example 24.235. Simple Use**

<div>

``` programlisting
create procedure simple_test()
{
  declare access_key, sec_token, p_name, image_id varchar;

  access_key := 'AKIAJI7ZL427TI5EDF5A'; -- amazon manager site access key
  sec_token  := 'CGI/UMaXf2LRUctaj/HGJ57UNy/t7fNCshh8wpJg'; -- amazon manager site secret token
  image_id   := 'my_new_image';
  p_name     := 'my_instance_of_linux';

  DB.DBA.AMAZON_CREATE_IMAGE (access_key, p_name, image_id, sec_token);

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

<a href="fn_amazon_create_snapshot.html" class="link"
title="DB.DBA.AMAZON_CREATE_SNAPSHOT"><code
class="function">DB.DBA.AMAZON_CREATE_SNAPSHOT </code></a>

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
href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-CreateImage.html"
class="ulink" target="_top">ApiReference--CreateImage</a>

</div>

</div>
