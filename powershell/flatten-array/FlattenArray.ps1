Function Invoke-FlattenArray() {
    <#
    .SYNOPSIS
    Take a nested array and return a single flattened array with all values except null.

    .DESCRIPTION
    Given an array, flatten it and keep all values execept null.

    .PARAMETER Array
    The nested array to be flatten.

    .EXAMPLE
    Invoke-FlattenArray -Array @(1, @(2, 3, $null, 4), @($null), 5)
    Return: @(1, 2, 3, 4, 5)
    #>
    [CmdletBinding()]
    Param(
        [System.Object[]]$Array
    )


    # function Flatten-Array {
    #     param([array]$Array)
    #     $flattenedArray = @()
    #     foreach ($item in $Array) {
    #         if ($item -is [array]) {
    #             # Recursively flatten the array
    #             $flattenedArray += Flatten-Array -Array $item
    #         } elseif ($item -ne $null) {
    #             $flattenedArray += $item
    #         }
    #     }
    #     return $flattenedArray
    # }

    $flattenedArray = @()
    foreach ($item in $Array) {
        if ($item -is [array]) {
            # Recursively flatten the array
            $flattenedArray += Invoke-FlattenArray -Array $item
        } elseif ($item -ne $null) {
            $flattenedArray += $item
        }
    }
    return $flattenedArray
}
