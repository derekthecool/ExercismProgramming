<#
.SYNOPSIS
    Implement a clock that handles times without dates.

.DESCRIPTION
    Implement a clock that handles times without dates in 24 hours format.
    You should be able to add and subtract minutes to it.
    Two clocks that represent the same time should be equal to each other.
    Note: Please try to implement the class and its method instead of using built-in module Datetime.

.EXAMPLE
    $clock1 = [Clock]::new(5,0)
    $clock1.ToString()
    Return: "05:00"

    $clock2 = [Clock]::new(6,-120)
    $clock2.Add(60).ToString()
    Return: "05:00"

    $clock1 -eq $clock2
    Return: $true
#>

# class Clock {
#     [int]$hours
#     [int]$minutes
#
#     Clock([int]$hours, [int]$minutes) {
#         $this.hours = $hours
#         $this.minutes = $minutes
#     }
#
#     [string] ToString() {
#         return $this.hours + ":" + $this.minutes
#     }
#
#     [bool] Equals() {
#         return $true
#     }
# }

class Clock {
    [Int32] $hour = 0
    [Int32] $minute = 0
    Clock($h, $m) {
        $this.hour = (24 + (($h + [Math]::Floor($m / 60)) % 24)) % 24
        $this.minute = (60 + ($m % 60)) % 60
    }
    [string] ToString() {
        return '{0:d2}:{1:d2}' -f $this.hour, $this.minute
    }
    [bool] Equals($other) {
        return $other.hour -eq $this.hour -and $other.minute -eq $this.minute
    }
    [Clock] Add($m) {
        return [Clock]::new($this.hour, $this.minute + $m)
    }
}
