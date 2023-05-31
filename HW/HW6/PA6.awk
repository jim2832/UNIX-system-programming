# Line 1
BEGIN { DE = "Database Entry: "}

{
# Line 2
if ($0 ~ /^End of/) {next;}

# Line 3
NR==448 { sub("Ship'\''s Database - ", "Database Entry: ");}

# Line 4
NR>=987 && NR<=989 { print }

}

# Line 5
/Log, Day 113/{gsub("Log, Day", "Log - Mission Day")}

# Line 6
/, Supplemental/{gsub(", Supplemental", " - Mission Day 113, Supplemental")}

# Line 7

# Line 8

# Line 9

# Line 10
END { for }

# test
awk '/Deep Space Hibernation/ {split($0, A, ": ");DB[A[1]] = A[2]}/Weapons System/{split($0, A, ": ");DB[A[1]] = A[2]} ; END{print DB}' QuantumQuest:_A_ChatGPT_Space_Adventure

