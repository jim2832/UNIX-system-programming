#!/usr/bin/csh
foreach i ( `seq 10 10 100` )
   echo
   echo $i + 1 = `expr $i + 1`
   echo
end
