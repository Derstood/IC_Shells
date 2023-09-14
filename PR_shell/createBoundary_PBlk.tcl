proc createBoundary_PBlk { space } {
    set prefix "Derstood"
    if {[ llength [get_placement_blockages ${prefix)_* -quiet ] ]} {
        remove_placement_blockages ${prefix}_*
    }
    
    set boundary [get_attribute [get_core_area] boundary]
    
    set p_sum [llength $boundary]

    set p_pre [lindex $boundary [expr $p_sum -1 ]]
    set p_pre_x [lindex $p_pre 0 ]
    set p_pre_y [lindex $p_pre 1 ]
    set i 0
    while { $i < $p_sum } {
        set p_x [lindex $boundary $i 0]
        set p_y [lindex $boundary $i 1]
        if {$p_x == $p_pre_x } {
            set box1_x [expr $p_x - $space ]
            set box1_y $p_y
            set box2_x [expr $p_pre_x + $space]
            set box2_y $p_pre_y
        } else {
            set box1_x $p_x
            set box1_y [expr $p_y - $space]
            set box2_x $p_pre_x
            set box2_y [expr $p_pre_y + $space]
        }
        create_placement_blockage -boundary [list [list $box1_x $box1_y] [list $box2_x $box2_y]] -name ${prefix}_$i
        set p_pre_x $p_x
        set p_pre_y $p_y
        incr i
    }
}
