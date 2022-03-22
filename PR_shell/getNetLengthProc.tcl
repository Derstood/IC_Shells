proc getNetLength { net } {
set length [ expr [ join dbget [dbget top.nets.name $net -p ].wires.length] + ]]
puts $length
}
