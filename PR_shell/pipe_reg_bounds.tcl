##
remove_bounds critical_io_*

set i 0
foreach_in_collection p $output_ports {
  create_bound -name critical_io_$i -dimensions 100 -diamond $p [all_fanin -to $p -flat -startpoint_only -only_cells]
  incr i
}
