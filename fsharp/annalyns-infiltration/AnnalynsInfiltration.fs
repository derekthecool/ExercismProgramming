module AnnalynsInfiltration

let canFastAttack (knightIsAwake: bool) : bool = not knightIsAwake

let canSpy (knightIsAwake: bool) (archerIsAwake: bool) (prisonerIsAwake: bool) : bool =
    [ knightIsAwake; archerIsAwake; prisonerIsAwake ]
    |> Seq.exists (fun x -> x = true)

let canSignalPrisoner (archerIsAwake: bool) (prisonerIsAwake: bool) : bool = not archerIsAwake && prisonerIsAwake

let canFreePrisoner (knightIsAwake: bool) (archerIsAwake: bool) (prisonerIsAwake: bool) (petDogIsPresent: bool) : bool =
    let fastAttack = canFastAttack knightIsAwake
    let signal = canSignalPrisoner archerIsAwake prisonerIsAwake

    let methodOne = petDogIsPresent && not archerIsAwake
    let methodTwo = not petDogIsPresent && signal && fastAttack

    methodOne || methodTwo
