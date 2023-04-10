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

echo -n ": " # line 12

switch ( `echo $num_count | tr " " "\n" | sort -r | tr -d "0\n"` ) # line 13
    # lines 14-24
    case 41:
        echo Four of a kind! ;breaksw
    case 32:
        echo Full house! ;breaksw
    case 311:
        echo Three of a kind! ;breaksw
    case 221:
        echo Two pair! ;breaksw
    case 2111:
        echo One pair! ;breaksw
    case 11111:
        #echo $num_count # line 25
        set flush = "" # line 26
        if ( `echo $suit_count` =~ '*5*' ) set flush = \ Flush! # line 27
        # line 28-29
        if ( `echo $num_count` =~ "*1 1 1 1 1*" ) then
            echo Straight$flush!
        # line 30-31
        else if ( `echo $num_count[13] $num_count[1] $num_count[2] $num_count[3] $num_count[4]` == '1 1 1 1 1' ) then
            echo Straight$flush!
        # line 32-34
        else if ( $flush != "" ) then
	        echo Flush!
        else
            foreach idx (`seq 13 -1 1`) # line 35
                if ( $num_count[$idx] == 1 ) then # line 36
                    # line 37 to end-5
                    set max = $idx
                    switch ( $max )
                        case 13:
                            echo Ace high! ;break
                        case 12:
                            echo King high! ;break
                        case 11:
                            echo Queen high! ;break
                        case 10:
                            echo Jack high! ;break
                        case 9:
                            echo 10 high! ;break
                        case 8:
                            echo 9 high! ;break
                        case 7:
                            echo 8 high! ;break
                        case 6:
                            echo 7 high! ;break
                        case 5:
                            echo 6 high! ;break
                        case 4:
                            echo 5 high! ;break
                        case 3:
                            echo 4 high! ;break
                        case 2:
                            echo 3 high! ;break
                        case 1:
                            echo 2 high! ;break
                    endsw
                endif
            end
        endif
endsw