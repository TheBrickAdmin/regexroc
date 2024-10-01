###########################
#          Recap          #
###########################

###   Match characters  ###
# .  -> any character
# \s -> whitespace
# \d -> digit
# \w -> word character

###     Quantifiers     ###
# *     -> 0 to infinite
# +     -> 1 to infinite
# ?     -> 0 or 1
# {2}   -> exactly 2
# {2,4} -> 2, 3 or 4
# {2,}  -> 2 to infinite

###    Lazy vs Greedy   ###
# ? -> Lazy

###########################
#          Recap          #
###########################

# Excercise with lazy/greedy
$testString = "DitIsEenTestString"

# Enter a valid regex to get matches for each single character
$regex        = ""
$foundMatches = [Regex]::Matches($testString, $regex)

# The count of matches should be 18
$foundMatches.Count