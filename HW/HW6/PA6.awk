# Line 1
BEGIN{ DE = "Database Entry: "}

# Line 2
{if ($0 ~ /^End of/) {next}}

# Line 3
/Ship's Database - Dilithium/{gsub(/Ship.*- /, "Database Entry: ")}

# Line 4
NR==987{split($0, A, ": ") ; A[1]=DE A[1] ; DB[A[1]]="\n"A[2]"\n"}
NR==989{split($0, A, ": ") ; A[1]=DE A[1] ; DB[A[1]]="\n"A[2]"\n"}

# Line 5
/Log, Day 113/{sub("Log, Day", "Log - Mission Day")}

# Line 6
/, Supplemental/{sub(", Supplemental", " - Mission Day 113, Supplemental")}

# Line 7
/^(Database|Captain's Log)/{K = $0 ; DB[K] = "" ; getline}

# Line 8
/^User/{K = ""}

# Line 9
{if (length(K) > 0) DB[K]=DB[K] "\n"$0}

# Line 10
END {for(key in DB) print key":", ""DB[key],"\n------------------------"}
