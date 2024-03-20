alias rt report_timing -nos -cros -trans -cap -derate -net
alias rtt rt -to
alias rtf rt -from
alias rh rt -delay_type min
alias rht rh -to
alias rhf rh -from

alias rg report_global_timing

proc cpu { { cores 16} } {
  set_host_options -max_cores $cores -num_processes 16
  report_host_options
}

history keep 9999
