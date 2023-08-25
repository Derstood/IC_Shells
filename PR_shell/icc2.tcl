alias ol open_lib
alias lb list_block
alias ob open_block
alias sb save_block

alias cs change_selection
alias glc get_lib_cells
alias gc get_cells
alias gn get_nets
alias gp get_pins
alias gs get_selection
alias ga get_attribute

alias rt report_timing

set_host_options -max-cores 16 -num_processes 16
report_host_options

history keep 9999

proc ll {args} {
    set ll_i_count 0
    foreach_in_collection cc $args {
        puts [get_object_name $cc]
        incr ll_i_count
    }
    puts "Total: $ll_i_count"
}

proc groupPath {} {
    set all_seq [get_cells -hi -fi is_sequential ]
    set mem [get_cells -hi -fi is_memory_cell]
    set cgate [get_cells -hi -fi is_integrated_clock_gating_cell ]
    set tmp [remove_from_collection $all_seq $mem]
    set reg [remove_from_collection $tmp $cgate]
    set input [get_ports -fi "direction == in"]
    set output [get_ports -fi "direction == out"]

    group_path -name XXX -from A -to B
}
