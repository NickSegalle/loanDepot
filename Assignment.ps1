#Create a powershell function or cmdlet that takes an arbitrarily long string parameter $foo (e.g. 'abcdedcba') and returns the first recurring character in that Input string. 
# In 'abcdedcba', 'd' would be the first recurring character, so the cmdlet/function should return 'd' for that sample input. Be mindful of the runtime of your solution.



function Find-DuplicateCharacter {
    <#
    .SYNOPSIS
        Find the first reoccurring character in an input string.
    .DESCRIPTION
        This function will take an input string ($foo) and it will find the first duplicate character and return it's value and position
    .EXAMPLE
        PS C:\> Find-DuplicateCharacter -foo 'abcdedcba'
        Found a duplicate character!  The duplicate character was found in position: 5 and it's value is: 'd'
    .EXAMPLE
        PS C:\> Find-DuplicateCharacter -foo 'abcdedcba' -FindAllDuplicates:$True
        Found a duplicate character!  The duplicate character was found in position: 5 and it's value is: 'd'
    .EXAMPLE
        PS C:\> 'abcdedcba' | Find-DuplicateCharacter -FindAllDuplicates:$True  
        Found a duplicate character! The duplicate character was found in position:  5  and it's value is:  d
        Found a duplicate character! The duplicate character was found in position:  6  and it's value is:  c
        Found a duplicate character! The duplicate character was found in position:  7  and it's value is:  b
        Found a duplicate character! The duplicate character was found in position:  8  and it's value is:  a
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param (
        [Parameter(
            Mandatory         = $True,
            ValueFromPipeline = $True
         )]
        [Char[]]
        $foo,
        [switch]
        $FindAllDuplicates = $False
    )
    
    begin {
        # Create an empty hashtable and set an index variable for a loop...
        $TestCharHT = @{}
        $Index      = 1
    }
    process {
        ForEach($Char in $foo)
        {
            Try 
            {
                # Add each character to a hash table and set the character to the name field.  Once it hit's a duplicate it will throw an error and we can catch it...
                $TestCharHT.Add($Char, $Index)
            }
            Catch {
                Write-Host "Found a duplicate character! The duplicate character was found in position: " $Index " and it's value is: " $($Char)
                # Need to break the loop here otherwise you get more than one answer...
                If($FindAllDuplicates -eq $False)
                {
                    Break
                }
            }
            ++$Index
        }
    }
}