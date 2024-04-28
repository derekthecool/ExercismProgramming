Function Get-SumOfMultiples {
    [CmdletBinding()]
    Param(
        [int[]]$Multiples,
        [int]$Limit
    )
    # Ensure necessary assembly for LINQ is loaded
    Add-Type -AssemblyName System.Core

    # Use LINQ to create a range
    $range = [System.Linq.Enumerable]::Range(1, $Limit - 1)

    # Filter the range to only include numbers that are multiples of any numbers in $Multiples
    $filtered = [System.Linq.Enumerable]::Where(
        $range,
        [Func[int, bool]] {
            param($number)
            $Multiples | Where-Object { $number % $_ -eq 0 } | Measure-Object | Select-Object -ExpandProperty Count
        }
    )

    # Sum the filtered numbers
    [System.Linq.Enumerable]::Sum($filtered)
}
