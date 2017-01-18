$path = "C:\"
#press enter to accept the variable

$size = 100MB
#press enter to accept the variable. Identifies file sizes over 100MB

$limit = 100
#press enter to accept the variable. Limits results returned to 100 entries.

$largesizefiles = Get-ChildItem -path $path -recurse -ErrorAction "SilentlyContinue" | ? { $_.GetType().Name -eq "FileInfo" } | where-object {$_.length -gt $size} | sort-object -property length -descending | select-object @{Name="SizeInMB";Expression={$_.Length / 1MB}},@{Name="Path";Expression={$_.directory}} -first $limit
#run the command. Should take up to a minute to complete.

$largesizefiles | Export-csv C:\largefilesizes.csv
#exports a CSV file to the root C directory for review
