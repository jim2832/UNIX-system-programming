#!/usr/bin/tcsh
cd $1

ls ?? | xargs -l fgrep ../allcards -e | cut --complement -c1-2
ls ?H |& fgrep -v : | wc -l > ___tempfile1
ls ?C |& fgrep -v : | wc -l >> ___tempfile1
ls ?D |& fgrep -v : | wc -l >> ___tempfile1
ls ?S |& fgrep -v : | wc -l >> ___tempfile1

fgrep -q 5 ___tempfile1 && echo Flush! #&& rm ___tempfile? || rm ___tempfile?
#到這邊是重複上次的事
# % cat tempfile1
#   0
#   0
#   0
#   5

ls [23456789]? | cut --complement -c2-5 > faces
# faces
# 2
# 3
# 5

#現在的目的：將T換成10、J換成11、Q換成12、K換成13、A換成14 (先加上一個1再加上後面的數字)
#提示：先用cat -n在每行前面增加一個\t，之後
#作法：T?要換成10，首先要先在前面加一個1，變成1T?，再把T?換成0
ls [TJQKA]? | cat -n | cut -c7-12 | tr "\t" "1" | cut -c1-2 | tr "T" "0" | tr "J" "1" | tr "Q" "2" | tr "K" "3" | tr "A" "4" 

最後face會變成
2
3
5
14
10

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