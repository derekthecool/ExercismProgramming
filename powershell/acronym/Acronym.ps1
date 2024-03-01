Function Get-Acronym() {
    <#
    .SYNOPSIS
    Get the acronym of a phrase.

    .DESCRIPTION
    Given a phrase, return the string acronym of that phrase.
    "As Soon As Possible" => "ASAP"

    .PARAMETER Phrase
    The phrase to get the acronym from.

    .EXAMPLE
    Get-Acronym -Phrase "As Soon As Possible"
    #>
    [CmdletBinding()]
    Param (
        [string]$Phrase
    )
    return [System.Text.RegularExpressions.Regex]::Matches($Phrase.ToUpper(), "\b[_]*([a-zA-Z])") |
    ForEach-Object { $_.Groups[1].Value } |
    Join-String -Separator ""

}
