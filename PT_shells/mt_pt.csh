set_host_option -num_processes -max_core
start_host

create_senario -name wcl -image $session
current_session -all
current_senario -all

remote_execute
