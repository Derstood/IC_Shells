proc createBoundary_PBlk { space } {
    set bbox [get_attribute [get_core_area] bbox]

    set glx [lindex $bbox 0 0]
    set gly [lindex $bbox 0 1]
    set ghx [lindex $bbox 1 0]
    set ghy [lindex $bbox 1 1]

    create_placement_blockage -boundary [list [list $glx $gly] [list $ghx [expr $gly + $space ]]]
    create_placement_blockage -boundary [list [list $glx $gly] [list [expr $glx + $space ] $ghy]]
    create_placement_blockage -boundary [list [list $glx [expr $ghy - $space]] [list $ghx $ghy ]]
    create_placement_blockage -boundary [list [list [expr $ghx - $space] $gly] [list $ghx $ghy ]]
}
