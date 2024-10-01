# Load a string which will make splitting on a comma or semicolon annoying
$string = "Dit is een string, met een komma, en een puntkomma (; deze dus). En een komma tussen twee getallen (zoals dit 3,5) die ik niet wil splitsen."

# Show splitting on a comma will not lead to the result since the decimal number is also split
$string.Split(",")

# Let's try splitting on comma's followed by a space
# In Windows PowerShell this is split on all delimiters
# In PowerShell this is split on the full match
$string.Split(", ")

# -split will behave the same in both versions
$string -split ", "

# Now to split on both a comma followed by a space, or a semicolon
# PowerShell option
$string.Split(", ").Split(";")

# Regex option
$string -split ", |;"