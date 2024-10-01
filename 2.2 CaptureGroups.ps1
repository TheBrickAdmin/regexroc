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

###    Capture Groups   ###
# Capture with ()

###########################
#          Recap          #
###########################

# Excercise with capture groups

# Retrieve content from logfile
$content = [System.IO.File]::ReadAllLines((Join-Path -Path (Get-Location).Path -ChildPath "Hadoop_2k.log"))

# Base regex for extracting IP-addresses
$regex = "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"

# Find all matches (should be 490)
$foundMatches = @()
foreach ($line in $content)
{
    if ($line -match $regex)
    {
        $foundMatches += $Matches[0]
    }
}
$foundMatches.Count

# Edit the regex to use a capture group for the first 3 octets
$regex = ""

# What's in $Matches?
$Matches