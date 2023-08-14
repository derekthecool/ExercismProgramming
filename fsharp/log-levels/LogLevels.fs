module LogLevels

open System.Text.RegularExpressions

let message (logLine: string) : string =
    sprintf "%s" (Regex.Match(logLine, @".*?\]:\s*?(\w.*\w)\s*$").Groups[1].Value)

let logLevel (logLine: string) : string =
    sprintf "%s" (Regex.Match(logLine, @"\[(\w+)\]").Groups[1].Value.ToLower())

let reformat (logLine: string) : string =
    sprintf
        "%s"
        (Regex.Replace(
            logLine,
            @"\[(\w+)\]:\s*(\w.*\w)\s*$",
            fun (M: Match) -> sprintf "%s (%s)" (M.Groups[2].Value) (M.Groups[1].Value.ToLower())
        ))
