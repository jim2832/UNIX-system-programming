#!/bin/csh
@ i = 0
while (`expr $i < 3`)
   echo -n $i
   @ i++
end
