proc createPBlkMesh {bbox {net_width 0.768} {net_space 15.36}} {
    remove_placement_blockage pBlk_net_*
    set pb_net_horizontal_num 0
    set pb_net_vertical_num 0
    
    set glx [lindex $bbox 0 0]
    set gly [lindex $bbox 0 1]
    set ghx [lindex $bbox 1 0]
    set ghy [lindex $bbox 1 1]
    
    set start_x $glx
    set start_y [expr $glx + $net_width + $net_space]

##### horizontal
    while { $start_y < [expr $ghy - $net_width]} {
        create_placement_blockage -type hard -boundary [list [list $start_x $start_y] [list $ghx [expr $start_y + $net_width]]] -name " pBlk_net_horizontal_${pb_net_horizontal_num}"
        set start_y [expr $start_y + $net_width + $net_space]
        incr pb_net_horizontal_num
    }

  
}

    set start_x [expr $glx + $net_width + $net_space]
    set start_y $gly
##### vertical
    while { $start_x < [expr $ghx - $net_width]} {
        create_placement_blockage -type hard -boundary [list [list $start_x $start_y] [list [expr $start_x _$net_width] $ghy ]] -name " pBlk_net_vertical_${pb_net_vertical_num}"
        set start_x [expr $start_x + $net_width + $net_space]
        incr pb_net_vertical_num
    }

    puts "horizontal: $pb_net_horizontal_num"
    puts "vertical: $pb_net_vertical_num"
  
}
