set fileList="$1"
foreach file ($fileList) 
	source waitOneFile.csh $file &
end
wait
echo "all files has updated"
