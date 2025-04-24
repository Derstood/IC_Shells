set_timing_derate –clock –cell_delay –early $derateValue  [get_lib_cells  *rvt*/* ]
set_timing_derate –clock –cell_delay –late $derateValue  [get_lib_cells  *rvt*/* ]
set_timing_derate –clock –net_delay –early $derateValue  [get_lib_cells  *rvt*/* ]
set_timing_derate –clock –net_delay –late $derateValue  [get_lib_cells  *rvt*/* ]

set_timing_derate –data –cell_delay –early $derateValue  [get_lib_cells  *rvt*/* ]
set_timing_derate –data –cell_delay –late $derateValue  [get_lib_cells  *rvt*/* ]
set_timing_derate –data –net_delay –early $derateValue  [get_lib_cells  *rvt*/* ]
set_timing_derate –data –net_delay –late $derateValue  [get_lib_cells  *rvt*/* ]
