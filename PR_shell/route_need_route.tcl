	1. 把VSS net 的属性physical_status == locked
	2. 把目标net需要固定的shape 的physical_status==locked
	3. 设定目标net的max_layer
 
route_eco -utilize_dangling_wires 1 -reroute modified_nets_only -nets $aim_nets
