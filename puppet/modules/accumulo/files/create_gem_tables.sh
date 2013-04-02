
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "createtable triplestore_spo"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "createtable triplestore_po"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "createtable triplestore_so"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "createtable triplestore_o"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "createtable entity_index"

$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "createuser gem"

$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_spo Table.READ"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_spo Table.WRITE"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_spo Table.BULK_IMPORT"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_spo Table.ALTER_TABLE"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_spo Table.GRANT"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_spo Table.DROP_TABLE"

$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_so Table.READ"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_so Table.WRITE"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_so Table.BULK_IMPORT"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_so Table.ALTER_TABLE"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_so Table.GRANT"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_so Table.DROP_TABLE"

$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_po Table.READ"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_po Table.WRITE"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_po Table.BULK_IMPORT"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_po Table.ALTER_TABLE"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_po Table.GRANT"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_po Table.DROP_TABLE"

$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_o Table.READ"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_o Table.WRITE"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_o Table.BULK_IMPORT"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_o Table.ALTER_TABLE"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_o Table.GRANT"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t triplestore_o Table.DROP_TABLE"

$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t entity_index Table.READ"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t entity_index Table.WRITE"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t entity_index Table.BULK_IMPORT"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t entity_index Table.ALTER_TABLE"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t entity_index Table.GRANT"
$ACCUMULO_HOME/bin/accumulo shell -u root -p root -e "grant -u gem -t entity_index Table.DROP_TABLE"


$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "config -t triplestore_spo -s table.bloom.enabled=true"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "config -t triplestore_so -s table.bloom.enabled=true"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "config -t triplestore_po -s table.bloom.enabled=true"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "config -t triplestore_o -s table.bloom.enabled=true"

$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "config -t triplestore_spo -s table.cache.block.enable=true"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "config -t triplestore_spo -s table.cache.index.enable=true"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "config -t triplestore_so -s table.cache.block.enable=true"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "config -t triplestore_so -s table.cache.index.enable=true"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "config -t triplestore_po -s table.cache.block.enable=true"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "config -t triplestore_po -s table.cache.index.enable=true"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "config -t triplestore_o -s table.cache.block.enable=true"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "config -t triplestore_o -s table.cache.index.enable=true"
 
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "setiter -majc -n ageoff -class gem.accumulo.iterators.DynamicAgeOffFilter -p 9 -t triplestore_spo"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "setiter -minc -n ageoff -class gem.accumulo.iterators.DynamicAgeOffFilter -p 9 -t triplestore_spo"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "setiter -scan -n ageoff -class gem.accumulo.iterators.DynamicAgeOffFilter -p 9 -t triplestore_spo"

$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "setiter -majc -n ageoff -class gem.accumulo.iterators.DynamicAgeOffFilter -p 9 -t triplestore_po"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "setiter -minc -n ageoff -class gem.accumulo.iterators.DynamicAgeOffFilter -p 9 -t triplestore_po"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "setiter -scan -n ageoff -class gem.accumulo.iterators.DynamicAgeOffFilter -p 9 -t triplestore_po"

$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "setiter -majc -n ageoff -class gem.accumulo.iterators.DynamicAgeOffFilter -p 9 -t triplestore_osp"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "setiter -minc -n ageoff -class gem.accumulo.iterators.DynamicAgeOffFilter -p 9 -t triplestore_osp"
$ACCUMULO_HOME/bin/accumulo shell -u gem -p gem -e "setiter -scan -n ageoff -class gem.accumulo.iterators.DynamicAgeOffFilter -p 9 -t triplestore_osp"

# # Test DynamicAgeOffFilter
# 
# table triplestore_spo
# insert a b c "{AGEOFF=5000}"
# # Verfy one row returns within the 5 second window of the insert
# scan
# # Wait 5 seconds, verify no results are returned
# scan

