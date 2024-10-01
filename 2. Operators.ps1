# Load string into variable
$string = "Dit is een string met daarin tekst die we met PowerShell gaan uitlezen"

# Check if like works without wildcards (it doesn't)
$string -like "PowerShell"
$string -like "*PowerShell*"

# Check if like is case sensitive (it isn't)
$string -like "*Powershell*"

# If case is required use -clike
$string -clike "*Powershell*"

# Now use match and show it is also case insensitive
$string -match "PowerShell"
$string -match "Powershell"

# Introduce $Matches
$Matches
$Matches[0]

# Make match case sensitive (https://www.regular-expressions.info/modifiers.html)
$string -match "(?-i)Powershell"