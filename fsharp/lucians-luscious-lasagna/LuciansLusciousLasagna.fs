module LuciansLusciousLasagna

let expectedMinutesInOven = 40

let remainingMinutesInOven minutes = expectedMinutesInOven - minutes

let preparationTimeInMinutes layers = layers * 2

let elapsedTimeInMinutes layers minutesDone =
    preparationTimeInMinutes layers + minutesDone
