#!/usr/bin/csh
set fcounts = ( 0 0 0 0 0 0 0 0 0 0 0 0 0 )
set scounts = ( 0 0 0 0 )
set suits = ( `echo ♦♥♠♣ | grep -o .` )
foreach i (`seq 0 51 | sort -R | tail -5 | sort -g`)
   @ f = 1 + $i % 13
   @ s = 1 + $i / 13
   echo -n \  `expr $f| grep 1.|cut -c2|tr 0-3 JQKA||expr 2 + $i % 13`$suits[$s]
   @ fcounts[$f] = $fcounts[$f] + 1 
   @ scounts[$s] = $scounts[$s] + 1 
end
echo -n ": "
switch ( "`echo $fcounts | tr \  \\n | sort -rg | tr -d 0\\n`" )
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
        set flush = ""
        if ( `echo $scounts | grep -o 5` == 5 ) set flush = \ Flush!
        if ( `echo $fcounts` =~ '*1 1 1 1 1*' ) then
            echo Straight$flush!
        else if ( `echo $fcounts[1-4] $fcounts[13]` == '1 1 1 1 1' ) then
            echo Straight$flush!
        else if ( $flush != "" ) then
	    echo Flush!
        else
            foreach i ( `seq 13 -1 1` )
                if ( $fcounts[$i] == 1 ) then
		    switch ($i)
		        case 13:
			    echo Ace high! ;exit
		        case 12:
			    echo King high! ;exit
		        case 11:
			    echo Queen high! ;exit
		        case 10:
			    echo Jack high! ;exit
		        default:
			    echo `expr $i + 1` high! ;exit
		    endsw
		endif
	    end
	endif
endsw
