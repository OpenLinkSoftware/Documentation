<div id="fn_amazon_run_instance" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.AMAZON_RUN_INSTANCE — Runs new AMI instance of image.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_amazon_run_instance" class="funcsynopsis">

|                                         |                                              |
|-----------------------------------------|----------------------------------------------|
| ` `**`DB.DBA.AMAZON_RUN_INSTANCE`**` (` | in `aws_access_key ` varchar ,               |
|                                         | in `image_id ` varchar ,                     |
|                                         | in `secret_key ` varchar ,                   |
|                                         | in `key_name ` varchar ,                     |
|                                         | in `MinCount ` integer (default 1) ,         |
|                                         | in `MaxCount ` integer (default 1) ,         |
|                                         | in `http_proxy ` varchar (default null) `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_amazon_run_instance" class="refsect1">

## Description

Runs new AMI instance of image.

</div>

<div id="params_amazon_run_instance" class="refsect1">

## Parameters

<div id="id97600" class="refsect2">

### aws_access_key

Amazon Access Key ID.

</div>

<div id="id97603" class="refsect2">

### image_id

The Image ID of the AMI.

</div>

<div id="id97606" class="refsect2">

### secret_key

AWS Security Token.

</div>

<div id="id97609" class="refsect2">

### key_name

Name of public key to use (can be used for Linux images). Can be empty
or null.

</div>

<div id="id97612" class="refsect2">

### MinCount

The minimum number of instances to launch. If the value is more than
Amazon EC2 can launch, no instances are launched at all. Default is 1.

</div>

<div id="id97615" class="refsect2">

### MaxCount

The maximum number of instances to launch. If the value is more than
Amazon EC2 can launch, the largest possible number above MinCount will
be launched instead. Default is 1.

</div>

<div id="id97618" class="refsect2">

### http_proxy

Proxy server, can be null or empty.

</div>

</div>

<div id="examples_amazon_run_instance" class="refsect1">

## Examples

<div id="ex_amazon_run_instance" class="example">

**Example 24.230. Simple Use**

<div class="example-contents">

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

<div id="seealso_amazon_run_instance" class="refsect1">

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
