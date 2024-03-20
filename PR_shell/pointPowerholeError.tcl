proc pointPowerHoleError {rptDir ""} {
  if { $rptDir == "" } {
    return
  }
  set rpt_list [glob -directory $rptDir -tails *missingvia.rpt ]
  remove_drc_error_data my_missVia -force
  set ded [create_drc_error_data -name my_missVia -checker_name Derstood ]
  set det [create_drc_error_type -name missVia -error_data $ded -error_class size ]
  foreach rpt $rpt_list {
    set rptPath [file join $rptDir $rpt]
    set rptContent [open $rptPath -r]
    while { [ gets $rptContent line ] != -1 } {
      set column [split $line]
      set bbox {{[lindex $column 3] [lindex $column 4]} {[lindex $column 3] [lindex $column 4]}}
      set create_cmd "create_drc_error -error_data \$ded -error_type \$det -point $bbox -layer [lindex $column 2] "
    }
  }
}
