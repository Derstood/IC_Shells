set_qor_strategy -stage pnr -metric "leakage" -mode "balanced"


set_attribute [get_lib_cells -q *UL] threshold_voltage_group ULVT -q
set_attribute [get_lib_cells -q *L -filter "name !~ *UL"] threshold_voltage_group LVT -q
set_attribute [get_lib_cells -q *R] threshold_voltage_group RVT -q

set_threshold_voltage_group_type -type low_vt {ULVT}
set_threshold_voltage_group_type -type normal_vt {LVT}
set_threshold_voltage_group_type -type high_vt {RVT}


## must set this
set_multi_vth_constraint -cost area -low_vt_percentage 10
