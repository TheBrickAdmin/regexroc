# Set file location and load content
$filePath = ".\Regex workshop\Logfile1.log"
$content = Get-Content -LiteralPath $filePath

# Challenge: Find all lines with an IP-address
$regex = ""
$content -match $regex