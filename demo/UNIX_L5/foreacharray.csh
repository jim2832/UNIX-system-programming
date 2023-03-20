#!/usr/bin/csh
set Z = ( A B C )
foreach fn ( $Z )
   cat $fn | cut -c1
end
