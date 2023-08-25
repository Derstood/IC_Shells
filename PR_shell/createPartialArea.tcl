# createPartialArea {{0 0} {100 100}} 40 5 5
# createPartialArea {{0 0} {100 100}}
proc createPartialArea {bbox {percent 40} {x_inc 5} {y_inc 5}} {
    set glx [lindex $bbox 0 0]
    set gly [lindex $bbox 0 1]
    set ghx [lindex $bbox 1 0]
    set ghy [lindex $bbox 1 1]

    set gwidth [expr $ghx - $glx]
    set gheight [expr $ghy - $gly]
    if {$x_inc > $gwidth} {
        set x_inc $gwidth
    }
    if {$y_inc > $gheight} {
        set y_inc $gheight
    }

    set pb_lx $glx
    set pb_ly $gly
    set pb_hx [expr $pb_lx + $x_inc]
    set pb_hy [expr $pb_ly + $y_inc]

    while { $pb_hy < $ghy } {
        while { $pb_hx < $ghx } {
            set loc [list [list [list $pb_lx $pb_ly] [list $pb_hx $pb_hy]]]
            create_placement_blockage -type partial -blocked_percentage $percent -boundary $loc
            set pb_lx $pb_hx
            set ph_hx [expr $pb_hx + $x_inc]
        }
        set pb_lx $glx
        set pb_ly $pb_hy
        set ph_hx [expr $pb_lx + $x_inc]
        set ph_hy [expr $pb_hy + $y_inc]
    }
}
