Function Get-SumOfMultiples {
    [CmdletBinding()]
    Param(
        [int[]]$Multiples,
        [int]$Limit
    )

    1..($Limit - 1)
    | Where-Object {
        $number = $_
        $Multiples
        | Where-Object { $number % $_ -eq 0 }
        | Measure-Object
        | Select-Object -ExpandProperty Count
    }
    | Where-Object { $_ -gt 0 }
    | Measure-Object -Sum
    | Select-Object -ExpandProperty Sum

}
