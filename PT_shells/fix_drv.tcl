### example
## fix_drv_Derstood "data_trans.rpt" $is_clock $is_fixLongNet $longNetThreshold
proc fix_drv_Derstood { {rpts ""} {is _clock false} {is_fix_longNet true } {longNetThreshold 390}} {
  set run_date [exec date +%m%d_%H%M]
  set buf_lib "BUFH_X6N_A7P5PP60TL_C8"
  if { $is_clock } {
    set buf_lib "BUF_X6N_A7P5PP60TL_C8_XGCAP6"
  }
  if { $rpts == "" } {
    return
  }
  if { ! [llength $rpts ] } {
    return
  }
  set drv_nets {}
  foreach rpt $rpts {
    set f [open $rpt ]
    zlib push gunzip $f
    set content [read $f]
    foreach line [ split $content \n ] {
      if { [ regexp {^# Net: (.*?) .*} $line match net ]  } {
        append drv_nets $net 
      }
    }
    close $f
  }
  set drv nets sorted [ lsort -u $drv_nets ]
  foreach n $drv_nets_sorted {
    set load_num [ expr [sizeof_collection [get_flat_cells -of [get_nets $n - seg] ] ] - 1 ]
    if { $load_num> 14 } {
      set max_fanout [expr $load_num / 2 + 1 ]
      set fix_cmd "split_fanout -net $n -lib_cells $buf_lib -max_fanout $max_fanout -on_route -cell_prefix manual_fix_drv_${run_date} -net_prefix manual_fix_drv_${run_date} "
    } else {
      set fix_cmd "add_buffer_on_route $n -repeater_distance_length_ratio 0.51 -lib_cells $buf_lib  -cell_prefix manual_fix_drv_${run_date} -net_prefix manual_fix_drv_${run_date} -punch_port"
    }
    puts "Derstood_cmd_fix_drv: $fix_cmd"
    eval $fix_cmd
}
  ### deal Longset
  set longNet_fixed_num 0
  if { $is_fix_longNet } {
    set longNets [get_flat_nets -filter "dr_length > $longNetThreshold"]
    foreach_in_collection n $longNets {
      set netName [get_object_name $n]
      if { [ lsearch $drv_nets $netName ] == -1 } {
        set fix_cmd "add_buffer_on_route $netName -repeater_distance_length_ratio 0.51 -lib_cells $buf_lib  -cell_prefix manual_fix_longNet_${run_date} -net_prefix manual_fix_longNet_${run_date} -punch_port"
        puts "Derstood_cmd_fix_longNet: $fix_cmd"
        eval $fix_cmd
        incr $longNet_fixed_num
      }
    }
  }
  puts "fixed drv net num: [llength $drv_nets_sorted]"
  puts "fixed longNet num: [llength $longNet_fixed_num]"
}
