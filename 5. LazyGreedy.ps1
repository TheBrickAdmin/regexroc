$string = "Deze 1 string heeft op 5 meerdere plekken getallen staan 8. We willen enkel de tekst tussen de eerste 2 getallen hebben 9."

# Show default greedy behavior of PowerShell
$string -match "\d.*\d"
$Matches

# Make PowerShell lazy
$string -match "\d.*?\d"
$Matches