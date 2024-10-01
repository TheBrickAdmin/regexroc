# Set file location and load content
$filePath = ".\Regex workshop\Logfile1.log"
$content = Get-Content -LiteralPath $filePath

# Check if content is loaded correctly
Write-Output $content