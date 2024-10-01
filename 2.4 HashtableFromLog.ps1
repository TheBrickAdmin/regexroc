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
# Exclude with ?:

###       Position      ###
# Start of line -> ^
# End of line   -> $

###########################
#          Recap          #
###########################

# Excercise with capture groups

# Retrieve content from logfile
$content = [System.IO.File]::ReadAllLines((Join-Path -Path (Get-Location).Path -ChildPath "Hadoop_2k.log"))

# Given the last line matching an IP-address
# 2015-10-18 18:10:55,202 WARN [LeaseRenewer:msrabi@msra-sa-41:9000] org.apache.hadoop.ipc.Client: Address change detected. Old: msra-sa-41/10.190.173.170:9000 New: msra-sa-41:9000
# Extend the regex to extract the datetime (make sure only a datetime at the start of a line is captured), parse it to a datetime object, and create a hashtable with the datetimes and IP-addresses for every match.
# Exclude all capture groups not required in the hashtable

# Base regex for extracting IP-addresses
$regex = "(?:(?:\d{1,3}\.){3})\d{1,3}"

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

# Create a new regex for just the datetime, match it with the last line (which we know matches)
$regex = ""
$line -match $regex
$Matches

# Combine the regexes (datetime at the start of a line, IP-address at the end of a line), add a wildcard in between both groups
# Results should be:
# Name   Value                                                                                                                                                                                                                                                
# ----   -----                                                                                                                                                                                                                                                
# 2      10.190.173.170                                                                                                                                                                                                                                       
# 1      2015-10-18 18:10:55                                                                                                                                                                                                                                  
# 0      2015-10-18 18:10:55,202 WARN [LeaseRenewer:msrabi@msra-sa-41:9000] org.apache.hadoop.ipc.Client: Address change detected. Old: msra-sa-41/10.190.173.170 
$regex = ""
$line -match $regex
$Matches

# Create a hashtable with the output
$foundMatches = @()
foreach ($line in $content)
{
    if ($line -match $regex)
    {
        $foundMatches += [PSCustomObject]@{
            Datetime = [datetime]::ParseExact($Matches[1], "yyyy-MM-dd HH:mm:ss", [cultureinfo]::InvariantCulture)
            IP       = $Matches[2]
        }        
    }
}

# At what datetimes are there communications with localhost in the logs (should be 6)?
$foundMatches | Where-Object { $_. IP -eq "127.0.0.1" }