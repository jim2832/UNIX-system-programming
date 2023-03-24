#!/usr/bin/tcsh
cd $1

ls ?? | xargs -l fgrep ../allcards -e | cut --complement -c1-2
ls ?H |& fgrep -v : | wc -l > ___tempfile1
ls ?C |& fgrep -v : | wc -l >> ___tempfile1
ls ?D |& fgrep -v : | wc -l >> ___tempfile1
ls ?S |& fgrep -v : | wc -l >> ___tempfile1

fgrep -q 5 ___tempfile1 && echo Flush!

# ---------------------------------------------------------------------------------------

#handle number 2~9
ls [23456789]? |& fgrep -v :| cut --complement -c2-5 > faces

#handle 10, J, Q, K, A
ls [TJQKA]? |& fgrep -v :| cat -n | cut -c7-12 | tr "\t" "1" | cut -c1-2 | tr "T" "0" | tr "J" "1" | tr "Q" "2" | tr "K" "3" | tr "A" "4" >> faces

#write unique number into facecounts
uniq -c faces | cut -c7 > facecounts

#one pair
wc -l < facecounts | xargs expr 4 == > tempfile1 && fgrep -q 1 tempfile1 && echo One pair!

#two pairs
wc -l < facecounts | xargs expr 3 == > tempfile2 && fgrep -q 1 tempfile2 && fgrep -q 2 facecounts && echo Two pair!

#Three of a kind
wc -l < facecounts | xargs expr 3 == > tempfile3 && fgrep -q 1 tempfile3 && fgrep -q 3 facecounts && echo Three of a kind!

#Four of a kind
wc -l < facecounts | xargs expr 2 == > tempfile4 && fgrep -q 1 tempfile4 && fgrep -q 4 facecounts && echo Four of a kind!

#Full house
wc -l < facecounts | xargs expr 2 == > tempfile5 && fgrep -q 1 tempfile5 && fgrep -q 3 facecounts && echo Full house!

#Straight
wc -l < facecounts | xargs expr 5 == > tempfile6 && fgrep -q 1 tempfile6 && expr `sort -g faces | tail -1` - `sort -g faces | head -1` | xargs expr 4 == > tempfile7 && fgrep -q 1 tempfile7 && echo Straight!

# (14, 2, 3, 4, 5) Straight
#wc -l < facecounts | xargs expr 5 == > tempfile8 && fgrep -q 1 tempfile8 && fgrep -q 14 faces && expr `sort -g faces | tail -2 | head -1` - `sort -g faces | head -1` | xargs expr 3 == > tempfile9 && fgrep -q 1 tempfile9 && echo Straight!


#remove files
rm faces
rm facecounts
rm tempfile?
rm ___tempfile1
