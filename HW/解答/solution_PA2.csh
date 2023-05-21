ls ?? | xargs -l fgrep ../allcards -e | cut --complement -c1-2
ls ?H |& fgrep -v : | wc -l > ___tempfile1
ls ?C |& fgrep -v : | wc -l >> ___tempfile1
ls ?D |& fgrep -v : | wc -l >> ___tempfile1
ls ?S |& fgrep -v : | wc -l >> ___tempfile1
fgrep -q 5 ___tempfile1 && echo Flush!
ls [2-9]* |& fgrep -v : | cut -c1 |paste - faces > faces
ls [TJQKA]* |& fgrep -v : |cat -n |tr TJQKA2-5 0-41 |tr -d ' \t' |cut -c1-2 >> faces
sort faces | uniq -c | cut -c7 | sort > facecounts
expr `wc -l < facecounts` == 4 >/dev/null && echo One pair!
expr `wc -l < facecounts` == 3 >/dev/null && expr `tail -1 facecounts` == 2 >/dev/null && echo Two pair!
expr `wc -l < facecounts` == 3 >/dev/null && expr `tail -1 facecounts` == 3 >/dev/null && echo Three of a kind!
expr `wc -l < facecounts` == 2 >/dev/null && expr `tail -1 facecounts` == 4 >/dev/null && echo Four of a kind!
expr `wc -l < facecounts` == 2 >/dev/null && expr `tail -1 facecounts` == 3 >/dev/null && echo Full house!
expr `wc -l < facecounts` == 5 >/dev/null && expr `sort -g faces |tail -1` - `sort -g faces | head -1` == 4 >/dev/null && echo Straight!
sort -g faces | tr -d '\t\n' | fgrep -q 234514 && echo Straight!
