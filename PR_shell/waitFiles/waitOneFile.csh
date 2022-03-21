set file=$1
if (-f $file) then
	set fileOldStat="`stat ${file}`"
else
	set fileOldStat="none"
endif
set startTime="`date '+%Y-%m-%d %H:%M:%S'`"
echo "wait file : ${file} at ${startTime}"
while ( 1 )
	sleep 5 
	if (! -f $file) then
		continue
	endif
	set fileNewStat="`stat ${file}`"
	if ( "${fileNewStat}" != "${fileOldStat}"  ) then
		set endTime="`date '+%Y-%m-%d %H:%M:%S'`"
		echo "${file} has updated at ${endTime}"
		break
	endif
end
