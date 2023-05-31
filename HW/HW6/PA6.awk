# Line 1
BEGIN { DE = "Database Entry: "}

# Line 2
{if ($0 ~ /^End of/) {next;} }

# Line 3
awk 'NR==448 { sub("Ship'\''s Database - ", "Database Entry: "); } 1'

# Line 4