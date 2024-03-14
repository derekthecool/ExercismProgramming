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
    # Create the dotnet regex inside a powershell here-string
    # A here-string starts with @" and ends with "@ - and the final terminator MUST be at the start of the line
    # Regex comments can then be placed at the start of lines similar to a powershell script comment starting with #
    # Character groups in square brackets still respect the spaces
    $patternWithComments = @'
    # Look for anything that is NOT an _ or ' or a space
    [_' ]*

    # Create a capture group looking for any letter A-Z
    ([A-Z])

    # Make sure there are no dashes or spaces after these matches
    [^- ]*
'@

    # Now look how much more readable the above regex is compared to the "normal"
    # way of writing them like this "[_' ]*([A-Z])[^- ]+"

    return [regex]::Matches($Phrase.ToUpper(), $patternWithComments, 'IgnorePatternWhitespace') |
        ForEach-Object { $_.Groups[1].Value } |
        Join-String -Separator ''
}
