BEGIN{
	aimName=ENVIRON["aimName"]
	idNum=0
	sum=0
	if (aimName == ""){
		print "ERROR: no aim-name"
		exit
	}
}
{
	if ($0 == "\*NAME_MAP" || $0 == "\*PORTS") {
		pos = $0
	} else if ($0 ~ /^\*[0-9]+ \w+$/) {
		if ($2 == aimName && pos == "\*NAME_MAP"){
			numList[$1]=1
			idNum++
		} else if ( $1 in numList && pos == "\*PORTS") {
			delete numList[$1]
			idNum--
		}
	} else if (idNum == 1 && $0 ~ /^\*D_NET \*[0-9]+ \S+$/){
		for (i in numList){
			if (i == $2){
				pos = "NET"
			}
		}
	} else if ( $0 == "\*CAP" && pos == "NET" ){
		pos = "found"
	} else if (pos == "found" && $0 ~ /^[0-9]+ .*/) {
		sum+=$NF
	} else if (pos == "found" && NF==0 ) {
		pos = "finish"
		print "finish compute"
		exit
	}
}
END {
	if (idNum == 0) {
		print "failed to count cap:"
		print "not found aim-name net"
	} else if (idNum > 1) {
		print "failed to count cap:"
		print "found more than 1 net-id, pls ask niukun to update this awk-shell."
	}
}
