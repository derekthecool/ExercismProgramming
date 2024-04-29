Function Get-WordCount() {
    Param(
        [string]$Phrase
    )

    # Use a dotnet regex to find valid words
    [regex]::Matches($Phrase.ToLower(), "[a-z0-9]+('[a-z0-9]+)?")
    | ForEach-Object -Begin {
        $words = @{}
    } -Process {
        $words[$_.Value]++
    } -End {
        $words
    }
}
