# Set file location and load content
$filePath = ".\Regex workshop\Home_Methos.html"
$content = Get-Content -LiteralPath $filePath

# Check if content is loaded correctly
Write-Output $content

# Challenge: Split the content and keep only the contents inside a div. Use the following code-block and just write a working regex string for the $regex variable.
# Example:
# '<div class="name_of_a_class">Content of the div</div>' should return 'Content of the div'
$regex = ""
foreach ($line in ($content -split $regex))
{
    if ($line)
    {
        Write-output "`nThis is a div:`n$line"
    }
}