change_selection
foreach_in_collection mmm [get_shapes -filter "layer_name =~ D6 && shape_use != ring"] {
  set all_pins [get_pins -intersect $mmm -filter "layer_name =~ *D5* && name !~ *VSS* && name !~ *VDD*" -quiet]
  change_selection -add $all_pins
}
