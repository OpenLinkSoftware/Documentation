<div>

<div>

<div>

<div>

### 16.14.3. Changing Rule Sets

</div>

</div>

</div>

Changing a rule set affects queries made after the change. Some queries
may have been previously compiled and will not be changed as a result of
modifying the rule set. When a rule set is changed, i.e. when
<span class="emphasis">*rdfs_rule_set*</span> is called with the first
argument set to a pre-existing rule set's name, all the graphs
associated with this name are read and the relevant facts are added to a
new empty rule set. Thus, if triples are deleted from or added to the
graphs comprising the rule set, calling
<span class="emphasis">*rdfs_rule_set*</span> will refresh the rule set
to correspond to the state of the stored graphs.

</div>
