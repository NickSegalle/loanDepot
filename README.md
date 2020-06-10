## Nick Segalle's loanDepot assignment.

Create a powershell function or cmdlet that takes an arbitrarily long string parameter $foo (e.g. 'abcdedcba') and returns the first recurring character in that Input string. In 'abcdedcba', 'd' would be the first recurring character, so the cmdlet/function should return 'd' for that sample input. Be mindful of the runtime of your solution.

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
