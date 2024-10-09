<div>

<div>

<div>

<div>

### 16.5.6. Describing Source Relational Tables

</div>

</div>

</div>

Quad map patterns of an application usually share a common set of source
tables and quad map values of one pattern usually share either a single
table or very small number of joined tables. Join and filtering
conditions are also usually repeated in different patterns. It is not
necessary to type table descriptions multiple times, they are declare
once in the beginning of storage declaration statement and shared
between all quad map declarations inside the statement. Names of aliases
can be used instead of table names in quad map values.

``` programlisting
FROM DB.DBA.SYS_USERS as user WHERE (^{user.}^.U_IS_ROLE = 0)
FROM DB.DBA.SYS_USERS as group WHERE (^{group.}^.U_IS_ROLE = 1)
FROM DB.DBA.SYS_USERS as account
FROM user as active_user
  WHERE (^{active_user.}^.U_ACCOUNT_DISABLED = 0)
FROM DB.DBA.SYS_ROLE_GRANTS as grant
  WHERE (^{grant.}^.GI_SUPER = ^{account.}^.U_ID)
  WHERE (^{grant.}^.GI_SUB = ^{group.}^.U_ID)
  WHERE (^{grant.}^.GI_SUPER = ^{user.}^.U_ID)
```

This declares five distinct aliases for two distinct tables, and six
filtering conditions. Every condition is an SQL expression with
placeholders where a reference to the table should be printed. The
SPARQL compiler will not try to parse texts of these expressions (except
dummy search for placeholders), so any logical expressions are
acceptable. When a quad map pattern declaration refers to some aliases,
the <span class="emphasis">*WHERE*</span> clause of the generated SQL
code will contain a conjunction of all distinct texts of "relevant"
conditions. A condition is relevant if every alias inside the condition
is used in some quad map value of the map pattern, either directly or
via clause like <span class="emphasis">*from user as active_user*</span>
. (<span class="emphasis">*user*</span> is a
"<span class="emphasis">*base alias*</span> " for
<span class="emphasis">*active_user*</span> ).

Consider a group of four declarations.

``` programlisting
graph <http://myhost/sys>
  {
    oplsioc:user_iri (active_user.U_ID)
        a oplsioc:active-user .
    oplsioc:membership_iri (grant.GI_SUPER, grant.GI_SUB).
        oplsioc:is_direct
            grant.GI_DIRECT ;
        oplsioc:member-e-mail
            active_user.U_E_MAIL
               where (^{active_user.}^.U_E_MAIL like 'mailto:%').
    ldap:account-ref (account.U_NAME)
        ldap:belongs-to
            ldap:account-ref (group.U_NAME) option (using grant).
  }
```

The first declaration will extend
<span class="emphasis">*\<http://myhost/sys\>*</span> graph with one
imaginary triples <span class="emphasis">*{ user a oplsioc:active-user
}*</span> for every account record that is not a role and not disabled.
The second declaration deals with membership records. A membership is a
pair of a grantee ("super") and a granted role ("sub") stored as a row
in <span class="emphasis">*DB.DBA.SYS_ROLE_GRANTS*</span> ).

The second declaration states that every membership has
<span class="emphasis">*oplsioc:is_direct*</span> property with value
from <span class="emphasis">*GI_DIRECT*</span> column of that table
(roles may be granted to other roles and users, so permissions are
"direct" or "recursive").

The third declaration declares
<span class="emphasis">*oplsioc:member-e-mail*</span> property of
memberships. The value is a literal string from
<span class="emphasis">*DB.DBA.SYS_USERS.U_E_MAIL*</span> , if the
grantee is active (not disabled) and is not a role and its e-mail
address starts with <span class="emphasis">*'mailto:'*</span> . The join
between <span class="emphasis">*DB.DBA.SYS_ROLE_GRANTS*</span> and
<span class="emphasis">*DB.DBA.SYS_USERS*</span> is made by equality
<span class="emphasis">*(GI_SUPER = U_ID)*</span> because the alias
<span class="emphasis">*active_user*</span> in the declaration
"inherits" all conditions specified for
<span class="emphasis">*user*</span> . In addition, the SPARQL compiler
will add one more condition to check if the
<span class="emphasis">*U_E_MAIL*</span> is not null because the NULL
value is not a valid object and it knows that
<span class="emphasis">*U_E_MAIL*</span> is not declared as
<span class="emphasis">*NOT NULL*</span> .

The last declaration contains an <span class="emphasis">*option*</span>
clause. As usual, this indicates that the basic functionality is good
for many tasks but not for all. In this declaration, the
<span class="emphasis">*ldap:belongs-to*</span> property establishes a
relation between grantee (subject) and a granted role (object). Both
subject and object IRIs are based on account name,
<span class="emphasis">*DB.DBA.SYS_USERS.U_NAME*</span> , so the quad
map pattern contains two references to different aliases of
<span class="emphasis">*DB.DBA.SYS_USERS*</span> but no alias for
<span class="emphasis">*DB.DBA.SYS_ROLE_GRANTS*</span> . Hence the
declaration could produce a triple for every row of the Cartesian
product of the <span class="emphasis">*DB.DBA.SYS_USERS*</span> . To fix
the problem, <span class="emphasis">*option (using alias-name)*</span>
tells the compiler to process the alias-name as if it's used in some
quad map value of the pattern.

It is an error to use an alias only in
<span class="emphasis">*where*</span> clause of the quad map pattern but
neither in values or in <span class="emphasis">*option (using
alias-name)*</span> . To detect more typos, an alias used in quad map
values can not appear in <span class="emphasis">*option (using
alias-name)*</span> clause.

</div>
