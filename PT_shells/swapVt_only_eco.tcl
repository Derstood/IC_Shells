set eco_alternative_area_ratio_threshold 1

define_user_attribute -class lib_cell -type string eco_only_swapVt
set_app_var eco_alternative_cell_attribute_restriction eco_only_swapVt


remote_execute {
    set eco_alternative_area_ratio_threshold 1

    define_user_attribute -class lib_cell -type string eco_only_swapVt
    set_app_var eco_alternative_cell_attribute_restriction eco_only_swapVt
    foreach_in_coll cell [get_lib_cells */*] {
      set base_name [get_attr $cell base_name]
      set full_name [get_attr $cell full_name]
      set attr_name [lindex [split $base_name _ ] 0]
      set_user_attribute -class lib_cell $full_name eco_only_swapVt ${attr_name}_
    }
}