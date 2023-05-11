#!/usr/bin/sed -nf


#The following lines print a pretty card (meaning that everything except for
#the first 2 characters is printed). These lines also take those first two
#characters and append them onto the end of the hold space.

h
g
s/^..\(..\)/\1/p
g
s/\(..\).*/\1/
h


#The following line loads the hold space into the pattern space:
g
#p

#The following _____ is a single pattern that detects any flush:
s/^\(.\)\(.\)\2\2\2\2$/Flush/p


#The following ____ pattern detects if the last 4 cards all have the same face:
#s/____/Four of a kind/p


#The following ____ pattern detects if the first 4 cards have the same face:
#s/____/Four of a kind/p


# Note that the input file will always be sorted based on the face. This is
# why the above only needed to check for two cases (ie, first 4 & last 4).
