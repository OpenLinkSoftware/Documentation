<div id="udttypeinstances" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.5. Type Instances

</div>

</div>

</div>

Every user defined type can have zero or more instances. Every instance
knows it's type. The instances are SQL values. They are copyable.
Instances for SQL types contain placeholders for the type's members.
Instances for non-SQL types contain a reference to the real instance in
type's hosted environment. (Java VM for JAVA and the CLR virtual machine
for CLR). So copying an instance is different for SQL and non-SQL types.
When a SQL type's instance is copied a new set of members placeholders
is created and all members values are copied. This way the copy does not
hold any link to it's original and they can be considered as two
different instances. This means that changing members' value in the copy
will not affect the original.

The non-SQL types instances hold only a reference to the real instance.
So copying such an instance is equivalent of making another reference to
the foreign object. Thus changing the member's value in the copy WILL
affect the original. Usually the foreign virtual machines have a means
of explicitly copying an instance, but they are not used by the Virtuoso
server when copying the SQL values.

As with the other SQL values, an instance gets destroyed when it is no
longer referenced.

</div>
