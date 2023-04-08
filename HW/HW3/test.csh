#!/usr/bin/tcsh
set num_count = (0 0 0 0 0 0 0 0 0 0 0 0 0) #num_count陣列用來數"數字"出現幾次
set suit_count = (0 0 0 0) #num_count陣列用來數"花色"出現幾次
set suits = ( ♦ ♥ ♠ ♣ ) #suits陣列存花色

foreach i (`seq 0 51 | sort -R | head -5 | sort -g`) #line5
    @ suit = `expr 1 + $i / 13` #line6
    @ num = `expr 1 + $i % 13` #line7
    # echo "i = "$i", suit = "$suit", num = "$num
    # echo -n \ `echo $num | grep ^1. | cut -c1 --complement | tr "0123" "JQKA" || expr $num + 1`$suits[$suit] #line8
    @ num_count[$num]++ #line9
    @ suit_count[$suit]++ #line10
end # line11

# echo "\n"$num_count | tr " 0" "\n" | sort -r | tr -d "\n "
echo "suit_count: "$suit_count