Function Get-BobResponse() {
    <#
    .SYNOPSIS
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    .DESCRIPTION
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    Bob answers 'Sure.' if you ask him a question.

    He answers 'Whoa, chill out!' if you yell at him.

    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

    He says 'Fine. Be that way!' if you address him without actually saying
    anything.

    He answers 'Whatever.' to anything else.

    .PARAMETER HeyBob
    The sentence you say to Bob.

    .EXAMPLE
    Get-BobResponse -HeyBob "Hi Bob"
    #>
    [CmdletBinding()]
    Param(
        [string]$HeyBob
    )


    # Need to use -cmatch instead of -match to get case sensitive matching
    if($HeyBob -cmatch '(OK|[^A-Z])\?\s*$') {
        return 'Sure.'
    } elseif($HeyBob -cmatch '[A-Z]+\?\s*$') {
        return "Calm down, I know what I'm doing!"
    } elseif($HeyBob -cmatch '^\s*$') {
        return 'Fine. Be that way!'
    } elseif($HeyBob -cmatch '\b(?!OK|DMV)\p{Lu}{2,}\b') {
        return 'Whoa, chill out!'
    } else {
        return 'Whatever.'
    }

    return $HeyBob
}
