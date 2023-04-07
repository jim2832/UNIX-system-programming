#!/usr/bin/tcsh
set num_count = (0 0 0 0 0 0 0 0 0 0 0 0 0) #num_count陣列用來數"數字"出現幾次
set suit_count = (0 0 0 0) #num_count陣列用來數"花色"出現幾次
set suits = ( ♦ ♥ ♠ ♣ ) #suits陣列存花色

foreach i (`seq 0 51 | sort -R | head -5 | sort -g`)
    @ suit = `expr $i / 13 + 1`
    @ num = `expr $i % 13 + 1`
    echo "i = "$i", suit = "$suit", num = "$num
    echo -n \  `echo  $num | grep 1[0-9]`
end