Function Get-WordCount() {
    Param(
        [string]$Phrase
    )

    [regex]::Matches($Phrase.ToLower(), "[a-z0-9]+('[a-z0-9]+)?")
    | ForEach-Object -Begin {
        $words = @{}
    } -Process {
        $words[$_.Value] += 1
    } -End {
        $words
    }
}
