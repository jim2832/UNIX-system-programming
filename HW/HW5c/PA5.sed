#!/usr/bin/sed -nf
# The above line defines the path to sed and the flags to sed

#Now recall that the lines of the allcards file have a specific format:
# - The first 2 characters of each line represent a character in a simple way.
# - The rest of the line represents that character in a colorful way which is
#   more suitable for pretty printing, but is less suitable for analyzing.



#The following lines print a pretty card (meaning that everything except for
#the first 2 characters is printed). These lines also take those first two
#characters and append them onto the end of the hold space.


s/\(..\)\(.*\)/\2\n\1/
P
s/.*\(..\)/\1/
H


#The following line loads the hold space into the pattern space:
g


:J;tJ #<- Note: I ADDED THIS LINE. It was not in the PA5a template file.

#The following _____ is a single pattern that detects any flush:
s/\n.\(.\)\n.\1\n.\1\n.\1\n.\1/Flush/p

#The following ____ pattern detects if the last 4 cards all have the same face:
s/\n\(.\).\n\1.\n\1.\n\1.\n../Four of a kind/p

#The following ____ pattern detects if the first 4 cards have the same face:
s/\n..\n\(.\).\n\1.\n\1.\n\1./Four of a kind/p


# Note that the input file will always be sorted based on the face. This is
# why the above only needed to check for two cases (ie, first 4 & last 4).

# -------------------------------------------------------------------------
#Below this point, you can use all sed syntax, not just Lecture 8:


#The following line uses "d" to stop processing the current input line. But
#it only does so if the current line is not the last line of input.

$!d


#The following lines use "q" to quit processing input. But it only does so
#if there is a flush or four-of-a-kind. In other words, it use the flag
#that might have been set by one of the three earlier "s" commands, above.


/Flush/q
/Four of a kind/q


#Possibilities: FullHouse, 3ofaKind, 1pair, 2pair, straight, nothing.
#None of these possibilities care about the card suit. Therefore, the
#following lines remove that information (and also the "\n"s) from the
#Pattern Space. In other words, the Pattern Space will have a length of
#5 characters after the following commands are executed:

s/\n\(.\)./\1/g


#The following line uses "b" to branch over the subsequent section. But
#it only does so if there are not three identical cards.
#Hint: you do know that the cards have been sorted. 
/\(.\)\1\{2\}/!b notthree

   #At this point, we know that we didn't get branched over. This
   #means that there are three identical cards. There are therefore
   #two possibilities: Full House or Three of a kind.
   #The following line use "c" to print Full house, when appropiate:
   /\(.\)\1.\(.\)\2/c\Full House

   #The following line use "c" to print Three of a kind, otherwise:
   /\(.\)\1\1/c\Three of a kind


#The following line provide the label for the above branch-over code.
:notthree

#Now the possibilities are just: 1 pair, 2 pair, straight, or nothing.

#The following line uses "b" to branch over the subsequent section. But
#it only does so if there are not two identical cards.
/\(.\)\1/!b nottwo

   #At this point, we know that we didn't get branched over. This
   #means that there are two identical cards. There are therefore
   #two possibilities: Two pair or One pair.

   #The following line use "c" to print Two pair, when appropiate:
   /\(.\)\1.*\(.\)\2/c\Two pair

   #The following line use "c" to print One pair, otherwise:
   /\(.\)\1/c\One pair
   

#The following line provide the label for the above branch-over code.
:nottwo

#Now the possibilities are just: straight or nothing.
#The following adds "_23456789T" to the end of the pattern space.
s/$/_23456789T/


#The following line uses "c" to print "Straight" for every situation
#where there's straight involving only numbered cards (ie, 2 to 10).
/\(.....\)_.*\1.*/c\Straight


#The following line handles the straight: A, 2, 3, 4, 5
/A2345/c\Straight


#The following line handles both: 9, T, J, Q, K and T, J, Q, K, A
#Hint: Both "A" and "9" will sort earlier than 'J'.
/[9A]JKQT/c\Straight


#The following line handles: 8, 9, T, J, Q
/89JQT/c\Straight


#The following line handles: 7, 8, 9, T, J
/789JT/c\Straight


#The following line handles the "Nothing" case
c\Nothing
