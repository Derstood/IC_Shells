setup analysis_mode esd
import gsr $gsr_file
setup design
perform extraction -power -ground

perform res_calc -from xxx -to xxx
perform res_calc -fromFile xxx -toFile xxx
perform res_calc -net xxx -detail
