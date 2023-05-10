#!/usr/bin/tcsh

#num_count陣列用來數"數字"出現幾次
set num_count = (0 0 0 0 0 0 0 0 0 0 0 0 0) #line 2
#num_count陣列用來數"花色"出現幾次
set suit_count = (0 0 0 0) #line 3
#suits陣列存花色
set suits = ( ♦ ♥ ♠ ♣ ) #line 4

foreach i (`seq 0 51 | sort -R | head -5 | sort -g`) #line 5
    @ suit = `expr 1 + $i / 13` #line 6
    @ num = `expr 1 + $i % 13` #line 7
    echo -n \ `echo $num | grep ^1. | cut -c1 --complement | tr "0123" "JQKA" || expr $num + 1`$suits[$suit]"  " #line 8
    @ num_count[$num]++ #line 9
    @ suit_count[$suit]++ #line 10
end # line 11