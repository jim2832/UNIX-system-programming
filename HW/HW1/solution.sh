cd $*
ls ?? | xargs -l fgrep ../allcards -e | complement -cl-2
ls ?H 2> dev/null | wc -l > tempfile1
ls ?C 2> dev/null | wc -l >> tempfile1
ls ?D 2> dev/null | wc -l >> tempfile1
ls ?S 2> dev/null | wc -l >> tempfile1
echo Fluh! > tempfile2
fgrep 5 tempfile1 | paste - tempile2 | cut --complemet 0cl-2 | fgep F
rm tempfile?
