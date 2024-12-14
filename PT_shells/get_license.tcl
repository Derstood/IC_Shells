set try_get_time 0
while { ! [get_license PrimeTime-ADV] && $try_get_time < 40 } {
    puts "get license failed, try after 30s"
    after 30000
    incr try_get_time
}
