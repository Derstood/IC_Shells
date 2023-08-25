parallel_execute -comands_only {
    write_gds -units 1000 -compress -hierarchy all -long_names -keep_data_type -allow_design_mismatch -merge_files $MERGE_FILES $output.gds.gz
    
    ## verilog for pt
    write_verilog -compress gzip -exclude {scalar_wire_decalarations leaf_module_declarations empty_modules} -hierarchy all $lvs.v.gz
    
    ## verilog for LVS
    write_verilog -compress gzip -exclude {scalar_wire_decalarations leaf_module_declarations pg_object end_cap_cells well_tap_cells filler_cells pad_spacer_cells physical_only_cells cover_cells flip_chip_pad_cells} -hierarchy all $pt.v.gz
    ##
    write_def -compress gzip -version 5.8 -include_tech_via_definitions $output.def.gz
}


