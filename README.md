## Nick Segalle's loanDepot assignment.

Create a powershell function or cmdlet that takes an arbitrarily long string parameter $foo (e.g. 'abcdedcba') and returns the first recurring character in that Input string. In 'abcdedcba', 'd' would be the first recurring character, so the cmdlet/function should return 'd' for that sample input. Be mindful of the runtime of your solution.

I also recorded the process for fun: [2020-06-09_19-48-17 - Loan Depot Assignment.mp4](https://github.com/NickSegalle/loanDepot/blob/master/2020-06-09_19-48-17%20-%20Loan%20Depot%20Assignment.mp4)

The script: [Assignment.ps1](https://github.com/NickSegalle/loanDepot/blob/master/Assignment.ps1)

Enjoy!

## Speed of command


```
PS F:\OneDrive\Scripts\Scripts\loanDepot> measure-command {Find-DuplicateCharacter -foo 'abcdedcba'}

Found a duplicate character! The duplicate character was found in position:  5  and it's value is:  d


Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 0
Milliseconds      : 2
Ticks             : 27878
TotalDays         : 3.22662037037037E-08
TotalHours        : 7.74388888888889E-07
TotalMinutes      : 4.64633333333333E-05
TotalSeconds      : 0.0027878
TotalMilliseconds : 2.7878
```

## Other method

The other method would be to nest two for loops and compare each character one by one until you found a duplicate character.  This might be quicker, but it's not quite as pretty and would be trickier to accept a parameter from the pipeline.  I also had trouble finding the first duplicate character because if interpretted literally, the first duplicate character is 'a'... 

### Here is the example: 

```
$foo = 'abcdedcba'
    For($i = 0 ; $i -le $foo.Length ; ++$i) {
            For ($j=0; $j -lt $i; ++$j) {
                If ($foo[$j] -eq $foo[$i]){
                    $Char  = $foo[$j]
                    $Index = $j
                }
            }
        }
Write-Host "Found a duplicate character! The duplicate character was found in position: " $Index " and it's value is: " $($Char)
```
