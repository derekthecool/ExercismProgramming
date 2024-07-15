Function Invoke-Rebase() {
    <#
    .SYNOPSIS
    Convert a number, represented as a sequence of digits in one base, to any other base.

    .DESCRIPTION
    Implement general base conversion of a number.
    Given an array of digits represent a number in base "a", convert it and return an array of digits represent the same number in base "b".

    .PARAMETER Digits
    Array of digits represent the number to be converted.

    .PARAMETER InputBase
    The original base of the number.

    .PARAMETER OutputBase
    The base to be converted to.

    .EXAMPLE
    Invoke-Rebase -Digits @(1, 0, 1 , 0 ,1 ) -InputBase 2 -OutputBase 10
    return : @(2, 1)
    #>
    [CmdletBinding()]
    Param(
        [int[]]$Digits,
        [int]$InputBase,
        [int]$OutputBase
    )

    Write-Host "Digits: $Digits, InputBase: $InputBase, OutputBase: $OutputBase"

    $recoveredInput = 0
    for($DigitIndex = $Digits.Length - 1; $DigitIndex -ge 0; $DigitIndex--){
        $currentNumberAsBase10 = $Digits[$DigitIndex]
        $currentInputBaseSegment = $currentNumberAsBase10 * [Math]::Pow($InputBase,$DigitIndex)
        $recoveredInput += $currentInputBaseSegment
        # Write-Host "currentNumberAsBase10 = $currentNumberAsBase10"
        # Write-Host "currentInputBaseSegment = $currentInputBaseSegment"
        # Write-Host "recoveredInput = $recoveredInput"

        # PWSH 7 ternary operator to determine the equationEnding text
        $equationEnding = $DigitIndex -ne 0 ? ' + ' : ''
        
        $equationString += "($currentNumberAsBase10 x $InputBase ^ $DigitIndex)$equationEnding"
    }

    Write-Host "$equationString = $recoveredInput"

    $recoveredInputAsString = "$recoveredInput"
    for($OutputDigitIndex = 0; $OutputDigitIndex -lt $recoveredInputAsString.Length; $OutputDigitIndex++){
        $currentNumberForOutputBaseAsBase10 = [int]$recoveredInputAsString[$OutputDigitIndex]
        Write-Host "currentNumberForOutputBaseAsBase10 = $currentNumberForOutputBaseAsBase10"
    }
}
