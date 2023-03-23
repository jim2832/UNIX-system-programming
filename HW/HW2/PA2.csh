#!/usr/bin/tcsh
cd $1

ls ?? | xargs -l fgrep ../allcards -e | cut --complement -c1-2
ls ?H |& fgrep -v : | wc -l > ___tempfile1
ls ?C |& fgrep -v : | wc -l >> ___tempfile1
ls ?D |& fgrep -v : | wc -l >> ___tempfile1
ls ?S |& fgrep -v : | wc -l >> ___tempfile1

fgrep -q 5 ___tempfile1 && echo Flush! #&& rm ___tempfile? || rm ___tempfile?



 ls [23456789]? | cut --complement -c2-5 > faces


____________________________ >> faces  <= Fill in the blank


____________________________  > facecounts  <= Fill in the blank


_______________________________ echo One pair! <= Fill in the blank


_______________________________ echo Two pair!  <= Fill in the blank


_______________________________ echo Three of a kind! <= Fill in the blank


_______________________________ echo Four of a kind! <= Fill in the blank


_______________________________ echo Full house! <= Fill in the blank


_______________________________ echo Straight! <= Fill in the blank


_______________________________ echo Straight! <= Fill in the blank


#And that is the end of your script. You will notice that there is no output for
#garbage hands (ie, hands that have no matches or straights or flushes).
