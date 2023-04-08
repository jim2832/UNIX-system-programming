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
    # echo "i = "$i", suit = "$suit", num = "$num
    echo -n \ `echo $num | grep ^1. | cut -c1 --complement | tr "0123" "JQKA" || expr $num + 1`$suits[$suit]"  " #line 8
    @ num_count[$num]++ #line 9
    @ suit_count[$suit]++ #line 10
end # line 11

echo -n ": " # line 12

switch ( `echo $num_count | tr " 0" "\n" | sort -r | tr -d "\n"` ) # line 13
    # lines 14-24
    case 41:
        echo Four of a kind! ;breaksw
    case 32:
        echo Full house! ;breaksw
    case 311:
        echo Three of a kind! ;breaksw
    case 221:
        echo Two pair! ;breaksw
    case 2111:0
        echo One pair! ;breaksw
    case 11111:
        echo $num_count # line 25
        set flush = "" # line 26
        if ( suit_count[1] == 5 || suit_count[2] == 5 || suit_count[3] == 5 || suit_count[4] == 5 ) set flush = \ Flush! # line 27
        if ( `echo $num_count` =~ '[11111]' ) then
            echo Straight$flush!