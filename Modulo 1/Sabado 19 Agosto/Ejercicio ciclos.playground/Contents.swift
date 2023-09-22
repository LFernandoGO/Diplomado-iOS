import UIKit

var board = [0,1,2,3,4,
            5,6,7,8,9,
            10,11,12,13,14,
            15,16,17,18,19,
            20,21,22,23,24]
var index = 0
var turno = 0

while index < 24{
    var dice = Int.random(in: 1...6)
    index = index + dice
    // Sube de 3 a 10, 9 a 11, 8 a 17, 5 a 16
    // Baja de 21 a 10, 18 a 7, 13 a 3, 23 a 15
    
    // SUBEN
    if index == 3 {
        index = 10
    } else if index == 9 {
        index = 11
    } else if index == 8 {
        index = 17
    } else if index == 5 {
        index = 16
    // BAJAN
    } else if index == 21 {
        index = 10
    } else if index == 18 {
        index = 7
    } else if index == 13 {
        index = 3
    } else if index == 23 {
        index = 15
    }
    turno += 1
    print("Vas en el turno \(turno), estas en la casilla \(index), el dado salió \(dice)")
}

print("Te tomó \(turno) turnos para ganar")

