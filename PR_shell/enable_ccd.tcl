set_app_options -name ccd.skip_path_groups -value {in2reg reg2out}
set_app_options -name {{{clock_opt}}}.flow.enable_ccd -value true
set_app_options -name ccd.post_route_buffer_removal -value true
set_app_options -name ccd.max_postpone -value 150
set_app_options -name ccd.max_prepone -value 150
